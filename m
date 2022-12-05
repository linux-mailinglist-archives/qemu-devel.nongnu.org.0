Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A16642A8B
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Dec 2022 15:41:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2CeS-0002nE-1R; Mon, 05 Dec 2022 09:41:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p2CeO-0002kl-IN
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 09:40:56 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p2CeM-0008VM-Tr
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 09:40:56 -0500
Received: by mail-wr1-x436.google.com with SMTP id d1so18869476wrs.12
 for <qemu-devel@nongnu.org>; Mon, 05 Dec 2022 06:40:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=1h80Rz1J0z2OeEGFTToD3kkyn7zPM0iLlo4GpuXHEZs=;
 b=vWnwjNOzmPsil1u5lF5imwgk5Bh/7ixK/DO23TiagCrpI22D8GRi2VY+ZprRJQJEmM
 fah/0gXeAcUWvbwoYWP1LKj1GTeaWKywDlrA21IrOfB9+bsJsTshRfxeX59Qo5e75dL5
 pHhBN16WSxsiqMIflPeW/NKe5TCd9FLToLgiwfwwGycvBF5ACKxd/nPoJ2m/GPi4NwHq
 XgYx/YAWa9iKzoQoJhOKaYi4X0LSts5i+97kyzrSULC14z2CjzOCC3081WVIn9WCxKC3
 +5+ZHzWgfFRJAWwENFkOCJYMz3CQ4WzxPrGiMzYAKgAO8dEkMovA0Kxi++kbOVg+36bu
 E1Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1h80Rz1J0z2OeEGFTToD3kkyn7zPM0iLlo4GpuXHEZs=;
 b=CNxo1rEeC9tLCdE7RDstGAJlYPMQJsoPVTinfGu28YvMGY5F+k5YkoReH9AcSYqxRI
 ml9SKKXofGmOxJ6NUWCsNJeOeXlQK1Lge6LVNxZtFcDwndgKybciNoUKYj93vEM5HRBo
 3loYeM+bSyKTYwQDiiAXLAk1GEZ5uloaLEimwRrClB+FNRjeopmtdEL9wBjdiJtUV4jO
 GcvtMGuCra0tqROrOA1wgYI6ci5AbgmeVVxDhGEgo+JbCOt1xlFhQ0VClwa0qQBPo7RN
 6uXUx+Iqplkh0T9flZwXaQlWMttN8GF4T+iEwz+T4PyQrQT4o6XMcUSX0e9xt98wZx65
 nVdQ==
X-Gm-Message-State: ANoB5pmz7KzDGRFw1HTxGCOGbAcN2agyqOyu6m0tYwJsTL2iNRIZ2t4u
 ESBu5b8kuQ6oKQmzeetWZ50/U7S9GuLVIfx3c3xnkw==
X-Google-Smtp-Source: AA0mqf5fkrfvtJ6Kthl0ZurEXF0X77ZRDLUzc+wgqblYgqG8JpGKFNCpMjcyjJvMJx0ZkC8a8v3oTw3x97l4if0le54=
X-Received: by 2002:a5d:5a12:0:b0:22e:c2a6:d00d with SMTP id
 bq18-20020a5d5a12000000b0022ec2a6d00dmr44275352wrb.29.1670251253101; Mon, 05
 Dec 2022 06:40:53 -0800 (PST)
MIME-Version: 1.0
References: <20221205080859.2216-1-yangming73@huawei.com>
In-Reply-To: <20221205080859.2216-1-yangming73@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 5 Dec 2022 14:40:36 +0000
Message-ID: <CAFEAcA9uXAPo8X0o4D800ZWhi0p6AbN_eDOyAs7-++AS6D8d1Q@mail.gmail.com>
Subject: Re: [PATCH] net/net.c: Fix qemu crash when hot-pluging a vhost-net
 failed.
To: Ming Yang <yangming73@huawei.com>
Cc: qemu-devel@nongnu.org, jasowang@redhat.com, wangzhigang17@huawei.com, 
 linyilu@huawei.com, zhangliang5@huawei.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 5 Dec 2022 at 14:24, Ming Yang via <qemu-devel@nongnu.org> wrote:
>
> Hot-pluging a vhost-net may cause virtual machine crash in following steps:
> 1. Starting a vm without net devices.
> 2. Hot-pluging 70 memory devices.
> 3. Hot-pluging a vhost-net device.
>
> The reason is : if hotplug a vhost-net failed, the nc cannot be found via function qemu_find_netdev, as
> it has been cleaned up through function qemu_cleanup_net_client. Which leads to the result
> that assert(nc) failed, then qemu crashed.
>
> While, the root reason is that, in commit 46d4d36d0bf2 if not both has_vhostforce and vhostforce flags
> are true, the errp would not be set. Then net_init_tap would not return a negative value, fallowed by founding nc
> and assert nc.
>
> In this patch, asserting nc is replaced with setting an error message.
>
> Fixes: 46d4d36d0bf2("tap: setting error appropriately when calling net_init_tap_one()")
> Signed-off-by: Ming Yang <yangming73@huawei.com>
> Signed-off-by: Liang Zhang <zhangliang5@huawei.com>
> ---
>  net/net.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/net/net.c b/net/net.c
> index 840ad9dca5..1d1d7e54c4 100644
> --- a/net/net.c
> +++ b/net/net.c
> @@ -1103,7 +1103,16 @@ static int net_client_init1(const Netdev *netdev, bool is_netdev, Error **errp)
>
>      if (is_netdev) {
>          nc = qemu_find_netdev(netdev->id);
> -        assert(nc);
> +        /*
> +         * If the tap of hotpluged net device do not has both has_vhostforce flag and vhostforce flags,
> +         * when error occurs, the error messags will be report but not set to errp. Thus net_client_init_fun
> +         * will not return a negatave value. Therefore the value of nc might be NULL. To make qemu robust,
> +         * it is better to judge if nc is NULL.
> +         */
> +        if (!nc) {
> +            error_setg(errp, "Device '%s' could not be initialized", netdev->id);
> +            return -1;
> +        }
>          nc->is_netdev = true;
>      }

This doesn't look like the right fix to me. If the net_client_init_fun
doesn't correctly initialize the netdev, it should report that error
back to the caller. We should make the tap init function correctly
return an error in this error situation, not work around it in
the caller. The assert() is correct, because it is detecting a bug
elsewhere in QEMU that we need to fix.

thanks
-- PMM

