Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AEA365C5B1
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Jan 2023 19:09:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pClhG-0005MQ-RV; Tue, 03 Jan 2023 13:07:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pClhE-0005M1-4i
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 13:07:32 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pClhB-0003bB-AA
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 13:07:31 -0500
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.207])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4NmgYr3g6Yz6801v;
 Wed,  4 Jan 2023 02:02:40 +0800 (CST)
Received: from localhost (10.122.247.231) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 3 Jan
 2023 18:07:20 +0000
Date: Tue, 3 Jan 2023 18:07:19 +0000
To: Ira Weiny <ira.weiny@intel.com>
CC: Michael Tsirkin <mst@redhat.com>, Ben Widawsky <bwidawsk@kernel.org>,
 <qemu-devel@nongnu.org>, <linux-cxl@vger.kernel.org>, Peter Maydell
 <peter.maydell@linaro.org>
Subject: Re: [PATCH v2 8/8] hw/cxl/events: Add in inject general media event
Message-ID: <20230103180719.00006437@huawei.com>
In-Reply-To: <20221221-ira-cxl-events-2022-11-17-v2-8-2ce2ecc06219@intel.com>
References: <20221221-ira-cxl-events-2022-11-17-v2-0-2ce2ecc06219@intel.com>
 <20221221-ira-cxl-events-2022-11-17-v2-8-2ce2ecc06219@intel.com>
Organization: Huawei Technologies R&D (UK) Ltd.
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
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

On Wed, 21 Dec 2022 20:24:38 -0800
Ira Weiny <ira.weiny@intel.com> wrote:

> To facilitate testing provide a QMP command to inject a general media
> event.  The event can be added to the log specified.
>=20
> Signed-off-by: Ira Weiny <ira.weiny@intel.com>

Hi Ira,

Suggestion inline on how to more neatly handle optional arguments using
QMPs inbuilt handling.  Short version is stick a * in front of the
argument name in the json and you get a bonus parameter in the callback
bool has_<name> which lets you identify if it is provided or not.

Jonathan

