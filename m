Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C80693A1793
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 16:40:59 +0200 (CEST)
Received: from localhost ([::1]:33282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqzO6-0008WE-SG
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 10:40:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lqzMs-0007HU-TH
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 10:39:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28454)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lqzMq-0001CZ-A2
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 10:39:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623249579;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tBNUtpLk8TidNFG19wNJnhLlbz3l6BMrglMEb9+iQcI=;
 b=g5GF/L47sC12vKXNPc96GUiJ4UU9eKvwyajDK0vqJYOUhdRHCPw6hBg7UcMdbFIrDvPTaT
 fzNc/1AHBjULvDljNA9oAV0gk40TLNxFCpvW+WLUw82KghlRCcaVfEqf6Mn3NSqxJlAbma
 D38TW/18QWgjae0pI/vu4iGUNc9XobA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-533-Uo4yJHXVPGCMG52r_TSQOg-1; Wed, 09 Jun 2021 10:39:28 -0400
X-MC-Unique: Uo4yJHXVPGCMG52r_TSQOg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 34D978042AA;
 Wed,  9 Jun 2021 14:39:26 +0000 (UTC)
Received: from redhat.com (ovpn-115-127.ams2.redhat.com [10.36.115.127])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B507010016F4;
 Wed,  9 Jun 2021 14:39:23 +0000 (UTC)
Date: Wed, 9 Jun 2021 15:39:20 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH 1/1] hw/nvme: namespace parameter for EUI64
Message-ID: <YMDSmEgfMeZa8cWd@redhat.com>
References: <20210609114657.33301-1-xypron.glpk@gmx.de>
 <YMCwjV7Vpbk5au/U@apples.localdomain>
 <f5f15ac1-0876-331e-7433-a6ca551b9e10@gmx.de>
 <YMC1BJ5zOGQWmg7Q@apples.localdomain>
