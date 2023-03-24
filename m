Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ABC66C80B1
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Mar 2023 16:06:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfg9z-0001K4-W1; Fri, 24 Mar 2023 08:04:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1pfg9u-0001JN-RR; Fri, 24 Mar 2023 08:04:38 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1pfg9J-00005C-C7; Fri, 24 Mar 2023 08:04:36 -0400
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32OB2Dwc026301; Fri, 24 Mar 2023 12:01:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=7tkPHn+JAvToCNQzpvlWBOUIFf1KdkntHmbFQ1lMXWk=;
 b=koQldjUmK3vQ890z14XDxXSSrHJ1wfghbKJ63Yw8vdZYY7mIfZ3ssLSL4HUr1tweVlWv
 xvKOhtt///Kf3WJwxCOBZnxL/LWd7/1oGLqfr5gG3Gg71p4TAN7KRIHaCkNH32YpORRu
 FQqX0weSxllygM+LuS/zU5h715zmoQ0JxP0wlwiizovDkg16DsiOqCkV35qomYcASwo4
 uM4Gc4eayBp1z3p9XIuxDK6pEam2RQKMJaLgL7izOYqnEC+yZ1Jzg1jb/oGrPG6LdbSy
 cPFmM9VkZ/65l2jJd6Zo7lgSj7nxGxKSDfoLylbzFHjdFtXZ5hrl5ZCjJHQ5Mu6322or FA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ph84ud6yh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Mar 2023 12:01:33 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32OBjk20014396;
 Fri, 24 Mar 2023 12:01:32 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ph84ud6x6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Mar 2023 12:01:32 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32NLulif013860;
 Fri, 24 Mar 2023 12:01:30 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
 by ppma04ams.nl.ibm.com (PPS) with ESMTPS id 3pgy3s0sj5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Mar 2023 12:01:30 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com
 [10.20.54.105])
 by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32OC1QIi48497354
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 24 Mar 2023 12:01:26 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8DB0520043;
 Fri, 24 Mar 2023 12:01:26 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BA28320040;
 Fri, 24 Mar 2023 12:01:25 +0000 (GMT)
Received: from li-ce58cfcc-320b-11b2-a85c-85e19b5285e0 (unknown [9.171.3.88])
 by smtpav06.fra02v.mail.ibm.com (Postfix) with SMTP;
 Fri, 24 Mar 2023 12:01:25 +0000 (GMT)
Date: Fri, 24 Mar 2023 13:00:36 +0100
From: Halil Pasic <pasic@linux.ibm.com>
To: Cornelia Huck <cohuck@redhat.com>
Cc: Carlos =?UTF-8?B?TMOzcGV6?= <clopez@suse.de>, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>, David Hildenbrand
 <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>, Christian
 Borntraeger <borntraeger@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 "open list:virtio-ccw" <qemu-s390x@nongnu.org>, Halil Pasic
 <pasic@linux.ibm.com>
Subject: Re: [PATCH v2] virtio: refresh vring region cache after updating a
 virtqueue size
Message-ID: <20230324130036.2c4db781.pasic@linux.ibm.com>
In-Reply-To: <20230322182433.695270d0.pasic@linux.ibm.com>
References: <20230317002749.27379-1-clopez@suse.de> <87y1npglk0.fsf@redhat.com>
 <20230322182433.695270d0.pasic@linux.ibm.com>
Organization: IBM
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: lgm29mcjLuNT_vsSpuTnJHqc7u81zLBp
X-Proofpoint-ORIG-GUID: t22AC0rTpHBZOD2WUz7War49AJSB2Tf3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_06,2023-03-24_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 bulkscore=0 phishscore=0 clxscore=1015 adultscore=0 spamscore=0
 malwarescore=0 mlxlogscore=999 suspectscore=0 lowpriorityscore=0
 impostorscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303240099
Received-SPF: pass client-ip=148.163.156.1; envelope-from=pasic@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, 22 Mar 2023 18:24:33 +0100
Halil Pasic <pasic@linux.ibm.com> wrote:

> > > --- a/hw/s390x/virtio-ccw.c
> > > +++ b/hw/s390x/virtio-ccw.c
> > > @@ -237,6 +237,7 @@ static int virtio_ccw_set_vqs(SubchDev *sch, VqInfoBlock *info,
> > >                  return -EINVAL;
> > >              }
> > >              virtio_queue_set_num(vdev, index, num);
> > > +            virtio_init_region_cache(vdev, index);    
> > 
> > Hmm... this is not wrong, but looking at it again, I see that the guest
> > has no way to change num after our last call to
> > virtio_init_region_cache() (while setting up the queue addresses.) IOW,
> > this introduces an extra round trip that is not really needed.
> >   
> 
> I don't quite understand. AFAIU the virtio_init_region_cache() would see
> the (new) queue addresses but not the new size (num). Yes virtio-ccw
> already knows the new num but it is yet to call
> to put it into vdev->vq[n].vring.num from where
> virtio_init_region_cache() picks it up.
> 
> If we were to first virtio_queue_set_num() and only then the address
> I would understand. But with the code as is, I don't. Am I missing
> something?

Connie: have you had a chance to have yet another look at this? I
would like to understand the reason for seeing this differently.

Regards,
Halil

