Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7499A4CE38F
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Mar 2022 09:10:35 +0100 (CET)
Received: from localhost ([::1]:42922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQPUo-0000uX-CR
	for lists+qemu-devel@lfdr.de; Sat, 05 Mar 2022 03:10:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nQPRP-0007kv-Ev; Sat, 05 Mar 2022 03:07:06 -0500
Received: from 1.mo548.mail-out.ovh.net ([178.32.121.110]:39759)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nQPRL-00028O-3k; Sat, 05 Mar 2022 03:07:00 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.2])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 7C96421614;
 Sat,  5 Mar 2022 08:06:56 +0000 (UTC)
Received: from kaod.org (37.59.142.100) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Sat, 5 Mar
 2022 09:06:55 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R003a002f320-639e-4d54-8449-2b9787edf4de,
 A4EA2D8AEBB64B4F793E8EC0AE0C67A6646D724C) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.1.230.64
Message-ID: <cac1a92a-c130-1310-4dc2-3430ee92fcd1@kaod.org>
Date: Sat, 5 Mar 2022 09:06:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 0/7] target/ppc: Vector/VSX instruction batch fixes
Content-Language: en-US
To: <matheus.ferst@eldorado.org.br>, <qemu-devel@nongnu.org>,
 <qemu-ppc@nongnu.org>
References: <20220304175156.2012315-1-matheus.ferst@eldorado.org.br>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220304175156.2012315-1-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG4EX1.mxp5.local (172.16.2.31) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 0312dbde-62d1-4945-9364-8a78bd6b8f83
X-Ovh-Tracer-Id: 1882504648385268585
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddruddtledgudduudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieegvdffkeegfeetuddttddtveduiefhgeduffekiedtkeekteekhfffleevleelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepghhrohhugheskhgrohgurdhorhhg
Received-SPF: pass client-ip=178.32.121.110; envelope-from=clg@kaod.org;
 helo=1.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: danielhb413@gmail.com, richard.henderson@linaro.org, groug@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/4/22 18:51, matheus.ferst@eldorado.org.br wrote:
> From: Matheus Ferst <matheus.ferst@eldorado.org.br>
> 
> Some fixes to the insns of our last patch series.
> 
> Lucas Mateus Castro (alqotel) (1):
>    target/ppc: Fix vmul[eo]* instructions marked 2.07
> 
> Matheus Ferst (4):
>    target/ppc: use ext32u and deposit in do_vx_vmulhw_i64
>    target/ppc: use extract/extract2 to create vrlqnm mask
>    target/ppc: use andc in vrlqmi
>    target/ppc: split XXGENPCV macros for readability
> 
> Víctor Colombo (2):
>    target/ppc: Add missing helper_reset_fpstatus to VSX_MAX_MINC
>    target/ppc: Add missing helper_reset_fpstatus to helper_XVCVSPBF16
> 
>   target/ppc/fpu_helper.c             |  4 ++
>   target/ppc/int_helper.c             | 28 +++++++++---
>   target/ppc/translate/vmx-impl.c.inc | 42 +++++++----------
>   target/ppc/translate/vsx-impl.c.inc | 71 +++++++++++++++--------------
>   4 files changed, 77 insertions(+), 68 deletions(-)
> 

Queued for ppc-7.0.

Thanks,

C.

