Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E41962C2B95
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 16:39:17 +0100 (CET)
Received: from localhost ([::1]:48894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khaPV-0007vw-0D
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 10:39:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.s.norwitz@gmail.com>)
 id 1khaOQ-0007NF-FL; Tue, 24 Nov 2020 10:38:10 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:38294)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <raphael.s.norwitz@gmail.com>)
 id 1khaOO-0003A4-Jy; Tue, 24 Nov 2020 10:38:10 -0500
Received: by mail-ot1-x342.google.com with SMTP id 92so16652310otd.5;
 Tue, 24 Nov 2020 07:38:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=T9aximfDkcbO+2+ihjXsHELH/uw7Ph7PjKl7o2wstDs=;
 b=VlWcPZHEeP7yIr6paGUhRSRchx/CZ7Hgu6UWYi/FjGF3ll7b0WgxSV41fJZyHax6HK
 QTHKDS+axtFHWAyKGQLVTWsYiYogWs+q1S3uIkBE6oitfWtoP6FbJat+cCYZFs0NgISy
 QxLVRDBqjFNSz9l30IyS0z56e1JDXWVai11IInX5L4IKf46p2E1Q2+Quuph0kL6qCHqC
 PIyM6u3loW+ub9GWro4aLPY9TFwDifqCYkF5zC8A1wl3RE4oce/+ILoYmyJwEK/dwqYj
 6n8NtAmTg1Ei4zjB9+/7rQDQMqd9OS+IMFmsDhYBjVJIBiYrrLVsMKS3BgRMatahZQKm
 9Krg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=T9aximfDkcbO+2+ihjXsHELH/uw7Ph7PjKl7o2wstDs=;
 b=HXRQtYlt1LyhvUpz/83N6O/FPEkqbO/ZYakpnjBpzlRPqe8TG6BGQMiGXasFzkRMwI
 qqFlvIPEJmLCAE/W2dwaEf7gMfylo0ByhVLSnvnSnfcuNOMJ9NcVxrRW1oDQ55sbe6DW
 4daOQ+ZBJwFhRNBCHm/MLtbNidQMCfIww7sT+cpxDIlUXF1b6U58rjCOhn+b6Xqo089a
 B/oFU7rtXZlT60OJbb9lE1ZzJ65j2KgDt+zk2amb9HE/1h5PuMUz/zXuniMn1w1eU15P
 K/ejtV3gBthQR18b/AUdpTeDdMyqMlgx349iY7JWyyn8WiKhWXl1O5R5PtUMyCQsy2j+
 v4+Q==
X-Gm-Message-State: AOAM53151M+lFSpFaO6MU7sulgtwFWCQ5TiXoHHz38NTJGQEvRHliI8h
 xHpf/++OvBf+5onkpYl17ufdyMGNsIxa6/+DSpk=
X-Google-Smtp-Source: ABdhPJzHyu+wOhvPtYmSG6qGRzIeV/2pAWwc43pwGaIu6xa1ica19HcnW6AkFi8TvGd/UU8j+nK721Ph5z9UhaWBQnQ=
X-Received: by 2002:a9d:27e8:: with SMTP id c95mr3784442otb.262.1606232286750; 
 Tue, 24 Nov 2020 07:38:06 -0800 (PST)
MIME-Version: 1.0
References: <20201124143727.47037-1-alex.chen@huawei.com>
In-Reply-To: <20201124143727.47037-1-alex.chen@huawei.com>
From: Raphael Norwitz <raphael.s.norwitz@gmail.com>
Date: Tue, 24 Nov 2020 10:37:55 -0500
Message-ID: <CAFubqFub7gPiuHAU4fFXPncCZhfM3iPAr-oVDgR3Ewyk_D8hjA@mail.gmail.com>
Subject: Re: [PATCH] vhost-user-scsi: Fix memleaks in vus_proc_req()
To: Alex Chen <alex.chen@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::342;
 envelope-from=raphael.s.norwitz@gmail.com; helo=mail-ot1-x342.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: qemu-trivial@nongnu.org, zhang.zhanghailiang@huawei.com,
 Raphael Norwitz <raphael.norwitz@nutanix.com>, QEMU <qemu-devel@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 24, 2020 at 9:50 AM Alex Chen <alex.chen@huawei.com> wrote:
>
> The 'elem' is allocated memory in vu_queue_pop(), and it's memory should be
> freed in all error branchs after vu_queue_pop().

s/branchs/branches

> In addition, in order to free 'elem' memory outside of while(1) loop, move the
> definition of 'elem' to the begin of vus_proc_req().

s/begin/beginning

>
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Alex Chen <alex.chen@huawei.com>

Other than spelling in the commit message, looks good to me.

Reviewed-by: Raphael Norwitz <raphael.norwitz@nutanix.com>

> ---
>  contrib/vhost-user-scsi/vhost-user-scsi.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/contrib/vhost-user-scsi/vhost-user-scsi.c b/contrib/vhost-user-scsi/vhost-user-scsi.c
> index 0f9ba4b2a2..4639440a70 100644
> --- a/contrib/vhost-user-scsi/vhost-user-scsi.c
> +++ b/contrib/vhost-user-scsi/vhost-user-scsi.c
> @@ -232,6 +232,7 @@ static void vus_proc_req(VuDev *vu_dev, int idx)
>      VugDev *gdev;
>      VusDev *vdev_scsi;
>      VuVirtq *vq;
> +    VuVirtqElement *elem = NULL;
>
>      assert(vu_dev);
>
> @@ -248,7 +249,6 @@ static void vus_proc_req(VuDev *vu_dev, int idx)
>      g_debug("Got kicked on vq[%d]@%p", idx, vq);
>
>      while (1) {
> -        VuVirtqElement *elem;
>          VirtIOSCSICmdReq *req;
>          VirtIOSCSICmdResp *rsp;
>
> @@ -288,6 +288,7 @@ static void vus_proc_req(VuDev *vu_dev, int idx)
>
>          free(elem);
>      }
> +    free(elem);
>  }
>
>  static void vus_queue_set_started(VuDev *vu_dev, int idx, bool started)
> --
> 2.19.1
>
>

