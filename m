Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D3958BA95
	for <lists+qemu-devel@lfdr.de>; Sun,  7 Aug 2022 12:41:15 +0200 (CEST)
Received: from localhost ([::1]:58718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oKdib-0000Fo-QW
	for lists+qemu-devel@lfdr.de; Sun, 07 Aug 2022 06:41:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <movement@movementarian.org>)
 id 1oKdh4-0007DZ-Ty
 for qemu-devel@nongnu.org; Sun, 07 Aug 2022 06:39:38 -0400
Received: from ssh.movementarian.org ([139.162.205.133]:43076
 helo=movementarian.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <movement@movementarian.org>)
 id 1oKdh2-0004JF-0M
 for qemu-devel@nongnu.org; Sun, 07 Aug 2022 06:39:38 -0400
Received: from movement by movementarian.org with local (Exim 4.94.2)
 (envelope-from <movement@movementarian.org>)
 id 1oKdgw-00DJ2N-J3; Sun, 07 Aug 2022 11:39:30 +0100
Date: Sun, 7 Aug 2022 11:39:30 +0100
From: John Levon <levon@movementarian.org>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, "Zhang, Chen" <chen.zhang@intel.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "stefanha@gmail.com" <stefanha@gmail.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Xie Yongji <xieyongji@bytedance.com>
Subject: Re: [PATCH 0/1] Update vfio-user module to the latest
Message-ID: <Yu+WYmwvr/1fBww+@movementarian.org>
References: <cover.1659403195.git.jag.raman@oracle.com>
 <MWHPR11MB00312737931679069FAAE7AB9B9D9@MWHPR11MB0031.namprd11.prod.outlook.com>
 <e8eab8e6-e6a5-af95-223f-e0ca91b4d833@redhat.com>
 <YuzT2MA9Q4mAr4eQ@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YuzT2MA9Q4mAr4eQ@redhat.com>
X-Url: http://www.movementarian.org/
Received-SPF: pass client-ip=139.162.205.133;
 envelope-from=movement@movementarian.org; helo=movementarian.org
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Aug 05, 2022 at 09:24:56AM +0100, Daniel P. Berrangé wrote:

> > > For the RFC QEMU user space eBPF support,
> > > https://lore.kernel.org/all/20220617073630.535914-6-chen.zhang@intel.com/T/
> > > Maybe introduce the libubpf.so as a subproject like libvfio-user.so is more appropriate?
> > 
> > Fair comment. I never noticed them before, but why do we have those
> > submodules in the subprojects/ folder (libvduse, libvfio-user and
> > libvhost-user)? ... I don't think it's the job of QEMU to ship libraries
> > that a user might want to use for a certain feature, so could we please
> > remove those submodules again? If someone wants to use this, they can
> > compile the libraries on their own or help their favorite distribution to
> > ship them as packages.
> 
> FWIW, I don't really agree with shipping libvfio-user.so as a submodule
> either, but the consensus was that we have to do it because there's no
> stable ABI committed to by libvfio-user maintainers yet.  My counterpoint
> is that as long as QEMU ships libvfio-user as a submodule, there's no
> incentive to create a stable ABI, leaving a chicken & egg scenario.

qemu is not the only consumer of the library, so I'm not sure removing the
submodule from qemu moves the needle in either direction.

We are still discovering our abstractions are not quite right in places, so
we're not yet confident enough to mark the API/ABI as stable (nor do we have any
testing of this in place). It would be all downside at this point.

> IOW personally I'd rather libvfio-user.so was put into the distros right
> now, and have the pain ABI incompatible releases act as motivation for
> the creation of a stable ABI.

We can't control what the distributions choose to do, but speaking for
libvfio-user, we would not support this choice or anything like it. It would
only cause pain for users.

> A second factor is that as long as it is a submodule, there is little
> pressure for the distros to actually package the library, which leaves
> us in a place where someone will always object to removing the submodule
> from QEMU because it doesn't exist in distro X.

No distribution has even *asked* us about this.  Do you have some evidence that
by making this more difficult, somehow we'll start hearing from all the distros?
What's the mechanism by which this will work?

It seems to me that all that will happen by removing it, is make it extremely
annoying for anyone wanting to use it with qemu, as every user will have to
figure out which commit is needed for the qemu commit they're trying to compile.

> If we do add something as a submodule for some reason, I'd like us to
> say upfront that this is for a fixed time period (ie maximum of 3
> releases aka 1 year) only after which we'll remove it no matter what.

I'm not clear on the costs of having the submodule: could you please explain why
it's an issue exactly? I can only think of the flaky test issue (for which I'm
sorry).

regards
john

