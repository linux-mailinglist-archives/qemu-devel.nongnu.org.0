Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00EC03B165A
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 10:59:26 +0200 (CEST)
Received: from localhost ([::1]:46734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvyjE-0004zy-Rl
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 04:59:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1lvyhS-0003Ob-Q6
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 04:57:34 -0400
Received: from 10.mo51.mail-out.ovh.net ([46.105.77.235]:37804)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1lvyhR-0005Po-37
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 04:57:34 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.132])
 by mo51.mail-out.ovh.net (Postfix) with ESMTPS id E613D2A65FE;
 Wed, 23 Jun 2021 10:57:28 +0200 (CEST)
Received: from kaod.org (37.59.142.95) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.10; Wed, 23 Jun
 2021 10:57:27 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G001a3a4f0ad-f1b7-4a5e-979a-771d6e8131c3,
 B7AA0C2FA2B81B44B633B8B15AC1C2D9682E7D4C) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 92.184.105.222
Subject: Re: [PATCH] sd: mmc: Fix SET_BLOCK_COUNT command argument
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>, Bin Meng
 <bmeng.cn@gmail.com>
References: <20210623083004.245894-1-clg@kaod.org>
 <CAEUhbmXMKphSdgE0xMJT2Tzu5okf00SJcskPfK742PwZv-X1RQ@mail.gmail.com>
 <efa3958c-8a08-76f3-a963-8424c660e4e5@amsat.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <3648c80c-f5b2-f2d4-cab6-4983a8a6db69@kaod.org>
Date: Wed, 23 Jun 2021 10:57:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <efa3958c-8a08-76f3-a963-8424c660e4e5@amsat.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG3EX1.mxp5.local (172.16.2.21) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: b21125a2-1702-46ad-9eba-daef61130a56
X-Ovh-Tracer-Id: 17832002728227146659
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrfeegfedgudduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepjeekudeuudevleegudeugeekleffveeludejteffiedvledvgfekueefudehheefnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelheenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepfhegsghughesrghmshgrthdrohhrgh
Received-SPF: pass client-ip=46.105.77.235; envelope-from=clg@kaod.org;
 helo=10.mo51.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Cc: Bin Meng <bin.meng@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/23/21 10:52 AM, Philippe Mathieu-Daudé wrote:
> On 6/23/21 10:39 AM, Bin Meng wrote:
>> On Wed, Jun 23, 2021 at 4:30 PM Cédric Le Goater <clg@kaod.org> wrote:
>>>
>>> The number of blocks is defined in the lower bits [15:0]
>>
>> I checked the physical spec v8.00 and it says bits [31:0] for CMD23 argument.
> 
> Watch out, we only support 1-3:
> 
> enum SDPhySpecificationVersion {
>     SD_PHY_SPECv1_10_VERS     = 1,
>     SD_PHY_SPECv2_00_VERS     = 2,
>     SD_PHY_SPECv3_01_VERS     = 3,
> };
> 

Yes. block count was increased to 32-bit in v4 if I am correct. 

Any how, it is a bit more complex than the patch I sent which is fixing 
an issue I saw with eMMC.

Thanks,

C. 

