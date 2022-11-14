Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 013EE628F60
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 02:35:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouir4-0004AY-Pa; Mon, 14 Nov 2022 18:27:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1ouih4-0008L7-LK; Mon, 14 Nov 2022 18:16:46 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1ouRhs-0003KQ-3z; Mon, 14 Nov 2022 00:08:29 -0500
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.5) with ESMTP id
 2AE51WdO020878; Mon, 14 Nov 2022 05:08:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=d57PbqwwnyIUlM8xuhK36MDGlSryMj3kInYosYZV2Kg=;
 b=XwZrzz0IFX4YFKeNWuoFqOWrqw/314KDMDLbI+uX0BvRxqCKIqf9m9yP+Jlz4obw20uY
 gMHLVxcToKXl7HOd2AOHc2psrGUFllMHUmyJWuanI2bCad0SWpCZQzekoPrjYY8Ie+iK
 NsDHffun5mpDjCsH86nHstXJPzz1dvrHQlL9oSJvMEF93dRvhHHNWScSzvEtoUb/ffaD
 CcbNTlzzHR3VUSJ6Q6+/cTzZ3oQVzUjMDL7sdCQAd+gOZS8AIVDVteFXfehlDgOu5GTM
 yCh5XNkkDdbLBrR3r4pF7yfetUGFCYHMVWaonOXGjbNAOT0hjx07kWPDdDYQcYGvaBQE /w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kuf5s05dg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Nov 2022 05:08:21 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2AE541tt030998;
 Mon, 14 Nov 2022 05:08:20 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kuf5s05cc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Nov 2022 05:08:20 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AE55oIk004505;
 Mon, 14 Nov 2022 05:08:18 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma06fra.de.ibm.com with ESMTP id 3kt2rj1fb1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Nov 2022 05:08:18 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2AE58FxQ50659764
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Nov 2022 05:08:15 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E9AFC4C044;
 Mon, 14 Nov 2022 05:08:14 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7563D4C040;
 Mon, 14 Nov 2022 05:08:14 +0000 (GMT)
Received: from heavy (unknown [9.171.39.72])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Mon, 14 Nov 2022 05:08:14 +0000 (GMT)
Date: Mon, 14 Nov 2022 06:08:13 +0100
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, sw@weilnetz.de
Subject: Re: [PATCH] s390x: Fix spelling errors
Message-ID: <20221114050813.6aegy5ishny25r3h@heavy>
References: <20221111182828.282251-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221111182828.282251-1-thuth@redhat.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: PJW-nT69_4V7s4_q9QyElxvmhLwiGBFK
X-Proofpoint-ORIG-GUID: aEoRKnHbwKgVbiUCIBQvu3Qk6ynXvJL0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-14_04,2022-11-11_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 bulkscore=0 mlxscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 spamscore=0 mlxlogscore=749 impostorscore=0 clxscore=1011
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211140035
Received-SPF: pass client-ip=148.163.156.1; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Fri, Nov 11, 2022 at 07:28:28PM +0100, Thomas Huth wrote:
> Fix typos (discovered with the 'codespell' utility).
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  hw/s390x/ipl.h                      | 2 +-
>  pc-bios/s390-ccw/cio.h              | 2 +-
>  pc-bios/s390-ccw/iplb.h             | 2 +-
>  target/s390x/cpu_models.h           | 4 ++--
>  hw/s390x/s390-pci-vfio.c            | 2 +-
>  hw/s390x/s390-virtio-ccw.c          | 6 +++---
>  target/s390x/ioinst.c               | 2 +-
>  target/s390x/tcg/excp_helper.c      | 2 +-
>  target/s390x/tcg/fpu_helper.c       | 2 +-
>  target/s390x/tcg/misc_helper.c      | 2 +-
>  target/s390x/tcg/translate.c        | 4 ++--
>  target/s390x/tcg/translate_vx.c.inc | 6 +++---
>  pc-bios/s390-ccw/start.S            | 2 +-
>  13 files changed, 19 insertions(+), 19 deletions(-)

Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>

