Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5733D6A87D1
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 18:23:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXmdy-0006bW-Br; Thu, 02 Mar 2023 12:23:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pXmdv-0006Yb-TU
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 12:22:59 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pXmdt-00026M-Db
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 12:22:59 -0500
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.200])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4PSHqR4cvYz6J7f6;
 Fri,  3 Mar 2023 01:17:55 +0800 (CST)
Received: from localhost (10.122.247.231) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Thu, 2 Mar
 2023 17:22:53 +0000
Date: Thu, 2 Mar 2023 17:22:52 +0000
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>, qemu
 <qemu-devel@nongnu.org>, Ben Widawsky <bwidawsk@kernel.org>,
 <linux-cxl@vger.kernel.org>, <linuxarm@huawei.com>, Ira Weiny
 <ira.weiny@intel.com>, Gregory Price <gourry.memverge@gmail.com>, "Mike
 Maslenkin" <mike.maslenkin@gmail.com>, Dave Jiang <dave.jiang@intel.com>,
 Markus Armbruster <armbru@redhat.com>, =?ISO-8859-1?Q?Marc-Andr=E9?= Lureau
 <marcandre.lureau@redhat.com>, Thomas Huth <thuth@redhat.com>, Michael Roth
 <michael.roth@amd.com>
Subject: Re: [PATCH v6 8/8] hw/mem/cxl_type3: Add CXL RAS Error Injection
 Support.
Message-ID: <20230302172252.00000025@huawei.com>
In-Reply-To: <20230302055254-mutt-send-email-mst@kernel.org>
References: <20230227112751.6101-1-Jonathan.Cameron@huawei.com>
 <20230227112751.6101-9-Jonathan.Cameron@huawei.com>
 <20230302100608.00005bcd@huawei.com>
 <e9287de7-94a6-944b-1627-3fa8f7f1a9bc@linaro.org>
 <20230302055254-mutt-send-email-mst@kernel.org>
Organization: Huawei Technologies R&D (UK) Ltd.
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhrpeml100003.china.huawei.com (7.191.160.210) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, 2 Mar 2023 05:55:00 -0500
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Thu, Mar 02, 2023 at 11:49:52AM +0100, Philippe Mathieu-Daud=E9 wrote:
> > On 2/3/23 11:06, Jonathan Cameron wrote: =20
> > > +CC Michael Roth.
> > >=20
> > > Michael Tsirkin noted I'd missed CCing QAPI maintaintainers on the
> > > poison injection series so I went back to check the others I had out =
for review.
> > > For this series I'd managed to pick up one of two as Markus gave comm=
ents on
> > > earlier versions. =20
> >=20
> > Now LGTM for meson/QAPI (although I'm not a QAPI maintainer).
> >=20
> > Hopefully MST can take your series just in time for soft freeze. =20
>=20
>=20
> Bottleneck is QAPI right now. Consider CC Eric and maybe Daniel
> because Daniel is awesome and has been helping out with lots
> of stuff among them QAPI.

Thanks for the tip.  Resent with additional CCs (hopefully to right
people!) and a note that we are looking for qapi review.

With the benefit of hindsight I'd have ordered the series differently
if I'd guessed we'd bottleneck here.

Jonathan

>=20
> > > On Mon, 27 Feb 2023 11:27:51 +0000
> > > Jonathan Cameron via <qemu-devel@nongnu.org> wrote:
> > >  =20
> > > > CXL uses PCI AER Internal errors to signal to the host that an erro=
r has
> > > > occurred. The host can then read more detailed status from the CXL =
RAS
> > > > capability.
> > > >=20
> > > > For uncorrectable errors: support multiple injection in one operati=
on
> > > > as this is needed to reliably test multiple header logging support =
in an
> > > > OS. The equivalent feature doesn't exist for correctable errors, so=
 only
> > > > one error need be injected at a time.
> > > >=20
> > > > Note:
> > > >   - Header content needs to be manually specified in a fashion that
> > > >     matches the specification for what can be in the header for each
> > > >     error type.
> > > >=20
> > > > Injection via QMP:
> > > > { "execute": "qmp_capabilities" }
> > > > ...
> > > > { "execute": "cxl-inject-uncorrectable-errors",
> > > >    "arguments": {
> > > >      "path": "/machine/peripheral/cxl-pmem0",
> > > >      "errors": [
> > > >          {
> > > >              "type": "cache-address-parity",
> > > >              "header": [ 3, 4]
> > > >          },
> > > >          {
> > > >              "type": "cache-data-parity",
> > > >              "header": [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17=
,18,19,20,21,22,23,24,25,26,27,28,29,30,31]
> > > >          },
> > > >          {
> > > >              "type": "internal",
> > > >              "header": [ 1, 2, 4]
> > > >          }
> > > >          ]
> > > >    }}
> > > > ...
> > > > { "execute": "cxl-inject-correctable-error",
> > > >      "arguments": {
> > > >          "path": "/machine/peripheral/cxl-pmem0",
> > > >          "type": "physical"
> > > >      } }
> > > >=20
> > > > Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> > > > ---
> > > > v6: (Thanks to Philippe Mathieu-Daud=E9)
> > > > - Add Since entries in cxl.json
> > > > - Add error prints in the stub functions so that if they are called=
 without
> > > >    CONFIG_CXL_MEM_DEVICE then we get a useful print rather than jus=
t silently
> > > >    eating them.
> > > > ---
> > > >   hw/cxl/cxl-component-utils.c   |   4 +-
> > > >   hw/mem/cxl_type3.c             | 281 ++++++++++++++++++++++++++++=
+++++
> > > >   hw/mem/cxl_type3_stubs.c       |  17 ++
> > > >   hw/mem/meson.build             |   2 +
> > > >   include/hw/cxl/cxl_component.h |  26 +++
> > > >   include/hw/cxl/cxl_device.h    |  11 ++
> > > >   qapi/cxl.json                  | 128 +++++++++++++++
> > > >   qapi/meson.build               |   1 +
> > > >   qapi/qapi-schema.json          |   1 +
> > > >   9 files changed, 470 insertions(+), 1 deletion(-) =20
>=20


