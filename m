Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A14D6A208B
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 18:39:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVc1Q-0007vP-W9; Fri, 24 Feb 2023 12:38:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pVc1K-0007v3-IU
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 12:38:11 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pVc1G-000897-TH
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 12:38:10 -0500
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.200])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4PNcVt5dcpz67DfB;
 Sat, 25 Feb 2023 01:35:50 +0800 (CST)
Received: from localhost (10.122.247.231) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.17; Fri, 24 Feb
 2023 17:37:59 +0000
Date: Fri, 24 Feb 2023 17:37:58 +0000
To: Markus Armbruster <armbru@redhat.com>
CC: Thomas Huth <thuth@redhat.com>, Philippe =?ISO-8859-1?Q?Mathieu-Daud?=
 =?ISO-8859-1?Q?=E9?= <philmd@linaro.org>, <qemu-devel@nongnu.org>, "Michael
 Tsirkin" <mst@redhat.com>, Ben Widawsky <bwidawsk@kernel.org>,
 <linux-cxl@vger.kernel.org>, <linuxarm@huawei.com>, Ira Weiny
 <ira.weiny@intel.com>, Gregory Price <gourry.memverge@gmail.com>, "Mike
 Maslenkin" <mike.maslenkin@gmail.com>, Dave Jiang <dave.jiang@intel.com>,
 =?ISO-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>
Subject: Re: [PATCH v5 8/8] hw/mem/cxl_type3: Add CXL RAS Error Injection
 Support.
Message-ID: <20230224173758.00005d6f@huawei.com>
In-Reply-To: <20230223142748.0000662f@huawei.com>
References: <20230221152145.9736-1-Jonathan.Cameron@huawei.com>
 <20230221152145.9736-9-Jonathan.Cameron@huawei.com>
 <e432cebc-8faa-7b41-71c8-ea88c7bcbb04@linaro.org>
 <20230222145330.000021ef@huawei.com>
 <c2fb77b0-0734-3be5-1b54-7c797b3daa15@linaro.org>
 <20230222164947.0000554f@Huawei.com>
 <b9bd5698-1f73-b912-0344-4b70c30dd02a@linaro.org>
 <586d040f-d712-905e-fd68-bcde3713478b@redhat.com>
 <875ybsg7cl.fsf@pond.sub.org> <20230223142748.0000662f@huawei.com>
Organization: Huawei Technologies R&D (UK) Ltd.
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhrpeml500003.china.huawei.com (7.191.162.67) To
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

On Thu, 23 Feb 2023 14:27:48 +0000
Jonathan Cameron <Jonathan.Cameron@huawei.com> wrote:

> On Thu, 23 Feb 2023 08:37:46 +0100
> Markus Armbruster <armbru@redhat.com> wrote:
>=20
> > Thomas Huth <thuth@redhat.com> writes:
> >  =20
> > > On 22/02/2023 19.16, Philippe Mathieu-Daud=E9 wrote:   =20
> > >> +Thomas (meson) & Marc-Andr=E9 (conditional QAPI)   =20
> > >
> > > + Markus
> > >   =20
> > >> On 22/2/23 17:49, Jonathan Cameron wrote:   =20
> >=20
> > [...]
> >  =20
> > >>>>>> Doesn't these need
> > >>>>>>
> > >>>>>> =A0=A0=A0=A0=A0=A0=A0 'if': 'CONFIG_CXL_MEM_DEVICE',
> > >>>>>>
> > >>>>>> ?   =20
> > >>>>>
> > >>>>> If I make this change I get a bunch of
> > >>>>>
> > >>>>> ./qapi/qapi-types-cxl.h:18:13: error: attempt to use poisoned "CO=
NFIG_CXL_MEM_DEVICE"
> > >>>>> =A0=A0=A0=A0 18 | #if defined(CONFIG_CXL_MEM_DEVICE)   =20
> > >>>>
> > >>>> Err, I meant the generic CONFIG_CXL, not CONFIG_CXL_MEM_DEVICE.
> > >>>>   =20
> > >>>>> It's a target specific define (I think) as built alongside PCI_EX=
PRESS
> > >>>>> Only CXL_ACPI is specifically included by x86 and arm64 (out of t=
ree)
> > >>>>>
> > >>>>> To be honest though I don't fully understand the QEMU build syste=
m so the reason
> > >>>>> for the error might be wrong.   =20
> > >>>>
> > >>>> You need to restrict to system emulation (the 'have_system' check)=
:   =20
> > >>>
> > >>> This doesn't help - still have
> > >>> attempt to used poisoned "CONFIG_CXL"   =20
> > >
> > > Not sure how the QAPI generator works, but target specific config swi=
tches can only be used in target specific json files there, so that's machi=
ne-target.json and misc-target.json currently, as far as I know. Not sure h=
ow the QAPI generator distinguishes between common and target specific code=
, though ... just by the "-target" suffix? Maybe Markus or Marc-Andr=E9 can=
 comment on that.   =20
