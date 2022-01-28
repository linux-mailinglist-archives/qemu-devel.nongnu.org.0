Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA3749FFF8
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 19:14:00 +0100 (CET)
Received: from localhost ([::1]:37196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDVl1-0008Tu-GE
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 13:13:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nDVQb-0007g7-2p
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 12:52:53 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56]:2224)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nDVQY-00034o-63
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 12:52:52 -0500
Received: from fraeml707-chm.china.huawei.com (unknown [172.18.147.207])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4JllLF0ls6z67brf;
 Sat, 29 Jan 2022 01:48:21 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml707-chm.china.huawei.com (10.206.15.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Fri, 28 Jan 2022 18:52:46 +0100
Received: from localhost (10.122.247.231) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.21; Fri, 28 Jan
 2022 17:52:46 +0000
Date: Fri, 28 Jan 2022 17:52:45 +0000
To: Alex =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
CC: <qemu-devel@nongnu.org>, Marcel Apfelbaum <marcel@redhat.com>, "Michael S
 . Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 <linux-cxl@vger.kernel.org>, Ben Widawsky <ben.widawsky@intel.com>, "Peter
 Maydell" <peter.maydell@linaro.org>, <linuxarm@huawei.com>, "Shameerali
 Kolothum Thodi" <shameerali.kolothum.thodi@huawei.com>, Philippe
 =?ISO-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>, Saransh Gupta1
 <saransh@ibm.com>, Shreyas Shah <shreyas.shah@elastics.cloud>, Chris Browy
 <cbrowy@avery-design.com>, Samarth Saxena <samarths@cadence.com>, "Dan
 Williams" <dan.j.williams@intel.com>
Subject: Re: [PATCH v4 09/42] hw/cxl/device: Timestamp implementation (8.2.9.3)
Message-ID: <20220128175245.00007f6b@huawei.com>
In-Reply-To: <874k5pbdlh.fsf@linaro.org>
References: <20220124171705.10432-1-Jonathan.Cameron@huawei.com>
 <20220124171705.10432-10-Jonathan.Cameron@huawei.com>
 <874k5pbdlh.fsf@linaro.org>
Organization: Huawei Technologies R&D (UK) Ltd.
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhreml740-chm.china.huawei.com (10.201.108.190) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>

On Thu, 27 Jan 2022 11:50:08 +0000
Alex Benn=E9e <alex.bennee@linaro.org> wrote:

> Jonathan Cameron <Jonathan.Cameron@huawei.com> writes:
>=20
> > From: Ben Widawsky <ben.widawsky@intel.com>
> >
> > Per spec, timestamp appears to be a free-running counter from a value
> > set by the host via the Set Timestamp command (0301h). There are
> > references to the epoch, which seem like a red herring. Therefore, the
> > implementation implements the timestamp as freerunning counter from the
> > last value that was issued by the Set Timestamp command.
> >
> > Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
> > Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> > ---
> >  hw/cxl/cxl-mailbox-utils.c  | 53 +++++++++++++++++++++++++++++++++++++
> >  include/hw/cxl/cxl_device.h |  6 +++++
> >  2 files changed, 59 insertions(+)
> >
> > diff --git a/hw/cxl/cxl-mailbox-utils.c b/hw/cxl/cxl-mailbox-utils.c
> > index 1a87846356..cea4b2a59c 100644
> > --- a/hw/cxl/cxl-mailbox-utils.c
> > +++ b/hw/cxl/cxl-mailbox-utils.c
> > @@ -43,6 +43,9 @@ enum {
> >          #define CLEAR_RECORDS   0x1
> >          #define GET_INTERRUPT_POLICY   0x2
> >          #define SET_INTERRUPT_POLICY   0x3
> > +    TIMESTAMP   =3D 0x03,
> > +        #define GET           0x0
> > +        #define SET           0x1
> >  };
> > =20
> >  /* 8.2.8.4.5.1 Command Return Codes */
> > @@ -117,8 +120,11 @@ define_mailbox_handler_zeroed(EVENTS_GET_RECORDS, =
0x20);
> >  define_mailbox_handler_nop(EVENTS_CLEAR_RECORDS);
> >  define_mailbox_handler_zeroed(EVENTS_GET_INTERRUPT_POLICY, 4);
> >  define_mailbox_handler_nop(EVENTS_SET_INTERRUPT_POLICY);
> > +declare_mailbox_handler(TIMESTAMP_GET);
> > +declare_mailbox_handler(TIMESTAMP_SET);
> > =20
> >  #define IMMEDIATE_CONFIG_CHANGE (1 << 1)
> > +#define IMMEDIATE_POLICY_CHANGE (1 << 3)
> >  #define IMMEDIATE_LOG_CHANGE (1 << 4)
> > =20
> >  #define CXL_CMD(s, c, in, cel_effect) \
> > @@ -129,10 +135,57 @@ static struct cxl_cmd cxl_cmd_set[256][256] =3D {
> >      CXL_CMD(EVENTS, CLEAR_RECORDS, ~0, IMMEDIATE_LOG_CHANGE),
> >      CXL_CMD(EVENTS, GET_INTERRUPT_POLICY, 0, 0),
> >      CXL_CMD(EVENTS, SET_INTERRUPT_POLICY, 4, IMMEDIATE_CONFIG_CHANGE),
> > +    CXL_CMD(TIMESTAMP, GET, 0, 0),
> > +    CXL_CMD(TIMESTAMP, SET, 8, IMMEDIATE_POLICY_CHANGE),
> >  };
> > =20
> >  #undef CXL_CMD
> > =20
> > +/*
> > + * 8.2.9.3.1
> > + */
> > +define_mailbox_handler(TIMESTAMP_GET)
> > +{
> > +    struct timespec ts;
> > +    uint64_t delta;
> > +
> > +    if (!cxl_dstate->timestamp.set) {
> > +        *(uint64_t *)cmd->payload =3D 0;
> > +        goto done;
> > +    }
> > +
> > +    /* First find the delta from the last time the host set the time. =
*/
> > +    clock_gettime(CLOCK_REALTIME, &ts); =20
>=20
> Could you consider using qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL)?
> Otherwise by introducing a dependency on real time you'll loose the
> ability to get deterministic execution via icount.

I don't have a strong opinion either way, so Ill go with=20
qemu_clock_get_ns() and see if any comments on it in v5.

I've also updated the commit message as the catch all errata
which was F4 included a clarification that the timestamp
was as implemented here.

Thanks,

Jonathan
=20


