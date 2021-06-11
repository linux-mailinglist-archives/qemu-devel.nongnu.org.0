Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48BCE3A426A
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Jun 2021 14:52:17 +0200 (CEST)
Received: from localhost ([::1]:52084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrgdz-0006zf-Sp
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 08:52:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1lrgdC-0006JX-WA; Fri, 11 Jun 2021 08:51:27 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:55486
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1lrgdA-0003u8-Jo; Fri, 11 Jun 2021 08:51:26 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15BCYOtW055918; Fri, 11 Jun 2021 08:51:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=MZyfn6ttkj62lC99fveaOSjkuetSiyxrH1qtobbCZuA=;
 b=Mgol3M5cMXUj4qGheEXKDk5TRYjP7TJGXN+Ej7VL55Suq4XP/yAu2cFofCJcJ8kuucRH
 nwH4bot6knjnIVH+F+KPXBsyi/xHoQ6bOw/I7kR1YMMNBgps38PVjt1H+klMLz92B8wV
 phIVkQnU9Glwsq1fpKAYsc8RSWuTkp4erznskJMhrEws66iwO1qymvEn+W3fMtE9UJMd
 gIZrvCSHgMh76F5pQxr7/nfdTIVvWwTQJGN5HuGDpj5XhOl3hHH0TRPG5S9DXc6j8edw
 I7pH7HrNhfcT1TV3KqweqNm+oy0bS569y4+xWoFbhHcrslcGx2pKaLeQZ6khJ0mwaEX7 WQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3947h41at8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Jun 2021 08:51:22 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15BCYPVH055945;
 Fri, 11 Jun 2021 08:51:21 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3947h41asu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Jun 2021 08:51:21 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15BClM1j018409;
 Fri, 11 Jun 2021 12:51:21 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma03dal.us.ibm.com with ESMTP id 3900wam6f4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Jun 2021 12:51:21 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15BCpKrZ22675966
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 11 Jun 2021 12:51:20 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5555B112063;
 Fri, 11 Jun 2021 12:51:20 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 912E9112066;
 Fri, 11 Jun 2021 12:51:19 +0000 (GMT)
Received: from farman-thinkpad-t470p (unknown [9.160.30.100])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 11 Jun 2021 12:51:19 +0000 (GMT)
Message-ID: <aba83201997c64ee11af5f1a5ca2ac2c76731a17.camel@linux.ibm.com>
Subject: Re: [PATCH 1/1] vfio-ccw: Keep passthrough sense data intact
From: Eric Farman <farman@linux.ibm.com>
To: Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org
Date: Fri, 11 Jun 2021 08:51:19 -0400
In-Reply-To: <87fsxozoq4.fsf@redhat.com>
References: <20210610202011.391029-1-farman@linux.ibm.com>
 <20210610202011.391029-2-farman@linux.ibm.com> <87lf7gzxbh.fsf@redhat.com>
 <87fsxozoq4.fsf@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-16.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 5PbfaP8hVqVs-NNVC8dBu143UNBkNqbC
X-Proofpoint-ORIG-GUID: yXvqYGxz7GuzIOEBAU5zn-JZ0IadGQ70
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-11_05:2021-06-11,
 2021-06-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 mlxscore=0 phishscore=0 mlxlogscore=999 priorityscore=1501 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106110080
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farman@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 2021-06-11 at 12:21 +0200, Cornelia Huck wrote:
> On Fri, Jun 11 2021, Cornelia Huck <cohuck@redhat.com> wrote:
> 
> > On Thu, Jun 10 2021, Eric Farman <farman@linux.ibm.com> wrote:
> > > diff --git a/hw/s390x/css.c b/hw/s390x/css.c
> > > index bed46f5ec3..29234daa27 100644
> > > --- a/hw/s390x/css.c
> > > +++ b/hw/s390x/css.c
> > > @@ -1661,7 +1661,8 @@ int css_do_tsch_get_irb(SubchDev *sch, IRB
> > > *target_irb, int *irb_len)
> > >          }
> > >          /* If a unit check is pending, copy sense data. */
> > >          if ((schib->scsw.dstat & SCSW_DSTAT_UNIT_CHECK) &&
> > > -            (schib->pmcw.chars & PMCW_CHARS_MASK_CSENSE)) {
> > > +            (schib->pmcw.chars & PMCW_CHARS_MASK_CSENSE) &&
> > > +            (sch->sense_data[0] != 0)) {
> > >              int i;
> > >  
> > >              irb.scsw.flags |= SCSW_FLAGS_MASK_ESWF |
> > >              SCSW_FLAGS_MASK_ECTL;
> 
> This function is where we build the esw/ecw...
> 
> > > diff --git a/hw/vfio/ccw.c b/hw/vfio/ccw.c
> > > index 139a3d9d1b..a4dc4acb34 100644
> > > --- a/hw/vfio/ccw.c
> > > +++ b/hw/vfio/ccw.c
> > > @@ -371,12 +371,6 @@ static void
> > > vfio_ccw_io_notifier_handler(void *opaque)
> > >      copy_scsw_to_guest(&s, &irb.scsw);
> > >      schib->scsw = s;
> > >  
> > > -    /* If a uint check is pending, copy sense data. */
> > > -    if ((schib->scsw.dstat & SCSW_DSTAT_UNIT_CHECK) &&
> > > -        (schib->pmcw.chars & PMCW_CHARS_MASK_CSENSE)) {
> 
> ...and here we actually do have the esw/ecw provided by the hardware.
> 
> > If I'm reading the PoP correctly, turning on concurrent sense only
> > means
> > that we may have sense data already available, but not that it's
> > guaranteed.

Agreed.

> >  Would it be enough to look at the relevant bit in the erw
> > and only copy sense data if it is actually set (here and/or above)?

Do we have the hardware ERW in the css_do_tsch routine?

Oh, but we have SCSW, and POPS says if ERW.S is set, SCSW.E is set. So
that would make this a pretty simple change then.

> 
> Maybe the root of the problem is that we actually try to build the
> esw
> ourselves? If we copy it from the irb received by the hardware, we
> should already have the correct data, I think.

Yeah, that's part of the problem. As you note above, the PMCW.CSENSE
bit only says if concurrent sense is possible, not that it was actually
stored in the IRB.

I (mistakenly) thought that removing this hunk would get the whole IRB
copied over, but I see now that css_do_tsch_get_irb() only copies the
SCSW, and builds the ESW/ECW based off sch->sense_data.

> 
> > > -        memcpy(sch->sense_data, irb.ecw, sizeof(irb.ecw));
> > > -    }
> > > -
> > >  read_err:
> > >      css_inject_io_interrupt(sch);
> > >  }


