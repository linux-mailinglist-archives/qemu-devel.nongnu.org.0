Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 042F27326C
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Jul 2019 17:03:11 +0200 (CEST)
Received: from localhost ([::1]:52436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hqInN-0000qB-SR
	for lists+qemu-devel@lfdr.de; Wed, 24 Jul 2019 11:03:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39468)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <ehabkost@redhat.com>) id 1hqIn7-0000Q1-NA
 for qemu-devel@nongnu.org; Wed, 24 Jul 2019 11:02:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ehabkost@redhat.com>) id 1hqIn6-0007C4-J5
 for qemu-devel@nongnu.org; Wed, 24 Jul 2019 11:02:53 -0400
Received: from mx1.redhat.com ([209.132.183.28]:19220)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ehabkost@redhat.com>) id 1hqIn6-0007BP-Ct
 for qemu-devel@nongnu.org; Wed, 24 Jul 2019 11:02:52 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 3D9F7307CDFC;
 Wed, 24 Jul 2019 15:02:51 +0000 (UTC)
Received: from localhost (ovpn-116-19.gru2.redhat.com [10.97.116.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A15565D71A;
 Wed, 24 Jul 2019 15:02:49 +0000 (UTC)
Date: Wed, 24 Jul 2019 12:02:41 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20190724150241.GM11469@habkost.net>
References: <20190716145121.19578-1-tao3.xu@intel.com>
 <20190716145121.19578-3-tao3.xu@intel.com>
 <20190723165641.55930926@redhat.com>
 <20190723152357.GI11469@habkost.net>
 <20190724162721.736f7efe@Igors-MacBook-Pro>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190724162721.736f7efe@Igors-MacBook-Pro>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Wed, 24 Jul 2019 15:02:51 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v7 02/11] numa: move numa global variable
 nb_numa_nodes into MachineState
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
Cc: jingqi.liu@intel.com, Tao Xu <tao3.xu@intel.com>, fan.du@intel.com,
 qemu-devel@nongnu.org, jonathan.cameron@huawei.com, dan.j.williams@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jul 24, 2019 at 04:27:21PM +0200, Igor Mammedov wrote:
> On Tue, 23 Jul 2019 12:23:57 -0300
> Eduardo Habkost <ehabkost@redhat.com> wrote:
> 
> > On Tue, Jul 23, 2019 at 04:56:41PM +0200, Igor Mammedov wrote:
> > > On Tue, 16 Jul 2019 22:51:12 +0800
> > > Tao Xu <tao3.xu@intel.com> wrote:
> > > 
> > > > Add struct NumaState in MachineState and move existing numa global
> > > > nb_numa_nodes(renamed as "num_nodes") into NumaState. And add variable
> > > > numa_support into MachineClass to decide which submachines support NUMA.
> > > > 
> > > > Suggested-by: Igor Mammedov <imammedo@redhat.com>
> > > > Suggested-by: Eduardo Habkost <ehabkost@redhat.com>
> > > > Signed-off-by: Tao Xu <tao3.xu@intel.com>
> > > > ---
> > > > 
> > > > No changes in v7.
> > > > 
> > > > Changes in v6:
> > > >     - Rebase to upstream, move globals in arm/sbsa-ref and use
> > > >       numa_mem_supported
> > > >     - When used once or twice in the function, use
> > > >       ms->numa_state->num_nodes directly
> > > >     - Correct some mistakes
> > > >     - Use once monitor_printf in hmp_info_numa
> > > > ---
> > [...]
> > > >      if (pxb->numa_node != NUMA_NODE_UNASSIGNED &&
> > > > -        pxb->numa_node >= nb_numa_nodes) {
> > > > +        pxb->numa_node >= ms->numa_state->num_nodes) {
> > > this will crash if user tries to use device on machine that doesn't support numa
> > > check that numa_state is not NULL before dereferencing 
> > 
> > That's exactly why the machine_num_numa_nodes() was created in
> > v5, but then you asked for its removal.
> V4 to more precise.
> I dislike small wrappers because they usually doesn't simplify code and make it more obscure,
> forcing to jump around to see what's really going on.
> Like it's implemented in this patch it's obvious what's wrong right away.
> 
> In that particular case machine_num_numa_nodes() was also misused since only a handful
> of places (6) really need NULL check while majority (48) can directly access ms->numa_state->num_nodes.
> without NULL check.

I strongly disagree, here.  Avoiding a ms->numa_state==NULL check
is pointless optimization, and leads to hard to spot bugs like
the one you saw above.

Although I won't reject a patch just because it doesn't have a
machine_num_numa_nodes() wrapper, I insist we use one for clarity
and safety.

-- 
Eduardo

