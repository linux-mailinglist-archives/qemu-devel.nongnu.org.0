Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D55F6CC746
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 18:00:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phBjk-0004jb-Tr; Tue, 28 Mar 2023 11:59:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1phBjj-0004io-B6
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 11:59:51 -0400
Received: from 9.mo548.mail-out.ovh.net ([46.105.48.137])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1phBjh-0003Mx-2c
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 11:59:50 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.10])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id CC0B8203CB;
 Tue, 28 Mar 2023 15:59:45 +0000 (UTC)
Received: from kaod.org (37.59.142.107) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Tue, 28 Mar
 2023 17:59:45 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-107S0012c57eb99-9cf6-4f33-abdf-4ca8930cb357,
 5D21C2AA46E1B9891D174392918792ED1A5C90BB) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <7e79ca66-fdb9-945c-42a2-5805ce9698df@kaod.org>
Date: Tue, 28 Mar 2023 17:59:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 1/3] qtest: Add functions for accessing devices on
 Aspeed I2C controller
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, Stefan Berger <stefanb@linux.ibm.com>,
 <qemu-devel@nongnu.org>
CC: <marcandre.lureau@redhat.com>, <ninad@linux.ibm.com>, <joel@jms.id.au>,
 <andrew@aj.id.au>
References: <20230328135121.3661711-1-stefanb@linux.ibm.com>
 <20230328135121.3661711-2-stefanb@linux.ibm.com>
 <601fa241-1b5e-067c-f7b5-7cdd4feaa13f@redhat.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <601fa241-1b5e-067c-f7b5-7cdd4feaa13f@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.107]
X-ClientProxiedBy: DAG3EX1.mxp5.local (172.16.2.21) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: b7fb72d1-6c71-425a-b932-2b48ce07ba92
X-Ovh-Tracer-Id: 1076641786759514985
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrvdehgedgleegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeffudefleeiudejfeffhfejffeigffhhffhvdekieejheelvdeufffhjedtheeggeenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddruddtjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegtlhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepthhhuhhthhesrhgvughhrghtrdgtohhmpdhsthgvfhgrnhgssehlihhnuhigrdhisghmrdgtohhmpdhqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdhmrghrtggrnhgurhgvrdhluhhrvggruhesrhgvughhrghtrdgtohhmpdhnihhnrggusehlihhnuhigrdhisghmrdgtohhmpdhjohgvlhesjhhmshdrihgurdgruhdprghnughrvgifsegrjhdrihgurdgruhdpoffvtefjohhsthepmhhoheegkedpmhhouggvpehsmhhtphhouhht
Received-SPF: pass client-ip=46.105.48.137; envelope-from=clg@kaod.org;
 helo=9.mo548.mail-out.ovh.net
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

> +static void aspeed_i2c_write_n(uint32_t baseaddr, uint8_t slave_addr,
>> +                               uint8_t reg, uint32_t v, size_t nbytes)
>> +{
>> +    size_t i;
>> +
>> +    aspeed_i2c_startup(baseaddr, slave_addr, reg);
>> +
>> +    for (i = 0; i < nbytes; i++) {
>> +        writel(baseaddr + A_I2CD_BYTE_BUF, v & 0xff);
>> +        v >>= 8;
>> +        writel(baseaddr + A_I2CD_CMD, A_I2CD_M_TX_CMD);
>> +    }
>> +
>> +    writel(baseaddr + A_I2CD_CMD, A_I2CD_M_STOP_CMD);
>> +}
>> +
>> +void aspeed_i2c_writel(uint32_t baseaddr, uint8_t slave_addr,
>> +                       uint8_t reg, uint32_t v)
>> +{
>> +    aspeed_i2c_write_n(baseaddr, slave_addr, reg, v, sizeof(v));
>> +}
>> +
>> +void aspeed_i2c_writew(uint32_t baseaddr, uint8_t slave_addr,
>> +                       uint8_t reg, uint16_t v)
>> +{
>> +    aspeed_i2c_write_n(baseaddr, slave_addr, reg, v, sizeof(v));
>> +}
>> +
>> +void aspeed_i2c_writeb(uint32_t baseaddr, uint8_t slave_addr,
>> +                       uint8_t reg, uint8_t v)
>> +{
>> +    aspeed_i2c_write_n(baseaddr, slave_addr, reg, v, sizeof(v));
>> +}
> 
> For helper functions like this, I'd recommend to not use libqtest-single.h and rather pass in a QTestState* as parameter to use qtest_writel() and qtest_readl() instead. That will make the code future-proof in case someone wants to use these function for migration-related tests later.

Indeed. Talking of which, I should convert tests/qtest/aspeed_smc-test.c

Thanks,

C.


