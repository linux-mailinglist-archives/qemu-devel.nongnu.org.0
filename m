Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D5E4D5CA3
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Mar 2022 08:42:16 +0100 (CET)
Received: from localhost ([::1]:47666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSZub-0000My-5r
	for lists+qemu-devel@lfdr.de; Fri, 11 Mar 2022 02:42:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nSZrJ-0007Br-Bq
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 02:38:45 -0500
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:41639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nSZrH-0005zh-GL
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 02:38:44 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.108])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id A3959E881248;
 Fri, 11 Mar 2022 08:38:40 +0100 (CET)
Received: from kaod.org (37.59.142.104) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Fri, 11 Mar
 2022 08:38:40 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R0055cb8906e-c843-4be6-9e43-79acbed20434,
 79B1F22DAD7DBC473036ED04AB85CFE0B7BEDBC1) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <71dbc23a-a56c-f685-cd9a-6ce3b7395a5f@kaod.org>
Date: Fri, 11 Mar 2022 08:38:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 01/18] ppc/xive2: Introduce a XIVE2 core framework
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, <qemu-ppc@nongnu.org>,
 <qemu-devel@nongnu.org>
References: <20220228155222.643974-1-clg@kaod.org>
 <20220228155222.643974-2-clg@kaod.org>
 <df27854b-8f41-b83c-600e-72e52416c787@redhat.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <df27854b-8f41-b83c-600e-72e52416c787@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG4EX1.mxp5.local (172.16.2.31) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: aedf1e0c-3459-4039-aaaf-36be78c8fe5a
X-Ovh-Tracer-Id: 18194542496556944166
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddruddvuddguddtkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeigedvffekgeeftedutddttdevudeihfegudffkeeitdekkeetkefhffelveelleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopegurghnihgvlhhhsgegudefsehgmhgrihhlrdgtohhm
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>,
 Frederic Barrat <fbarrat@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

>> +static const TypeInfo xive2_end_source_info = {
>> +    .name          = TYPE_XIVE2_END_SOURCE,
>> +    .parent        = TYPE_DEVICE,
>> +    .instance_size = sizeof(Xive2EndSource),
>> +    .class_init    = xive2_end_source_class_init,
>> +};
> 
> This device can be used to crash QEMU:
> 
> $ ./qemu-system-ppc64 -nographic  -device xive2-end-source
> qemu-system-ppc64: ../../devel/qemu/hw/intc/xive2.c:966: xive2_end_source_realize: Assertion `xsrc->xrtr' failed.
> Aborted (core dumped)
> 
> Should it be user_creatable = false ?

Clearly yes.

Thanks,

C.

