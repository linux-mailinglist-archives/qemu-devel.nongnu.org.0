Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E5E26EE24A
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 14:59:47 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prIFj-0001AV-A8; Tue, 25 Apr 2023 08:58:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <davydov-max@yandex-team.ru>)
 id 1prIFg-0001A1-Lp
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 08:58:36 -0400
Received: from forwardcorp1a.mail.yandex.net ([178.154.239.72])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <davydov-max@yandex-team.ru>)
 id 1prIFd-0003cu-97
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 08:58:36 -0400
Received: from mail-nwsmtp-smtp-corp-main-62.vla.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-62.vla.yp-c.yandex.net
 [IPv6:2a02:6b8:c0d:3786:0:640:7c97:0])
 by forwardcorp1a.mail.yandex.net (Yandex) with ESMTP id 85E0E6027C;
 Tue, 25 Apr 2023 15:51:13 +0300 (MSK)
Received: from [IPV6:2a02:6b8:0:107:fa75:a4ff:fe7d:8480] (unknown
 [2a02:6b8:0:107:fa75:a4ff:fe7d:8480])
 by mail-nwsmtp-smtp-corp-main-62.vla.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id BpFM8l1Mc0U0-KQfsB4hO; Tue, 25 Apr 2023 15:51:12 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1682427072; bh=+bGF8KHgmeB1w3xPtY2abqSMo6k78fzmEn6I5kxNxxA=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=N/NY2PgR8In/LJUicayHdMx9kOCOStnjWlttDty1dCbh65hOzpSXiROI04aT7avuP
 +AM5Ww/9NoGruPN767Nzl4X8XM98gjkgTyiaSAQNWoT67EG/EoRZJTuFaewGDCLm0u
 VLIpTneUiIjYwPLRGjZah+lqfQSllHhhnm9fHtSQ=
Authentication-Results: mail-nwsmtp-smtp-corp-main-62.vla.yp-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <2d5b21cb-7b09-f4e8-576f-31d9977aa70c@yandex-team.ru>
Date: Tue, 25 Apr 2023 15:51:11 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v3 2/7] target/i386: Add new EPYC CPU versions with
 updated cache_info
To: Babu Moger <babu.moger@amd.com>
Cc: weijiang.yang@intel.com, philmd@linaro.org, dwmw@amazon.co.uk,
 paul@xen.org, joao.m.martins@oracle.com, qemu-devel@nongnu.org,
 mtosatti@redhat.com, kvm@vger.kernel.org, mst@redhat.com,
 marcel.apfelbaum@gmail.com, yang.zhong@intel.com, jing2.liu@intel.com,
 vkuznets@redhat.com, michael.roth@amd.com, wei.huang2@amd.com,
 berrange@redhat.com, pbonzini@redhat.com, richard.henderson@linaro.org
References: <20230424163401.23018-1-babu.moger@amd.com>
 <20230424163401.23018-3-babu.moger@amd.com>
Content-Language: en-US
From: Maksim Davydov <davydov-max@yandex-team.ru>
In-Reply-To: <20230424163401.23018-3-babu.moger@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=178.154.239.72;
 envelope-from=davydov-max@yandex-team.ru; helo=forwardcorp1a.mail.yandex.net
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
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


