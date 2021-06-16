Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A2E3A9B58
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 14:59:56 +0200 (CEST)
Received: from localhost ([::1]:42336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltV9A-0001Sj-0D
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 08:59:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1ltV7U-0000kK-2H; Wed, 16 Jun 2021 08:58:12 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:3874
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1ltV7P-0006Ya-J2; Wed, 16 Jun 2021 08:58:11 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15GCYgDm039512; Wed, 16 Jun 2021 08:58:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=KdtzbXyZSTDKVkCV1OzSeJHJgCWM6anoWX8gRoJmcRM=;
 b=b4cPuLxZuy0hV07St3d4CxWtTAilvVA3/OhDsij8a3RvpSpAsKg1Zjhg1veOBWHzwjSW
 5a3GYmHEqwSI3IQoczc+/0ICoT4APbKrH+D5ZA2R94duckfP2CVEzpp/FdflvsgDQwRM
 Ak28LPgn/iZpahnpqzJ5Vyvk0EkXMdUa9GYo8Ahw32GLB9ydqG9PJS4KfvUXw5HT60jW
 pCwR4A1Rd3OLvTO2l42s6jfStyhq0O47taZj9wJQDhPPcEA7/fK7z7ksEzXyVReUXDN4
 qOZ2zgm0K6g3Hg3PwB9dsKWZbUbFIIGHH3BKtfaz7yPX8mdSgK+p5QPORU4JAmtm5yRv 5g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 397cv3hb7e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Jun 2021 08:58:03 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15GCZU5P043569;
 Wed, 16 Jun 2021 08:58:03 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0b-001b2d01.pphosted.com with ESMTP id 397cv3hb76-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Jun 2021 08:58:02 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15GCw17e009932;
 Wed, 16 Jun 2021 12:58:02 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma03wdc.us.ibm.com with ESMTP id 394mj9raj8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Jun 2021 12:58:02 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15GCw1m533292678
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Jun 2021 12:58:01 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0677BC6067;
 Wed, 16 Jun 2021 12:58:01 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E52A4C6063;
 Wed, 16 Jun 2021 12:57:59 +0000 (GMT)
Received: from farman-thinkpad-t470p (unknown [9.160.30.100])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 16 Jun 2021 12:57:59 +0000 (GMT)
Message-ID: <8ec2adadaf29777bfd6b703fe1943867709511b8.camel@linux.ibm.com>
Subject: Re: [PATCH v3 1/4] s390x/css: Introduce an ESW struct
From: Eric Farman <farman@linux.ibm.com>
To: Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org
Date: Wed, 16 Jun 2021 08:57:59 -0400
In-Reply-To: <87r1h2w39y.fsf@redhat.com>
References: <20210616014749.2460133-1-farman@linux.ibm.com>
 <20210616014749.2460133-2-farman@linux.ibm.com> <87r1h2w39y.fsf@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-16.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 3GAdJh25t9vSbU_jalptDg6-n-ktOuQy
X-Proofpoint-GUID: g306T_FuKribAqLhIa5hra66bfyeGnry
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-16_07:2021-06-15,
 2021-06-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 mlxlogscore=999 spamscore=0 phishscore=0 mlxscore=0 lowpriorityscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106160072
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

On Wed, 2021-06-16 at 11:46 +0200, Cornelia Huck wrote:
> On Wed, Jun 16 2021, Eric Farman <farman@linux.ibm.com> wrote:
> 
> > The Interrupt Response Block is comprised of several other
> > structures concatenated together, but only the 12-byte
> > Subchannel-Status Word (SCSW) is defined as a proper struct.
> > Everything else is a simple array of 32-bit words.
> > 
> > Let's define a proper struct for the 20-byte Extended-Status
> > Word (ESW) so that we can make good decisions about the sense
> > data that would go into the ECW area for virtual vs
> > passthrough devices.
> > 
> > Signed-off-by: Eric Farman <farman@linux.ibm.com>
> > ---
> >  hw/s390x/css.c            | 19 +++++++++++++------
> >  include/hw/s390x/ioinst.h | 12 +++++++++++-
> >  2 files changed, 24 insertions(+), 7 deletions(-)
> > 
> 
> (...)
> 
> > diff --git a/include/hw/s390x/ioinst.h b/include/hw/s390x/ioinst.h
> > index c6737a30d4..9613e0ccbb 100644
> > --- a/include/hw/s390x/ioinst.h
> > +++ b/include/hw/s390x/ioinst.h
> > @@ -123,10 +123,20 @@ typedef struct SCHIB {
> >      uint8_t mda[4];
> >  } QEMU_PACKED SCHIB;
> >  
> > +/* extended-status word */
> > +typedef struct ESW {
> > +   uint32_t sublog;
> > +   uint32_t erw;
> > +   uint64_t f_addr;
> > +   uint32_t s_addr;
> > +} QEMU_PACKED ESW;
> 
> Strictly speaking, that's a format 0 esw. 

True. I thought I put that in there, but I guess not. I can make a
clarification.

> Doesn't matter too much in the
> end, I think:
> - erw is always the same
> - f_addr and s_addr are always 0 for the other formats
> - 'sublog' is always a u32 with the lpum in the same place (which we
>   always set to 0x80 for virtual subchannels, as they have only one
> path)
> 

Yeah, I didn't want to get into the different formats' word 0. Since
the lpum is common to all, what if I just rename 'sublog' to 'word0'
and add some comments for f_addr and s_addr as only being applicable to
Format 0?

> > +
> > +#define ESW_ERW_SENSE 0x01000000
> > +
> >  /* interruption response block */
> >  typedef struct IRB {
> >      SCSW scsw;
> > -    uint32_t esw[5];
> > +    ESW esw;
> >      uint32_t ecw[8];
> >      uint32_t emw[8];
> >  } IRB;


