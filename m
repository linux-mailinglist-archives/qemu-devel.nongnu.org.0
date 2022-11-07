Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC7261F368
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Nov 2022 13:35:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1os1Kg-0006GF-3L; Mon, 07 Nov 2022 07:34:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1os1Kc-0006EN-8l
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 07:34:26 -0500
Received: from 2.mo548.mail-out.ovh.net ([178.33.255.19])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1os1Ka-0008Ty-CJ
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 07:34:25 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.167])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 9BF012157A;
 Mon,  7 Nov 2022 12:34:13 +0000 (UTC)
Received: from kaod.org (37.59.142.101) by DAG8EX2.mxp5.local (172.16.2.72)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12; Mon, 7 Nov
 2022 13:34:13 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G00412f3d60c-b117-4dde-8bb5-f318358b51a6,
 D0413842879B1F3F0A9C3937A5D2AA6A62CFA3A1) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Mon, 7 Nov 2022 13:34:12 +0100
From: Greg Kurz <groug@kaod.org>
To: Richard Henderson <richard.henderson@linaro.org>
CC: <qemu-devel@nongnu.org>, Alex =?UTF-8?B?QmVubsOpZQ==?=
 <alex.bennee@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>, "Daniel P .
 =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>
Subject: Re: [PATCH 0/2] util/log: Make the per-thread flag immutable
Message-ID: <20221107133412.49688989@bahia>
In-Reply-To: <136930a7-7e9d-8450-284a-17dba47f4e31@linaro.org>
References: <20221104120059.678470-1-groug@kaod.org>
 <136930a7-7e9d-8450-284a-17dba47f4e31@linaro.org>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG2EX2.mxp5.local (172.16.2.12) To DAG8EX2.mxp5.local
 (172.16.2.72)
X-Ovh-Tracer-GUID: 7d1a60f4-4dc1-4552-bb2a-8655b5d9fe1d
X-Ovh-Tracer-Id: 18105877879949728038
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvgedrvdekgdegudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhfogggtgfhisehtjeeftdertddvnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeghfefffekvddvudekhfdtgeegheejffeuleehjeegueegffffvdejgeevvdfgvdenucffohhmrghinhepphgrthgthhgvfidrohhrghdpnhhonhhgnhhurdhorhhgpdhgihhtlhgrsgdrtghomhenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddruddtudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehgrhhouhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtoheprhhitghhrghrugdrhhgvnhguvghrshhonheslhhinhgrrhhordhorhhgpdhqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdgrlhgvgidrsggvnhhnvggvsehlihhnrghrohdrohhrghdpphgsohhniihinhhisehrvgguhhgrthdrtghomhdpsggvrhhrrghnghgvsehrvgguhhgrthdrtghomhdpshhtvghfrghnhhgrsehrvgguhhgrthdrtghomhdpoffvtefjohhsthepmh
 hoheegkedpmhhouggvpehsmhhtphhouhht
Received-SPF: pass client-ip=178.33.255.19; envelope-from=groug@kaod.org;
 helo=2.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Sat, 5 Nov 2022 09:37:26 +1100
Richard Henderson <richard.henderson@linaro.org> wrote:

> On 11/4/22 23:00, Greg Kurz wrote:
> > While working on the "util/log: Always send errors to logfile when daemonized"
> > series [1], I've encountered some issues with the per-thread flag. They stem
> > from the code not being designed to allow the per-thread flag to be enabled
> > or disabled more than once, but nothing is done to prevent that from
> > happening. This results in unexpected results like the creation of a log
> > file with a `%d` in its name or confusing errors when using the `log`
> > command in the monitor.
> > 
> > I'm posting fixes separately now in case it makes sense to merge them during
> > soft freeze. If so, I'll open an issue as explained in this recent mail [2].
> > 
> > [1] https://patchew.org/QEMU/20221019151651.334334-1-groug@kaod.org/
> > [2] https://lists.nongnu.org/archive/html/qemu-devel/2022-11/msg00137.html
> > 
> > Date: Wed, 19 Oct 2022 17:16:49 +0200
> > Message-ID: <20221019151651.334334-1-groug@kaod.org>
> > 
> > Greg Kurz (2):
> >    util/log: Make the per-thread flag immutable
> >    util/log: Ignore per-thread flag if global file already there
> > 
> >   util/log.c | 9 +++++++++
> >   1 file changed, 9 insertions(+)
> > 
> 
> Series:
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> 

Thanks for the quick review Richard !

I've created https://gitlab.com/qemu-project/qemu/-/issues/1302 with
a 7.2 milestone.

Paolo,

Can you queue this ?

Cheers,

--
Greg

> 
> r~


