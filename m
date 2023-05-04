Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 861A76F65C9
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 09:33:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puTSt-0002lL-BI; Thu, 04 May 2023 03:33:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1puTSq-0002jl-Ko
 for qemu-devel@nongnu.org; Thu, 04 May 2023 03:33:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1puTSp-00007G-0z
 for qemu-devel@nongnu.org; Thu, 04 May 2023 03:33:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683185598;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fCpmttJ9d5f9xVD9aDsHz2r2m3u3wo4We41P/UK796I=;
 b=aK7HWV0clxJYjvF+cB7tikbIXc+mbQ4/whDsx9tDNv3YPx4mPBSveCfr1HLksaiWWwVEwL
 CmlfD/kuY/WDSZCM5DqEoIbgcPwCk3oX46bcaWTNlaPVxfDUnpvI3FDL8GN8SOFElAQabU
 aKc7LDqYg6Lw7lphDCfYuGfE1uF6LBk=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-590-SgDBnTx6OFK9syL3I5u0Xg-1; Thu, 04 May 2023 03:33:16 -0400
X-MC-Unique: SgDBnTx6OFK9syL3I5u0Xg-1
Received: by mail-ed1-f71.google.com with SMTP id
 4fb4d7f45d1cf-50bcd245040so122739a12.0
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 00:33:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683185595; x=1685777595;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fCpmttJ9d5f9xVD9aDsHz2r2m3u3wo4We41P/UK796I=;
 b=dtcwC+vo8dc7uFd3YaNZDRgvaLyju6lcqX43kK3GYAUhE+j1Da7PBcMV7AFKn/X3VO
 zTqkMsT17jXLryit6M4SR/EpGqIYEEDGRdiycFjqFYZi4/j3y4/m0/BxrhJy+qSyS5D9
 YfbFdpN2LqKp3WPQ14ywbQt3uY68fCvwCBS56N8lEwn9i4Kqqwgwha+qPV5/rQxtbnoG
 wfF2bQv7sxqyykvXEribfLbqFs66uMx7QQhL2b3W7qe5UHjQnckoUNWpUyyV97rzmPtA
 tkNEcQGcobUQBq8c+pKlMayX2CT4D27HtXjWoad9ulb5E3yqrOOqAJZoj+I7DzBb8RXx
 NBKQ==
X-Gm-Message-State: AC+VfDx1qVhma84z0fbIhe/vZrsfaX5OkP6v59mvVBPDt0xX92AexdE2
 BXMnzoKjVZCK0oiD2h5akm4lo/wVUst0PuNmNzwNWEyK8dNujgcCODWTiETbfZccKoShqkDAhmr
 u+8WzFE2b06LW1HY=
X-Received: by 2002:a17:907:7fac:b0:965:9d20:a41b with SMTP id
 qk44-20020a1709077fac00b009659d20a41bmr1882645ejc.16.1683185595120; 
 Thu, 04 May 2023 00:33:15 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4H5L/I9TVRuxgZ8QnbK9k7V8NBDIp0ZZI11Q5d39CeCjiz3yEPoQXeoa9ogC/Q6naR0XvA5A==
X-Received: by 2002:a17:907:7fac:b0:965:9d20:a41b with SMTP id
 qk44-20020a1709077fac00b009659d20a41bmr1882623ejc.16.1683185594789; 
 Thu, 04 May 2023 00:33:14 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:1c09:f536:3de6:228c?
 ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.googlemail.com with ESMTPSA id
 d9-20020a17090694c900b0095354acf666sm18401553ejy.92.2023.05.04.00.33.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 May 2023 00:33:14 -0700 (PDT)
Message-ID: <3f8ed21a-6c05-e7a4-ab9a-c8f6ca041013@redhat.com>
Date: Thu, 4 May 2023 09:33:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 1/3] target/arm: Use CONFIG_SEMIHOSTING instead of TCG for
 semihosting
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20230503193833.29047-1-farosas@suse.de>
 <20230503193833.29047-2-farosas@suse.de>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20230503193833.29047-2-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-4.28, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 5/3/23 21:38, Fabiano Rosas wrote:
> When building --without-default-devices, the semihosting code will not
> be available, so check the proper config.

Acked-by: Paolo Bonzini <pbonzini@redhat.com>

for this change; however, there are two more related issues:

1) you still want to leave out the code if !TCG, because KVM is not able
to exit to userspace on semihosting calls as far as I understand

2) I am not sure why CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y appears in
config/targets/{arm,riscv32,riscv64}-softmmu/default.mak.

Putting things together you also need something like

diff --git a/semihosting/Kconfig b/semihosting/Kconfig
index eaf3a20ef5b2..671020a33426 100644
--- a/semihosting/Kconfig
+++ b/semihosting/Kconfig
@@ -4,4 +4,5 @@ config SEMIHOSTING
  
  config ARM_COMPATIBLE_SEMIHOSTING
         bool
+       default y if (ARM && TCG) || RISCV32 || RISCV64
         select SEMIHOSTING
diff --git a/configs/devices/arm-softmmu/default.mak b/configs/devices/arm-softmmu/default.mak
index 1b49a7830c7e..5e7a17d05bf8 100644
--- a/configs/devices/arm-softmmu/default.mak
+++ b/configs/devices/arm-softmmu/default.mak
@@ -41,5 +41,4 @@ CONFIG_FSL_IMX25=y
  CONFIG_FSL_IMX7=y
  CONFIG_FSL_IMX6UL=y
  CONFIG_SEMIHOSTING=y
-CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y
  CONFIG_ALLWINNER_H3=y
diff --git a/configs/devices/riscv32-softmmu/default.mak b/configs/devices/riscv32-softmmu/default.mak
index d847bd5692ec..94a236c9c25b 100644
--- a/configs/devices/riscv32-softmmu/default.mak
+++ b/configs/devices/riscv32-softmmu/default.mak
@@ -3,8 +3,6 @@
  # Uncomment the following lines to disable these optional devices:
  #
  #CONFIG_PCI_DEVICES=n
-CONFIG_SEMIHOSTING=y
-CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y
  
  # Boards:
  #
diff --git a/configs/devices/riscv64-softmmu/default.mak b/configs/devices/riscv64-softmmu/default.mak
index bc69301fa4a6..3f6805944849 100644
--- a/configs/devices/riscv64-softmmu/default.mak
+++ b/configs/devices/riscv64-softmmu/default.mak
@@ -3,8 +3,6 @@
  # Uncomment the following lines to disable these optional devices:
  #
  #CONFIG_PCI_DEVICES=n
-CONFIG_SEMIHOSTING=y
-CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y
  
  # Boards:
  #

Paolo

> Fixes: 29d9efca16 ("arm/Kconfig: Do not build TCG-only boards on a KVM-only build")
> Signed-off-by: Fabiano Rosas<farosas@suse.de>
> ---
>   target/arm/helper.c       | 4 ++--
>   target/arm/tcg/m_helper.c | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)


