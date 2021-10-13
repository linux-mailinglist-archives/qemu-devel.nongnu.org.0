Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A0342C086
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 14:48:03 +0200 (CEST)
Received: from localhost ([::1]:36310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1madfu-0006oE-Ms
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 08:48:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1madcg-0004aP-4k
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 08:44:42 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:19154)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1madcd-0004GO-Sf
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 08:44:41 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19DCX8eM021026; 
 Wed, 13 Oct 2021 08:44:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=e4qeE39nNF63o3oTejjERAXSIzN7WFNAVqNCqaNZdS0=;
 b=bXdKh2QI46h+HoWTks3D/B3G7row03b3rYVbT/nIgjaVQgeqX2JEEXuQUfWPRZFUUyoB
 55qM23TFN7JsXM9l/sPtCIDo7ycrFTvLVryj7J6PsdFITPsTcH0pd3N2j4HWSPhxMLxT
 euwBaWLbYhVJE+9tbS3PiasNQfw3SZjVtDTVoFMfASgzvgRYyQ7QL/ICl75qsrhQAPvx
 ZvoknCx3YXG8QvhQqnvvkofrNKgjCZWn7AFCa8Km27LzXzILVwnIHNWYRz19hM59Aasl
 d7yuXRcAJUB3Jf3O+F80/Sojw7aJSsk/kq0ABs52Az04B0VFZec1P4qggAuOGdnWpUNx CA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bntpwxx85-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Oct 2021 08:44:36 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 19DBUBAi030380;
 Wed, 13 Oct 2021 08:44:35 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bntpwxx74-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Oct 2021 08:44:35 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 19DCfUTe016216;
 Wed, 13 Oct 2021 12:44:33 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma05fra.de.ibm.com with ESMTP id 3bk2qa0fa5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Oct 2021 12:44:32 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 19DCiKMl59441428
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 13 Oct 2021 12:44:20 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6FB2BA406F;
 Wed, 13 Oct 2021 12:44:20 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 727F2A407B;
 Wed, 13 Oct 2021 12:44:13 +0000 (GMT)
Received: from li-e979b1cc-23ba-11b2-a85c-dfd230f6cf82 (unknown [9.171.29.112])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed, 13 Oct 2021 12:44:13 +0000 (GMT)
Date: Wed, 13 Oct 2021 14:44:08 +0200
From: Halil Pasic <pasic@linux.ibm.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v3 1/1] virtio: write back F_VERSION_1 before validate
Message-ID: <20211013144408.2812d9bd.pasic@linux.ibm.com>
In-Reply-To: <20211013081836-mutt-send-email-mst@kernel.org>
References: <20211011053921.1198936-1-pasic@linux.ibm.com>
 <20211013060923-mutt-send-email-mst@kernel.org>
 <96561e29-e0d6-9a4d-3657-999bad59914e@de.ibm.com>
 <20211013081836-mutt-send-email-mst@kernel.org>
Organization: IBM
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Jp0uxxHTXTE771ls4ramYMB1Oy-7C_gz
X-Proofpoint-ORIG-GUID: AuiVxpbg965JdHptRviyaH---l1LWaGY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-13_05,2021-10-13_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 malwarescore=0 bulkscore=0 mlxlogscore=983 clxscore=1015 phishscore=0
 spamscore=0 mlxscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110130084
Received-SPF: pass client-ip=148.163.156.1; envelope-from=pasic@linux.ibm.com;
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
Cc: linux-s390@vger.kernel.org, markver@us.ibm.com,
 Xie Yongji <xieyongji@bytedance.com>, qemu-devel@nongnu.org,
 Jason Wang <jasowang@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 virtualization@lists.linux-foundation.org, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, stefanha@redhat.com,
 Raphael Norwitz <raphael.norwitz@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 13 Oct 2021 08:24:53 -0400
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> > > OK this looks good! How about a QEMU patch to make it spec compliant on
> > > BE?  
> > 
> > Who is going to do that? Halil? you? Conny?  
> 
> Halil said he'll do it... Right, Halil?

I can do it but not right away. Maybe in a couple of weeks. I have some
other bugs to hunt down, before proceeding to this. If somebody else
wants to do it, I'm fine with that as well.

Regards,
Halil