> >=20
> > Whenever you use a poisoned macro in a conditional, all the code
> > generated for this .json file (we call it a "QAPI schema module")
> > becomes target-dependent.  The QAPI code generator itself is blissfully
> > unaware of this.
> >=20
> > Since target-dependent code needs to be compiled differently, the build
> > process needs to be know which modules are target-dependent.  We do this
> > in one of the stupidest ways that could possibly work: a module is
> > target-dependent if its name ends with "-target".  There are just two
> > right now: qapi/machine-target.json and qapi/misc-target.json.
> >=20
> > The logic resides in qapi/meson.build.  Look for
> >=20
> >     if module.endswith('-target') =20
>=20
> Thanks for all the pointers.
> >=20
> > Questions? =20
>=20
> Is it sensible to make the cxl stuff all target dependent and do the foll=
owing?
> I like that we can get rid of the stubs if we do this but I'm sure there =
are
> disadvantages. Only alternative I can currently see is continue to have
> stubs and not make the qmp commands conditional on them doing anything us=
eful.
>=20
> Note this is on top of my tree so involves more changes - I'll push it do=
wn
> into the relevant series.

I got too focused on getting it to build, and failed to realize that the be=
low
change results in the new commands not being available anywhere. Oops.

Anyhow, my current conclusion is there isn't an easy way to make these cond=
itional
so we should just keep the stubs for non CXL supporting builds.

If I'm wrong on that, let me know.

Thanks,

Jonathan

