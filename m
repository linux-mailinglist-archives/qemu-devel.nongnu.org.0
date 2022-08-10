Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFAFD58EDAA
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 15:56:16 +0200 (CEST)
Received: from localhost ([::1]:43602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLmC0-00053u-0W
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 09:56:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imbrenda@linux.ibm.com>)
 id 1oLlgS-00031z-Ot; Wed, 10 Aug 2022 09:23:43 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:12178)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imbrenda@linux.ibm.com>)
 id 1oLlgQ-0005Ew-Q9; Wed, 10 Aug 2022 09:23:40 -0400
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27AD470C024163;
 Wed, 10 Aug 2022 13:23:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=zshqBA1QWd5RXy0qcLlgIuHPqmLoAAO3fiQnGwzBAUA=;
 b=R762HJUNNIvdFjHPtsRH+ua6k9+YPtYaxHV8x2CQvN3483M4ixaJ0vCFZPKXTFZZi5Vd
 6jxueFGSu18K+G2HptmMGl1prBcldh612K//+mPtL4S9IVjMgp0O8BanatKFw6zfAZ2Y
 3J6P26/B3qbacXEP6BhrwRpJS9aP8PKKQ2Fl9q1nA2u0xsSal8nbq64127RbercGkh97
 0tiPtOO8EtVJVd+LoknhQT7VrsgfaJSy9zQhdGYiB85jW/E8dH3pDTgQQiXpRnSwD4gs
 gBl8DWttbZX1Y6bsB2dj7Rp37jPqqCyJPIH+OuiZLXi2QLXG31Xc3N4teBKw/DN8bbau FQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hv1fvn4dv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Aug 2022 13:23:35 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27AD6GFs008603;
 Wed, 10 Aug 2022 13:23:34 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hv1fvn4cc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Aug 2022 13:23:34 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27ADKUuE011653;
 Wed, 10 Aug 2022 13:23:32 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma02fra.de.ibm.com with ESMTP id 3huww0rv2c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Aug 2022 13:23:31 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 27ADNTHQ8716678
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 10 Aug 2022 13:23:29 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 88C0011C04A;
 Wed, 10 Aug 2022 13:23:29 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1B42B11C052;
 Wed, 10 Aug 2022 13:23:29 +0000 (GMT)
Received: from p-imbrenda (unknown [9.145.0.105])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 10 Aug 2022 13:23:29 +0000 (GMT)
Date: Wed, 10 Aug 2022 15:23:16 +0200
From: Claudio Imbrenda <imbrenda@linux.ibm.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, David Hildenbrand <david@redhat.com>, Igor
 Mammedov <imammedo@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>,
 qemu-s390x@nongnu.org
Subject: Re: [PATCH v2 0/3] Fix hugepages with memfd on s390x and clean up
 related code
Message-ID: <20220810152316.390a4c1f@p-imbrenda>
In-Reply-To: <20220810125720.3849835-1-thuth@redhat.com>
References: <20220810125720.3849835-1-thuth@redhat.com>
Organization: IBM
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: BK8c510kAByHlhEbn9yqdgf-qBJewlvr
X-Proofpoint-GUID: thBTb7WLwNsZ6oj9GYQMVDKpGr71wNOk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-10_08,2022-08-10_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=999
 adultscore=0 impostorscore=0 suspectscore=0 bulkscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 lowpriorityscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208100041
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=imbrenda@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 10 Aug 2022 14:57:17 +0200
Thomas Huth <thuth@redhat.com> wrote:

> The first patch fixes the problem that hugepages cannot be used via
> the "memory-backend-memfd" object on s390x. The second and third patch
> are some clean-ups that can be done after generalizing the code in the
> first patch.

thanks for fixing this

> 
> v2:
>  - Use qemu_ram_pagesize(memdev->mr.ram_block) instead of adding
>    additional code for the memfd object
>  - Added the two clean-up patches on top to simplify the code
> 
> Thomas Huth (3):
>   backends/hostmem: Fix support of memory-backend-memfd in
>     qemu_maxrampagesize()
>   softmmu/physmem: Remove the ifdef __linux__  around the pagesize
>     functions
>   util/mmap-alloc: Remove qemu_mempath_getpagesize()
> 
>  include/qemu/mmap-alloc.h |  2 --
>  backends/hostmem.c        | 14 ++------------
>  softmmu/physmem.c         | 17 -----------------
>  util/mmap-alloc.c         | 31 -------------------------------
>  4 files changed, 2 insertions(+), 62 deletions(-)
> 


