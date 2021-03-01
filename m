Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90899328080
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 15:17:01 +0100 (CET)
Received: from localhost ([::1]:38222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGjM4-0006Xb-Jj
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 09:17:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lGjIl-0004o2-T5
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 09:13:35 -0500
Received: from 7.mo52.mail-out.ovh.net ([188.165.59.253]:43758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lGjIe-0000UV-04
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 09:13:35 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.68])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id B344524691F;
 Mon,  1 Mar 2021 15:13:25 +0100 (CET)
Received: from kaod.org (37.59.142.102) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Mon, 1 Mar 2021
 15:13:25 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-102R004dc091803-810c-4e6a-b76a-248a406b0601,
 479CA1392526D135F52AAC0E93683906E8F354F3) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Mon, 1 Mar 2021 15:13:24 +0100
From: Greg Kurz <groug@kaod.org>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH 2/5] spapr.c: check unplug_request flag in
 spapr_memory_unplug_request()
Message-ID: <20210301151324.3003e6a4@bahia.lan>
In-Reply-To: <20210226163301.419727-3-danielhb413@gmail.com>
References: <20210226163301.419727-1-danielhb413@gmail.com>
 <20210226163301.419727-3-danielhb413@gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.102]
X-ClientProxiedBy: DAG5EX1.mxp5.local (172.16.2.41) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: 2e19bfc0-46a4-4a30-ae95-974b7b870eae
X-Ovh-Tracer-Id: 17763604307183835616
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrleekgdeitdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkjghfofggtgfgihesthejredtredtvdenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepfedutdeijeejveehkeeileetgfelteekteehtedtieefffevhffflefftdefleejnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddvnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopegurghvihgusehgihgsshhonhdrughrohhpsggvrghrrdhiugdrrghu
Received-SPF: pass client-ip=188.165.59.253; envelope-from=groug@kaod.org;
 helo=7.mo52.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 26 Feb 2021 13:32:58 -0300
Daniel Henrique Barboza <danielhb413@gmail.com> wrote:

> Now that we're asserting the first DRC LMB earlier, use it to query if
> the DRC is already pending unplug and, in this case, issue the same
> error we already do.
> 
> The previous check was introduced in commit 2a129767ebb1 and it works,
> but it's easier to check the unplug_requested  flag instead of looking
> for the existence of the sPAPRDIMMState. It's also compliant with what
> is already done in other unplug_request functions for other devices.
> 
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---

Reviewed-by: Greg Kurz <groug@kaod.org>

>  hw/ppc/spapr.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index 74e046b522..149dc2113f 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -3681,13 +3681,7 @@ static void spapr_memory_unplug_request(HotplugHandler *hotplug_dev,
>                                  addr_start / SPAPR_MEMORY_BLOCK_SIZE);
>      g_assert(drc_start);
>  
> -    /*
> -     * An existing pending dimm state for this DIMM means that there is an
> -     * unplug operation in progress, waiting for the spapr_lmb_release
> -     * callback to complete the job (BQL can't cover that far). In this case,
> -     * bail out to avoid detaching DRCs that were already released.
> -     */
> -    if (spapr_pending_dimm_unplugs_find(spapr, dimm)) {
> +    if (spapr_drc_unplug_requested(drc_start)) {
>          error_setg(errp, "Memory unplug already in progress for device %s",
>                     dev->id);
>          return;


