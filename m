Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C366EAC46
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 16:07:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pprP4-0005Zu-GE; Fri, 21 Apr 2023 10:06:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pprOz-0005YP-NK
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 10:06:17 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pprOv-00039f-BR
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 10:06:17 -0400
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.201])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Q2x7n1GCPz6J6sw;
 Fri, 21 Apr 2023 22:03:17 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Fri, 21 Apr
 2023 15:06:08 +0100
Date: Fri, 21 Apr 2023 15:06:07 +0100
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: <qemu-devel@nongnu.org>, Fan Ni <fan.ni@samsung.com>,
 <linux-cxl@vger.kernel.org>, <linuxarm@huawei.com>, Ira Weiny
 <ira.weiny@intel.com>, Alison Schofield <alison.schofield@intel.com>, Michael
 Roth <michael.roth@amd.com>, Philippe =?ISO-8859-1?Q?Mathieu-Daud?=
 =?ISO-8859-1?Q?=E9?= <philmd@linaro.org>, Dave Jiang <dave.jiang@intel.com>,
 Markus Armbruster <armbru@redhat.com>, "Daniel P .
 =?ISO-8859-1?Q?Berrang=E9?=" <berrange@redhat.com>, Eric Blake
 <eblake@redhat.com>, Mike Maslenkin <mike.maslenkin@gmail.com>,
 =?ISO-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>, "Thomas
 Huth" <thuth@redhat.com>
Subject: Re: [PATCH v4 0/7] QEMU CXL Provide mock CXL events and irq support
Message-ID: <20230421150607.00005f95@Huawei.com>
In-Reply-To: <20230421032504-mutt-send-email-mst@kernel.org>
References: <20230303152903.28103-1-Jonathan.Cameron@huawei.com>
 <20230421032504-mutt-send-email-mst@kernel.org>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml100003.china.huawei.com (7.191.160.210) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@Huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, 21 Apr 2023 03:25:45 -0400
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Fri, Mar 03, 2023 at 03:28:56PM +0000, Jonathan Cameron wrote:
> > Whilst I'm an optimist, I suspect this is now 8.1 material because we h=
ave
> > 5 CXL patch sets outstanding before it. Current bottleneck being QAPI r=
eview
> > for the RAS error series. =20
>=20
> RAS thing is in, right?

Absolutely, that one is resolved.

This series was also after some other series that didn't make 8.0.

Volatile memory: You had some feedback on that which I think I've resolved.
I'll send a new version of that out shortly.

Poison list handling. Phillipe had some comments on that one that may take
a little longer so I might shuffle that to after this events series dependi=
ng on
how bad the rebase is.

I also have a couple of series of things that are fixes rather than
new features.

I've just sent out:
*  https://lore.kernel.org/qemu-devel/20230421132020.7408-1-Jonathan.Camero=
n@huawei.com/T/#t
   hw/cxl: CDAT file handling fixes
   to cover some issues Peter and others reported around CDAT file loading.
* https://lore.kernel.org/qemu-devel/20230421135906.3515-1-Jonathan.Cameron=
@huawei.com/T/
  [PATCH v2 0/3] hw/cxl: Fix decoder commit and uncommit handling
  Which was a low priority fix that surfaced from a bug report during the R=
Cs and some
  clarifications of an unclear bit of the specification.

I've also gathered some docs fixes and sent those out as
* https://lore.kernel.org/qemu-devel/20230421134507.26842-1-Jonathan.Camero=
n@huawei.com/T/#t

=46rom a quick test I think all 3 of these series are independent so pick up =
which
ever you think makes sense.

Thanks,

Jonathan





>=20
> could you rebase this one? no longer applies cleanly. thanks!
>=20
> > v4 changes: Thanks to Ira and to some feedback I received off list.
> > - More endian fixes for a future big endian architecture using it.
> > - Comment typo
> >=20
> > One challenge here is striking the right balance between lots of constr=
aints
> > in the injection code to enforce particular reserved bits etc by breaki=
ng
> > out all the flags as individual parameters vs having a reasonably conci=
se
> > API.  I think this set strikes the right balance but others may well
> > disagree :)   Note that Ira raised the question of whether we should be
> > automatically establishing the volatile flag based on the Device Physic=
al
> > Address of the injected error. My proposal is to not do so for now, but
> > to possibly revisit tightening the checking of injected errors in futur=
e.
> > Whilst the volatile flag is straight forwards, some of the other flags =
that
> > could be automatically set (or perhaps checked for validiaty) are much =
more
> > complex. Adding verification at this stage would greatly increase the
> > complexity of the patch + we are missing other elements that would inte=
ract
> > with this.  I'm not concerned about potential breaking of backwards com=
patibility
> > if it only related to the injection of errors that make no sense for a =
real
> > device.
> >=20
> > Based on following series (in order)
> > 1. [PATCH v4 00/10] hw/cxl: CXL emulation cleanups and minor fixes for =
upstream
> > (in staging currently so fingers crossed that one is fine)
> > 2. [PATCH v6 0/8] hw/cxl: RAS error emulation and injection
> > 3. [PATCH v2 0/2] hw/cxl: Passthrough HDM decoder emulation
> > 4. [PATCH v4 0/2] hw/mem: CXL Type-3 Volatile Memory Support
> > 5. [PATCH v4 0/6] hw/cxl: Poison get, inject, clear
> >=20
> > Based on: Message-Id: 20230206172816.8201-1-Jonathan.Cameron@huawei.com
> > Based-on: Message-id: 20230227112751.6101-1-Jonathan.Cameron@huawei.com
> > Based-on: Message-id: 20230227153128.8164-1-Jonathan.Cameron@huawei.com
> > Based-on: Message-id: 20230227163157.6621-1-Jonathan.Cameron@huawei.com
> > Based-on: Message-id: 20230303150908.27889-1-Jonathan.Cameron@huawei.com
> >=20
> > v2 cover letter.
> >=20
> > CXL Event records inform the OS of various CXL device events.  Thus far=
 CXL
