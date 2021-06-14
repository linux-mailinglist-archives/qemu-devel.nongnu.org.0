Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 479E63A6767
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 15:05:54 +0200 (CEST)
Received: from localhost ([::1]:40724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsmHo-0003w1-PW
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 09:05:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1lsmFk-0002uE-DT; Mon, 14 Jun 2021 09:03:44 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:58338)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1lsmFf-0003Qs-JO; Mon, 14 Jun 2021 09:03:44 -0400
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15ED3RYH137072; Mon, 14 Jun 2021 09:03:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=YfByQ5+zn6swYjXScNYtVu+rGZOZTT1MaCSvWtCNoFs=;
 b=W5h18Lyu5ZIHFhHy54LkxRiHeTGDvcyCta+kDt1gBKXag67WNYpnTX8toKow7BL1bGEO
 R7cIREnNATeqYOyCOBkmadRtdWBaJEE9U1nBkwdDUrNbTF2yQjApfSfboQVR+qzQ7T+I
 +ktLuxJQUckSgvAynPqLuGmfeulAg2SSra+MJC4VrENYFeGdG9Sad36etqApkuaoD9uf
 0NO6ZQHTCCqfJ6FmQZuIYg88YQZv2Tt7JIy4xyx4XNkdeJOZCka8y8jyXezkMN1g1WUT
 weStBKBk9SBgQE7JAO7Gi9qP+AURX+5hdMr7iRK6SOmRoAFAGXt7t89BiRT1GUqE+C0F VA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3967f68cjg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Jun 2021 09:03:35 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15ED3YsI137607;
 Mon, 14 Jun 2021 09:03:34 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3967f68c7s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Jun 2021 09:03:33 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15ED25ag025072;
 Mon, 14 Jun 2021 13:03:06 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma04dal.us.ibm.com with ESMTP id 3965yt8u2s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Jun 2021 13:03:06 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15ED35F319530150
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Jun 2021 13:03:05 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E746778063;
 Mon, 14 Jun 2021 13:03:04 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1ECBA78066;
 Mon, 14 Jun 2021 13:03:03 +0000 (GMT)
Received: from farman-thinkpad-t470p (unknown [9.160.30.100])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 14 Jun 2021 13:03:02 +0000 (GMT)
Message-ID: <393c292444af5a43f8e020de411dd09842c7a9ca.camel@linux.ibm.com>
Subject: Re: [PATCH v2] s390x/css: Selectively copy sense data to IRB
From: Eric Farman <farman@linux.ibm.com>
To: Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org
Date: Mon, 14 Jun 2021 09:03:02 -0400
In-Reply-To: <87sg1ky9x8.fsf@redhat.com>
References: <20210611202151.615410-1-farman@linux.ibm.com>
 <87sg1ky9x8.fsf@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-16.el8) 
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: AWemPfzLw_uETZIp4CZluD6KsPCYSTp7
X-Proofpoint-ORIG-GUID: 3DKl59tXKRT1PQ9fVdYFkJVWPI4SPSBM
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-14_07:2021-06-14,
 2021-06-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 adultscore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 impostorscore=0 phishscore=0 malwarescore=0 mlxscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106140089
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farman@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 2021-06-14 at 13:15 +0200, Cornelia Huck wrote:
> On Fri, Jun 11 2021, Eric Farman <farman@linux.ibm.com> wrote:
> 
> > The SCHIB.PMCW.CSENSE bit is used to determine whether the
> > IRB should be set up with sense data, but that bit only
> > indicates whether sense data is requested, not if it was
> > provided by the device. For virtual devices, this is fine.
> > 
> > For passthrough devices, hardware would present sense data
> > in IRB.ECW, but that field is only valid if IRB.SCSW.E and
> > IRB.ERW.S were also set.
> 
> An important point is that IRB.ERW.S implies IRB.SCSW.E, I guess?

Correct. I can make this point more explicit so we don't have to
reference the POPS to remind ourselves.

> 
> If I parse the table regarding the ecw in the POP correctly, we might
> also have model-dependent information stored, in which case we would
> need to indicate zero sense data in the erw that we build.

I wrestled with this. The best answer would be to pass the ERW from
hardware via vfio-ccw back to QEMU, since that contains the "is this
sense data or is this model-dependent info" bit (whatever that latter
might be). ...

> 
> > Let's only build the sense data in the IRB if the first byte
> > of sense is nonzero (indicating it may have come from a virtual
> > device), or the IRB.SCSW.E bit is already set (indicating it
> > came from the hardware). That way, the guest driver can read
> > the sense data if valid, or respond with a Sense CCW to get
> > the sense data if it wants/needs.
> 
> Hm, would it be possible that we get junk instead of proper sense
> data
> from the hardware, if IRB.ERW.S is not set? E.g. some residual
> data. That would potentially trigger the first condition.
> 
> Maybe we really need to special case virtual vs. passthrough devices
> here. We can assume that a virtual device with a unit check always
> has
> proper sense data available. For passthrough devices, maybe we need
> to
> copy esw etc. from the irb we got hardware, and not try to construct
> it
> ourselves?

... Ah, I should read ahead. :)

Yeah, that was where I was going to go above. I was considering that
this would be a simpler solution near term, to get "normal" behavior
behaving properly, but fixing it all in one go is probably better. Will
see how bad a v3 cook starts looking.

> 
> > Fixes: df1fe5bb4924 ("s390: Virtual channel subsystem support.")
> > Fixes: 334e76850bbb ("vfio/ccw: update sense data if a unit check
> > is pending")
> > Signed-off-by: Eric Farman <farman@linux.ibm.com>
> > ---
> > 
> > Notes:
> >     v1->v2:
> >      - [MR] Add Fixes: tags
> >      - [CH] Reinstate the memcpy(sch->sense_data, irb.ecw) in
> > vfio_ccw
> >      - [CH] Look at IRB.SCSW.E before copying sense into guest IRB
> >     
> >     v1: 
> > https://lore.kernel.org/qemu-devel/20210610202011.391029-1-farman@linux.ibm.com/
> > 
> >  hw/s390x/css.c | 10 ++++++++--
> >  1 file changed, 8 insertions(+), 2 deletions(-)
> > 
> > diff --git a/hw/s390x/css.c b/hw/s390x/css.c
> > index bed46f5ec3..8935f948d5 100644
> > --- a/hw/s390x/css.c
> > +++ b/hw/s390x/css.c
> > @@ -1659,9 +1659,15 @@ int css_do_tsch_get_irb(SubchDev *sch, IRB
> > *target_irb, int *irb_len)
> >          } else {
> >              irb.esw[0] = 0x00800000;
> >          }
> > -        /* If a unit check is pending, copy sense data. */
> > +        /*
> > +         * If a unit check is pending and concurrent sense
> > +         * is requested, copy the sense data if the sense
> > +         * data is plausibly valid.
> > +         */
> >          if ((schib->scsw.dstat & SCSW_DSTAT_UNIT_CHECK) &&
> > -            (schib->pmcw.chars & PMCW_CHARS_MASK_CSENSE)) {
> > +            (schib->pmcw.chars & PMCW_CHARS_MASK_CSENSE) &&
> > +            ((schib->scsw.flags & SCSW_FLAGS_MASK_ECTL) ||
> > +             (sch->sense_data[0] != 0))) {
> >              int i;
> >  
> >              irb.scsw.flags |= SCSW_FLAGS_MASK_ESWF |
> > SCSW_FLAGS_MASK_ECTL;
> > -- 
> > 2.25.1