>=20
> ---
> Changes from RFC:
> 	Add all fields for this event
> 	irq happens automatically when log transitions from 0 to 1
> ---
>  hw/mem/cxl_type3.c          | 93 +++++++++++++++++++++++++++++++++++++++=
++++++
>  hw/mem/cxl_type3_stubs.c    |  8 ++++
>  include/hw/cxl/cxl_events.h | 20 ++++++++++
>  qapi/cxl.json               | 25 ++++++++++++
>  4 files changed, 146 insertions(+)
>=20
> diff --git a/hw/mem/cxl_type3.c b/hw/mem/cxl_type3.c
> index a43949cab120..bedd09e500ba 100644
> --- a/hw/mem/cxl_type3.c
> +++ b/hw/mem/cxl_type3.c
> @@ -916,6 +916,99 @@ static CXLPoisonList *get_poison_list(CXLType3Dev *c=
t3d)
>      return &ct3d->poison_list;
>  }
> =20
> +static void cxl_assign_event_header(struct cxl_event_record_hdr *hdr,
> +                                    QemuUUID *uuid, uint8_t flags,
> +                                    uint8_t length)
> +{
> +    hdr->flags[0] =3D flags;
> +    hdr->length =3D length;
> +    memcpy(&hdr->id, uuid, sizeof(hdr->id));
> +    hdr->timestamp =3D qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> +}
> +
> +QemuUUID gen_media_uuid =3D {
> +    .data =3D UUID(0xfbcd0a77, 0xc260, 0x417f,
> +                 0x85, 0xa9, 0x08, 0x8b, 0x16, 0x21, 0xeb, 0xa6),
> +};
> +
> +#define CXL_GMER_VALID_CHANNEL                          BIT(0)
> +#define CXL_GMER_VALID_RANK                             BIT(1)
> +#define CXL_GMER_VALID_DEVICE                           BIT(2)
> +#define CXL_GMER_VALID_COMPONENT                        BIT(3)
> +
> +/*
> + * For channel, rank, and device; any value inside of the fields valid r=
ange
> + * will flag that field to be valid.  IE pass -1 to mark the field inval=
id.
> + *
> + * Component ID is device specific.  Define this as a string.
> + */
> +void qmp_cxl_inject_gen_media_event(const char *path, uint8_t log,
> +                                    uint8_t flags, uint64_t physaddr,
> +                                    uint8_t descriptor, uint8_t type,
> +                                    uint8_t transaction_type,
> +                                    int16_t channel, int16_t rank,
> +                                    int32_t device,
> +                                    const char *component_id,
> +                                    Error **errp)
> +{
> +    Object *obj =3D object_resolve_path(path, NULL);
> +    struct cxl_event_gen_media gem;
> +    struct cxl_event_record_hdr *hdr =3D &gem.hdr;
> +    CXLDeviceState *cxlds;
> +    CXLType3Dev *ct3d;
> +    uint16_t valid_flags =3D 0;
> +
> +    if (log >=3D CXL_EVENT_TYPE_MAX) {
> +        error_setg(errp, "Invalid log type: %d", log);
> +        return;
> +    }
> +    if (!obj) {
> +        error_setg(errp, "Unable to resolve path");
> +        return;
> +    }
> +    if (!object_dynamic_cast(obj, TYPE_CXL_TYPE3)) {
> +        error_setg(errp, "Path does not point to a CXL type 3 device");
> +    }
> +    ct3d =3D CXL_TYPE3(obj);
> +    cxlds =3D &ct3d->cxl_dstate;
> +
> +    memset(&gem, 0, sizeof(gem));
> +    cxl_assign_event_header(hdr, &gen_media_uuid, flags,
> +                            sizeof(struct cxl_event_gen_media));
> +
> +    gem.phys_addr =3D physaddr;
> +    gem.descriptor =3D descriptor;
> +    gem.type =3D type;
> +    gem.transaction_type =3D transaction_type;
> +
> +    if (0 <=3D channel && channel <=3D 0xFF) {
> +        gem.channel =3D channel;
> +        valid_flags |=3D CXL_GMER_VALID_CHANNEL;
> +    }
> +
> +    if (0 <=3D rank && rank <=3D 0xFF) {
> +        gem.rank =3D rank;
> +        valid_flags |=3D CXL_GMER_VALID_RANK;
> +    }
> +
> +    if (0 <=3D device && device <=3D 0xFFFFFF) {
> +        st24_le_p(gem.device, device);
> +        valid_flags |=3D CXL_GMER_VALID_DEVICE;
> +    }
> +
> +    if (component_id && strcmp(component_id, "")) {
> +        strncpy((char *)gem.component_id, component_id,
> +                sizeof(gem.component_id) - 1);
> +        valid_flags |=3D CXL_GMER_VALID_COMPONENT;
> +    }
> +
> +    stw_le_p(gem.validity_flags, valid_flags);
> +
> +    if (cxl_event_insert(cxlds, log, (struct cxl_event_record_raw *)&gem=
)) {
> +        cxl_event_irq_assert(ct3d);
> +    }
> +}
> +
>  void qmp_cxl_inject_poison(const char *path, uint64_t start, uint64_t le=
ngth,
>                             Error **errp)
>  {
> diff --git a/hw/mem/cxl_type3_stubs.c b/hw/mem/cxl_type3_stubs.c
> index f2c9f48f4010..62f04d487031 100644
> --- a/hw/mem/cxl_type3_stubs.c
> +++ b/hw/mem/cxl_type3_stubs.c
> @@ -2,6 +2,14 @@
>  #include "qemu/osdep.h"
>  #include "qapi/qapi-commands-cxl.h"
> =20
> +void qmp_cxl_inject_gen_media_event(const char *path, uint8_t log,
> +                                    uint8_t flags, uint64_t physaddr,
> +                                    uint8_t descriptor, uint8_t type,
> +                                    uint8_t transaction_type,
> +                                    int16_t channel, int16_t rank,
> +                                    int32_t device,
> +                                    char *component_id,
> +                                    Error **errp) {}
>  void qmp_cxl_inject_poison(const char *path, uint64_t start, uint64_t le=
ngth,
>                             Error **errp) {}
>  void qmp_cxl_inject_uncorrectable_error(const char *path,
> diff --git a/include/hw/cxl/cxl_events.h b/include/hw/cxl/cxl_events.h
> index 2df40720320a..3175e9d9866d 100644
> --- a/include/hw/cxl/cxl_events.h
> +++ b/include/hw/cxl/cxl_events.h
> @@ -103,4 +103,24 @@ struct cxl_event_interrupt_policy {
>  /* DCD is optional but other fields are not */
>  #define CXL_EVENT_INT_SETTING_MIN_LEN 4
> =20
> +/*
> + * General Media Event Record
> + * CXL rev 3.0 Section 8.2.9.2.1.1; Table 8-43
> + */
> +#define CXL_EVENT_GEN_MED_COMP_ID_SIZE  0x10
> +#define CXL_EVENT_GEN_MED_RES_SIZE      0x2e
> +struct cxl_event_gen_media {
> +    struct cxl_event_record_hdr hdr;
> +    uint64_t phys_addr;
> +    uint8_t descriptor;
> +    uint8_t type;
> +    uint8_t transaction_type;
> +    uint8_t validity_flags[2];
> +    uint8_t channel;
> +    uint8_t rank;
> +    uint8_t device[3];
> +    uint8_t component_id[CXL_EVENT_GEN_MED_COMP_ID_SIZE];
> +    uint8_t reserved[CXL_EVENT_GEN_MED_RES_SIZE];
> +} QEMU_PACKED;
> +
>  #endif /* CXL_EVENTS_H */
> diff --git a/qapi/cxl.json b/qapi/cxl.json
> index b4836bb87f53..56e85a28d7e0 100644
> --- a/qapi/cxl.json
> +++ b/qapi/cxl.json
> @@ -5,6 +5,31 @@
>  # =3D CXL devices
>  ##
> =20
> +##
> +# @cxl-inject-gen-media-event:
> +#
> +# @path: CXL type 3 device canonical QOM path
> +#
> +# @log: Event Log to add the event to
> +# @flags: header flags
> +# @physaddr: Physical Address
> +# @descriptor: Descriptor
> +# @type: Type
> +# @transactiontype: Transaction Type
> +# @channel: Channel
> +# @rank: Rank
> +# @device: Device
> +# @componentid: Device specific string
> +#
> +##
> +{ 'command': 'cxl-inject-gen-media-event',
> +  'data': { 'path': 'str', 'log': 'uint8', 'flags': 'uint8',
> +            'physaddr': 'uint64', 'descriptor': 'uint8',
> +            'type': 'uint8', 'transactiontype': 'uint8',
> +            'channel': 'int16', 'rank': 'int16',
> +            'device': 'int32', 'componentid': 'str'
> +            }}

=46rom an interface cleanliness point of view I'd rather see
all the optional fields as optional.  That's done by marking them
with a * so
'*channel': 'int16'

Then the signature of the related qmp_cxl_inject_gen_media_event
gains a boolean has_channel parameter (before channel)

Those booleans can be used to set the flags etc.

Very lightly tested:=20

diff --git a/hw/mem/cxl_type3.c b/hw/mem/cxl_type3.c
index 4660a44ef8..cb9bb0b166 100644
--- a/hw/mem/cxl_type3.c
+++ b/hw/mem/cxl_type3.c
@@ -1203,8 +1203,9 @@ void qmp_cxl_inject_gen_media_event(const char *path,=
 uint8_t log,
                                     uint8_t flags, uint64_t physaddr,
                                     uint8_t descriptor, uint8_t type,
                                     uint8_t transaction_type,
-                                    int16_t channel, int16_t rank,
-                                    int32_t device,
+                                    bool has_channel, uint8_t channel,
+                                    bool has_rank, uint8_t rank,
+                                    bool has_device, uint32_t device,
                                     const char *component_id,
                                     Error **errp)
 {
@@ -1238,22 +1239,22 @@ void qmp_cxl_inject_gen_media_event(const char *pat=
h, uint8_t log,
     gem.type =3D type;
     gem.transaction_type =3D transaction_type;

-    if (0 <=3D channel && channel <=3D 0xFF) {
+    if (has_channel) {
         gem.channel =3D channel;
         valid_flags |=3D CXL_GMER_VALID_CHANNEL;
     }

-    if (0 <=3D rank && rank <=3D 0xFF) {
+    if (has_rank) {
         gem.rank =3D rank;
         valid_flags |=3D CXL_GMER_VALID_RANK;
     }

-    if (0 <=3D device && device <=3D 0xFFFFFF) {
+    if (has_device) {
         st24_le_p(gem.device, device);
         valid_flags |=3D CXL_GMER_VALID_DEVICE;
     }

-    if (component_id && strcmp(component_id, "")) {
+    if (component_id) {
        strncpy((char *)gem.component_id, component_id,
                 sizeof(gem.component_id) - 1);
         valid_flags |=3D CXL_GMER_VALID_COMPONENT;
diff --git a/qapi/cxl.json b/qapi/cxl.json
index 56e85a28d7..085f82e7da 100644
--- a/qapi/cxl.json
+++ b/qapi/cxl.json
@@ -26,8 +26,8 @@
   'data': { 'path': 'str', 'log': 'uint8', 'flags': 'uint8',
             'physaddr': 'uint64', 'descriptor': 'uint8',
             'type': 'uint8', 'transactiontype': 'uint8',
-            'channel': 'int16', 'rank': 'int16',
-            'device': 'int32', 'componentid': 'str'
+            '*channel': 'uint8', '*rank': 'uint8',
+            '*device': 'uint32', '*componentid': 'str'
             }}

 ##

> +
>  ##
>  # @cxl-inject-poison:
>  #
>=20


