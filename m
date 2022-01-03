Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF5A482EB2
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jan 2022 08:18:40 +0100 (CET)
Received: from localhost ([::1]:57036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4Hc7-0006ry-3g
	for lists+qemu-devel@lfdr.de; Mon, 03 Jan 2022 02:18:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n4H70-0006FO-60; Mon, 03 Jan 2022 01:46:32 -0500
Received: from smtpout4.mo529.mail-out.ovh.net ([217.182.185.173]:36251)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n4H6w-0002UJ-Kw; Mon, 03 Jan 2022 01:46:29 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.11])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 009B7D52043E;
 Mon,  3 Jan 2022 07:46:21 +0100 (CET)
Received: from kaod.org (37.59.142.103) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Mon, 3 Jan
 2022 07:46:20 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G005230bd2c9-c484-4a05-a311-e4677d5f695f,
 71ABFCEAB0EE88409933ED7B68EF8EFCD2601B88) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <319c406d-0b4b-12aa-0057-ed967c232648@kaod.org>
Date: Mon, 3 Jan 2022 07:46:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2 0/5] Re-write PPC64 PMU instruction count using TCG Ops
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, <qemu-devel@nongnu.org>
References: <20211223201812.846495-1-danielhb413@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20211223201812.846495-1-danielhb413@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG2EX1.mxp5.local (172.16.2.11) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: cc401225-064f-44e9-a9eb-1318b76b7eef
X-Ovh-Tracer-Id: 11221844374935145379
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrudeftddgleelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepteevleduueffffelveelheekuedtveehkedutefffffhkedutdehgfdtjefhtdffnecuffhomhgrihhnpehgnhhurdhorhhgnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheprhhitghhrghrugdrhhgvnhguvghrshhonheslhhinhgrrhhordhorhhg
Received-SPF: pass client-ip=217.182.185.173; envelope-from=clg@kaod.org;
 helo=smtpout4.mo529.mail-out.ovh.net
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) NICE_REPLY_A=-3.354,
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
Cc: richard.henderson@linaro.org, qemu-ppc@nongnu.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/23/21 21:18, Daniel Henrique Barboza wrote:
> Hi,
> 
> In this version the tedious repetition was taken away from the
> code by using a helper that increments the PMCs based on specified
> conditions.
> 
> As far as Avocado test goes, the performance is the same as the previous
> version. All PMU-EBB kernel selftests are also passing. Basically we have
> the same benefits from v1 but 150+ lines shorter.
> 
> changes from v1:
> - former patches 2-6: removed
> - new patch 2:
>    * added inc_spr_if_cond() helper
> - new patch 3:
>    * add insn count for PMCs 1-4
> - patch 4 (former 7):
>    * use a loop to reduce code repetition when checking for counter
> overflows
> - v1 link: https://lists.gnu.org/archive/html/qemu-devel/2021-12/msg03871.html

I understand that you are going to rebase on top of Richard's patchset.
and so this series is now obsolete ?

Thanks,

C.
  