On 4/24/23 19:33, Babu Moger wrote:
> From: Michael Roth <michael.roth@amd.com>
>
> Introduce new EPYC cpu versions: EPYC-v4 and EPYC-Rome-v3.
> The only difference vs. older models is an updated cache_info with
> the 'complex_indexing' bit unset, since this bit is not currently
> defined for AMD and may cause problems should it be used for
> something else in the future. Setting this bit will also cause
> CPUID validation failures when running SEV-SNP guests.
>
> Signed-off-by: Michael Roth <michael.roth@amd.com>
> Signed-off-by: Babu Moger <babu.moger@amd.com>
> Acked-by: Michael S. Tsirkin <mst@redhat.com>
> ---
>   target/i386/cpu.c | 118 ++++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 118 insertions(+)
>
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index e3d9eaa307..c1bc47661d 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -1707,6 +1707,56 @@ static const CPUCaches epyc_cache_info = {
>       },
>   };
>   
> +static CPUCaches epyc_v4_cache_info = {
> +    .l1d_cache = &(CPUCacheInfo) {
> +        .type = DATA_CACHE,
> +        .level = 1,
> +        .size = 32 * KiB,
> +        .line_size = 64,
> +        .associativity = 8,
> +        .partitions = 1,
> +        .sets = 64,
> +        .lines_per_tag = 1,
> +        .self_init = 1,
> +        .no_invd_sharing = true,
> +    },
> +    .l1i_cache = &(CPUCacheInfo) {
> +        .type = INSTRUCTION_CACHE,
> +        .level = 1,
> +        .size = 64 * KiB,
> +        .line_size = 64,
> +        .associativity = 4,
> +        .partitions = 1,
> +        .sets = 256,
> +        .lines_per_tag = 1,
> +        .self_init = 1,
> +        .no_invd_sharing = true,
> +    },
> +    .l2_cache = &(CPUCacheInfo) {
> +        .type = UNIFIED_CACHE,
> +        .level = 2,
> +        .size = 512 * KiB,
> +        .line_size = 64,
> +        .associativity = 8,
> +        .partitions = 1,
> +        .sets = 1024,
> +        .lines_per_tag = 1,
> +    },
> +    .l3_cache = &(CPUCacheInfo) {
> +        .type = UNIFIED_CACHE,
> +        .level = 3,
> +        .size = 8 * MiB,
> +        .line_size = 64,
> +        .associativity = 16,
> +        .partitions = 1,
> +        .sets = 8192,
> +        .lines_per_tag = 1,
> +        .self_init = true,
> +        .inclusive = true,
> +        .complex_indexing = false,
> +    },
> +};
> +
>   static const CPUCaches epyc_rome_cache_info = {
>       .l1d_cache = &(CPUCacheInfo) {
>           .type = DATA_CACHE,
> @@ -1757,6 +1807,56 @@ static const CPUCaches epyc_rome_cache_info = {
>       },
>   };
>   
> +static const CPUCaches epyc_rome_v3_cache_info = {
> +    .l1d_cache = &(CPUCacheInfo) {
> +        .type = DATA_CACHE,
> +        .level = 1,
> +        .size = 32 * KiB,
> +        .line_size = 64,
> +        .associativity = 8,
> +        .partitions = 1,
> +        .sets = 64,
> +        .lines_per_tag = 1,
> +        .self_init = 1,
> +        .no_invd_sharing = true,
> +    },
> +    .l1i_cache = &(CPUCacheInfo) {
> +        .type = INSTRUCTION_CACHE,
> +        .level = 1,
> +        .size = 32 * KiB,
> +        .line_size = 64,
> +        .associativity = 8,
> +        .partitions = 1,
> +        .sets = 64,
> +        .lines_per_tag = 1,
> +        .self_init = 1,
> +        .no_invd_sharing = true,
> +    },
> +    .l2_cache = &(CPUCacheInfo) {
> +        .type = UNIFIED_CACHE,
> +        .level = 2,
> +        .size = 512 * KiB,
> +        .line_size = 64,
> +        .associativity = 8,
> +        .partitions = 1,
> +        .sets = 1024,
> +        .lines_per_tag = 1,
> +    },
> +    .l3_cache = &(CPUCacheInfo) {
> +        .type = UNIFIED_CACHE,
> +        .level = 3,
> +        .size = 16 * MiB,
> +        .line_size = 64,
> +        .associativity = 16,
> +        .partitions = 1,
> +        .sets = 16384,
> +        .lines_per_tag = 1,
> +        .self_init = true,
> +        .inclusive = true,
> +        .complex_indexing = false,
> +    },
> +};
> +
>   static const CPUCaches epyc_milan_cache_info = {
>       .l1d_cache = &(CPUCacheInfo) {
>           .type = DATA_CACHE,
> @@ -4091,6 +4191,15 @@ static const X86CPUDefinition builtin_x86_defs[] = {
>                       { /* end of list */ }
>                   }
>               },
> +            {
> +                .version = 4,
> +                .props = (PropValue[]) {
> +                    { "model-id",
> +                      "AMD EPYC-v4 Processor" },
> +                    { /* end of list */ }
> +                },
> +                .cache_info = &epyc_v4_cache_info
> +            },
>               { /* end of list */ }
>           }
>       },
> @@ -4210,6 +4319,15 @@ static const X86CPUDefinition builtin_x86_defs[] = {
>                       { /* end of list */ }
>                   }
>               },
> +            {
> +                .version = 3,
> +                .props = (PropValue[]) {
> +                    { "model-id",
> +                      "AMD EPYC-Rome-v3 Processor" },
What do you think about adding more information to the model name to reveal
its key feature? For instance, model-id can be "EPYC-Rome-v3 (NO INDEXING)",
because only cache info was affected. Or alias can be used to achieve
the same effect. It works well in
"EPYC-v2 <-> AMD EPYC Processor (with IBPB) <-> EPYC-IBPB"
> +                    { /* end of list */ }
> +                },
> +                .cache_info = &epyc_rome_v3_cache_info
> +            },
>               { /* end of list */ }
>           }
>       },

-- 
Best regards,
Maksim Davydov


