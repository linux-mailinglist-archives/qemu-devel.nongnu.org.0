Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B16806F64D9
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 08:22:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puSKn-0006k0-FW; Thu, 04 May 2023 02:20:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1puSKk-0006j2-7O
 for qemu-devel@nongnu.org; Thu, 04 May 2023 02:20:54 -0400
Received: from 7.mo552.mail-out.ovh.net ([188.165.59.253])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1puSKe-0003oG-5w
 for qemu-devel@nongnu.org; Thu, 04 May 2023 02:20:53 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.114])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 919F02C2D9;
 Thu,  4 May 2023 06:20:43 +0000 (UTC)
Received: from kaod.org (37.59.142.110) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Thu, 4 May
 2023 08:20:42 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-110S00482f56add-dd36-4135-89dd-edd15c8130f7,
 0A600877A5F7A88FF06BBE9148B0C6241669CEAA) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 86.250.25.177
Message-ID: <2bff3e81-4e72-e4dd-6bf2-c5178f335321@kaod.org>
Date: Thu, 4 May 2023 08:20:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 1/2] tcg: ppc64: Fix mask generation for vextractdm
Content-Language: en-US
To: Shivaprasad G Bhat <sbhat@linux.ibm.com>, <philmd@linaro.org>,
 <richard.henderson@linaro.org>, <danielhb413@gmail.com>,
 <lucas.araujo@eldorado.org.br>, <qemu-ppc@nongnu.org>,
 <david@gibson.dropbear.id.au>, <groug@kaod.org>
CC: <john_platts@hotmail.com>, <qemu-devel@nongnu.org>
References: <168319291781.1159309.7376486961333644798.stgit@ltc-boston1.aus.stglabs.ibm.com>
 <168319292809.1159309.5817546227121323288.stgit@ltc-boston1.aus.stglabs.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <168319292809.1159309.5817546227121323288.stgit@ltc-boston1.aus.stglabs.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.110]
X-ClientProxiedBy: DAG3EX1.mxp5.local (172.16.2.21) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 07b9875b-a389-4703-a15c-009394a97b32
X-Ovh-Tracer-Id: 5673128159028087730
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrfedvledguddtgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepheeugfdtteetfefgiefhfefgueduveefieehgfevvdetiedugeeghfehtdehvdffnecuffhomhgrihhnpehgihhtlhgrsgdrtghomhenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddruddutddpkeeirddvhedtrddvhedrudejjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegtlhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepshgshhgrtheslhhinhhugidrihgsmhdrtghomhdpphhhihhlmhgusehlihhnrghrohdrohhrghdprhhitghhrghrugdrhhgvnhguvghrshhonheslhhinhgrrhhordhorhhgpdgurghnihgvlhhhsgegudefsehgmhgrihhlrdgtohhmpdhluhgtrghsrdgrrhgruhhjohesvghlughorhgrughordhorhhgrdgsrhdpqhgvmhhuqdhpphgtsehnohhnghhnuhdrohhrghdpuggrvhhiugesghhisg
 hsohhnrdgurhhophgsvggrrhdrihgurdgruhdpjhhohhhnpghplhgrthhtsheshhhothhmrghilhdrtghomhdpqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpghhrohhugheskhgrohgurdhorhhgpdfovfetjfhoshhtpehmohehhedvpdhmohguvgepshhmthhpohhuth
Received-SPF: pass client-ip=188.165.59.253; envelope-from=clg@kaod.org;
 helo=7.mo552.mail-out.ovh.net
X-Spam_score_int: -61
X-Spam_score: -6.2
X-Spam_bar: ------
X-Spam_report: (-6.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-4.28,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 5/4/23 11:35, Shivaprasad G Bhat wrote:
> In function do_extractm() the mask is calculated as
> dup_const(1 << (element_width - 1)). '1' being signed int
> works fine for MO_8,16,32. For MO_64, on PPC64 host
> this ends up becoming 0 on compilation. The vextractdm
> uses MO_64, and it ends up having mask as 0.
> 
> Explicitly use 1ULL instead of signed int 1 like its
> used everywhere else.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1536
> Signed-off-by: Shivaprasad G Bhat <sbhat@linux.ibm.com>
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> Reviewed-by: Lucas Mateus Castro <lucas.araujo@eldorado.org.br>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Cédric Le Goater <clg@redhat.com>

Thanks,

C.


> ---
>   target/ppc/translate/vmx-impl.c.inc |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/vmx-impl.c.inc
> index 112233b541..c8712dd7d8 100644
> --- a/target/ppc/translate/vmx-impl.c.inc
> +++ b/target/ppc/translate/vmx-impl.c.inc
> @@ -2058,7 +2058,7 @@ static bool trans_VEXPANDQM(DisasContext *ctx, arg_VX_tb *a)
>   static bool do_vextractm(DisasContext *ctx, arg_VX_tb *a, unsigned vece)
>   {
>       const uint64_t elem_width = 8 << vece, elem_count_half = 8 >> vece,
> -                   mask = dup_const(vece, 1 << (elem_width - 1));
> +                   mask = dup_const(vece, 1ULL << (elem_width - 1));
>       uint64_t i, j;
>       TCGv_i64 lo, hi, t0, t1;
> 
> 
> 


