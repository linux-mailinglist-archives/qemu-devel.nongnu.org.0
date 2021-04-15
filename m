Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D26B936043F
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 10:28:01 +0200 (CEST)
Received: from localhost ([::1]:40798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWxM0-00032U-DV
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 04:28:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lWxLD-0002WI-Hr
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 04:27:11 -0400
Received: from 4.mo52.mail-out.ovh.net ([178.33.43.201]:41491)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lWxL6-0005Uv-Nk
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 04:27:11 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.53])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id B45F725D19D;
 Thu, 15 Apr 2021 10:27:00 +0200 (CEST)
Received: from kaod.org (37.59.142.95) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Thu, 15 Apr
 2021 10:27:00 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G001645913dc-3188-49ea-b3a8-f1108cafbc6c,
 6691293821731CB7DBA648D2D7B51D476DB59CA9) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Thu, 15 Apr 2021 10:26:58 +0200
From: Greg Kurz <groug@kaod.org>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH 1/2] qdev: Separate implementations of
 qdev_get_machine() for user and system
Message-ID: <20210415102658.6221d0ed@bahia.lan>
In-Reply-To: <87zgy6cy6q.fsf@dusky.pond.sub.org>
References: <20210409160339.500167-1-groug@kaod.org>
 <20210409160339.500167-2-groug@kaod.org>
 <87zgy6cy6q.fsf@dusky.pond.sub.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG8EX1.mxp5.local (172.16.2.71) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: 853aa4ca-abd4-45dc-9605-0cfbc38c0c85
X-Ovh-Tracer-Id: 17929956017783019814
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrudelfedgtdegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtgfhisehtjeertdertddvnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehveetgfehjeeltdffudeijedugeejhfehvefhteevgeehgeelheegffejtdehleenucffohhmrghinhepnhgvvgguvggurdhishenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopehpsghonhiiihhnihesrhgvughhrghtrdgtohhm
Received-SPF: pass client-ip=178.33.43.201; envelope-from=groug@kaod.org;
 helo=4.mo52.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 10 Apr 2021 10:59:25 +0200
Markus Armbruster <armbru@redhat.com> wrote:

> Greg Kurz <groug@kaod.org> writes:
> 
> > Despite its simple name and common usage of "getting a pointer to
> > the machine" in system-mode emulation, qdev_get_machine() has some
> > subtilities.
> >
> > First, it can be called when running user-mode emulation : this is
> > because user-mode partly relies on qdev to instantiate its CPU
> > model.
> >
> > Second, but not least, it has a side-effect : if it cannot find an
> > object at "/machine" in the QOM tree, it creates a dummy "container"
> > object and put it there. A simple check on the type returned by
> > qdev_get_machine() allows user-mode to run the common qdev code,
> > skipping the parts that only make sense for system-mode.
> >
> > This side-effect turns out to complicate the use of qdev_get_machine()
> > for the system-mode case though. Most notably, qdev_get_machine() must
> > not be called before the machine object is added to the QOM tree by
> > qemu_create_machine(), otherwise the existing dummy "container" object
> > would cause qemu_create_machine() to fail with something like :
> 
> Stupid trap.
> 

Still armed and ready for subtle bugs.

> > Unexpected error in object_property_try_add() at ../../qom/object.c:1223:
> > qemu-system-ppc64: attempt to add duplicate property 'machine' to
> >  object (type 'container')
> > Aborted (core dumped)
> >
> > This situation doesn't exist in the current code base, mostly because
> > of preventive fixing of some "latent bugs" in QEMU 4.0 (see 1a3ec8c1564
> > and e2fb3fbbf9c for details).
> 
> I lacked the stamina to address the root problem: automatic creation of
> dummy containers where real ones may be needed.
> 
> Is /machine the only such container?  Have you reviewed the other uses
> of container_get()?
> 

No. I've only looked at the /machine case.

> > A new kind of breakage was spotted very recently though :
> >
> > $ ./qemu-system-ppc64 -device power8_v2.0-spapr-cpu-core,help
> > /home/thuth/devel/qemu/include/hw/boards.h:24:
> >  MACHINE: Object 0x5635bd53af10 is not an instance of type machine
> > Aborted (core dumped)
> >
> > This comes from the change 3df261b6676b in QEMU 5.0. It unwillingly
> > added a new condition for qdev_get_machine() to be called too early,
> > breaking MACHINE(qdev_get_machine()) in generic cpu-core code this
> > time.
> >
> > In order to avoid further subtle breakages like this, change the
> > implentation of qdev_get_machine() to:
> > - keep the existing behaviour of creating the dummy "container"
> >   object for the user-mode case only ;
> > - abort() if the machine doesn't exist yet in the QOM tree for
> >   the system-mode case. This gives a precise hint to developpers
> >   that calling qdev_get_machine() too early is a programming bug.
> 
> In other words, we fail right away instead of planting a landmine for
> later.  Good.
> 
> The alternative would be mandating "must create /machine before first
> use" for all programs, not just qemu-system-FOO, but that might be more
> invasive.  Not sure.
> 

This would mean all user emulation binaries and a bunch of test
programs as well. I'll give a try in this direction.

> > This is achieved with a new do_qdev_get_machine() function called
> 
> container_get() is a suboptimal name for a function that creates
> containers, qdev_get_machine() is a suboptimal name for a function that
> creates /machine, and so is do_qdev_get_machine().  Observation, not
> demand.
> 

/**
 * container_get:
 * @root: root of the #path, e.g., object_get_root()
 * @path: path to the container
 *
 * Return a container object whose path is @path.  Create more containers
 * along the path if necessary.
 *
 * Returns: the container object.
 */
Object *container_get(Object *root, const char *path);

My understanding is that container_get()'s main mission is to
return a "container" object. The creation part looks like
a fallback to "fill the holes" in the QOM tree...

I'd rather try to get rid of that side-effect entirely rather
than coming up with a sensible name => auditing other users
of container_get() as you asked above seems to be the next
step :)

Thanks!

> > from qdev_get_machine(), with different implementations for system
> > and user mode.
> >
> > $ ./qemu-system-ppc64 -device power8_v2.0-spapr-cpu-core,help
> > qemu-system-ppc64: ../../hw/core/machine.c:1290:
> >  qdev_get_machine: Assertion `machine != NULL' failed.
> > Aborted (core dumped)
> >
> > Reported-by: Thomas Huth <thuth@redhat.com>
> > Signed-off-by: Greg Kurz <groug@kaod.org>
> 


