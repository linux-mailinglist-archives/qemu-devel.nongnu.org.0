Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E931E2B0684
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 14:34:26 +0100 (CET)
Received: from localhost ([::1]:46380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdCk6-0004n5-0L
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 08:34:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1kdChq-0003F9-Gc; Thu, 12 Nov 2020 08:32:06 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:38914
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1kdChm-0004MP-7p; Thu, 12 Nov 2020 08:32:05 -0500
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0ACDVk95147148; Thu, 12 Nov 2020 08:32:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=Aj3J9LKzDYCdJNqS2/rQ245t0pTmSQaOAaoSU96iY38=;
 b=lzS4AR7zYFFZLIml5i2Tb///6AUrnTPt49hLJ2QA5ATo5D7bXrQsOx0/BltZwFPdWvwd
 SVeXtBArMvq1pDIEZ+wZ0vXdlQqPnosYs6MiLNn29tmEKLggvtxZMZ+1ZWhMMKLjg0Ee
 fWB9XvVTfbZc8iVjY51Wxzcrq8UhFiHpACUVk/o+3bfDTHrX+y0Yrlptz+MMXwt8hhp8
 I4pPxOknYlI6mhSp/7T5CrQMGlc6vybz7GemsJFMYLzqKOEBC5o5M/po5obO5I23hnHe
 tuzhRcC6TZEdLrwHPAR8v9a3iKwTe0gfjw4r4JJN2h2rsz4u7fPszXH6nmtgaIsIYmln Wg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 34s2wq5cvh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Nov 2020 08:32:00 -0500
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0ACDW0GT148548;
 Thu, 12 Nov 2020 08:32:00 -0500
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0b-001b2d01.pphosted.com with ESMTP id 34s2wq5cud-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Nov 2020 08:32:00 -0500
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0ACDRW0C006795;
 Thu, 12 Nov 2020 13:31:57 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma06fra.de.ibm.com with ESMTP id 34njuh2wq9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Nov 2020 13:31:57 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 0ACDVofj58327482
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 12 Nov 2020 13:31:51 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DA15F42047;
 Thu, 12 Nov 2020 13:31:50 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 65E344204F;
 Thu, 12 Nov 2020 13:31:50 +0000 (GMT)
Received: from oc2783563651 (unknown [9.171.3.71])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Thu, 12 Nov 2020 13:31:50 +0000 (GMT)
Date: Thu, 12 Nov 2020 14:31:43 +0100
From: Halil Pasic <pasic@linux.ibm.com>
To: Michael Mueller <mimu@linux.ibm.com>
Subject: Re: [PATCH 1/1] virtio-blk-ccw: tweak the default for num_queues
Message-ID: <20201112143143.2e24b45c.pasic@linux.ibm.com>
In-Reply-To: <d13e61ad-8e98-4de8-141e-43eb7b513880@linux.ibm.com>
References: <20201109154831.20779-1-pasic@linux.ibm.com>
 <20201109170616.6875f610.cohuck@redhat.com>
 <20201109195303.459f6fba.pasic@linux.ibm.com>
 <4a3d24e0-399f-f509-9a5c-c66c57b2d28a@linux.ibm.com>
 <e27547cf-1462-6e0f-c830-dde5a6f8c1f6@linux.ibm.com>
 <20201111133815.10b8f3b7.cohuck@redhat.com>
 <d13e61ad-8e98-4de8-141e-43eb7b513880@linux.ibm.com>
Organization: IBM
X-Mailer: Claws Mail 3.11.1 (GTK+ 2.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-12_05:2020-11-12,
 2020-11-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 suspectscore=0
 mlxlogscore=999 clxscore=1015 phishscore=0 mlxscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2011120077
Received-SPF: pass client-ip=148.163.158.5; envelope-from=pasic@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 08:32:00
X-ACL-Warn: Detected OS   = Linux 3.x [generic]
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, David Hildenbrand <david@redhat.com>,
 qemu-devel@nongnu.org, Christian Borntraeger <borntraeger@de.ibm.com>,
 qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 11 Nov 2020 13:49:08 +0100
Michael Mueller <mimu@linux.ibm.com> wrote:

> Halil,
> 
> still I would like to know what the exact memory consumption per queue
> is that you are talking about. Have you made a calculation? Thanks.

Hi! 

The default size for virtio-blk seems to be 256 ring entries, which
translates to 6668 bytes for the split ring(s). The queue size is user
configurable, and guest, in theory, can decide to have a smaller queue.
The indirect descriptors are allocated separately, and bounced via
swiotlb in case of secure guests.

Regards,
Halil


