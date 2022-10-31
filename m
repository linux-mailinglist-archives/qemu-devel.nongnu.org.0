Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B62E614074
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 23:10:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opcxw-0006kL-3A; Mon, 31 Oct 2022 18:09:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opcxt-0006k7-Hy
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 18:09:05 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opcxr-0003uE-Df
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 18:09:05 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 f16-20020a05600c491000b003cf66a2e7c0so4249558wmp.5
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 15:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LyQShnvoJM7z9hDlodIpAOjZgHnaO9r8jiYZc/6MZBk=;
 b=mIrr1FJvWRAC4HmeE9iDwrehh2t7ieXggNwccLDO49TCTUgu+ATdQYxZG0d57XYsU5
 dUyfZOvp0PE38aUxByqtRb5L5sbJTLC+WlftxMdhbprHhqpx8gLkbsRQmohbkEJBo2Rp
 bFLSwTq/XL4UT2OdHLDqr2BUNATB10yO4DPVxkuYpgGXj2QhG61HGE0RjQ5PfFxqkyS7
 RQvQLUm3cyG1aaIZa/xzTI6ORokWu1Ik3JmxM16o53RZI26oXLcxU9J2lGvkpYVERgkf
 dUnp0+cIGihV4hrvz2l5iWGre2M0vNddAcnD26F5yFdHObssUOaTXpBVFSED0wU/AA/N
 yxQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LyQShnvoJM7z9hDlodIpAOjZgHnaO9r8jiYZc/6MZBk=;
 b=2jXWcV/sAyYnXeI9Vha4KiLQCxehFkbatcuFDcmgPwZxscHbzr/TtCR7bsKlJdRXEw
 L3neCswv3NhlIwS0i6PnOe2tAzV24SOYfF2d1/9+tJPjPhHEbu4x1d4CmIodIyoHk15C
 vgiiY5ZBtg3+8wSooUTwAQQlplahLFSWPMCpfQ25HbgM69TkP31n/k3KuD1wNgGPX5zq
 Lst0Zl+SY1qty14gQ8TPKlWgaQ1Qvedf9QmAiVh7l7wSOlx6cDwJqvx27j2f95f0NcGX
 EkNbXFPVaiJa5rzaP+JD5Vjws0w3OdhnM6ujCNXn/o5rgZcZM/ii2JkD/9oDxoPbL2pd
 XVPA==
X-Gm-Message-State: ACrzQf2Tcau/JwVvIDixT2jRHbaXgdM8CVFef0YJEBMaQ+jjiWLi/26i
 YhpS9mBVDmM34694T7LE38vBmQ==
X-Google-Smtp-Source: AMsMyM6DqV2a/e9jZ/s6CrUQ1j2rP0SxUQe5cljzbansYROltu/j3dGAfGioiDY1OQETpZMr9IGCeg==
X-Received: by 2002:a05:600c:4e45:b0:3cf:3e69:9351 with SMTP id
 e5-20020a05600c4e4500b003cf3e699351mr20182478wmq.2.1667254140857; 
 Mon, 31 Oct 2022 15:09:00 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 z17-20020a05600c0a1100b003b492753826sm8508549wmp.43.2022.10.31.15.08.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Oct 2022 15:08:59 -0700 (PDT)
Message-ID: <dccf8560-a4db-53e4-418e-402ba76d7570@linaro.org>
Date: Mon, 31 Oct 2022 23:08:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [PATCH v4 1/2] xen/pt: fix syntax error that causes FTBFS in some
 configurations
Content-Language: en-US
To: Chuck Zmudzinski <brchuckz@aol.com>, qemu-devel@nongnu.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org, QEMU Trivial <qemu-trivial@nongnu.org>
References: <cover.1667242033.git.brchuckz@aol.com>
 <5f1342a13c09af77b1a7b0aeaba5955bcea89731.1667242033.git.brchuckz@aol.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <5f1342a13c09af77b1a7b0aeaba5955bcea89731.1667242033.git.brchuckz@aol.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

On 31/10/22 22:35, Chuck Zmudzinski wrote:
> When Qemu is built with --enable-xen and --disable-xen-pci-passthrough
> and the target os is linux, the build fails with:
> 
> meson.build:3477:2: ERROR: File xen_pt_stub.c does not exist.
> 
> Fixes: 582ea95f5f93 ("meson: convert hw/xen")
> 
> Signed-off-by: Chuck Zmudzinski <brchuckz@aol.com>
> ---
> v2: Remove From: <email address> tag at top of commit message
> 
> v3: No change to this patch since v2
> 
> v4: Use brchuckz@aol.com instead of brchuckz@netscape.net for the author's
>      email address to match the address used by the same author in commits
>      be9c61da and c0e86b76
> 
>   hw/xen/meson.build | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/xen/meson.build b/hw/xen/meson.build
> index 08dc1f6857..ae0ace3046 100644
> --- a/hw/xen/meson.build
> +++ b/hw/xen/meson.build
> @@ -18,7 +18,7 @@ if have_xen_pci_passthrough
>       'xen_pt_msi.c',
>     ))
>   else
> -  xen_specific_ss.add('xen_pt_stub.c')
> +  xen_specific_ss.add(files('xen_pt_stub.c'))
>   endif
>   
>   specific_ss.add_all(when: ['CONFIG_XEN', xen], if_true: xen_specific_ss)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


