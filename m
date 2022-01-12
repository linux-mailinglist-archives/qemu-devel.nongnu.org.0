Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C595A48C739
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 16:29:06 +0100 (CET)
Received: from localhost ([::1]:54896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7fYf-0006J8-NG
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 10:29:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1n7eoD-00078q-W9; Wed, 12 Jan 2022 09:41:06 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:62964)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1n7eo9-0002Vl-JC; Wed, 12 Jan 2022 09:41:05 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20CDr7KT004653; 
 Wed, 12 Jan 2022 14:40:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=908fXRXgdndB/8Ou4YLkaiMTmkO6U6SteTlawqpzTKA=;
 b=s4HRrgmz92tDQQETAYldWJ2439PulogstUd4Y70ABu2ospSRtzZ/bRvc3bDEcrRfPJtJ
 /aQUNmK1zknfs3nIZSY4uZ7izOxB13VO5WKRU89mqyVQYWEPvW4nDXZOPWD+RSals1lR
 S5Re+k8X+f9IPKST6tpi2RY8UKpZQwsS46+v+DF6YZpiMyrKzRXxJAM957DnUqCF5+eV
 hFbH3dWjijiFZuMe1eeMAnf20RrrdL1aT+jBK8heH36s/fyNn5OG9otnxUQQgPeIkrn0
 io+4yIJ6d0sMlsWdJcjj1W3gbCPHxcBcyDn+OX+Iea6NgsB+OQvRVA+Z+Ptbo0aXr+rR IA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dhhcwku91-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 14:40:57 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20CDrNaQ005096;
 Wed, 12 Jan 2022 14:40:57 GMT
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dhhcwku8j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 14:40:56 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20CEWKjU029916;
 Wed, 12 Jan 2022 14:40:55 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma01wdc.us.ibm.com with ESMTP id 3df28avtps-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 14:40:55 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20CEerJR30409000
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 12 Jan 2022 14:40:54 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B58316E056;
 Wed, 12 Jan 2022 14:40:53 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C430F6E053;
 Wed, 12 Jan 2022 14:40:52 +0000 (GMT)
Received: from farman-thinkpad-t470p (unknown [9.211.71.239])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 12 Jan 2022 14:40:52 +0000 (GMT)
Message-ID: <a1fbf5b75203e6431ee7632cd010437488f53af7.camel@linux.ibm.com>
Subject: Re: [PATCH RFC v2] MAINTAINERS: split out s390x sections
From: Eric Farman <farman@linux.ibm.com>
To: Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org
Date: Wed, 12 Jan 2022 09:40:51 -0500
In-Reply-To: <87r19dw8u9.fsf@redhat.com>
References: <20211222105548.356852-1-cohuck@redhat.com>
 <aa11d65c8cb303b381c4e53aa948818b7b65a228.camel@linux.ibm.com>
 <87r19dw8u9.fsf@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-18.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: sW3Upm3dvieQ1UeoFQCLl34hFwWnwYir
X-Proofpoint-ORIG-GUID: 6AcgktLjxSpBcA7Vg-M80qoiFUozSh1N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-12_04,2022-01-11_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 spamscore=0 clxscore=1015 phishscore=0 impostorscore=0 priorityscore=1501
 adultscore=0 mlxscore=0 lowpriorityscore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2201120095
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farman@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 2022-01-12 at 11:23 +0100, Cornelia Huck wrote:
> On Wed, Jan 05 2022, Eric Farman <farman@linux.ibm.com> wrote:
> 
> > On Wed, 2021-12-22 at 11:55 +0100, Cornelia Huck wrote:
> > > Split out some more specialized devices etc., so that we can
> > > build
> > > smarter lists of people to be put on cc: in the future.
> > > 
> > > Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> > > Acked-by: David Hildenbrand <david@redhat.com>
> > > Acked-by: Christian Borntraeger <borntraeger@de.ibm.com>
> > > Acked-by: Thomas Huth <thuth@redhat.com>
> > > Acked-by: Halil Pasic <pasic@linux.ibm.com>
> > > Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> > 
> > (Late to the party, Happy New Year!) I like the rearrangement:
> 
> Happy new year :)
> 
> > Acked-by: Eric Farman <farman@linux.ibm.com>
> > 
> > Of course, you also said in v1:
> > 
> > """
> > - The new sections have inherited the maintainers of the sections
> >   they have been split out of (except where people had already
> >   volunteered). That's easy to change, obviously, and I hope that
> >   the cc: list already contains people who might have interest in
> >   volunteering for some sections.
> > """
> > 
> > As someone on cc, I could volunteer to help with these sections:
> > 
> > S390 Machines
> > -------------
> > S390 Virtio-ccw
> > S390 channel subsystem
> > 
> > Devices
> > -------
> > virtio-ccw
> 
> Thanks!
> 
> Do you want to do a patch on top, or should I do a v3? (A separate
> patch
> is probably better.)

I can do a patch on top.

Eric

> 


