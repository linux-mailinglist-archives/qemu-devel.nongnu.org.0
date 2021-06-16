Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 263983A9B7F
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 15:06:46 +0200 (CEST)
Received: from localhost ([::1]:51926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltVFl-0008UC-5H
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 09:06:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1ltVD7-0005pG-FX; Wed, 16 Jun 2021 09:04:01 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:56804)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1ltVD1-0000iy-M0; Wed, 16 Jun 2021 09:04:01 -0400
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15GD3ETv002707; Wed, 16 Jun 2021 09:03:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=264909Vq3yckYuBP8jYyUV4cpCJJ3MW+7zacam8XwOE=;
 b=pqD/ycWIu7BdX43Khs2r2JiSn8jngBQkF2zmUC4NTJgNpnc/lzRfWJVKZfpgGAXsDE79
 87wGGWp2JZfxVYCjzUbxmZl52I+rxliSaqF8umJaI6GxKUw0xvPidBbBniIOESf7NQR3
 hEoHz/a4zpwBQfrML4Rq6mfa7OMpaH3chBNCCRvsNjHC/GzLt5LAMcri2r+Wu35trAww
 KOFq3+LLdSz0KxB+cCzykN1LnVKYZrRr0cozDAhfhCOJG/0HySbNlGB5+AjFTNOukf5F
 U6ILKNpkH6Fbg1kmu5x+bLbadq0O50TvS5tK9yJfvRjNQRVuqLpANS0xzeDFssoAeatH /g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 397g87karu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Jun 2021 09:03:52 -0400
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15GD3MiO006396;
 Wed, 16 Jun 2021 09:03:52 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 397g87kaqw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Jun 2021 09:03:52 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15GD25Ip017198;
 Wed, 16 Jun 2021 13:03:51 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma03wdc.us.ibm.com with ESMTP id 394mj9rcdh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Jun 2021 13:03:50 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15GD3nZx17891610
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Jun 2021 13:03:49 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 926AF6E056;
 Wed, 16 Jun 2021 13:03:49 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5EFE86E04C;
 Wed, 16 Jun 2021 13:03:48 +0000 (GMT)
Received: from farman-thinkpad-t470p (unknown [9.160.30.100])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 16 Jun 2021 13:03:48 +0000 (GMT)
Message-ID: <c9fac1cb32c16ea583367ea2320845eb78074f9c.camel@linux.ibm.com>
Subject: Re: [PATCH v3 4/4] s390x/css: Add passthrough IRB
From: Eric Farman <farman@linux.ibm.com>
To: Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org
Date: Wed, 16 Jun 2021 09:03:47 -0400
In-Reply-To: <87o8c6w2n4.fsf@redhat.com>
References: <20210616014749.2460133-1-farman@linux.ibm.com>
 <20210616014749.2460133-5-farman@linux.ibm.com> <87o8c6w2n4.fsf@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-16.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: xkJtmwCJo2WwTEQbksYnlrgwf8btX9kH
X-Proofpoint-GUID: EzTiEDjUoLK6gHI91XT7b2k-2LUfEIVP
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-16_07:2021-06-15,
 2021-06-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 phishscore=0 bulkscore=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106160076
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
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 2021-06-16 at 11:59 +0200, Cornelia Huck wrote:
> On Wed, Jun 16 2021, Eric Farman <farman@linux.ibm.com> wrote:
> 
> > Wire in the subchannel callback for building the IRB
> > ESW and ECW space for passthrough devices, and copy
> > the hardware's ESW into the IRB we are building.
> > 
> > If the hardware presented concurrent sense, then copy
> > that sense data into the IRB's ECW space.
> > 
> > Signed-off-by: Eric Farman <farman@linux.ibm.com>
> > ---
> >  hw/s390x/css.c         | 13 ++++++++++++-
> >  hw/s390x/s390-ccw.c    |  1 +
> >  hw/vfio/ccw.c          |  4 ++++
> >  include/hw/s390x/css.h |  3 +++
> >  4 files changed, 20 insertions(+), 1 deletion(-)
> > 
> 
> (...)
> 
> > +void build_irb_passthrough(SubchDev *sch, IRB *irb)
> > +{
> > +    /* Copy ESW from hardware */
> > +    irb->esw = sch->esw;
> > +
> > +    if (irb->esw.erw & ESW_ERW_SENSE) {
> > +        /* Copy ECW from hardware */
> > +        build_irb_sense_data(sch, irb);
> > +    }
> 
> I'm wondering whether we should also copy "Model-dependent
> information"
> (scsw 5 + 14 set, erw 7 unset). Seems more correct, and IIUC the
> guest
> was tripped by the presence of erw 7 without valid sense data.
> 

This is true, but that's because the existing code in
css_do_tsch_get_irb() set ERW 7 to go with the zeros it copied into the
ECW. Since we're now copying the ESW.ERW from the passthrough device,
that bit wouldn't be set in the first place.

But, to be more correct with the possibility of model-dependent
information, I can unconditionally copy this data over too.

> > +}
> > +


