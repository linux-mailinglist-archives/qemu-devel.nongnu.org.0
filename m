Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0684B1230
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 16:58:50 +0100 (CET)
Received: from localhost ([::1]:46880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIBqL-0003c9-Jh
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 10:58:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1nI9ew-0006vI-NL
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 08:38:55 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:32648
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1nI9ei-0007QC-5O
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 08:38:54 -0500
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21ADc2Fg017999; 
 Thu, 10 Feb 2022 13:38:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=mXKi63LkPpNp57iKnZDY9dh3Lu6gtCVC8rGWi+GDvCQ=;
 b=FztqsCLcQcXhAmel7GODuPQaIcXFOgRVdtEzYO3r59hJQOjiC1Y7jkCZaC/akQz0EJ0E
 BHpgY7Cm/W6DZ8LgY4YuuUOH1+0VMs0qwq1YszDi/caKJt1MV4s2hWO0i9QF7Mb7WwrK
 qJATgKjIlU3PbgkHiC3rCWTzCtPUWtgR3mKUHWFocB4hI0dwmd5qYRtOA0ic0m80Yk8+
 f0C2TghRjt2f2OAV2lYmhWJCF3jnkAJqpIiPXpZ2lFBTJyTAWAeO9jNUkK8qCMChgZrj
 EGsGy2PH8znDqad0zeGmp025KZwGg5xk0hBlMhYETmNNmrckafVdFcyrVva8iwRRIqWP 0Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3e4m98aunx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Feb 2022 13:38:06 +0000
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21ADc5cm018345;
 Thu, 10 Feb 2022 13:38:05 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3e4m98atvg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Feb 2022 13:38:05 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21ADC6bK031096;
 Thu, 10 Feb 2022 13:29:35 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma06ams.nl.ibm.com with ESMTP id 3e1ggkgh0g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Feb 2022 13:29:35 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21ADTX4I41484734
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Feb 2022 13:29:33 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E0222A405B;
 Thu, 10 Feb 2022 13:29:32 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 744EBA4054;
 Thu, 10 Feb 2022 13:29:32 +0000 (GMT)
Received: from li-e979b1cc-23ba-11b2-a85c-dfd230f6cf82 (unknown [9.171.70.232])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Thu, 10 Feb 2022 13:29:32 +0000 (GMT)
Date: Thu, 10 Feb 2022 14:29:29 +0100
From: Halil Pasic <pasic@linux.ibm.com>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH 1/1] virtio: fix feature negotiation for ACCESS_PLATFORM
Message-ID: <20220210142929.668a1f3d.pasic@linux.ibm.com>
In-Reply-To: <877da3t1du.fsf@redhat.com>
References: <20220209124534.1206993-1-pasic@linux.ibm.com>
 <87leykt0k7.fsf@redhat.com>
 <20220209212750.25ddcebe.pasic@linux.ibm.com>
 <87fsort5a6.fsf@redhat.com>
 <20220210113258.1e90af05.pasic@linux.ibm.com>
 <877da3t1du.fsf@redhat.com>
Organization: IBM
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: PdLjC3_XaDDBN9AR1o0s9rHHRtARfUSC
X-Proofpoint-GUID: si2UaIYPZFoFwNfaUh4byA3It47AFPiy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-10_06,2022-02-09_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0
 spamscore=0 suspectscore=0 adultscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 phishscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202100074
Received-SPF: pass client-ip=148.163.158.5; envelope-from=pasic@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Brijesh Singh <brijesh.singh@amd.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org,
 Halil Pasic <pasic@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 10 Feb 2022 12:19:25 +0100
Cornelia Huck <cohuck@redhat.com> wrote:

[..]
> 
> Nope, that's not my problem. We make sure that the bit is persistent, we
> fail realization if the bit got removed by the callback when required,
> and we fail feature validation if the driver removes the bit, which is
> in a different code path. We should not talk about FEATURES_OK in this
> code.

I agree. I changed my mind. Expanation follows...

> 
> We force-add the bit, and then still might fail realization. The
> important condition is the has_iommu one, not the checks later on. I
> find it very confusing to talk about what a potential driver might do in
> that context.
> 

I assumed stuff like virtiofs+SE regressed with commit 04ceb61a40
("virtio: Fail if iommu_platform is requested, but unsupported") but I
think, I was wrong. It didn't work before that, because we did not
present ACCESS_PLATFORM to the guest. I operated under the assumption
that virtio_add_feature(&vdev->host_features, VIRTIO_F_IOMMU_PLATFORM)
does not impact the set of features offered to the driver by the device,
but it does.

So we need both this patch and "[PATCH v5 1/1] virtio: fix the condition
for iommu_platform not supported" to get virtiofs to work with SE/SEV/Secure VM.

I have to admit I only tested for the error message, and not with a full
SE setup.

I agree my comment was inadequate. Can we use

/* make sure that the device did not drop a required IOMMU_PLATFORM */

I will think some more though. This is again about the dual nature
of ACCESS_PLATFORM...

> What about moving the virtio_add_feature() after the if
> (klass->get_dma_as) check, and adding a comment
> 
> /* we want to always force IOMMU_PLATFORM here */
> 
> [I'll withdraw from this discussion for now, I fear I might just add
> confusion.]
> 
> 


