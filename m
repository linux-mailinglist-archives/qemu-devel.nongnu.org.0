Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27BA457955F
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 10:41:23 +0200 (CEST)
Received: from localhost ([::1]:48140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDinB-0008A5-VK
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 04:41:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oDil3-0005VC-DJ
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 04:39:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52126)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oDil1-0000Uv-JM
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 04:39:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658219946;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MZjaDW/LnidMiPExddFW/E2rDRA58gz/Nfw8vQwl7Dg=;
 b=a36xFAlFG5Gv3Wr8TJvBE+syce8KTeAaD10lTCxHnOHSGrc0Myg4yN4m/RLcHxvcnJPgvP
 5vcQxGHmoVFkoY8vfsKyQkPdciVtmbKh2JL3Oj09UXBKqhnYW2J2My7lNCNnbsaQc0l0cp
 EzQjbdjD6dZFwr2Y8wLja1Ag24M6lNs=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-261-mKPbwU3_NdOKxLTniu-FmQ-1; Tue, 19 Jul 2022 04:39:05 -0400
X-MC-Unique: mKPbwU3_NdOKxLTniu-FmQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 s16-20020adf9790000000b0021e36810385so215363wrb.15
 for <qemu-devel@nongnu.org>; Tue, 19 Jul 2022 01:39:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:cc:from:in-reply-to
 :content-transfer-encoding;
 bh=MZjaDW/LnidMiPExddFW/E2rDRA58gz/Nfw8vQwl7Dg=;
 b=FuCxDT+05cMfuV710uTp1hegrNXBmw1pGJoG/CEl2+klrEh0LMkZzZL0AIrP/w4e9y
 ITgwuT8rrjT/Zk4cp7XLXLXXAEGrqYTnK4b57SwAUUF6XqG+/RkjfXUuyD6HwM9VFN3v
 A3BflarUR3VfQivv2JRNgLtmAwo41aCaqWZBsPC5DS8yt8lH43QkOQh3qb09avvl5Wku
 8mHHdfcMW8d5QanxtvKi+2j8Wh1nHUDQ/RCiybNrykC91Ltn3PQlxB0lNVpsoijB1Qoh
 h9PyBRqcym6dvuHgHrwyOSHCPmQotq8eyxxy+4ra4LB/AS0snbyXjaIoh2chzGCGkGZN
 yiPw==
X-Gm-Message-State: AJIora+Z5AIL2weIA6As8FYL96l9MI+GQrh1PPPWzmlVXIVTZCryl18x
 emIP8YixjkvVA22KsevoDLNZcBAmRNPQ3MC4PeaHARccraHa+8CZdrOhiQB6zQqqTRWWOzF6Twi
 fEceIGSuG8XB6cqs=
X-Received: by 2002:adf:e5c3:0:b0:21d:6be1:9c43 with SMTP id
 a3-20020adfe5c3000000b0021d6be19c43mr25807320wrn.625.1658219944075; 
 Tue, 19 Jul 2022 01:39:04 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tiViI4MamVY2id1k8/DiyDIggZUK1jMFgVutpy09PDB22ppkTvHs/wgPf8GoFEZIaelh9ARg==
X-Received: by 2002:adf:e5c3:0:b0:21d:6be1:9c43 with SMTP id
 a3-20020adfe5c3000000b0021d6be19c43mr25807299wrn.625.1658219943749; 
 Tue, 19 Jul 2022 01:39:03 -0700 (PDT)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 l19-20020a5d5273000000b0021d60994b0asm12522259wrc.100.2022.07.19.01.39.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Jul 2022 01:39:03 -0700 (PDT)
Message-ID: <b19f966b-2969-38d2-1a1a-79ac97f69468@redhat.com>
Date: Tue, 19 Jul 2022 10:39:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] docs: List kvm as a supported accelerator on RISC-V
Content-Language: en-US
To: Bin Meng <bin.meng@windriver.com>, Akihiko Odaki
 <akihiko.odaki@gmail.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org
References: <20220719082635.3741878-1-bin.meng@windriver.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 QEMU Trivial <qemu-trivial@nongnu.org>, RISC-V <qemu-riscv@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220719082635.3741878-1-bin.meng@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 19/07/2022 10.26, Bin Meng wrote:
> Since commit fbf43c7dbf18 ("target/riscv: enable riscv kvm accel"),
> KVM accelerator is supported on RISC-V. Let's document it.
> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
> 
>   docs/about/build-platforms.rst | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/docs/about/build-platforms.rst b/docs/about/build-platforms.rst
> index ebde20f981..118a4c64dc 100644
> --- a/docs/about/build-platforms.rst
> +++ b/docs/about/build-platforms.rst
> @@ -46,7 +46,7 @@ Those hosts are officially supported, with various accelerators:
>      * - PPC
>        - kvm, tcg
>      * - RISC-V
> -     - tcg
> +     - kvm, tcg
>      * - s390x
>        - kvm, tcg
>      * - SPARC

Reviewed-by: Thomas Huth <thuth@redhat.com>


