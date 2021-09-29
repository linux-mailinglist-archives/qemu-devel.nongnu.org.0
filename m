Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1653941CCB0
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 21:37:01 +0200 (CEST)
Received: from localhost ([::1]:34122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVfNz-00081r-Pv
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 15:36:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1mVfMk-0006f6-9h
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 15:35:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1mVfMi-0006dK-Sd
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 15:35:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632944139;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BHeKQ1imOgkmJghs9QwWX0FzzEzceufWR99qF9mPhvg=;
 b=hGXnOU6rq3/60tZdTucGbvw5ij9qGSbplZRAy6UlrxFQR8U7+21pGRm+BmLVLlMsx2e79t
 lqjrdPuf954US9Rzx7CSmOLxRxv8A5N7b6cMFLP9PzGOYzzbsjEFuo9cGGQRtUqD7t2Pwn
 zBj134L/HjhLPOM02hO772J+Z+/WpMo=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-458-uFCqczrHN-ukAK-tPPXkvg-1; Wed, 29 Sep 2021 15:35:38 -0400
X-MC-Unique: uFCqczrHN-ukAK-tPPXkvg-1
Received: by mail-lf1-f70.google.com with SMTP id
 c6-20020a05651200c600b003fc6d39efa4so3337097lfp.12
 for <qemu-devel@nongnu.org>; Wed, 29 Sep 2021 12:35:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BHeKQ1imOgkmJghs9QwWX0FzzEzceufWR99qF9mPhvg=;
 b=b1o9+NSqBIy/PO1wzxEN4xlvi+ahHtO1O14Kuzzcwkgh/X/1x4Mp9sg8EoDgx74GJ6
 zyfSD5b5V1OD0JJ0T3I2elvjRo4emBpPLE4Cje39DbxK/iJKjKPYXG2U7PcpuHZHvrEq
 UwU0gPdkFAbB9q4zIsSbfmLnUiYaj17dl7F1nzl8xlnxsdtcVMJZ9kH0tymg/uISrSEN
 29bOZSjzZSz2L0U3Pk0WGWUiqAvczmCribUjO0+V8OUAP5w8O6PzV//MHXuaURNqP67b
 TgHaBSOWATrCtuF7FHAFyGjcfgpdOAMQJg6hMhjbf+Q/rDn1/UVcAu7cHhRZGRymFu0H
 UMPA==
X-Gm-Message-State: AOAM533T1YPVpSVFrcj7vCV3BImZk25HWshZrmGL91RaFwjgSpEI3pBO
 2ghNezQfVNSrOT11paprVSqRkIgj3Pok8DDX07MC8XUFW2G2KapGgcydc00ArlUVoOzjYlMKynl
 4U+r1i1dll+v6tQU/DREzN1f2iyNDsRU=
X-Received: by 2002:a2e:54e:: with SMTP id 75mr1777024ljf.116.1632944136806;
 Wed, 29 Sep 2021 12:35:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxrFiYHrAQzsQZ+C/UtFnJgSUkCaZvZ6nAbK2XApyetDC08RJ6FOjF8y7sZNrXDaJdKxslDnhLUIN5N22Tnae0=
X-Received: by 2002:a2e:54e:: with SMTP id 75mr1777008ljf.116.1632944136639;
 Wed, 29 Sep 2021 12:35:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210922222423.644444-1-leobras@redhat.com>
 <20210922222423.644444-3-leobras@redhat.com>
 <YVObBEofYcUvEmOz@t490s>
In-Reply-To: <YVObBEofYcUvEmOz@t490s>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Wed, 29 Sep 2021 16:36:10 -0300
Message-ID: <CAJ6HWG5tqm9eg3XzKF-M5nVFSkO9u5NVyUA7uxo8rC3bdZv_zA@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] QIOChannelSocket: Implement io_async_write &
 io_async_flush
To: Peter Xu <peterx@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lsoaresp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lsoaresp@redhat.com;
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
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Sep 28, 2021 at 7:45 PM Peter Xu <peterx@redhat.com> wrote:
>
> On Wed, Sep 22, 2021 at 07:24:22PM -0300, Leonardo Bras wrote:
> > +static void qio_channel_socket_async_flush(QIOChannel *ioc,
> > +                                           Error **errp)
> > +{
> > +    QIOChannelSocket *sioc = QIO_CHANNEL_SOCKET(ioc);
> > +    struct msghdr msg = {};
> > +    struct pollfd pfd;
> > +    struct sock_extended_err *serr;
> > +    struct cmsghdr *cm;
> > +    char control[CMSG_SPACE(sizeof(int) * SOCKET_MAX_FDS)];
> > +    int ret;
> > +
> > +    memset(control, 0, CMSG_SPACE(sizeof(int) * SOCKET_MAX_FDS));
> > +    msg.msg_control = control;
> > +    msg.msg_controllen = sizeof(control);
> > +
> > +    while (sioc->async_sent < sioc->async_queued) {
> > +        ret = recvmsg(sioc->fd, &msg, MSG_ERRQUEUE);
> > +        if (ret < 0) {
> > +            if (errno == EAGAIN) {
> > +                /* Nothing on errqueue, wait */
> > +                pfd.fd = sioc->fd;
> > +                pfd.events = 0;
> > +                ret = poll(&pfd, 1, 250);
> > +                if (ret == 0) {
> > +                    /*
> > +                     * Timeout : After 250ms without receiving any zerocopy
> > +                     * notification, consider all data as sent.
> > +                     */
> > +                    break;
>
> After a timeout, we'll break the while loop and continue parsing an invalid
> msg [1].  Is that what we want?

No, the point here was returning from flush if this (long) timeout
happened, as in
"if asso long has passed, there must be no pending send", which I
agree is quite bad,
but it was all I could think to avoid an infinite loop here if
something goes wrong.

>
> Also, I don't think we can return the flush() even if timed out - iiuc we
> should keep polling until we have async_sent==async_queued.  It depends on how
> we define flush(): if it's "when this function returns all data is sent", then
> we should keep polling, and afaict this is what we want here right now.

Yeah, I agree.
That is the correct way to deal with this.

>
> > +                } else if (ret < 0 ||
> > +                           (pfd.revents & (POLLERR | POLLHUP | POLLNVAL))) {
> > +                    error_setg_errno(errp, errno,
> > +                                     "Poll error");
> > +                    break;
> > +                } else {
> > +                    continue;
> > +                }
> > +            }
> > +            if (errno == EINTR) {
> > +                continue;
> > +            }
> > +
> > +            error_setg_errno(errp, errno,
> > +                             "Unable to read errqueue");
> > +            break;
> > +        }
> > +
> > +        cm = CMSG_FIRSTHDR(&msg);
>
> [1]
>
> > +        if (cm->cmsg_level != SOL_IP &&
> > +            cm->cmsg_type != IP_RECVERR) {
> > +            error_setg_errno(errp, EPROTOTYPE,
> > +                             "Wrong cmsg in errqueue");
> > +            break;
> > +        }
>
> --
> Peter Xu
>

Best regards,
Leonardo