>=20
> From 551122103cf1f5bb4de8ee005482c72532181439 Mon Sep 17 00:00:00 2001
> From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Date: Thu, 23 Feb 2023 14:22:53 +0000
> Subject: [PATCH] hw/cxl: Make CXL compilation target specific
>=20
> ---
>  hw/cxl/cxl-host-stubs.c            | 15 --------
>  hw/cxl/meson.build                 |  6 +---
>  hw/mem/cxl_type3.c                 |  3 +-
>  hw/mem/cxl_type3_stubs.c           | 58 ------------------------------
>  hw/mem/meson.build                 |  8 ++---
>  qapi/{cxl.json =3D> cxl-target.json} | 37 +++++++++++++------
>  qapi/meson.build                   |  2 +-
>  qapi/qapi-schema.json              |  2 +-
>  8 files changed, 35 insertions(+), 96 deletions(-)
>=20
> diff --git a/hw/cxl/cxl-host-stubs.c b/hw/cxl/cxl-host-stubs.c
> deleted file mode 100644
> index cae4afcdde..0000000000
> --- a/hw/cxl/cxl-host-stubs.c
> +++ /dev/null
> @@ -1,15 +0,0 @@
> -/*
> - * CXL host parameter parsing routine stubs
> - *
> - * Copyright (c) 2022 Huawei
> - */
> -#include "qemu/osdep.h"
> -#include "qapi/error.h"
> -#include "hw/cxl/cxl.h"
> -#include "hw/cxl/cxl_host.h"
> -
> -void cxl_fmws_link_targets(CXLState *stat, Error **errp) {};
> -void cxl_machine_init(Object *obj, CXLState *state) {};
> -void cxl_hook_up_pxb_registers(PCIBus *bus, CXLState *state, Error **err=
p) {};
> -
> -const MemoryRegionOps cfmws_ops;
> diff --git a/hw/cxl/meson.build b/hw/cxl/meson.build
> index 99ee564ce8..99eeb84268 100644
> --- a/hw/cxl/meson.build
> +++ b/hw/cxl/meson.build
> @@ -1,4 +1,4 @@
> -softmmu_ss.add(when: 'CONFIG_CXL',
> +specific_ss.add(when: 'CONFIG_CXL',
>                 if_true: files(
>                     'cxl-component-utils.c',
>                     'cxl-device-utils.c',
> @@ -8,9 +8,5 @@ softmmu_ss.add(when: 'CONFIG_CXL',
>                     'cxl-events.c',
>                     'cxl-cpmu.c',
>                     'switch-mailbox-cci.c',
> -               ),
> -               if_false: files(
> -                   'cxl-host-stubs.c',
>                 ))
> =20
> -softmmu_ss.add(when: 'CONFIG_ALL', if_true: files('cxl-host-stubs.c'))
> diff --git a/hw/mem/cxl_type3.c b/hw/mem/cxl_type3.c
> index 334ce92f5e..cf20fb81ff 100644
> --- a/hw/mem/cxl_type3.c
> +++ b/hw/mem/cxl_type3.c
> @@ -1,7 +1,8 @@
>  #include "qemu/osdep.h"
> +#include CONFIG_DEVICES
>  #include "qemu/units.h"
>  #include "qemu/error-report.h"
> -#include "qapi/qapi-commands-cxl.h"
> +#include "qapi/qapi-commands-cxl-target.h"
>  #include "hw/mem/memory-device.h"
>  #include "hw/mem/pc-dimm.h"
>  #include "hw/pci/pci.h"
> diff --git a/hw/mem/cxl_type3_stubs.c b/hw/mem/cxl_type3_stubs.c
> deleted file mode 100644
> index 2196bd841c..0000000000
> --- a/hw/mem/cxl_type3_stubs.c
> +++ /dev/null
> @@ -1,58 +0,0 @@
> -
> -#include "qemu/osdep.h"
> -#include "qapi/error.h"
> -#include "qapi/qapi-commands-cxl.h"
> -
> -void qmp_cxl_inject_gen_media_event(const char *path, CxlEventLog log,
> -                                    uint8_t flags, uint64_t physaddr,
> -                                    uint8_t descriptor, uint8_t type,
> -                                    uint8_t transaction_type,
> -                                    bool has_channel, uint8_t channel,
> -                                    bool has_rank, uint8_t rank,
> -                                    bool has_device, uint32_t device,
> -                                    const char *component_id,
> -                                    Error **errp) {}
> -
> -void qmp_cxl_inject_dram_event(const char *path, CxlEventLog log, uint8_=
t flags,
> -                               uint64_t physaddr, uint8_t descriptor,
> -                               uint8_t type, uint8_t transaction_type,
> -                               bool has_channel, uint8_t channel,
> -                               bool has_rank, uint8_t rank,
> -                               bool has_nibble_mask, uint32_t nibble_mas=
k,
> -                               bool has_bank_group, uint8_t bank_group,
> -                               bool has_bank, uint8_t bank,
> -                               bool has_row, uint32_t row,
> -                               bool has_column, uint16_t column,
> -                               bool has_correction_mask, uint64List *cor=
rection_mask,
> -                               Error **errp) {}
> -
> -void qmp_cxl_inject_memory_module_event(const char *path, CxlEventLog lo=
g,
> -                                        uint8_t flags, uint8_t type,
> -                                        uint8_t health_status,
> -                                        uint8_t media_status,
> -                                        uint8_t additional_status,
> -                                        uint8_t life_used,
> -                                        int16_t temperature,
> -                                        uint32_t dirty_shutdown_count,
> -                                        uint32_t corrected_volatile_erro=
r_count,
> -                                        uint32_t corrected_persistent_er=
ror_count,
> -                                        Error **errp) {}
> -
> -void qmp_cxl_inject_poison(const char *path, uint64_t start, uint64_t le=
ngth,
> -                           Error **errp)
> -{
> -    error_setg(errp, "CXL Type 3 support is not compiled in");
> -}
> -
> -void qmp_cxl_inject_uncorrectable_errors(const char *path,
> -                                         CXLUncorErrorRecordList *errors,
> -                                         Error **errp)
> -{
> -    error_setg(errp, "CXL Type 3 support is not compiled in");
> -}
> -
> -void qmp_cxl_inject_correctable_error(const char *path, CxlCorErrorType =
type,
> -                                      Error **errp)
> -{
> -    error_setg(errp, "CXL Type 3 support is not compiled in");
> -}
> diff --git a/hw/mem/meson.build b/hw/mem/meson.build
> index 56c2618b84..2bdd24512e 100644
> --- a/hw/mem/meson.build
> +++ b/hw/mem/meson.build
> @@ -3,10 +3,10 @@ mem_ss.add(files('memory-device.c'))
>  mem_ss.add(when: 'CONFIG_DIMM', if_true: files('pc-dimm.c'))
>  mem_ss.add(when: 'CONFIG_NPCM7XX', if_true: files('npcm7xx_mc.c'))
>  mem_ss.add(when: 'CONFIG_NVDIMM', if_true: files('nvdimm.c'))
> -mem_ss.add(when: 'CONFIG_CXL_MEM_DEVICE', if_true: files('cxl_type3.c'))
> -softmmu_ss.add(when: 'CONFIG_CXL_MEM_DEVICE', if_false: files('cxl_type3=
_stubs.c'))
> -softmmu_ss.add(when: 'CONFIG_ALL', if_true: files('cxl_type3_stubs.c'))
> +specific_ss.add(when: 'CONFIG_CXL_MEM_DEVICE', if_true: files('cxl_type3=
.c'))
> +#specific_ss.add(when: 'CONFIG_CXL_MEM_DEVICE', if_false: files('cxl_typ=
e3_stubs.c'))
> +#specific_ss.add(when: 'CONFIG_ALL', if_true: files('cxl_type3_stubs.c'))
> =20
> -softmmu_ss.add_all(when: 'CONFIG_MEM_DEVICE', if_true: mem_ss)
> +specific_ss.add_all(when: 'CONFIG_MEM_DEVICE', if_true: mem_ss)
> =20
>  softmmu_ss.add(when: 'CONFIG_SPARSE_MEM', if_true: files('sparse-mem.c'))
> diff --git a/qapi/cxl.json b/qapi/cxl-target.json
> similarity index 94%
> rename from qapi/cxl.json
> rename to qapi/cxl-target.json
> index 4c029f2807..b3aecea4f0 100644
> --- a/qapi/cxl.json
> +++ b/qapi/cxl-target.json
> @@ -21,7 +21,8 @@
>             'warning',
>             'failure',
>             'fatal'
> -           ]
> +           ],
> +  'if': 'CONFIG_CXL_MEM_DEVICE'
>   }
> =20
>  ##
> @@ -49,7 +50,9 @@
>              'type': 'uint8', 'transaction-type': 'uint8',
>              '*channel': 'uint8', '*rank': 'uint8',
>              '*device': 'uint32', '*component-id': 'str'
> -            }}
> +            },
> +  'if': 'CONFIG_CXL_MEM_DEVICE'
> + }
> =20
>  ##
>  # @cxl-inject-dram-event:
> @@ -82,7 +85,9 @@
>              '*channel': 'uint8', '*rank': 'uint8', '*nibble-mask': 'uint=
32',
>              '*bank-group': 'uint8', '*bank': 'uint8', '*row': 'uint32',
>              '*column': 'uint16', '*correction-mask': [ 'uint64' ]
> -           }}
> +           },
> +  'if': 'CONFIG_CXL_MEM_DEVICE'
> +}
> =20
>  ##
>  # @cxl-inject-memory-module-event:
> @@ -115,7 +120,9 @@
>              'dirty-shutdown-count': 'uint32',
>              'corrected-volatile-error-count': 'uint32',
>              'corrected-persistent-error-count': 'uint32'
> -            }}
> +            },
> +  'if': 'CONFIG_CXL_MEM_DEVICE'
> +}
> =20
>  ##
>  # @cxl-inject-poison:
> @@ -133,7 +140,9 @@
>  # Since: 8.0
>  ##
>  { 'command': 'cxl-inject-poison',
> -  'data': { 'path': 'str', 'start': 'uint64', 'length': 'uint64' }}
> +  'data': { 'path': 'str', 'start': 'uint64', 'length': 'uint64' },
> +  'if': 'CONFIG_CXL_MEM_DEVICE'
> +}
> =20
>  ##
>  # @CxlUncorErrorType:
> @@ -179,8 +188,9 @@
>             'internal',
>             'cxl-ide-tx',
>             'cxl-ide-rx'
> -           ]
> - }
> +           ],
> +  'if': 'CONFIG_CXL_MEM_DEVICE'
> +}
> =20
>  ##
>  # @CXLUncorErrorRecord:
> @@ -196,7 +206,8 @@
>    'data': {
>        'type': 'CxlUncorErrorType',
>        'header': [ 'uint32' ]
> -  }
> +  },
> +  'if': 'CONFIG_CXL_MEM_DEVICE'
>  }
> =20
>  ##
> @@ -212,7 +223,9 @@
>  ##
>  { 'command': 'cxl-inject-uncorrectable-errors',
>    'data': { 'path': 'str',
> -             'errors': [ 'CXLUncorErrorRecord' ] }}
> +             'errors': [ 'CXLUncorErrorRecord' ] },
> +  'if': 'CONFIG_CXL_MEM_DEVICE'
> +}
> =20
>  ##
>  # @CxlCorErrorType:
> @@ -235,7 +248,8 @@
>             'retry-threshold',
>             'cache-poison-received',
>             'mem-poison-received',
> -           'physical']
> +           'physical'],
> +  'if': 'CONFIG_CXL_MEM_DEVICE'
>  }
> =20
>  ##
> @@ -254,5 +268,6 @@
>  { 'command': 'cxl-inject-correctable-error',
>    'data': { 'path': 'str',
>              'type': 'CxlCorErrorType'
> -  }
> +           },
> +  'if': 'CONFIG_CXL_MEM_DEVICE'
>  }
> diff --git a/qapi/meson.build b/qapi/meson.build
> index 73c3c8c31a..f5b3f36979 100644
> --- a/qapi/meson.build
> +++ b/qapi/meson.build
> @@ -31,7 +31,7 @@ qapi_all_modules =3D [
>    'compat',
>    'control',
>    'crypto',
> -  'cxl',
> +  'cxl-target',
>    'dump',
>    'error',
>    'introspect',
> diff --git a/qapi/qapi-schema.json b/qapi/qapi-schema.json
> index 079f2a402a..a79d84577f 100644
> --- a/qapi/qapi-schema.json
> +++ b/qapi/qapi-schema.json
> @@ -95,4 +95,4 @@
>  { 'include': 'pci.json' }
>  { 'include': 'stats.json' }
>  { 'include': 'virtio.json' }
> -{ 'include': 'cxl.json' }
> +{ 'include': 'cxl-target.json' }


