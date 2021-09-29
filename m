Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB0341CD1F
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 22:04:43 +0200 (CEST)
Received: from localhost ([::1]:34646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVfoo-0005lz-Fp
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 16:04:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mVfjO-00088X-Fa
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 15:59:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mVfjK-0000yE-OA
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 15:59:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632945540;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=g/0JTFVVpIUumkry6dBYf9NrQX2GrCKnfHYx0weOsA8=;
 b=gmsuPhpzjvMjAdu5M6eV8xUcp9SvSr0EYMeE7z1FmobP3UHgIzA+UldRbw3JoglDUM9rR+
 d9P60sjAs6KATLBOEPFB7OoA4bSFpHUwnIKeVcz2vR2GhvMgtay/gR7cCx/pV+ex1YHywN
 YtLtt45hRoVS1sPlU4mSpNJAWHXRM4I=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-519-harDNI_0OzKa5tcqzATkKA-1; Wed, 29 Sep 2021 15:58:59 -0400
X-MC-Unique: harDNI_0OzKa5tcqzATkKA-1
Received: by mail-qk1-f199.google.com with SMTP id
 k3-20020a05620a414300b0045e623cd1afso10707448qko.20
 for <qemu-devel@nongnu.org>; Wed, 29 Sep 2021 12:58:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=g/0JTFVVpIUumkry6dBYf9NrQX2GrCKnfHYx0weOsA8=;
 b=immi7IAIKfSYsfMK5eeyyt24YFYuT01a7STelFaOcvmiwEx6S6OF/T+gyOmFhVHTDw
 C5DXY24jaxclO7VJZzDrb9eNLDf0w6UclOEeXPiyuZRQnoVRG5Tl0D3UVPWtLcSCBsKL
 i5/aq/aH/JjDH6oqKRELUfTodeCZaa9iEQXlwEwjDrqWTtS+7YoaXDV+cCvSWlESln0h
 jcasi/1BSRGk6nOxhTIuYjBUKjtG5+4wbD+tZ3Z6HwWWrdey+FO9JvP+6NPKrm0gPgxA
 zkpkp5XwgcRIO542X58R6TJDdFsLMVQhKi6EmI1N5xWwPoHFd2GhTZKWPe5Im6wESR3Z
 f02Q==
X-Gm-Message-State: AOAM531u63rfxzQ8ZNL5ig7eRX8GZyjElu5C/82NpNJyEdpIejcNzYTI
 p37MemYkzYoLBh6WyBgKPSJtbvVEeOkeZApOALN6/7qOZWoKmVJsENiNITLw/to3V4ERpWgRFue
 VpAuA/TOk6j1v6u4=
X-Received: by 2002:a05:622a:1652:: with SMTP id
 y18mr2162480qtj.226.1632945538546; 
 Wed, 29 Sep 2021 12:58:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxn6enzU65BlT6pvsHurTimDGwCkVCHiBTyL1CeqU3/pj7MxJSUihXNw7A7VDmHPAmauVgB7g==
X-Received: by 2002:a05:622a:1652:: with SMTP id
 y18mr2162452qtj.226.1632945538331; 
 Wed, 29 Sep 2021 12:58:58 -0700 (PDT)
Received: from t490s ([2607:fea8:56a2:9100::d3ec])
 by smtp.gmail.com with ESMTPSA id b14sm431992qkl.81.2021.09.29.12.58.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Sep 2021 12:58:57 -0700 (PDT)
Date: Wed, 29 Sep 2021 15:58:56 -0400
From: Peter Xu <peterx@redhat.com>
To: Leonardo Bras Soares Passos <leobras@redhat.com>
Subject: Re: [PATCH v3 2/3] QIOChannelSocket: Implement io_async_write &
 io_async_flush
Message-ID: <YVTFgJoxbT4cTn4i@t490s>
References: <20210922222423.644444-1-leobras@redhat.com>
 <20210922222423.644444-3-leobras@redhat.com>
 <YVObBEofYcUvEmOz@t490s>
 <CAJ6HWG5tqm9eg3XzKF-M5nVFSkO9u5NVyUA7uxo8rC3bdZv_zA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ6HWG5tqm9eg3XzKF-M5nVFSkO9u5NVyUA7uxo8rC3bdZv_zA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel <qemu-devel@nongnu.org>, Jason Wang <jasowang@redhat.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 29, 2021 at 04:36:10PM -0300, Leonardo Bras Soares Passos wrote:
> On Tue, Sep 28, 2021 at 7:45 PM Peter Xu <peterx@redhat.com> wrote:
> >
> > On Wed, Sep 22, 2021 at 07:24:22PM -0300, Leonardo Bras wrote:
> > > +static void qio_channel_socket_async_flush(QIOChannel *ioc,
> > > +                                           Error **errp)
> > > +{
> > > +    QIOChannelSocket *sioc = QIO_CHANNEL_SOCKET(ioc);
> > > +    struct msghdr msg = {};
> > > +    struct pollfd pfd;
> > > +    struct sock_extended_err *serr;
> > > +    struct cmsghdr *cm;
> > > +    char control[CMSG_SPACE(sizeof(int) * SOCKET_MAX_FDS)];
> > > +    int ret;
> > > +
> > > +    memset(control, 0, CMSG_SPACE(sizeof(int) * SOCKET_MAX_FDS));
> > > +    msg.msg_control = control;
> > > +    msg.msg_controllen = sizeof(control);
> > > +
> > > +    while (sioc->async_sent < sioc->async_queued) {
> > > +        ret = recvmsg(sioc->fd, &msg, MSG_ERRQUEUE);
> > > +        if (ret < 0) {
> > > +            if (errno == EAGAIN) {
> > > +                /* Nothing on errqueue, wait */
> > > +                pfd.fd = sioc->fd;
> > > +                pfd.events = 0;
> > > +                ret = poll(&pfd, 1, 250);
> > > +                if (ret == 0) {
> > > +                    /*
> > > +                     * Timeout : After 250ms without receiving any zerocopy
> > > +                     * notification, consider all data as sent.
> > > +                     */
> > > +                    break;
> >
> > After a timeout, we'll break the while loop and continue parsing an invalid
> > msg [1].  Is that what we want?
> 
> No, the point here was returning from flush if this (long) timeout
> happened, as in
> "if asso long has passed, there must be no pending send", which I
> agree is quite bad,
> but it was all I could think to avoid an infinite loop here if
> something goes wrong.

IMHO it's the same when we write() to a socket but the buffer is always full,
we'll simply block there until it has some space.  I don't know what we can do
here besides infinite loop on the timeout - we shouldn't eat the cpu all, but
we should still wait?

-- 
Peter Xu