MIME-Version: 1.0
In-Reply-To: <YMC1BJ5zOGQWmg7Q@apples.localdomain>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, qemu-devel@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, Keith Busch <kbusch@kernel.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 09, 2021 at 02:33:08PM +0200, Klaus Jensen wrote:
> On Jun  9 14:21, Heinrich Schuchardt wrote:
> > On 6/9/21 2:14 PM, Klaus Jensen wrote:
> > > On Jun  9 13:46, Heinrich Schuchardt wrote:
> > > > The EUI64 field is the only identifier for NVMe namespaces in UEFI device
> > > > paths. Add a new namespace property "eui64", that provides the user the
> > > > option to specify the EUI64.
> > > > 
> > > > Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
> > > > ---
> > > > docs/system/nvme.rst |  4 +++
> > > > hw/nvme/ctrl.c       | 58 ++++++++++++++++++++++++++------------------
> > > > hw/nvme/ns.c         |  2 ++
> > > > hw/nvme/nvme.h       |  1 +
> > > > 4 files changed, 42 insertions(+), 23 deletions(-)
> > > > 
> > > > diff --git a/docs/system/nvme.rst b/docs/system/nvme.rst
> > > > index f7f63d6bf6..a6042f942a 100644
> > > > --- a/docs/system/nvme.rst
> > > > +++ b/docs/system/nvme.rst
> > > > @@ -81,6 +81,10 @@ There are a number of parameters available:
> > > >   Set the UUID of the namespace. This will be reported as a "Namespace
> > > > UUID"
> > > >   descriptor in the Namespace Identification Descriptor List.
> > > > 
> > > > +``eui64``
> > > > +  Set the EUI64 of the namespace. This will be reported as a "IEEE
> > > > Extended
> > > > +  Unique Identifier" descriptor in the Namespace Identification
> > > > Descriptor List.
> > > > +
> > > > ``bus``
> > > >   If there are more ``nvme`` devices defined, this parameter may be
> > > > used to
> > > >   attach the namespace to a specific ``nvme`` device (identified by an
> > > > ``id``
> > > > diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> > > > index 0bcaf7192f..21f2d6843b 100644
> > > > --- a/hw/nvme/ctrl.c
> > > > +++ b/hw/nvme/ctrl.c
> > > > @@ -4426,19 +4426,19 @@ static uint16_t
> > > > nvme_identify_ns_descr_list(NvmeCtrl *n, NvmeRequest *req)
> > > >     NvmeIdentify *c = (NvmeIdentify *)&req->cmd;
> > > >     uint32_t nsid = le32_to_cpu(c->nsid);
> > > >     uint8_t list[NVME_IDENTIFY_DATA_SIZE] = {};
> > > > -
> > > > -    struct data {
> > > > -        struct {
> > > > -            NvmeIdNsDescr hdr;
> > > > -            uint8_t v[NVME_NIDL_UUID];
> > > > -        } uuid;
> > > > -        struct {
> > > > -            NvmeIdNsDescr hdr;
> > > > -            uint8_t v;
> > > > -        } csi;
> > > > -    };
> > > > -
> > > > -    struct data *ns_descrs = (struct data *)list;
> > > > +    uint8_t *pos = list;
> > > > +    struct {
> > > > +        NvmeIdNsDescr hdr;
> > > > +        uint8_t v[NVME_NIDL_UUID];
> > > > +    } QEMU_PACKED uuid;
> > > > +    struct {
> > > > +        NvmeIdNsDescr hdr;
> > > > +        uint64_t v;
> > > > +    } QEMU_PACKED eui64;
> > > > +    struct {
> > > > +        NvmeIdNsDescr hdr;
> > > > +        uint8_t v;
> > > > +    } QEMU_PACKED csi;
> > > > 
> > > >     trace_pci_nvme_identify_ns_descr_list(nsid);
> > > > 
> > > > @@ -4452,17 +4452,29 @@ static uint16_t
> > > > nvme_identify_ns_descr_list(NvmeCtrl *n, NvmeRequest *req)
> > > >     }
> > > > 
> > > >     /*
> > > > -     * Because the NGUID and EUI64 fields are 0 in the Identify
> > > > Namespace data
> > > > -     * structure, a Namespace UUID (nidt = 3h) must be reported in the
> > > > -     * Namespace Identification Descriptor. Add the namespace UUID here.
> > > > +     * If the EUI64 field is 0 and the NGUID field is 0, the
> > > > namespace must
> > > > +     * provide a valid Namespace UUID in the Namespace Identification
> > > > Descriptor
> > > > +     * data structure. QEMU does not yet support setting NGUID.
> > > >      */
> > > > -    ns_descrs->uuid.hdr.nidt = NVME_NIDT_UUID;
> > > > -    ns_descrs->uuid.hdr.nidl = NVME_NIDL_UUID;
> > > > -    memcpy(&ns_descrs->uuid.v, ns->params.uuid.data, NVME_NIDL_UUID);
> > > > -
> > > > -    ns_descrs->csi.hdr.nidt = NVME_NIDT_CSI;
> > > > -    ns_descrs->csi.hdr.nidl = NVME_NIDL_CSI;
> > > > -    ns_descrs->csi.v = ns->csi;
> > > > +    uuid.hdr.nidt = NVME_NIDT_UUID;
> > > > +    uuid.hdr.nidl = NVME_NIDL_UUID;
> > > > +    memcpy(uuid.v, ns->params.uuid.data, NVME_NIDL_UUID);
> > > > +    memcpy(pos, &uuid, sizeof(uuid));
> > > > +    pos += sizeof(uuid);
> > > > +
> > > > +    if (ns->params.eui64) {
> > > > +        eui64.hdr.nidt = NVME_NIDT_EUI64;
> > > > +        eui64.hdr.nidl = NVME_NIDL_EUI64;
> > > > +        eui64.v = cpu_to_be64(ns->params.eui64);
> > > > +        memcpy(pos, &eui64, sizeof(eui64));
> > > > +        pos += sizeof(eui64);
> > > > +    }
> > > > +
> > > > +    csi.hdr.nidt = NVME_NIDT_CSI;
> > > > +    csi.hdr.nidl = NVME_NIDL_CSI;
> > > > +    csi.v = ns->csi;
> > > > +    memcpy(pos, &csi, sizeof(csi));
> > > > +    pos += sizeof(csi);
> > > > 
> > > >     return nvme_c2h(n, list, sizeof(list), req);
> > > > }
> > > > diff --git a/hw/nvme/ns.c b/hw/nvme/ns.c
> > > > index 992e5a13f5..ddf395d60e 100644
> > > > --- a/hw/nvme/ns.c
> > > > +++ b/hw/nvme/ns.c
> > > > @@ -77,6 +77,7 @@ static int nvme_ns_init(NvmeNamespace *ns, Error
> > > > **errp)
> > > >     id_ns->mssrl = cpu_to_le16(ns->params.mssrl);
> > > >     id_ns->mcl = cpu_to_le32(ns->params.mcl);
> > > >     id_ns->msrc = ns->params.msrc;
> > > > +    id_ns->eui64 = cpu_to_be64(ns->params.eui64);
> > > > 
> > > >     ds = 31 - clz32(ns->blkconf.logical_block_size);
> > > >     ms = ns->params.ms;
> > > > @@ -518,6 +519,7 @@ static Property nvme_ns_props[] = {
> > > >     DEFINE_PROP_BOOL("shared", NvmeNamespace, params.shared, false),
> > > >     DEFINE_PROP_UINT32("nsid", NvmeNamespace, params.nsid, 0),
> > > >     DEFINE_PROP_UUID("uuid", NvmeNamespace, params.uuid),
> > > > +    DEFINE_PROP_UINT64("eui64", NvmeNamespace, params.eui64, 0),
> > > >     DEFINE_PROP_UINT16("ms", NvmeNamespace, params.ms, 0),
> > > >     DEFINE_PROP_UINT8("mset", NvmeNamespace, params.mset, 0),
> > > >     DEFINE_PROP_UINT8("pi", NvmeNamespace, params.pi, 0),
> > > > diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
> > > > index 81a35cda14..abe7fab21c 100644
> > > > --- a/hw/nvme/nvme.h
> > > > +++ b/hw/nvme/nvme.h
> > > > @@ -83,6 +83,7 @@ typedef struct NvmeNamespaceParams {
> > > >     bool     shared;
> > > >     uint32_t nsid;
> > > >     QemuUUID uuid;
> > > > +    uint64_t eui64;
> > > > 
> > > >     uint16_t ms;
> > > >     uint8_t  mset;
> > > > --
> > > > 2.30.2
> > > > 
> > > > 
> > > 
> > > Would it make sense to provide a sensible default for EUI64 such that it
> > > is always there? That is, using the same IEEE OUI as we already report
> > > in the IEEE field and add an extension identifier by grabbing 5 bytes
> > > from the UUID?
> > 
> > According to the NVMe 1.4 specification it is allowable to have a NVMe
> > device that does not support EUI64. As the EUI64 is used to define boot
> > options in UEFI using a non-zero default may break existing installations.
> > 
> 
> Right. We dont wanna do that.

Any change in defaults can (must) be tied to the machine type versions,
so that existing installs are unchanged, but new installs using latest
machine type get the new default.

IOW, it would be possible to set a non-zero EUI if it only gets set
for 6.1.0 machine types and later.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


