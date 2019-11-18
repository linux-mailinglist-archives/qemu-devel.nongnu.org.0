Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 848441001B9
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Nov 2019 10:51:16 +0100 (CET)
Received: from localhost ([::1]:59996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iWdgh-0000t2-KK
	for lists+qemu-devel@lfdr.de; Mon, 18 Nov 2019 04:51:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32792)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <its@irrelevant.dk>) id 1iWdeb-0008MU-Fk
 for qemu-devel@nongnu.org; Mon, 18 Nov 2019 04:49:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <its@irrelevant.dk>) id 1iWdea-0008KO-8f
 for qemu-devel@nongnu.org; Mon, 18 Nov 2019 04:49:05 -0500
Received: from charlie.dont.surf ([128.199.63.193]:35564)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <its@irrelevant.dk>)
 id 1iWdeW-0008Hu-9n; Mon, 18 Nov 2019 04:49:00 -0500
Received: from apples.localdomain (unknown [194.62.217.57])
 by charlie.dont.surf (Postfix) with ESMTPSA id B612DBF4E8;
 Mon, 18 Nov 2019 09:48:57 +0000 (UTC)
Date: Mon, 18 Nov 2019 10:48:56 +0100
From: Klaus Birkelund <its@irrelevant.dk>
To: Beata Michalska <beata.michalska@linaro.org>
Subject: Re: [PATCH v2 12/20] nvme: bump supported specification version to 1.3
Message-ID: <20191118094856.GB812803@apples.localdomain>
References: <20191015103900.313928-1-its@irrelevant.dk>
 <20191015103900.313928-13-its@irrelevant.dk>
 <CADSWDzt-YfwuxmxL=c7qQzac-Xby1azxAsGhAfviSRXz2FkNhg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADSWDzt-YfwuxmxL=c7qQzac-Xby1azxAsGhAfviSRXz2FkNhg@mail.gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 128.199.63.193
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Paul Durrant <Paul.Durrant@citrix.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 12, 2019 at 03:05:06PM +0000, Beata Michalska wrote:
> Hi Klaus,
> 
> On Tue, 15 Oct 2019 at 11:52, Klaus Jensen <its@irrelevant.dk> wrote:
> >
> > +static uint16_t nvme_identify_ns_descr_list(NvmeCtrl *n, NvmeCmd *c)
> > +{
> > +    static const int len = 4096;
> > +
> > +    struct ns_descr {
> > +        uint8_t nidt;
> > +        uint8_t nidl;
> > +        uint8_t rsvd2[2];
> > +        uint8_t nid[16];
> > +    };
> > +
> > +    uint32_t nsid = le32_to_cpu(c->nsid);
> > +    uint64_t prp1 = le64_to_cpu(c->prp1);
> > +    uint64_t prp2 = le64_to_cpu(c->prp2);
> > +
> > +    struct ns_descr *list;
> > +    uint16_t ret;
> > +
> > +    trace_nvme_identify_ns_descr_list(nsid);
> > +
> > +    if (unlikely(nsid == 0 || nsid > n->num_namespaces)) {
> > +        trace_nvme_err_invalid_ns(nsid, n->num_namespaces);
> > +        return NVME_INVALID_NSID | NVME_DNR;
> > +    }
> > +
> In theory this should abort the command for inactive NSIDs as well.
> But I guess this will come later on.
> 

At this point in the series, the device does not support multiple
namespaces anyway and num_namespaces is always 1. But this has also been
reported seperately in relation the patch adding multiple namespaces and
is fixed in v3.

> > +    list = g_malloc0(len);
> > +    list->nidt = 0x3;
> > +    list->nidl = 0x10;
> > +    *(uint32_t *) &list->nid[12] = cpu_to_be32(nsid);
> > +
> Might be worth to add some comment here -> as per the NGUID/EUI64 format.
> Also those are not specified currently in the namespace identity data structure.
> 

I'll add a comment for why the Namespace UUID is set to this value here.
The NGUID/EUI64 fields are not set in the namespace identity data
structure as they are not required. See the descriptions of NGUID and
EUI64. Here for NGUID:

    "The controller shall specify a globally unique namespace identifier
    in this field, the EUI64 field, or a Namespace UUID in the Namespace
    Identification Descriptor..."

Here, I chose to provide it in the Namespace Identification Descriptor
(by setting `list->nidt = 0x3`).

> > +    ret = nvme_dma_read_prp(n, (uint8_t *) list, len, prp1, prp2);
> > +    g_free(list);
> > +    return ret;
> > +}
> > +
> >  static uint16_t nvme_identify(NvmeCtrl *n, NvmeCmd *cmd)
> >  {
> >      NvmeIdentify *c = (NvmeIdentify *)cmd;
> > @@ -934,7 +978,9 @@ static uint16_t nvme_identify(NvmeCtrl *n, NvmeCmd *cmd)
> >      case 0x01:
> >          return nvme_identify_ctrl(n, c);
> >      case 0x02:
> > -        return nvme_identify_nslist(n, c);
> > +        return nvme_identify_ns_list(n, c);
> > +    case 0x03:
> > +        return nvme_identify_ns_descr_list(n, cmd);
> >      default:
> >          trace_nvme_err_invalid_identify_cns(le32_to_cpu(c->cns));
> >          return NVME_INVALID_FIELD | NVME_DNR;
> > @@ -1101,6 +1147,14 @@ static uint16_t nvme_set_feature(NvmeCtrl *n, NvmeCmd *cmd, NvmeRequest *req)
> >          blk_set_enable_write_cache(n->conf.blk, dw11 & 1);
> >          break;
> >      case NVME_NUMBER_OF_QUEUES:
> > +        if (n->qs_created > 2) {
> > +            return NVME_CMD_SEQ_ERROR | NVME_DNR;
> > +        }
> > +
> I am not sure this is entirely correct as the spec says:
> "if any I/O Submission and/or Completion Queues (...)"
> so it might be enough to have a single queue created
> for this command to be valid.
> Also I think that the condition here is to make sure that the number
> of queues requested is being set once at init phase. Currently this will
> allow the setting to happen if there is no active queue -> so at any
> point of time (provided the condition mentioned). I might be wrong here
> but it seems that what we need is a single status saying any queue
> has been created prior to the Set Feature command at all
> 

Internally, the admin queue pair is counted in qs_created, which is the
reason for checking if is above 2. The admin queues are created when the
controller is enabled (mmio write to the EN register in CC).

I'll add a comment about that - I see why it is unclear.

> 
> Small note: this patch seems to be introducing more changes
> than specified in the commit message and especially the subject. Might
> be worth to extend it a bit.
> 

You are right. I'll split it up.