> > memory devices are emulated and therefore don't naturally generate even=
ts.
> >=20
> > Add an event infrastructure and mock event injection.  Previous versions
> > included a bulk insertion of lots of events.  However, this series focu=
ses on
> > providing the ability to inject individual events through QMP.  Only the
> > General Media Event is included in this series as an example.  Other ev=
ents can
> > be added pretty easily once the infrastructure is acceptable.
> >=20
> > In addition, this version updates the code to be in line with the
> > specification based on discussions around the kernel patches.
> >=20
> > Injection examples;
> >=20
> > { "execute": "cxl-inject-gen-media-event",
> >     "arguments": {
> >         "path": "/machine/peripheral/cxl-mem0",
> >         "log": "informational",
> >         "flags": 1,
> >         "physaddr": 1000,
> >         "descriptor": 3,
> >         "type": 3,
> >         "transaction-type": 192,
> >         "channel": 3,
> >         "device": 5,
> >         "component-id": "iras mem"
> >     }}
> >=20
> >=20
> > { "execute": "cxl-inject-dram-event",
> >     "arguments": {
> >         "path": "/machine/peripheral/cxl-mem0",
> >         "log": "informational",
> >         "flags": 1,
> >         "physaddr": 1000,
> >         "descriptor": 3,
> >         "type": 3,
> >         "transaction-type": 192,
> >         "channel": 3,
> >         "rank": 17,
> >         "nibble-mask": 37421234,
> >         "bank-group": 7,
> >         "bank": 11,
> >         "row": 2,
> >         "column": 77,
> >         "correction-mask": [33, 44, 55, 66]
> >     }}
> >=20
> > { "execute": "cxl-inject-memory-module-event",
> >   "arguments": {
> >     "path": "/machine/peripheral/cxl-mem0",
> >     "log": "informational",
> >     "flags": 1,
> >     "type": 3,
> >     "health-status": 3,
> >     "media-status": 7,
> >     "additional-status": 33,
> >     "life-used": 30,
> >     "temperature": -15,
> >     "dirty-shutdown-count": 4,
> >     "corrected-volatile-error-count": 3233,
> >     "corrected-persistent-error-count": 1300
> >   }}
> >=20
> >=20
> > Ira Weiny (4):
> >   hw/cxl/events: Add event status register
> >   hw/cxl/events: Wire up get/clear event mailbox commands
> >   hw/cxl/events: Add event interrupt support
> >   hw/cxl/events: Add injection of General Media Events
> >=20
> > Jonathan Cameron (3):
> >   hw/cxl: Move CXLRetCode definition to cxl_device.h
> >   hw/cxl/events: Add injection of DRAM events
> >   hw/cxl/events: Add injection of Memory Module Events
> >=20
> >  hw/cxl/cxl-device-utils.c   |  43 +++++-
> >  hw/cxl/cxl-events.c         | 248 ++++++++++++++++++++++++++++++
> >  hw/cxl/cxl-mailbox-utils.c  | 166 ++++++++++++++------
> >  hw/cxl/meson.build          |   1 +
> >  hw/mem/cxl_type3.c          | 292 +++++++++++++++++++++++++++++++++++-
> >  hw/mem/cxl_type3_stubs.c    |  35 +++++
> >  include/hw/cxl/cxl_device.h |  80 +++++++++-
> >  include/hw/cxl/cxl_events.h | 168 +++++++++++++++++++++
> >  qapi/cxl.json               | 120 +++++++++++++++
> >  9 files changed, 1097 insertions(+), 56 deletions(-)
> >  create mode 100644 hw/cxl/cxl-events.c
> >  create mode 100644 include/hw/cxl/cxl_events.h
> >=20
> > --=20
> > 2.37.2 =20
>=20


