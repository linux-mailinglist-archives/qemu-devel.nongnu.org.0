Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 571B641BA8B
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 00:47:07 +0200 (CEST)
Received: from localhost ([::1]:56326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVLsQ-0001Qj-Em
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 18:47:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mVLqy-0000XG-Du
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 18:45:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59611)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mVLqs-0001pZ-V2
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 18:45:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632869129;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eAT8jxeNm5WD2CuXtxSGkATh0GHKhjswgL9DX2zsoKM=;
 b=V0uYTm7aFYmYBExa+9vWrDDsQf9bLAiDhDAriTM9Iwtzbg+ZEYPiJIAVnHiWjEFEHFOene
 FaCSdrx5jE+4XKpPsmxnd0F5N8bYm8Gf3t56t/hCNSKQjgGg/CkI7LyWqNrKMtD4vwzt4p
 wGpLUEfHwQNsf2NCoPcpOz15S5h26hg=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-587-bzncgilMNdm4YZbZDrUIRQ-1; Tue, 28 Sep 2021 18:45:27 -0400
X-MC-Unique: bzncgilMNdm4YZbZDrUIRQ-1
Received: by mail-io1-f72.google.com with SMTP id
 b13-20020a05660214cd00b005d6279b61fdso511862iow.13
 for <qemu-devel@nongnu.org>; Tue, 28 Sep 2021 15:45:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=eAT8jxeNm5WD2CuXtxSGkATh0GHKhjswgL9DX2zsoKM=;
 b=GlyQLNL76Aq5ZCB2cc/+CtOJDJVjRfTQDqmnvdPGBfSIxK81NljNN1bxMbKybmvi9u
 X5CtzVq+kXeyqF2aTLSLRByTY4D/lrTu25oro/xDrGeTWw3UVrL7xPkr/X/mFgClSPPV
 ov7ZZYsUIMY89LNuTtVdBQCShEzgeWHdHR3E6qWfVIzjgAMgjUYm+rO1mnOV/fQi0aUQ
 bitVVjadRmB8gOJVaVmKXpLQ9QWkH0x7pXxV1KkBPyIlv8dj7y/xX5lJp4d9cK+OM2+L
 ByNifoWu37oaYUZkK8JYwVed/84AwLgPsaeSYZIh6u/T178rYZ5vcGDjSJrEcIsCk9vQ
 da/g==
X-Gm-Message-State: AOAM531qIHxUyedeAHAIKpkclEWEXgWGJRJUfSZ+9elsMiI9DxowquR5
 o8EslbxIA8zSxeyZOYja12QrfnYkxcl7i66tJ5nAvKcIr0h7ltEfFs1Lp0EeHsh8ebz5axAbBDi
 2D1VVzP2bmIMei2U=
X-Received: by 2002:a92:db0b:: with SMTP id b11mr6082116iln.275.1632869126908; 
 Tue, 28 Sep 2021 15:45:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwvcvlnx+uUqJr+xybpGgH32pZawdC68/5GgJXJ69ZwZYSO/fFpxXa8Zdb9SbSSiXNhQz/hFQ==
X-Received: by 2002:a92:db0b:: with SMTP id b11mr6082104iln.275.1632869126672; 
 Tue, 28 Sep 2021 15:45:26 -0700 (PDT)
Received: from t490s ([2607:fea8:56a2:9100::d3ec])
 by smtp.gmail.com with ESMTPSA id b14sm229702ilc.63.2021.09.28.15.45.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Sep 2021 15:45:26 -0700 (PDT)
Date: Tue, 28 Sep 2021 18:45:24 -0400
From: Peter Xu <peterx@redhat.com>
To: Leonardo Bras <leobras@redhat.com>
Subject: Re: [PATCH v3 2/3] QIOChannelSocket: Implement io_async_write &
 io_async_flush
Message-ID: <YVObBEofYcUvEmOz@t490s>
References: <20210922222423.644444-1-leobras@redhat.com>
 <20210922222423.644444-3-leobras@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210922222423.644444-3-leobras@redhat.com>
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
Cc: qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 22, 2021 at 07:24:22PM -0300, Leonardo Bras wrote:
> +static void qio_channel_socket_async_flush(QIOChannel *ioc,
> +                                           Error **errp)
> +{
> +    QIOChannelSocket *sioc = QIO_CHANNEL_SOCKET(ioc);
> +    struct msghdr msg = {};
> +    struct pollfd pfd;
> +    struct sock_extended_err *serr;
> +    struct cmsghdr *cm;
> +    char control[CMSG_SPACE(sizeof(int) * SOCKET_MAX_FDS)];
> +    int ret;
> +
> +    memset(control, 0, CMSG_SPACE(sizeof(int) * SOCKET_MAX_FDS));
> +    msg.msg_control = control;
> +    msg.msg_controllen = sizeof(control);
> +
> +    while (sioc->async_sent < sioc->async_queued) {
> +        ret = recvmsg(sioc->fd, &msg, MSG_ERRQUEUE);
> +        if (ret < 0) {
> +            if (errno == EAGAIN) {
> +                /* Nothing on errqueue, wait */
> +                pfd.fd = sioc->fd;
> +                pfd.events = 0;
> +                ret = poll(&pfd, 1, 250);
> +                if (ret == 0) {
> +                    /*
> +                     * Timeout : After 250ms without receiving any zerocopy
> +                     * notification, consider all data as sent.
> +                     */
> +                    break;

After a timeout, we'll break the while loop and continue parsing an invalid
msg [1].  Is that what we want?

Also, I don't think we can return the flush() even if timed out - iiuc we
should keep polling until we have async_sent==async_queued.  It depends on how
we define flush(): if it's "when this function returns all data is sent", then
we should keep polling, and afaict this is what we want here right now.

> +                } else if (ret < 0 ||
> +                           (pfd.revents & (POLLERR | POLLHUP | POLLNVAL))) {
> +                    error_setg_errno(errp, errno,
> +                                     "Poll error");
> +                    break;
> +                } else {
> +                    continue;
> +                }
> +            }
> +            if (errno == EINTR) {
> +                continue;
> +            }
> +
> +            error_setg_errno(errp, errno,
> +                             "Unable to read errqueue");
> +            break;
> +        }
> +
> +        cm = CMSG_FIRSTHDR(&msg);

[1]

> +        if (cm->cmsg_level != SOL_IP &&
> +            cm->cmsg_type != IP_RECVERR) {
> +            error_setg_errno(errp, EPROTOTYPE,
> +                             "Wrong cmsg in errqueue");
> +            break;
> +        }

-- 
Peter Xu


