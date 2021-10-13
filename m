Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA05742C204
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 16:01:33 +0200 (CEST)
Received: from localhost ([::1]:51518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maep2-000452-Vi
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 10:01:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1maee4-0000It-DF; Wed, 13 Oct 2021 09:50:12 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:63438)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1maee1-0002O2-Vv; Wed, 13 Oct 2021 09:50:12 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19DD6IFa015449; 
 Wed, 13 Oct 2021 09:50:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=IOso6bVYhXb/vUeUNi4fR+NBGynkscKXKuK56m+t4sQ=;
 b=onaBwe4FqcCeiqKvmChKu8zht4TsS2QsJDMIgdkdCjlhft21R/X8cjCyFC3YVjEJvT7c
 Zc3HXREr7neEYMXHgDcxNTnmL7Dl+0hNkgGf73kMBmsnHw6asLyCNJNELaIDdG99nglB
 NXfgIRfUv3wd3omLoJzBWPrpCgjfr82JGHhKhI/cVT7gSp8/Na5FU/IYnElElAABDIwQ
 X0bLvFHpluqGr26HhXSUR7LZRFWFh4vrFhSZFB3IsN53qI9ctL95P848Bxom54d1Nl0h
 YSbVNLfsvDabol71VU82CELydnjD53ulRYZMu7IW+rJV5uYSyEBYbJtle9ps29t8sU4z dw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bnwb5cs9c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Oct 2021 09:50:05 -0400
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 19DCrKNB025732;
 Wed, 13 Oct 2021 09:50:05 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bnwb5cs8u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Oct 2021 09:50:04 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 19DDlSYS007780;
 Wed, 13 Oct 2021 13:50:04 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma04dal.us.ibm.com with ESMTP id 3bkeq7kvfy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Oct 2021 13:50:03 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 19DDo2sd50987476
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 13 Oct 2021 13:50:02 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 366546E04E;
 Wed, 13 Oct 2021 13:50:02 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3B0226E052;
 Wed, 13 Oct 2021 13:50:01 +0000 (GMT)
Received: from farman-thinkpad-t470p (unknown [9.211.134.52])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 13 Oct 2021 13:50:01 +0000 (GMT)
Message-ID: <f115d52875068f7dd064a3406391050c8338dc08.camel@linux.ibm.com>
Subject: Re: [PATCH 1/3] vfio-ccw: step down as maintainer
From: Eric Farman <farman@linux.ibm.com>
To: Matthew Rosato <mjrosato@linux.ibm.com>, Cornelia Huck
 <cohuck@redhat.com>, qemu-devel@nongnu.org, qemu-s390x@nongnu.org, Thomas
 Huth <thuth@redhat.com>
Date: Wed, 13 Oct 2021 09:50:00 -0400
In-Reply-To: <c0100043-8e95-c2b8-5791-6a56e6500c10@linux.ibm.com>
References: <20211012144040.360887-1-cohuck@redhat.com>
 <20211012144040.360887-2-cohuck@redhat.com>
 <c0100043-8e95-c2b8-5791-6a56e6500c10@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-16.el8) 
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: xdvyz53lHXJdb2H7HNy_9AhhJp6l0Jpq
X-Proofpoint-ORIG-GUID: -XZhmzI4DnYgGMv4VLC9huMh4JcDA1i0
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-13_05,2021-10-13_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 impostorscore=0 spamscore=0 suspectscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015
 adultscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110130092
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farman@linux.ibm.com;
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
Cc: Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 2021-10-12 at 19:38 -0400, Matthew Rosato wrote:
> On 10/12/21 10:40 AM, Cornelia Huck wrote:
> > I currently don't have time to act as vfio-ccw maintainer anymore,
> > so remove myself there.
> > 
> > Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> 
> Once again, thanks for all of your work on vfio-ccw.
> 
> Acked-by: Matthew Rosato <mjrosato@linux.ibm.com>

Likewise, thank you for everything!

Acked-by: Eric Farman <farman@linux.ibm.com>

> 
> > ---
> >   MAINTAINERS | 2 --
> >   1 file changed, 2 deletions(-)
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 50435b8d2f50..14d131294156 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -1862,7 +1862,6 @@ F: docs/igd-assign.txt
> >   F: docs/devel/vfio-migration.rst
> >   
> >   vfio-ccw
> > -M: Cornelia Huck <cohuck@redhat.com>
> >   M: Eric Farman <farman@linux.ibm.com>
> >   M: Matthew Rosato <mjrosato@linux.ibm.com>
> >   S: Supported
> > @@ -1870,7 +1869,6 @@ F: hw/vfio/ccw.c
> >   F: hw/s390x/s390-ccw.c
> >   F: include/hw/s390x/s390-ccw.h
> >   F: include/hw/s390x/vfio-ccw.h
> > -T: git https://gitlab.com/cohuck/qemu.git s390-next

--makes note to look into this later--

> >   L: qemu-s390x@nongnu.org
> >   
> >   vfio-ap
> > 


