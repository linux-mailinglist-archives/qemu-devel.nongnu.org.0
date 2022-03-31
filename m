Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A024ED987
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 14:19:57 +0200 (CEST)
Received: from localhost ([::1]:34570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZtmO-00029B-Gh
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 08:19:56 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1nZthc-0007DI-LG; Thu, 31 Mar 2022 08:15:00 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:27602
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1nZthY-00043i-EC; Thu, 31 Mar 2022 08:14:59 -0400
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22V98soO011435; 
 Thu, 31 Mar 2022 12:14:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=XtVEIcEO5ENyNUDlxZXv8jwNUMO3IUXZfGSSjL5XHGY=;
 b=LIQi3yI5vkiUlo01f3XRMO8WX0sQPyvH+HQQoL66FbQGi/t5dWVZwdQGfCEzHQcycYVx
 m2zBkbJ3LniRjdFT8H3YU3WTa2lSxvvjzEqMBWreldkEV9XUVh0abiD6uz4B/YY3MU4m
 Tn1TGsLQorZ4p81np3ic05ktYpkcsWADnrBhC6EKj/aNsDxJgNa6ELBPuF/poeiBBE2B
 8sogDe5M1j+2MseFigdTOqs28ZFKDvsJ8+FussS3b4a3rWRUb7tADbud04c2kubuseWI
 wyDqUqIYZblnI4ytWmOOkolR+F7tbj/ASHe1/+38+y6bguY+HuYNV05IK+pFVCabX0oa 8A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3f588851wg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 31 Mar 2022 12:14:54 +0000
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22VCD1sG013372;
 Thu, 31 Mar 2022 12:14:54 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3f588851w0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 31 Mar 2022 12:14:54 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22VC97Wr009888;
 Thu, 31 Mar 2022 12:14:52 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma02fra.de.ibm.com with ESMTP id 3f1tf914ee-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 31 Mar 2022 12:14:52 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22VCEndx47186394
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 31 Mar 2022 12:14:49 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3F66511C04C;
 Thu, 31 Mar 2022 12:14:49 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E574611C054;
 Thu, 31 Mar 2022 12:14:48 +0000 (GMT)
Received: from li-e979b1cc-23ba-11b2-a85c-dfd230f6cf82 (unknown
 [9.152.224.239])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 31 Mar 2022 12:14:48 +0000 (GMT)
Date: Thu, 31 Mar 2022 14:14:47 +0200
From: Halil Pasic <pasic@linux.ibm.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 3/4] virtio-ccw: move device type declarations to .c files
Message-ID: <20220331141447.40af9138.pasic@linux.ibm.com>
In-Reply-To: <20220328143019.682245-4-pbonzini@redhat.com>
References: <20220328143019.682245-1-pbonzini@redhat.com>
 <20220328143019.682245-4-pbonzini@redhat.com>
Organization: IBM
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 9bRvZIHRik3kLIdCMWTYJyDUso7rJDdh
X-Proofpoint-ORIG-GUID: w-I3sH0EugGmdkGX0FYnSlcJ2ndxR35B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-31_04,2022-03-31_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 malwarescore=0
 mlxscore=0 suspectscore=0 clxscore=1015 spamscore=0 mlxlogscore=999
 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203310068
Received-SPF: pass client-ip=148.163.158.5; envelope-from=pasic@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: farman@linux.ibm.com, cohuck@redhat.com, thuth@redhat.com,
 qemu-devel@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 qemu-s390x@nongnu.org, borntraeger@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 28 Mar 2022 16:30:18 +0200
Paolo Bonzini <pbonzini@redhat.com> wrote:

> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Just curious: is device type declarations for
leaf device types should be private a best practice in QEMU?

> ---
>  hw/s390x/s390-virtio-ccw.c    |   1 +
>  hw/s390x/vhost-scsi-ccw.c     |   9 +++
>  hw/s390x/vhost-vsock-ccw.c    |   9 +++
>  hw/s390x/virtio-ccw-9p.c      |   9 +++
>  hw/s390x/virtio-ccw-balloon.c |   9 +++
>  hw/s390x/virtio-ccw-blk.c     |   9 +++
>  hw/s390x/virtio-ccw-crypto.c  |   9 +++
>  hw/s390x/virtio-ccw-gpu.c     |   9 +++
>  hw/s390x/virtio-ccw-input.c   |  20 +++++
>  hw/s390x/virtio-ccw-net.c     |   9 +++
>  hw/s390x/virtio-ccw-rng.c     |   9 +++
>  hw/s390x/virtio-ccw-scsi.c    |   9 +++
>  hw/s390x/virtio-ccw-serial.c  |   9 +++
>  hw/s390x/virtio-ccw.c         |   2 +
>  hw/s390x/virtio-ccw.h         | 133 ----------------------------------
>  15 files changed, 122 insertions(+), 133 deletions(-)
> 
> diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
> index 90480e7cf9..2d32647d08 100644
> --- a/hw/s390x/s390-virtio-ccw.c
> +++ b/hw/s390x/s390-virtio-ccw.c
> @@ -25,6 +25,7 @@
>  #include "qemu/error-report.h"
>  #include "qemu/option.h"
>  #include "qemu/qemu-print.h"
> +#include "qemu/units.h"

Unrelated?

[..]
> diff --git a/hw/s390x/virtio-ccw.c b/hw/s390x/virtio-ccw.c
> index c845a92c3a..15b458527e 100644
> --- a/hw/s390x/virtio-ccw.c
> +++ b/hw/s390x/virtio-ccw.c
> @@ -12,6 +12,7 @@
>  
>  #include "qemu/osdep.h"
>  #include "qapi/error.h"
> +#include "exec/address-spaces.h"

Unrelated?

>  #include "sysemu/kvm.h"
>  #include "net/net.h"
>  #include "hw/virtio/virtio.h"
> @@ -19,6 +20,7 @@
>  #include "hw/virtio/virtio-net.h"
>  #include "qemu/bitops.h"
>  #include "qemu/error-report.h"
> +#include "qemu/log.h"

Unrelated?

Reviewed-by: Halil Pasic <pasic@linux.ibm.com>

