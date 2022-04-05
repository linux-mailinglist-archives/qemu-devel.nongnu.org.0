Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5678A4F29C4
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Apr 2022 12:38:48 +0200 (CEST)
Received: from localhost ([::1]:50910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbgaE-0002TP-CA
	for lists+qemu-devel@lfdr.de; Tue, 05 Apr 2022 06:38:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcel.apfelbaum@gmail.com>)
 id 1nbgTZ-0007yO-BE
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 06:31:55 -0400
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32]:37917)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcel.apfelbaum@gmail.com>)
 id 1nbgTX-0007PV-QZ
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 06:31:52 -0400
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-dacc470e03so13898174fac.5
 for <qemu-devel@nongnu.org>; Tue, 05 Apr 2022 03:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=i17K8XY98jAxrKtRgcT2YbUSda5Yi5b2a96BbnFqKvw=;
 b=HXtRmylg+uiiplvBnW4QuPRc15XTNi3zSPi+OHdHxat4aYnskCPURj8nShrXOy6OFA
 2AETyXDDXNHT7lIWWK21g6RalRd0ghtg5jodPcC9iQ+qPjDeiLWDTFu0sC56il7Bb5Ji
 M8/zKwpiCOlDKDbS2vHJj7Gp5qispSXUeYs4zoamNt5Ytzcr+vuPgB+0ukkE4u8JEx5G
 QR4F9Pzuxv+nNYrIouwm6OYGPNX0znD25uX6ZMrGiYGseqaTqVVBT8+Vw47rtri+GdN2
 /fprh22FCh7Qh8yn5+Bg9dn4IO+ydwizG0GIG86qM8oIHVILUyDrOd8lKKkUZTB+3gAf
 kq2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=i17K8XY98jAxrKtRgcT2YbUSda5Yi5b2a96BbnFqKvw=;
 b=OV7NlIpbNtnvYUgMmlC5AQX25ZOlFT/OmadvUxJV4G91lScEXEa42amaC4by+CotVm
 bqmEy3YlQqGxLweQHFW6DL5dcNryfGRgi6yvpbV4YLDOzUlystLr3OubGw1NU1Dy//7x
 NTls5A5g7ACdYB2ieOp7cCxutTMicDZHZudNxzAfNfUt4geFzXzd/g+XJmynYMNLb8jD
 /9pN1qZ67MQw8+lXbBnYcmc0dbtqGbHLL+pCMf4IaYNbTe7htw5NjmnaZmGhfNAYC/Ie
 wlE9fKY8x5Pv3dAXLuhSwDbj/nTjiCKuDnGVaaqV/V0Sapc2gZIyFi30Fv2F9yTMkzTF
 M6dQ==
X-Gm-Message-State: AOAM5302X3s5dcAHdi7tzvpMpKmO5wYW9Q0kQgbh3BMdHbOwLDw0iBTL
 tY/Uwk0uktjN9yCPissyIGvBRMgoYbEnkYDJAks=
X-Google-Smtp-Source: ABdhPJyjwC/TMFEyVQJEIaqdMPVHodZrkh6adoKhOERxcZwq+puVQhiT6CE1dP+mZ9yuST8mau2ks3HiilnKTw4csFU=
X-Received: by 2002:a05:6870:207:b0:db:f749:2936 with SMTP id
 j7-20020a056870020700b000dbf7492936mr1200878oad.274.1649154710672; Tue, 05
 Apr 2022 03:31:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220403095234.2210-1-yuval.shaia.ml@gmail.com>
In-Reply-To: <20220403095234.2210-1-yuval.shaia.ml@gmail.com>
From: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Date: Tue, 5 Apr 2022 12:31:39 +0200
Message-ID: <CAC_L=vXsKpai6Wr0Fi2r5sr4U+tshPB9VizqntDppqE=1_FbVQ@mail.gmail.com>
Subject: Re: [PATCH v3] hw/pvrdma: Protect against buggy or malicious guest
 driver
To: Yuval Shaia <yuval.shaia.ml@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2001:4860:4864:20::32;
 envelope-from=marcel.apfelbaum@gmail.com; helo=mail-oa1-x32.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: wxhusst@gmail.com, Mauro Matteo Cascella <mcascell@redhat.com>,
 qemu devel list <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Yuval,
Thank you for the changes.

On Sun, Apr 3, 2022 at 11:54 AM Yuval Shaia <yuval.shaia.ml@gmail.com> wrote:
>
> Guest driver might execute HW commands when shared buffers are not yet
> allocated.
> This could happen on purpose (malicious guest) or because of some other
> guest/host address mapping error.
> We need to protect againts such case.
>
> Fixes: CVE-2022-1050
>
> Reported-by: Raven <wxhusst@gmail.com>
> Signed-off-by: Yuval Shaia <yuval.shaia.ml@gmail.com>
> ---
> v1 -> v2:
>         * Commit message changes
> v2 -> v3:
>         * Exclude cosmetic changes
> ---
>  hw/rdma/vmw/pvrdma_cmd.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/hw/rdma/vmw/pvrdma_cmd.c b/hw/rdma/vmw/pvrdma_cmd.c
> index da7ddfa548..89db963c46 100644
> --- a/hw/rdma/vmw/pvrdma_cmd.c
> +++ b/hw/rdma/vmw/pvrdma_cmd.c
> @@ -796,6 +796,12 @@ int pvrdma_exec_cmd(PVRDMADev *dev)
>
>      dsr_info = &dev->dsr_info;
>
> +    if (!dsr_info->dsr) {
> +            /* Buggy or malicious guest driver */
> +            rdma_error_report("Exec command without dsr, req or rsp buffers");
> +            goto out;
> +    }
> +
>      if (dsr_info->req->hdr.cmd >= sizeof(cmd_handlers) /
>                        sizeof(struct cmd_handler)) {
>          rdma_error_report("Unsupported command");
> --
> 2.20.1
>

cc-ing Peter and Philippe for a question:
Do we have a "Security Fixes" or a "Misc" subtree? Otherwise it will
have to wait a week or so.

Reviewed by: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Thanks,
Marcel

