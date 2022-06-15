Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96BA354C459
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 11:09:28 +0200 (CEST)
Received: from localhost ([::1]:42602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1P1j-0005pk-Jy
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 05:09:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1o1Oe9-0006up-9S
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 04:45:15 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:42885)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1o1Ody-0000aO-2x
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 04:45:01 -0400
Received: by mail-wr1-x429.google.com with SMTP id s1so14352870wra.9
 for <qemu-devel@nongnu.org>; Wed, 15 Jun 2022 01:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2TWFXOeINrc2T2K+zNyyHTjHdK14f9+ATGxzo66bpqw=;
 b=HPwDNiDUIL8K8vAUVC7mMGAGC2YUJrYuMKXqh5/tIhQeoKpDDgdKwil4eHmvgV02ey
 /ZmNhK0bW3mSz4BgVtRFxnc8e8WGHv0gyE1UJdQ7AyPYvMChZyabqPcFJxrSOLOyrcmo
 tEvt5lerDEEfyiwONyxh3C7euPLTnqCk1Un8gnpOXwevINTwfZilaZRuQE27bdsm1AKk
 FtchjkMFScPVcavb9Cm7MNfr7ubrRupa2i+u2uxCb4mkrRdVaEYgZ2w6Qc04DC96BCcN
 DMAbBI7hxzww6zpf+QS+20IXHRJwpkm2XdR0ySoYT9Uav7nAYG3GuIx4c9cRMd2fIC7l
 tJbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2TWFXOeINrc2T2K+zNyyHTjHdK14f9+ATGxzo66bpqw=;
 b=waM5yTErvmkhBNesA/EBBfsfNwcdI7hXm4R6IPVXVsoJ+2IvF5JqqcMXcZFOTgkWNT
 FGg1yICu666UNI2qoNq4iB83vZ+YgbSYPB743DJWIur+Sbv/msoYrMT8QZ5PPC36nXpL
 9Bo5WETPzhuSYyvvUP7c9dyscrjf1KylQi7woAsTEeGTpPpbgfYRSm5ouGGwfg/8iuas
 nHhDDOV5zF5Is8RhoVkp0AhwD0jdy9h4IdupEjbLgemmo70QPnfqseGL8/IYc/ZQ9xDM
 rl5LmNC6AO2Ks7lQKC/Z26FVUWaJLrXbvx0K42rJxCTlBz7ilzRHQMwgpfiUemBqgxB0
 Cq+A==
X-Gm-Message-State: AJIora9bVMDOFJJxgzYmXaNs8h86VmIqKoWH1Dsphar15cGlyueQXtll
 GQpUuOPYcUnNnw6jr8ojfdc=
X-Google-Smtp-Source: AGRyM1tV1d9IRKpTUxFX0B5wLDWTsJzp2tEMCrNoQBh0WZVOnE37q+FlCL0KtWoPdW7gQ4zQhKNZfg==
X-Received: by 2002:adf:f40e:0:b0:218:3ea6:2d4d with SMTP id
 g14-20020adff40e000000b002183ea62d4dmr8795104wro.309.1655282689837; 
 Wed, 15 Jun 2022 01:44:49 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 b6-20020a056000054600b002102739add8sm17024994wrf.54.2022.06.15.01.44.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jun 2022 01:44:49 -0700 (PDT)
Message-ID: <c946b6a3-aa18-835c-885f-04e97b7ed15e@redhat.com>
Date: Wed, 15 Jun 2022 10:44:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: =?UTF-8?Q?Re=3a_=5bPATCH=5d_q35=ef=bc=9aEnable_TSEG_only_when_G=5fS?=
 =?UTF-8?Q?MRAME_and_TSEG=5fEN_both_enabled?=
Content-Language: en-US
To: Zhenzhong Duan <zhenzhong.duan@intel.com>, qemu-devel@nongnu.org
Cc: mst@redhat.com, marcel.apfelbaum@gmail.com, lersek@redhat.com,
 imammedo@redhat.com, kraxel@redhat.com
References: <20220615034501.2733802-1-zhenzhong.duan@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220615034501.2733802-1-zhenzhong.duan@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/15/22 05:45, Zhenzhong Duan wrote:
> According to spec:
> "TSEG Enable (T_EN): Enabling of SMRAM memory for Extended SMRAM space
> only. When G_SMRAME = 1 and TSEG_EN = 1, the TSEG is enabled to appear
> in the appropriate physical address space. Note that once D_LCK is set,
> this bit becomes read only."
> 
> Changed to match the spec description.
> 
> Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
> ---
>   hw/pci-host/q35.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/pci-host/q35.c b/hw/pci-host/q35.c
> index ab5a47aff560..20da1213747c 100644
> --- a/hw/pci-host/q35.c
> +++ b/hw/pci-host/q35.c
> @@ -379,7 +379,8 @@ static void mch_update_smram(MCHPCIState *mch)
>           memory_region_set_enabled(&mch->high_smram, false);
>       }
>   
> -    if (pd->config[MCH_HOST_BRIDGE_ESMRAMC] & MCH_HOST_BRIDGE_ESMRAMC_T_EN) {
> +    if ((pd->config[MCH_HOST_BRIDGE_ESMRAMC] & MCH_HOST_BRIDGE_ESMRAMC_T_EN) &&
> +        (pd->config[MCH_HOST_BRIDGE_SMRAM] & SMRAM_G_SMRAME)) {
>           switch (pd->config[MCH_HOST_BRIDGE_ESMRAMC] &
>                   MCH_HOST_BRIDGE_ESMRAMC_TSEG_SZ_MASK) {
>           case MCH_HOST_BRIDGE_ESMRAMC_TSEG_SZ_1MB:

Queued, thanks.

paolo

