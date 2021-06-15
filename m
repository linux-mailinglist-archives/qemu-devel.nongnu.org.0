Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 656E03A8619
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 18:11:06 +0200 (CEST)
Received: from localhost ([::1]:60318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltBeb-0007PB-F7
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 12:11:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1ltBRe-0007IA-Ho; Tue, 15 Jun 2021 11:57:42 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:57737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1ltBRa-0007U2-QD; Tue, 15 Jun 2021 11:57:42 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.141])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id D919FAD88064;
 Tue, 15 Jun 2021 17:57:34 +0200 (CEST)
Received: from kaod.org (37.59.142.103) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.10; Tue, 15 Jun
 2021 17:57:34 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G005c68afa2e-f7a0-4185-ac51-e0892f926bd3,
 C0A23537F2FFB9D7AAC434AAD4F3C11B0BA66CE8) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: [PATCH v2 1/2] target/ppc: fix address translation bug for radix
 mmus
To: Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>,
 <qemu-devel@nongnu.org>
References: <20210614191630.101304-1-bruno.larsen@eldorado.org.br>
 <8805c9ed-8ca1-540a-5fcb-81f146c76afb@kaod.org>
 <87ab59ec-012c-a708-869f-e4bd9b822f10@eldorado.org.br>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <5c706c36-36fb-650d-1721-d88c45c3476b@kaod.org>
Date: Tue, 15 Jun 2021 17:57:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <87ab59ec-012c-a708-869f-e4bd9b822f10@eldorado.org.br>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG8EX1.mxp5.local (172.16.2.71) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 163a7211-6e1a-4366-921e-0ebafae4d01a
X-Ovh-Tracer-Id: 14838797824782666741
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrfedvjedgleeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepvedvfeeiveefjeethfetveehgfdtudefvedtteefueduleffkeeliedtieegfeeunecuffhomhgrihhnpehnohhnghhnuhdrohhrghenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepghhrohhugheskhgrohgurdhorhhg
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.095,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: farosas@linux.ibm.com, richard.henderson@linaro.org,
 luis.pires@eldorado.org.br, Greg Kurz <groug@kaod.org>,
 lucas.araujo@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org, matheus.ferst@eldorado.org.br,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 6/15/21 4:57 PM, Bruno Piazera Larsen wrote:
> 
> On 15/06/2021 10:57, Cédric Le Goater wrote:
>> On 6/14/21 9:16 PM, Bruno Larsen (billionai) wrote:
>>> Based-on: <20210518201146.794854-1-richard.henderson@linaro.org>
>>>
>>> This commit attempts to fix the first bug mentioned by Richard Henderson in
>>> https://lists.nongnu.org/archive/html/qemu-devel/2021-05/msg06247.html
>>>
>>> To sumarize the bug here, when radix-style mmus are translating an
>>> address, they might need to call a second level of translation, with
>>> hypvervisor priviledges. However, the way it was being done up until
>>> this point meant that the second level translation had the same
>>> priviledges as the first level. This would only happen when a TCG guest
>>> was emulating KVM, which is why it hasn't been discovered yet.
>> What do you mean ? The QEMU PowerNV machine emulates baremetal and 
>> can run KVM pseries guests. 
> 
> Is the PowerNV using radix? 

Yes. Radix MMU is the default for Linux under POWER9 but it can also
use Hash.

> The bug only happens when guest1 (the emulated PowerNV, not it's guest), 

For PowerNV, "machine" would be more appropriate. We sometime refer to 
it as L0 and the sublevel guests as L1 and L2.

> and if so, we might need to reevaluate if the bug actually happens, 
> or if it's just a theoretical hiccup. And also change the commit message.

I think this would be a fix for the model. 

> Either way, if my explanation is a bit confusing, there are more details 
> on the link. I sort of just implemented the solutions suggested in that 
> e-mail chain.

It seems to makes sense. I just want to give it a try using an emulated 
QEMU PowerNV machine running a KVM pseries guest to see if it doesn't
break anything. Which would mean that the fix is incomplete. 

>> It has some issues under load but not related to memory translation. 
>> This patch is certainly improving the model and it is worth testing 
>> but this version does not apply on ppc-6.1.
>
> Ah, yes, it is based on a patch series made by Richard Henderson a 
> few weeks ago. Since we need that patch to be accepted to finally 
> support disable-tcg and I don't want to delay that by adding a 
> change that might change a lot of his remaining patches.

OK.

Thanks,

C.


