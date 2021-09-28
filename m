Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0271641B9A6
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 23:53:36 +0200 (CEST)
Received: from localhost ([::1]:58894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVL2d-0006Un-Kv
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 17:53:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mVL1K-0005pH-I8
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 17:52:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40088)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mVL1H-0000K1-Jn
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 17:52:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632865930;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=34IyyMysLKkdBdpyprP8+53om2NvAfDR6dhEVMvooas=;
 b=JFnqXIKMrdRAUoLhjjxZyxW1M0QSWRMP9oQxojS/+XTySeLxdMjAf8yC2zlLz6+QH+wwCH
 2su0aa3Xq8blpEjYSvneKJ3xdtvV6lKgWuKxmSGH6bLSSpZGzqDVgGL1Fio6tN0Kl3sNRB
 hGIG1cfsYBm6lxL5E4vQmpvpmea5nns=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-228-LP8pQtq8MH29GXiQcoQ8_g-1; Tue, 28 Sep 2021 17:52:08 -0400
X-MC-Unique: LP8pQtq8MH29GXiQcoQ8_g-1
Received: by mail-io1-f72.google.com with SMTP id
 p71-20020a6b8d4a000000b005d323186f7cso336269iod.17
 for <qemu-devel@nongnu.org>; Tue, 28 Sep 2021 14:52:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=34IyyMysLKkdBdpyprP8+53om2NvAfDR6dhEVMvooas=;
 b=BYCMoVt/hBPZ+MvsGtF9x0n7APuCCmoNHuT6dooUoaZ/JMmj8ZgXxEJJNDjQVEJQJT
 FaX83iAkKwHlmSxIzeIdW/CFlEG8vQ2ZvrXMd1rn46AxLfYElIjO0KzcF2RihHQg33Kd
 Pb00eJDnFK753hln/wZapUyz8vQidw6DLaGTpuuKq6mzN+qorQJ63KkHjU2PKPfT0qtM
 husjobhe6HgK8bIaphdOjeO/FFvl4SyN6YJQeXHTHg1QLR2iRC3xan5jSaC8Fk9XOObA
 lLaAhDZbmkX0v1AHZaxweekaNz/HnheUKhAHA0oAg4IKKaQMD1QflZi7egbumd3AnQeQ
 wINQ==
X-Gm-Message-State: AOAM530VbDG8hZkGCSznc5hgnFs8FHHmeGrbExJIgUDZJN8bHPNUB+iz
 X29WpnYial4s0LPvYHSJ+fkynnTHyVruzpvgeRGlguVhaCEYtinJNGGU6NujHGM88tiBqhtXRhJ
 oP8RCl8WHZVdoDus=
X-Received: by 2002:a05:6e02:c11:: with SMTP id
 d17mr6183319ile.25.1632865927976; 
 Tue, 28 Sep 2021 14:52:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzXwlclyPL3XDfXxxro+ae9Kf1aqhJ+b6hTPZVmTJcOAPelbEI/h+6Ccc7ZD3HTNrMUtTeX/w==
X-Received: by 2002:a05:6e02:c11:: with SMTP id
 d17mr6183312ile.25.1632865927803; 
 Tue, 28 Sep 2021 14:52:07 -0700 (PDT)
Received: from t490s ([2607:fea8:56a2:9100::d3ec])
 by smtp.gmail.com with ESMTPSA id j14sm153875ilu.74.2021.09.28.14.52.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Sep 2021 14:52:07 -0700 (PDT)
Date: Tue, 28 Sep 2021 17:52:05 -0400
From: Peter Xu <peterx@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH v3 1/3] QIOChannel: Add io_async_writev & io_async_flush
 callbacks
Message-ID: <YVOOhSk2QbTpYP2V@t490s>
References: <20210922222423.644444-1-leobras@redhat.com>
 <20210922222423.644444-2-leobras@redhat.com>
 <YU4H1HwsiAO3KM6r@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YU4H1HwsiAO3KM6r@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
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
Cc: qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>,
 Leonardo Bras <leobras@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Sep 24, 2021 at 06:16:04PM +0100, Daniel P. Berrangé wrote:
> > +ssize_t qio_channel_async_writev(QIOChannel *ioc,
> > +                                 const struct iovec *iov,
> > +                                 size_t niov,
> > +                                 int *fds,
> > +                                 size_t nfds,
> > +                                 Error **errp);
> 
> This is missing any flags. We need something like
> 
>    QIO_CHANNEL_WRITE_FLAG_ZEROCOPY
> 
> passed in an 'unsigned int flags' parameter. This in
> turn makes me question whether we should have the
> common helpers at all, as the api is going to be
> different for sync vs async.
> 
> The QIOChannelFeature enum probably ought to be
> extended with QIO_CHANNEL_FEATURE_WRITE_ZEROCOPY with
> support for probing whether that's supported or not.

I'm also wondering whether we could just drop the fds/nfds as per my knowledge
SCM_RIGHT is the only user, at the meantime I don't see why an async interface
would pass in any fd anyways..  Thanks,

-- 
Peter Xu


