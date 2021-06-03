Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC0EF39A51F
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 17:56:50 +0200 (CEST)
Received: from localhost ([::1]:46234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lopiD-0005Jp-Qp
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 11:56:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lopgv-0003ch-N3
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 11:55:30 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:37408)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lopgt-00043D-Ql
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 11:55:29 -0400
Received: by mail-ej1-x636.google.com with SMTP id ce15so9987163ejb.4
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 08:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=1xYosbAQMh8z6PamZTAEZodmIu/fMkFmaGJh9ZEQMDY=;
 b=HB97XGfX7+56mkWVn8ugKtzWgv7l9pmXCuEnd2NPwv2tugrsvanLlqm+ML1RNxByR4
 jzxPN4dobiQJ4CacZQo5xVe0V5EGshvLPStMd/50TGHLD4e98TiTWd8UZCRZS/vlQckI
 D/IuUSTvaRxmyVejE3dm3OiUB5krpV/+FBQErDYB64iyyDoQVlYPhZQk2fvgwPgLAlVW
 BpDJfYcl4nUJV46o6kHWLPafGwana9/RYnWnhYEvQLGFsX9mBWQ35hAErb2b2653vv44
 bmT+L0gNXsdgO2lMxYDlJGI6LYT5/5f0tlMD8SzxYtoXIeCB6KsSrVhw9RmPDaPXehdW
 i+fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=1xYosbAQMh8z6PamZTAEZodmIu/fMkFmaGJh9ZEQMDY=;
 b=GzMk7DrarHDRGn+d5YIkfz8rBBe0daW0Q1W5vRxEQE8sQL7x5G7scwxdAVP7Aab4V+
 3g/dMAdzbZ4EHgVzkWlGwPRASw7e2OI+dqBnmcDjjumpjdvnCuXLfxx0sJWhoyUPrDBv
 avh+mT9e1QkMmjvZMh9HK3i8hTXrSMD38A+1eP0w9KM4ZBKSdHkfG+V6bf+PHioCSckg
 1QOrHisw5SIAEwpcyp6kw+JXza1j/4t+UYUoLOL8liF3VV6kfq650myF6cfrj1WSutl8
 7YGDWsBPRp0tFa2m0qNMB+y4qkI6YMN8UvLjEBTqx2ENwNG9S7zIT3cQ13JCVlffUWDt
 usuA==
X-Gm-Message-State: AOAM531vmV+VzCdqdbCGv/icOn0saDVYn18ISPrKEfSQbR5HkbBtiXbP
 2E68Go8y1ADkNDhVGspLasJ64pF4a4+RJXvBGlLG/Q==
X-Google-Smtp-Source: ABdhPJwu/RqJ2Li1iIQ6lkgC5e/cVQk31byyfQGdxDNNA8erVYHC/ehZxl7ervOBV9No/EFd8WOGDuonzEC1uZ9Pnug=
X-Received: by 2002:a17:906:5299:: with SMTP id c25mr53841ejm.85.1622735725881; 
 Thu, 03 Jun 2021 08:55:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210527142340.1352791-1-kraxel@redhat.com>
 <20210527142340.1352791-3-kraxel@redhat.com>
In-Reply-To: <20210527142340.1352791-3-kraxel@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Jun 2021 16:54:53 +0100
Message-ID: <CAFEAcA_kNW3kovQkSgz24KA8Y6EmcaDEMDp-oJTi+W4noLmY6A@mail.gmail.com>
Subject: Re: [PULL 02/23] vhost-user-gpu: fix resource leak in
 'vg_resource_create_2d' (CVE-2021-3544)
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Prasad J Pandit <pjp@fedoraproject.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Li Qiang <liq3ea@163.com>, QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 27 May 2021 at 15:28, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> From: Li Qiang <liq3ea@163.com>
>
> Call 'vugbm_buffer_destroy' in error path to avoid resource leak.
>
> Fixes: CVE-2021-3544
> Reported-by: Li Qiang <liq3ea@163.com>
> Reviewed-by: Prasad J Pandit <pjp@fedoraproject.org>
> Signed-off-by: Li Qiang <liq3ea@163.com>
> Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> Message-Id: <20210516030403.107723-3-liq3ea@163.com>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  contrib/vhost-user-gpu/vhost-user-gpu.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/contrib/vhost-user-gpu/vhost-user-gpu.c b/contrib/vhost-user=
-gpu/vhost-user-gpu.c
> index f73f292c9f72..b5e153d0d648 100644
> --- a/contrib/vhost-user-gpu/vhost-user-gpu.c
> +++ b/contrib/vhost-user-gpu/vhost-user-gpu.c
> @@ -349,6 +349,7 @@ vg_resource_create_2d(VuGpu *g,
>          g_critical("%s: resource creation failed %d %d %d",
>                     __func__, c2d.resource_id, c2d.width, c2d.height);
>          g_free(res);
> +        vugbm_buffer_destroy(&res->buffer);
>          cmd->error =3D VIRTIO_GPU_RESP_ERR_OUT_OF_MEMORY;
>          return;
>      }

Hi; Coverity reports this as a use-after-free: we free 'res'
and then on the next line we pass a pointer into this freed
memory to vugbm_buffer_destroy(), which dereferences it.
Probably the two lines should be in the other order ?

(CID 1453812)

thanks
-- PMM

