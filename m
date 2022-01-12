Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 622AE48CE42
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 23:15:03 +0100 (CET)
Received: from localhost ([::1]:54006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7ltV-0006AU-V3
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 17:15:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1n7ls5-000513-8B; Wed, 12 Jan 2022 17:13:33 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:64412)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1n7ls3-0001gZ-9j; Wed, 12 Jan 2022 17:13:32 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20CKlUZf025237; 
 Wed, 12 Jan 2022 22:13:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=ULfVKZPdeghd0sRJgYQdAQC7fMu4/8KUW0+p9l21HoU=;
 b=NKVsf2IJauC/rJqNwOrZwrZYjHSykremJhaeBD+HqkJDIaU66cMwNzW27g6qZOM78Kid
 BQWJey+YdY3wqag2gcjvrF8W493q5/7lJ9aCKaNn3Gx8M4HOkWTkMQn1aP5OQFj8lRLb
 3Ry4fcik82f/2+weua7tB1cj1IAIZWNMrFOsLfwTR3aAzOqgLfyOjpePLZbIXw7Md2zU
 v7e2Ku1mHx6C3wTKdv/rIs+v5pYqnnOjvIqU77qW5mQdudmdWtzySkWCmhmSmVOtlT/Z
 ogP/d2Mj7I/StwCJxT0lksCfaOyt6qGq6gKsAhslbQtBHEqRrP8d9vR/2ns2DWUo8YSa ZA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dj6b819jh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 22:13:26 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20CLwY2X005539;
 Wed, 12 Jan 2022 22:13:25 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dj6b819j7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 22:13:25 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20CMCg8t016511;
 Wed, 12 Jan 2022 22:13:23 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma05fra.de.ibm.com with ESMTP id 3df289nttv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 22:13:23 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20CMDJIM39387450
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 12 Jan 2022 22:13:19 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B5139AE045;
 Wed, 12 Jan 2022 22:13:19 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 42130AE055;
 Wed, 12 Jan 2022 22:13:19 +0000 (GMT)
Received: from li-e979b1cc-23ba-11b2-a85c-dfd230f6cf82 (unknown [9.171.56.243])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed, 12 Jan 2022 22:13:19 +0000 (GMT)
Date: Wed, 12 Jan 2022 23:13:17 +0100
From: Halil Pasic <pasic@linux.ibm.com>
To: Eric Farman <farman@linux.ibm.com>
Subject: Re: [RFC PATCH] MAINTAINERS: Add myself to s390 I/O areas
Message-ID: <20220112231317.5c5d86df.pasic@linux.ibm.com>
In-Reply-To: <20220112164044.2210508-1-farman@linux.ibm.com>
References: <20211222105548.356852-1-cohuck@redhat.com>
 <20220112164044.2210508-1-farman@linux.ibm.com>
Organization: IBM
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Xyl8HpDmIXAVi9pyVRyeX14GlmeqHQ4n
X-Proofpoint-GUID: fTrvgCjx_BGO4VDI1tYk94rD0jL1p8yM
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-12_05,2022-01-11_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 mlxlogscore=999 lowpriorityscore=0 malwarescore=0 phishscore=0
 adultscore=0 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 mlxscore=0 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2110150000 definitions=main-2201120131
Received-SPF: pass client-ip=148.163.156.1; envelope-from=pasic@linux.ibm.com;
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
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Halil Pasic <pasic@linux.ibm.com>, qemu-s390x@nongnu.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 12 Jan 2022 17:40:44 +0100
Eric Farman <farman@linux.ibm.com> wrote:

> After the recent restructuring, I'd like to volunteer to help
> in some of the s390 I/O areas.
> 
> Built on "[PATCH RFC v2] MAINTAINERS: split out s390x sections"
> 
> Signed-off-by: Eric Farman <farman@linux.ibm.com>

Acked-by: Halil Pasic <pasic@linux.ibm.com>

Thanks!

> ---
>  MAINTAINERS | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5d37b0eec5..343f43e83d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1521,6 +1521,7 @@ S390 Machines
>  S390 Virtio-ccw
>  M: Halil Pasic <pasic@linux.ibm.com>
>  M: Christian Borntraeger <borntraeger@linux.ibm.com>
> +M: Eric Farman <farman@linux.ibm.com>
>  S: Supported
>  F: hw/s390x/
>  F: include/hw/s390x/
> @@ -1551,6 +1552,7 @@ L: qemu-s390x@nongnu.org
>  S390 channel subsystem
>  M: Halil Pasic <pasic@linux.ibm.com>
>  M: Christian Borntraeger <borntraeger@linux.ibm.com>
> +M: Eric Farman <farman@linux.ibm.com>
>  S: Supported
>  F: hw/s390x/ccw-device.[ch]
>  F: hw/s390x/css.c
> @@ -1975,6 +1977,7 @@ T: git https://github.com/stefanha/qemu.git block
>  virtio-ccw
>  M: Cornelia Huck <cohuck@redhat.com>
>  M: Halil Pasic <pasic@linux.ibm.com>
> +M: Eric Farman <farman@linux.ibm.com>
>  S: Supported
>  F: hw/s390x/virtio-ccw*.[hc]
>  F: hw/s390x/vhost-vsock-ccw.c


