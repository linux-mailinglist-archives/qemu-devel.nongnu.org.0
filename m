Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D132DB2B7
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 18:35:40 +0100 (CET)
Received: from localhost ([::1]:45610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpEEd-0007kX-JW
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 12:35:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kpEB2-0004Ez-3u
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 12:31:57 -0500
Received: from 3.mo51.mail-out.ovh.net ([188.165.32.156]:57488)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kpEAw-0006Qt-DF
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 12:31:55 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.173])
 by mo51.mail-out.ovh.net (Postfix) with ESMTPS id 4EDE4246EC1;
 Tue, 15 Dec 2020 18:31:38 +0100 (CET)
Received: from kaod.org (37.59.142.100) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Tue, 15 Dec
 2020 18:31:37 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R00378b823ae-4631-4c80-9e7b-9efbca210bae,
 5B637D79376B964A15914AD1CCB66AF2F67AE9EB) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 82.253.208.248
Date: Tue, 15 Dec 2020 18:31:36 +0100
From: Greg Kurz <groug@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL 06/30] spapr: Do PHB hoplug sanity check at pre-plug
Message-ID: <20201215183136.0f58cb35@bahia.lan>
In-Reply-To: <CAFEAcA8sOMxFJN=t69y=oSruh4a+LMUNWHX60wOEZZ8Cr=64OQ@mail.gmail.com>
References: <20201214045807.41003-1-david@gibson.dropbear.id.au>
 <20201214045807.41003-7-david@gibson.dropbear.id.au>
 <CAFEAcA8sOMxFJN=t69y=oSruh4a+LMUNWHX60wOEZZ8Cr=64OQ@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG6EX1.mxp5.local (172.16.2.51) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: 62b08be4-61c5-46ac-a025-1592c9cbbc12
X-Ovh-Tracer-Id: 17508025026775259616
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrudeltddguddtgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkjghfofggtgfgihesthejredtredtvdenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepfedutdeijeejveehkeeileetgfelteekteehtedtieefffevhffflefftdefleejnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhg
Received-SPF: pass client-ip=188.165.32.156; envelope-from=groug@kaod.org;
 helo=3.mo51.mail-out.ovh.net
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
Cc: qemu-ppc <qemu-ppc@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 15 Dec 2020 16:56:36 +0000
Peter Maydell <peter.maydell@linaro.org> wrote:

> On Mon, 14 Dec 2020 at 04:58, David Gibson <david@gibson.dropbear.id.au> wrote:
> >
> > From: Greg Kurz <groug@kaod.org>
> >
> > We currently detect that a PHB index is already in use at plug time.
> > But this can be decteted at pre-plug in order to error out earlier.
> >
> > This allows to pass &error_abort to spapr_drc_attach() and to end
> > up with a plug handler that doesn't need to report errors anymore.
> >
> > Signed-off-by: Greg Kurz <groug@kaod.org>
> > Message-Id: <20201120234208.683521-8-groug@kaod.org>
> > Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> 
> Hi; this change seems to have nudged one of Coverity's
> heuristics into deciding that spapr_drc_by_id() can return
> NULL (because its return value is checked here, I suspect),
> so it reports CID 1437757, 1437758, where spapr_add_lmbs()
> and spapr_memory_unplug_request() both take the return value
> of spapr_drc_by_id() and pass it directly to spapr_drc_index(),
> which will crash if it is passed a NULL pointer.
> 
> Is it impossible for spapr_drc_by_id() to return NULL in
> those functions (ie Coverity false positive) or is there
> a missing error check ?
> 

No, all DRC objects are created before any of these two
functions are called. Each function happens to loop over
the full list of memory DRCs a few line above the offending
call sites and already assert spapr_drc_by_id() doesn't
return NULL. But I guess Coverity isn't smart enough to
detect that.

I'll post a patch to add some more assertions.

> thanks
> -- PMM


