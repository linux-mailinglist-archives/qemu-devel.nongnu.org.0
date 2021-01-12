Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B09C52F2B32
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 10:25:07 +0100 (CET)
Received: from localhost ([::1]:52192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzFvG-0003rw-9B
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 04:25:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1kzFtd-0002qP-7A
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 04:23:25 -0500
Received: from 6.mo52.mail-out.ovh.net ([188.165.49.222]:50638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1kzFta-00014R-QY
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 04:23:24 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.58])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id 32265232319;
 Tue, 12 Jan 2021 10:23:10 +0100 (CET)
Received: from kaod.org (37.59.142.98) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Tue, 12 Jan
 2021 10:23:10 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R00218f14a55-1911-4197-83ec-146c038adeb9,
 2257B073617FA9ABCC7BD76A51E96555772B3A24) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: What's the correct way to implement rfi and related instruction.
To: <luoyonggang@gmail.com>
References: <CAE2XoE84K6vdQ23upRa1MaCNWSycUGKja9DrTpVCQ4bdY7bZuQ@mail.gmail.com>
 <db5077c9-4b20-08f1-131e-0bbc7ae15313@kaod.org>
 <CAE2XoE-Fc3Tc51uiDN70_6suHPwczdp9EcS_LirLK-txzgS+yw@mail.gmail.com>
 <ef0eb70c-5b56-9850-2ad3-f12591cd6b4b@kaod.org>
 <CAE2XoE-VAMPYwNcGYK_3fqKgy138VOx6JaaSHD+bvz-fkH_jZA@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <96e02d87-3326-748d-9c97-de910b5b1533@kaod.org>
Date: Tue, 12 Jan 2021 10:23:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAE2XoE-VAMPYwNcGYK_3fqKgy138VOx6JaaSHD+bvz-fkH_jZA@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.98]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 70bffaf1-d32d-4f28-a7ee-afc211b4ba19
X-Ovh-Tracer-Id: 7673570818062912361
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrvdehgedgtdduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepjeekudeuudevleegudeugeekleffveeludejteffiedvledvgfekueefudehheefnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheplhhuohihohhnghhgrghnghesghhmrghilhdrtghomh
Received-SPF: pass client-ip=188.165.49.222; envelope-from=clg@kaod.org;
 helo=6.mo52.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Cc: qemu-level <qemu-devel@nongnu.org>, qemu-ppc@nongnu.org,
 Thomas Monjalon <thomas@monjalon.net>, Aurelien Jarno <aurelien@aurel32.net>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> QEMU 5.2.x, an e300 based machine ppc603 are impacted.
> Here is my fix, narrowed down to  MSR_TGPR and  MSR_ILE
> ```
> From 42ce41671f1e6c4dd44e6fb481bbda9df09320bd Mon Sep 17 00:00:00 2001
> From: Yonggang Luo <luoyonggang@gmail.com <mailto:luoyonggang@gmail.com>>
> Date: Sun, 10 Jan 2021 00:08:00 -0800
> Subject: [PATCH] ppc: Fix rfi/rfid/hrfi/... emulation again
> 
> This revert part mask bits for ppc603/ppc4x that disabled in  a2e71b28e832346409efc795ecd1f0a2bcb705a3.
> Remove redundant macro MSR_BOOK3S_MASK.
> Fixes boot VxWorks on e300
> 
> Signed-off-by: Yonggang Luo <luoyonggang@gmail.com <mailto:luoyonggang@gmail.com>>
> ---
>  target/ppc/excp_helper.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index 1c48b9fdf6..df70c5a4e8 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -1156,8 +1156,10 @@ static inline void do_rfi(CPUPPCState *env, target_ulong nip, target_ulong msr)
>  {
>      CPUState *cs = env_cpu(env);
>  
> -    /* MSR:POW cannot be set by any form of rfi */
> +    /* MSR:POW,TGPR,ILE cannot be set by any form of rfi */
>      msr &= ~(1ULL << MSR_POW);
> +    msr &= ~(1ULL << MSR_TGPR);

Indeed. The e300 user manual says that TGPR is cleared by rfi. We should 
add a per-cpu family mask and not a global setting.

> +    msr &= ~(1ULL << MSR_ILE);

that's curious. I am still trying to understand that part. May be this is 
due to the lack of HID2 modeling which contains a "True little-endian" bit.

Is your image Little endian ? 

C. 

>  
>  #if defined(TARGET_PPC64)
>      /* Switching to 32-bit ? Crop the nip */
> @@ -1190,7 +1192,6 @@ void helper_rfi(CPUPPCState *env)
>      do_rfi(env, env->spr[SPR_SRR0], env->spr[SPR_SRR1] & 0xfffffffful);
>  }
>  
> -#define MSR_BOOK3S_MASK
>  #if defined(TARGET_PPC64)
>  void helper_rfid(CPUPPCState *env)
>  {
> -- 
> 2.29.2.windows.3
> 
> ```
> 
> --
>          此致
> 礼
> 罗勇刚
> Yours
>     sincerely,
> Yonggang Luo


