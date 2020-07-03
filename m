Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA71B213853
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jul 2020 12:01:28 +0200 (CEST)
Received: from localhost ([::1]:55688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jrIVb-0007Ls-Fy
	for lists+qemu-devel@lfdr.de; Fri, 03 Jul 2020 06:01:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1jrIUM-0005tP-L0; Fri, 03 Jul 2020 06:00:10 -0400
Received: from charlie.dont.surf ([128.199.63.193]:53506)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1jrIUK-00033x-C0; Fri, 03 Jul 2020 06:00:10 -0400
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by charlie.dont.surf (Postfix) with ESMTPSA id 6088CBF465;
 Fri,  3 Jul 2020 10:00:05 +0000 (UTC)
Date: Fri, 3 Jul 2020 12:00:02 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v2 14/18] hw/block/nvme: support identify namespace
 descriptor list
Message-ID: <20200703100002.aufq55fja2gktfl6@apples.localdomain>
References: <20200703063420.2241014-1-its@irrelevant.dk>
 <20200703063420.2241014-15-its@irrelevant.dk>
 <1a1e7fdf-6e87-aa6b-f687-cc6d98297efe@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1a1e7fdf-6e87-aa6b-f687-cc6d98297efe@redhat.com>
Received-SPF: pass client-ip=128.199.63.193; envelope-from=its@irrelevant.dk;
 helo=charlie.dont.surf
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/03 01:42:13
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Dmitry Fomichev <Dmitry.Fomichev@wdc.com>, Klaus Jensen <k.jensen@samsung.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Javier Gonzalez <javier.gonz@samsung.com>,
 Maxim Levitsky <mlevitsk@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Jul  3 10:27, Philippe Mathieu-Daudé wrote:
> On 7/3/20 8:34 AM, Klaus Jensen wrote:
> > From: Klaus Jensen <k.jensen@samsung.com>
> > 
> > Since we are not providing the NGUID or EUI64 fields, we must support
> > the Namespace UUID. We do not have any way of storing a persistent
> > unique identifier, so conjure up a UUID that is just the namespace id.
> > 
> > Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> > Reviewed-by: Dmitry Fomichev <dmitry.fomichev@wdc.com>
> > ---
> >  hw/block/nvme.c       | 41 +++++++++++++++++++++++++++++++++++++++++
> >  hw/block/trace-events |  1 +
> >  2 files changed, 42 insertions(+)
> > 
> > diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> > index 8230e0e3826b..65c2fa3ac1f4 100644
> > --- a/hw/block/nvme.c
> > +++ b/hw/block/nvme.c
> > @@ -971,6 +971,45 @@ static uint16_t nvme_identify_nslist(NvmeCtrl *n, NvmeIdentify *c)
> >      return ret;
> >  }
> >  
> > +static uint16_t nvme_identify_ns_descr_list(NvmeCtrl *n, NvmeIdentify *c)
> > +{
> > +    uint32_t nsid = le32_to_cpu(c->nsid);
> > +    uint64_t prp1 = le64_to_cpu(c->prp1);
> > +    uint64_t prp2 = le64_to_cpu(c->prp2);
> > +
> > +    uint8_t list[NVME_IDENTIFY_DATA_SIZE];
> > +
> > +    struct data {
> > +        struct {
> > +            NvmeIdNsDescr hdr;
> > +            uint8_t v[16];
> 
> You might consider to use QemuUUID from "qemu/uuid.h". The benefits
> are you can use qemu_uuid_parse() qemu_uuid_unparse*() for tracing,
> and DEFINE_PROP_UUID() in case you want to set a particular UUID
> from command line, it case it is important to the guest.
> 

Yes, definitely. Niklas also does this in his patch for namespace types
support. And I think that it's very important that it can be made
persistent, which would require a device property.

Thus, if it is OK with the rest of you, I would like to defer this to
when we merge the multiple namespaces patch and add "uuid" as a nvme-ns
device property there. Then, we do not have to add the uuid property on
the nvme device now and then have to keep it around when the namespace
related properties moves to the nvme-ns device.

