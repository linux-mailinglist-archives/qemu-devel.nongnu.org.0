Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 073A52D437A
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 14:42:26 +0100 (CET)
Received: from localhost ([::1]:56406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmzjc-0002uA-TM
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 08:42:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>)
 id 1kmziB-0002Mn-9R; Wed, 09 Dec 2020 08:40:55 -0500
Received: from smtpout1.mo804.mail-out.ovh.net ([79.137.123.220]:43745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>)
 id 1kmzi9-0003vi-9y; Wed, 09 Dec 2020 08:40:54 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.188])
 by mo804.mail-out.ovh.net (Postfix) with ESMTPS id 4245D791E3D7;
 Wed,  9 Dec 2020 14:40:47 +0100 (CET)
Received: from kaod.org (37.59.142.104) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Wed, 9 Dec 2020
 14:40:46 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R005ab967a43-ab4b-4124-99b1-594ca0ca6bc5,
 661A724A132DD26A84B163D3BB90DC3732340046) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 82.253.208.248
Date: Wed, 9 Dec 2020 14:40:45 +0100
From: Greg Kurz <groug@kaod.org>
To: Stephane Duverger <stephane.duverger@free.fr>
Subject: Re: [PATCH] ppc/translate: Fix need_access_type for non MMU_64
Message-ID: <20201209144045.65b4d9da@bahia.lan>
In-Reply-To: <20201209093544.GA58577@wise>
References: <20201209093544.GA58577@wise>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG5EX2.mxp5.local (172.16.2.42) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: 4d2b7cb6-8dfa-4ba1-a120-820ee0f27359
X-Ovh-Tracer-Id: 15266921262101404067
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrudejkedgheeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtgfhisehtjeertdertddvnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeefuddtieejjeevheekieeltefgleetkeetheettdeifeffvefhffelffdtfeeljeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtohepuggrvhhiugesghhisghsohhnrdgurhhophgsvggrrhdrihgurdgruh
Received-SPF: pass client-ip=79.137.123.220; envelope-from=groug@kaod.org;
 helo=smtpout1.mo804.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-trivial@nongnu.org, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 9 Dec 2020 10:35:44 +0100
Stephane Duverger <stephane.duverger@free.fr> wrote:

> The 64bits MMU variants have POWERPC_MMU_64 flag and POWERPC_MMU_64B
> is a specific one (POWERPC_MMU_32B with flag POWERPC_MMU_64). As a
> consequence, the original test ignored POWERPC_MMU_32B too.

Hrm... POWERPC_MMU_64B is just the generic MMU model for pre-PowerISA-2.03
64-bit CPUs (ie. PowerPC 970 in QEMU). I don't think the 0x00000001 in
POWERPC_MMU_64B has anything to do with POWERPC_MMU_32B actually, it is
just fortuitous.

FYI the MMU model enum was initially introduced by commit a750fc0b9184:

+    POWERPC_MMU_UNKNOWN    = 0,
+    /* Standard 32 bits PowerPC MMU                            */
+    POWERPC_MMU_32B,
+    /* Standard 64 bits PowerPC MMU                            */
+    POWERPC_MMU_64B,

=> POWERPC_MMU_64B isn't POWERPC_MMU_32B with a flag

> 
> The commit 5f2a625452 targeted hash64 mmu version. And indeed the
> 'mmu-hash64.c' does not use access_type. But 'mmu-hash32.c' does.
> 

But I agree that the 0x00000001 causes the check to be wrong for
CPUs using the POWERPC_MMU_32B MMU model. So your change is clearly
the way to go but the changelog should rather state that it doesn't
make sense to use an MMU model enum as a mask. The POWERPC_MMU_64
flag is to be used to detect 64-bit MMU models, as it is done
everywhere else.

How did you spot this ? Would you have an example that illustrates
how this can break things to share ?

Also, this could have:

Fixes: 5f2a6254522b ("ppc: Don't set access_type on all load/stores on hash64")

Finally, we also have a similar nit a few lines below in the same
function:

    ctx->lazy_tlb_flush = env->mmu_model == POWERPC_MMU_32B
        || env->mmu_model == POWERPC_MMU_601
        || (env->mmu_model & POWERPC_MMU_64B);

This happens to be working because POWERPC_MMU_32B is checked first but
the last check should also be (env->mmu_model & POWERPC_MMU_64).

> Signed-off-by: Stephane Duverger <stephane.duverger@free.fr>
> ---
>  target/ppc/translate.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index 54cac0e6a7..b4d0699ce3 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -7892,7 +7892,7 @@ static void ppc_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
>      ctx->insns_flags = env->insns_flags;
>      ctx->insns_flags2 = env->insns_flags2;
>      ctx->access_type = -1;
> -    ctx->need_access_type = !(env->mmu_model & POWERPC_MMU_64B);
> +    ctx->need_access_type = !(env->mmu_model & POWERPC_MMU_64);
>      ctx->le_mode = !!(env->hflags & (1 << MSR_LE));
>      ctx->default_tcg_memop_mask = ctx->le_mode ? MO_LE : MO_BE;
>      ctx->flags = env->flags;


