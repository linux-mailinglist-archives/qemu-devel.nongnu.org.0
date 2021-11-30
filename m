Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30BE8462EC7
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Nov 2021 09:46:01 +0100 (CET)
Received: from localhost ([::1]:38102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrym0-0008Oz-B7
	for lists+qemu-devel@lfdr.de; Tue, 30 Nov 2021 03:46:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mryl7-0007VF-3A
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 03:45:07 -0500
Received: from smtpout2.mo529.mail-out.ovh.net ([79.137.123.220]:55837)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mryl5-0003RC-2l
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 03:45:04 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.92])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 4D8BCCED5942;
 Tue, 30 Nov 2021 09:44:59 +0100 (CET)
Received: from kaod.org (37.59.142.96) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Tue, 30 Nov
 2021 09:44:59 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R001ab988999-8866-440e-870a-547945c6612a,
 913BE361125CD990369DD0E14659C4214E2DD476) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.11.56.15
Message-ID: <62188dd4-c6ea-4c3e-b444-585319818b4f@kaod.org>
Date: Tue, 30 Nov 2021 09:44:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v4] target/ppc: fix Hash64 MMU update of PTE bit R
Content-Language: en-US
To: David Gibson <david@gibson.dropbear.id.au>, Leandro Lupori
 <leandro.lupori@eldorado.org.br>
References: <20211129185751.25355-1-leandro.lupori@eldorado.org.br>
 <YaVwvAyhyhlIYhV5@yekko>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <YaVwvAyhyhlIYhV5@yekko>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: c47f57a1-2ebb-46bf-85d9-b9279396eb3a
X-Ovh-Tracer-Id: 16468256464132672294
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddriedtgdduvdegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepgfdthedvjeekhfduveekkeffkeelteeffedtkeduleeiudejfedtieekffevgfefnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepghhrohhugheskhgrohgurdhorhhg
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout2.mo529.mail-out.ovh.net
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.211,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/30/21 01:30, David Gibson wrote:
> On Mon, Nov 29, 2021 at 03:57:51PM -0300, Leandro Lupori wrote:
>> When updating the R bit of a PTE, the Hash64 MMU was using a wrong byte
>> offset, causing the first byte of the adjacent PTE to be corrupted.
>> This caused a panic when booting FreeBSD, using the Hash MMU.
>>
>> Fixes: a2dd4e83e76b ("ppc/hash64: Rework R and C bit updates")
>> Signed-off-by: Leandro Lupori <leandro.lupori@eldorado.org.br>
> 
> Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

Sorry, I didn't wait for your Rb because the patch was a good candidate
for -rc3. It is merged now.

> Thanks for your patience with our nitpicking :).

Yes,

Here is another QEMU bug found by FreeBSD :
  
https://lore.kernel.org/qemu-devel/427ef2ee-6871-0d27-f485-90ad142f6266@kaod.org/

It would be interesting to boot directly the PowerNV machine from a
FreeBSB kernel and a minimum inirtd without using the skiroot images
and an iso. Are images available ?

Thanks.

C.

