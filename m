Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44DD62AFFF4
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 07:58:24 +0100 (CET)
Received: from localhost ([::1]:50886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kd6Yp-0002Lp-CA
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 01:58:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>)
 id 1kd6Xq-0001Ri-1D; Thu, 12 Nov 2020 01:57:22 -0500
Received: from 7.mo51.mail-out.ovh.net ([46.105.33.25]:37899)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>)
 id 1kd6Xo-0007H6-09; Thu, 12 Nov 2020 01:57:21 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.189])
 by mo51.mail-out.ovh.net (Postfix) with ESMTPS id A84B2233AA2;
 Thu, 12 Nov 2020 07:57:08 +0100 (CET)
Received: from kaod.org (37.59.142.102) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Thu, 12 Nov
 2020 07:57:08 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-102R004bc1cfdfb-786d-460a-b4da-1eed57c2b321,
 59F639E4BBCB846B04676DD51D96F0D80C0888E2) smtp.auth=groug@kaod.org
Date: Thu, 12 Nov 2020 07:57:06 +0100
From: Greg Kurz <groug@kaod.org>
To: LemonBoy <thatlemon@gmail.com>
Subject: Re: [PATCH 1/2] ppc/translate: Implement lxvwsx opcode
Message-ID: <20201112075706.28b82a20@bahia.lan>
In-Reply-To: <9096a38b-0b6f-3531-b88b-e1be1d946831@gmail.com>
References: <d7d533e18c2bc10d924ee3e09907ff2b41fddb3a.1604912739.git.thatlemon@gmail.com>
 <a1c67758-7b2c-725c-67b6-e0c52a971d67@linaro.org>
 <9096a38b-0b6f-3531-b88b-e1be1d946831@gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.102]
X-ClientProxiedBy: DAG6EX2.mxp5.local (172.16.2.52) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: 2a8ebfc7-9fb3-415b-8b36-ac0b2ef5497e
X-Ovh-Tracer-Id: 15907839783813028259
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedruddvuddguddtfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkjghfofggtgfgihesthejredtredtvdenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepjeejgfevjeeiuddvjeevffejhfelfeeivdekhfdukeffjeegteevtdduveffjeejnecuffhomhgrihhnpehlrghunhgthhhprggurdhnvghtnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopegurghvihgusehgihgsshhonhdrughrohhpsggvrghrrdhiugdrrghu
Received-SPF: pass client-ip=46.105.33.25; envelope-from=groug@kaod.org;
 helo=7.mo51.mail-out.ovh.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 01:57:09
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-ppc@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 10 Nov 2020 10:14:23 +0100
LemonBoy <thatlemon@gmail.com> wrote:

> Is there any chance for this patch series to be merged for 5.2?
> 

Not a chance. We're in hard freeze now.

> On 09/11/20 18:39, Richard Henderson wrote:
> > On 11/9/20 1:17 AM, LemonBoy wrote:
> >> Implement the "Load VSX Vector Word & Splat Indexed" opcode, introduced
> >> in Power ISA v3.0.
> >>
> >> Buglink: https://bugs.launchpad.net/qemu/+bug/1793608
> >> Signed-off-by: Giuseppe Musacchio <thatlemon@gmail.com>
> >> ---
> >>  target/ppc/translate/vsx-impl.c.inc | 30 +++++++++++++++++++++++++++++
> >>  target/ppc/translate/vsx-ops.c.inc  |  1 +
> >>  2 files changed, 31 insertions(+)
> > 
> > Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> > 
> > r~
> > 
> 


