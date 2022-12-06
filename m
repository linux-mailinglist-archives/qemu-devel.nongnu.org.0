Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A586644D64
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Dec 2022 21:41:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2ejL-0002mn-OY; Tue, 06 Dec 2022 15:39:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1p2eiz-0002mU-8h
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 15:39:34 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1p2eix-00024h-LN
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 15:39:33 -0500
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2B6KDjEn027571; Tue, 6 Dec 2022 20:39:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=HeTR25j+IsEA3A6dLRMlfKecKu1sFGn3GrKf1qtUsRw=;
 b=TwoPVVue7WrvBBwcMyuaogUBxJQ4iB4xP9tXjY5gJhdjRZsRGWspvz4NU2zQo8KJnS0M
 CIeuWVeaz601+CxDJi7TgxI+RYgQZg/lmNWsEjthAGA5+ZJTAGYpVm6MdnkSLoE1e4dG
 LG45ZFmES+5fC+fpRRczPrbcRS70w73agZRWxB+xOjBLBCkhH4Ts+yQwMoCByH60HtBu
 Sao/nLke2LDY/kGyFi30FVEriKT8Tv5MQl4ZA2VT8gfYLk1NL+TK8FnvBiwXPOPdtAhm
 BlZ8jAXL1ooQPbK9bnqLdypj71nSiRvuFj9nFX2tyErZHAXxCeOfw7ikRgH5Q5sKXnKy cQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mack80hkv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Dec 2022 20:39:28 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2B6KUJ4X032066;
 Tue, 6 Dec 2022 20:39:28 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mack80hjx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Dec 2022 20:39:28 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.17.1.19/8.16.1.2) with ESMTP id 2B6DiUo3010216;
 Tue, 6 Dec 2022 20:39:26 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
 by ppma05fra.de.ibm.com (PPS) with ESMTPS id 3m9m7r9dfe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Dec 2022 20:39:26 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com
 [10.20.54.101])
 by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2B6KdNtp19202690
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 6 Dec 2022 20:39:24 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CCAD32004B;
 Tue,  6 Dec 2022 20:39:23 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 79FC920043;
 Tue,  6 Dec 2022 20:39:23 +0000 (GMT)
Received: from heavy (unknown [9.171.86.248])
 by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTPS;
 Tue,  6 Dec 2022 20:39:23 +0000 (GMT)
Date: Tue, 6 Dec 2022 21:39:19 +0100
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: thuth@redhat.com
Subject: Re: [PATCH v3 10/13] tcg/s390x: Generalize movcond implementation
Message-ID: <20221206203919.5mluzbnw3jhjkpsg@heavy>
References: <20221202065200.224537-1-richard.henderson@linaro.org>
 <20221202065200.224537-11-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221202065200.224537-11-richard.henderson@linaro.org>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: X_y9NmLY2giBE-rWkwWOHnGC73R0tLE5
X-Proofpoint-ORIG-GUID: dpoXMX0v8Vsucp4apy6umcDsz2gONnxH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-06_11,2022-12-06_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 phishscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 suspectscore=0 mlxscore=0 clxscore=1015 malwarescore=0 mlxlogscore=842
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212060172
Received-SPF: pass client-ip=148.163.158.5; envelope-from=iii@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
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

On Thu, Dec 01, 2022 at 10:51:57PM -0800, Richard Henderson wrote:
> Generalize movcond to support pre-computed conditions, and the same
> set of arguments at all times.  This will be assumed by a following
> patch, which needs to reuse tgen_movcond_int.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/s390x/tcg-target-con-set.h |  3 +-
>  tcg/s390x/tcg-target.c.inc     | 78 ++++++++++++++++++++++++++--------
>  2 files changed, 61 insertions(+), 20 deletions(-)

Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>

