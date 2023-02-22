Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B3769F72E
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 15:55:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUqVE-00024d-St; Wed, 22 Feb 2023 09:53:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pUqVB-000246-W7
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 09:53:50 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pUqV9-0004O6-B4
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 09:53:49 -0500
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.200])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4PMJv15pxdz6J7N8;
 Wed, 22 Feb 2023 22:48:45 +0800 (CST)
Received: from localhost (10.122.247.231) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.17; Wed, 22 Feb
 2023 14:53:31 +0000
Date: Wed, 22 Feb 2023 14:53:30 +0000
To: Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
CC: <qemu-devel@nongnu.org>, Michael Tsirkin <mst@redhat.com>, Ben Widawsky
 <bwidawsk@kernel.org>, <linux-cxl@vger.kernel.org>, <linuxarm@huawei.com>,
 "Ira Weiny" <ira.weiny@intel.com>, Gregory Price <gourry.memverge@gmail.com>, 
 Mike Maslenkin <mike.maslenkin@gmail.com>, Dave Jiang <dave.jiang@intel.com>, 
 Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v5 8/8] hw/mem/cxl_type3: Add CXL RAS Error Injection
 Support.
Message-ID: <20230222145330.000021ef@huawei.com>
In-Reply-To: <e432cebc-8faa-7b41-71c8-ea88c7bcbb04@linaro.org>
References: <20230221152145.9736-1-Jonathan.Cameron@huawei.com>
 <20230221152145.9736-9-Jonathan.Cameron@huawei.com>
 <e432cebc-8faa-7b41-71c8-ea88c7bcbb04@linaro.org>
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

On Tue, 21 Feb 2023 23:15:49 +0100
Philippe Mathieu-Daud=E9 <philmd@linaro.org> wrote:

> Hi Jonathan,
>=20
> On 21/2/23 16:21, Jonathan Cameron wrote:
> > CXL uses PCI AER Internal errors to signal to the host that an error has
> > occurred. The host can then read more detailed status from the CXL RAS
> > capability.
> >=20
> > For uncorrectable errors: support multiple injection in one operation
> > as this is needed to reliably test multiple header logging support in an
> > OS. The equivalent feature doesn't exist for correctable errors, so only
> > one error need be injected at a time.
> >=20
> > Note:
> >   - Header content needs to be manually specified in a fashion that
> >     matches the specification for what can be in the header for each
> >     error type.
> >=20
> > Injection via QMP:
> > { "execute": "qmp_capabilities" }
> > ...
> > { "execute": "cxl-inject-uncorrectable-errors",
> >    "arguments": {
> >      "path": "/machine/peripheral/cxl-pmem0",
> >      "errors": [
> >          {
> >              "type": "cache-address-parity",
> >              "header": [ 3, 4]
> >          },
> >          {
> >              "type": "cache-data-parity",
> >              "header": [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,=
19,20,21,22,23,24,25,26,27,28,29,30,31]
> >          },
> >          {
> >              "type": "internal",
> >              "header": [ 1, 2, 4]
> >          }
> >          ]
> >    }}
> > ...
> > { "execute": "cxl-inject-correctable-error",
> >      "arguments": {
> >          "path": "/machine/peripheral/cxl-pmem0",
> >          "type": "physical"
> >      } }
> >=20
> > Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Hi Philippe,

Thanks for your review.  One question inline.

> > +#
> > +# Type of uncorrectable CXL error to inject. These errors are reported=
 via
> > +# an AER uncorrectable internal error with additional information logg=
ed at
> > +# the CXL device.
> > +#
> > +# @cache-data-parity: Data error such as data parity or data ECC error=
 CXL.cache
> > +# @cache-address-parity: Address parity or other errors associated wit=
h the
> > +#                        address field on CXL.cache
> > +# @cache-be-parity: Byte enable parity or other byte enable errors on =
CXL.cache
> > +# @cache-data-ecc: ECC error on CXL.cache
> > +# @mem-data-parity: Data error such as data parity or data ECC error o=
n CXL.mem
> > +# @mem-address-parity: Address parity or other errors associated with =
the
> > +#                      address field on CXL.mem
> > +# @mem-be-parity: Byte enable parity or other byte enable errors on CX=
L.mem.
> > +# @mem-data-ecc: Data ECC error on CXL.mem.
> > +# @reinit-threshold: REINIT threshold hit.
> > +# @rsvd-encoding: Received unrecognized encoding.
> > +# @poison-received: Received poison from the peer.
> > +# @receiver-overflow: Buffer overflows (first 3 bits of header log ind=
icate which)
> > +# @internal: Component specific error
> > +# @cxl-ide-tx: Integrity and data encryption tx error.
> > +# @cxl-ide-rx: Integrity and data encryption rx error.
> > +##
> > +
> > +{ 'enum': 'CxlUncorErrorType', =20
>=20
> Doesn't these need
>=20
>       'if': 'CONFIG_CXL_MEM_DEVICE',
>=20
> ?

If I make this change I get a bunch of

./qapi/qapi-types-cxl.h:18:13: error: attempt to use poisoned "CONFIG_CXL_M=
EM_DEVICE"
   18 | #if defined(CONFIG_CXL_MEM_DEVICE)

It's a target specific define (I think) as built alongside PCI_EXPRESS
Only CXL_ACPI is specifically included by x86 and arm64 (out of tree)

To be honest though I don't fully understand the QEMU build system so the r=
eason
for the error might be wrong.

>=20
> > +  'data': ['cache-data-parity',
> > +           'cache-address-parity',
> > +           'cache-be-parity',
> > +           'cache-data-ecc',
> > +           'mem-data-parity',
> > +           'mem-address-parity',
> > +           'mem-be-parity',
> > +           'mem-data-ecc',
> > +           'reinit-threshold',
> > +           'rsvd-encoding',
> > +           'poison-received',
> > +           'receiver-overflow',
> > +           'internal',
> > +           'cxl-ide-tx',
> > +           'cxl-ide-rx'
> > +           ]
> > + }

