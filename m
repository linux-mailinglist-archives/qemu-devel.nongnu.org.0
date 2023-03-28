Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D54F96CB752
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 08:40:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ph2zj-0004Oi-QZ; Tue, 28 Mar 2023 02:39:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1ph2zh-0004OL-FZ
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 02:39:45 -0400
Received: from 4.mo548.mail-out.ovh.net ([188.165.42.229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1ph2zf-0002UG-JZ
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 02:39:44 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.98])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 16BAA20351;
 Tue, 28 Mar 2023 06:39:40 +0000 (UTC)
Received: from kaod.org (37.59.142.109) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Tue, 28 Mar
 2023 08:39:39 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-109S003c35401ea-ea98-4185-a136-9e0274087039,
 5D21C2AA46E1B9891D174392918792ED1A5C90BB) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <0368d6a6-5f66-9758-6977-818128d928b5@kaod.org>
Date: Tue, 28 Mar 2023 08:39:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 1/3] qtest: Add functions for accessing devices on Aspeed
 I2C controller
Content-Language: en-US
To: Stefan Berger <stefanb@linux.ibm.com>, <qemu-devel@nongnu.org>
CC: <marcandre.lureau@redhat.com>, <ninad@linux.ibm.com>, <joel@jms.id.au>,
 <andrew@aj.id.au>
References: <20230327202416.3617162-1-stefanb@linux.ibm.com>
 <20230327202416.3617162-2-stefanb@linux.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20230327202416.3617162-2-stefanb@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.109]
X-ClientProxiedBy: DAG1EX1.mxp5.local (172.16.2.1) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: b8652c93-fa1c-4d1b-8f6a-dc2a72e50faa
X-Ovh-Tracer-Id: 10064137793125583654
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrvdehfedguddufecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepffdufeeliedujeeffffhjeffiefghffhhfdvkeeijeehledvueffhfejtdehgeegnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrddutdelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeotghlgheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehsthgvfhgrnhgssehlihhnuhigrdhisghmrdgtohhmpdhqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdhmrghrtggrnhgurhgvrdhluhhrvggruhesrhgvughhrghtrdgtohhmpdhnihhnrggusehlihhnuhigrdhisghmrdgtohhmpdhjohgvlhesjhhmshdrihgurdgruhdprghnughrvgifsegrjhdrihgurdgruhdpoffvtefjohhsthepmhhoheegkedpmhhouggvpehsmhhtphhouhht
Received-SPF: pass client-ip=188.165.42.229; envelope-from=clg@kaod.org;
 helo=4.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 3/27/23 22:24, Stefan Berger wrote:
> Add read and write functions for accessing registers of I2C devices
> connected to the Aspeed I2C controller.
> 
> Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

[... ]

> +#ifndef QTEST_ASPEED_H
> +#define QTEST_ASPEED_H
> +
> +#include <stdint.h>
> +
> +#define AST2600_ASPEED_I2C_BASE_ADDR 0x1e78a000
> +
> +static inline uint32_t ast2600_aspeed_i2c_calc_dev_addr(uint8_t bus_num)

I think you could simplify the name ast2600_aspeed_i2c_calc_dev_addr()
to aspeed_i2c_calc_bus_addr() and add a comment saying it implements only
the AST2600 I2C controller. I don't think we will need the others.

> +{
> +    return AST2600_ASPEED_I2C_BASE_ADDR + 0x80 + bus_num * 0x80;
> +}

The formula is :

    return soc_base + (soc_i2c_offset + bus_num) * soc_i2c_reg_size;

May be turn it that way in case you respin. This is minor.

Thanks,

C.


