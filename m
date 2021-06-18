Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 109AF3ACB83
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 14:58:03 +0200 (CEST)
Received: from localhost ([::1]:54062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luE4Q-0008LN-4k
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 08:58:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1luE3d-0007Wb-1k; Fri, 18 Jun 2021 08:57:13 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:3978
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1luE3b-0006fL-Dw; Fri, 18 Jun 2021 08:57:12 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15ICX3XS075833; Fri, 18 Jun 2021 08:57:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=YDZ1O3dWENFIvT4Hxh3NiXGcFPsKvEvLU/zmkdYFuC8=;
 b=CwhsXJ01D2H3e6sT/2Vby47INLkmtLEmxK8tnwV7daK6EellQh75BFVGByHQeUCC+Zse
 p/z6rdnWLCkI3hEcFBA71HTexvWQwo93JqKmnfMLh3MBvjMdzBak+WRsOjCos/6ysSgv
 HA3HqssM7G3PkXevT9FOGdERbz0AN1VOhm1W8ggZvCLSCSuUmM230kvYIRvZ8kGz0HSm
 x14uTtKxlW1u3fqFd9Z6dIQpn6JXyWcQ0wiW7vZA18ZoZCvOGo7XD2vE7bzRkw5L9Syl
 JxAzXnZW9mJ9EBdLFUGsCz7na303+BhT5IytMZZCfx2zN7zXUNpiv5UdnQkSLZMTvcUF 0Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 398ph7swhp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Jun 2021 08:57:09 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15ICkfRx140347;
 Fri, 18 Jun 2021 08:57:08 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0b-001b2d01.pphosted.com with ESMTP id 398ph7swhf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Jun 2021 08:57:08 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15ICmAYp024815;
 Fri, 18 Jun 2021 12:57:08 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma03wdc.us.ibm.com with ESMTP id 394mja991y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Jun 2021 12:57:08 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15ICv6s529163812
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Jun 2021 12:57:07 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E1175BE04F;
 Fri, 18 Jun 2021 12:57:06 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E3403BE051;
 Fri, 18 Jun 2021 12:57:05 +0000 (GMT)
Received: from farman-thinkpad-t470p (unknown [9.163.1.119])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 18 Jun 2021 12:57:05 +0000 (GMT)
Message-ID: <2f4b46440d693a1e52d12ef7d95c30261c2dcdbc.camel@linux.ibm.com>
Subject: Re: [PATCH v4 1/4] s390x/css: Introduce an ESW struct
From: Eric Farman <farman@linux.ibm.com>
To: Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org
Date: Fri, 18 Jun 2021 08:57:04 -0400
In-Reply-To: <87czsjpl5i.fsf@redhat.com>
References: <20210617232537.1337506-1-farman@linux.ibm.com>
 <20210617232537.1337506-2-farman@linux.ibm.com> <87czsjpl5i.fsf@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-16.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: PLa3NPZ7b7wKnUGbmX3Q_bW3oF-_UsdR
X-Proofpoint-GUID: m0k0PQW8SNt37CAD_bhwSDAPx_Dd2kkW
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-18_07:2021-06-18,
 2021-06-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 impostorscore=0 mlxscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 phishscore=0 suspectscore=0 spamscore=0
 mlxlogscore=963 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104190000 definitions=main-2106180073
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

On Fri, 2021-06-18 at 11:38 +0200, Cornelia Huck wrote:
> On Fri, Jun 18 2021, Eric Farman <farman@linux.ibm.com> wrote:
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
> 
> (...)
> 
> > diff --git a/include/hw/s390x/ioinst.h b/include/hw/s390x/ioinst.h
> > index c6737a30d4..e7ab401781 100644
> > --- a/include/hw/s390x/ioinst.h
> > +++ b/include/hw/s390x/ioinst.h
> > @@ -123,10 +123,20 @@ typedef struct SCHIB {
> >      uint8_t mda[4];
> >  } QEMU_PACKED SCHIB;
> >  
> > +/* format-0 extended-status word */
> > +typedef struct ESW {
> > +   uint32_t word0;
> 
> Maybe append /* subchannel logout for format 0 */? Can do when
> applying.
> 

That's a good idea.

Eric

> > +   uint32_t erw;
> > +   uint64_t f_addr;     /* Zeros for other ESW formats */
> > +   uint32_t s_addr;     /* Zeros for other ESW formats */
> > +} QEMU_PACKED ESW;
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


