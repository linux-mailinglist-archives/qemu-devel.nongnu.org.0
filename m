Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D0C644DCB
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Dec 2022 22:11:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2fDA-00031w-W7; Tue, 06 Dec 2022 16:10:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1p2fD8-00031i-2s
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 16:10:42 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1p2fCz-0007Fz-1X
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 16:10:41 -0500
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2B6KxnuN006324; Tue, 6 Dec 2022 21:10:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=5QZU8z1bA0DGnd6/gQpTqEW4zV2gTWyNlLfykg6Li/k=;
 b=UQxanf0FWNz0ryI0GJGAdrLCIoJ0a7wyIob8Ar0xop2qNW9uewDUfl0IlrOTiAb/IPQ5
 z5DTIjSYwP862aDkX+8IcwSd6FJgPCVD0GYbbMm9qN1lXZiKRKF77cmMqs/SPppRwV0u
 Hlm6sFrAkjLxcLn4jTfaFoQxu3xSZh6Jclo/9ihzUGD+CcBxMRy7bvGxzNHhcGYTXMDP
 F4CjPagmDX53f81hBojD0dFh6zOUqtqomAKp/se/p/xVC57MEecIIlN9DQR1p0ukfg75
 ZmwMtcGIix5uHFuQUC9sjRBwEZKQcSxiIk6KZR9KH+HAWpXyHfLevKhZbu7au17adNzv kg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mad8y8866-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Dec 2022 21:10:30 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2B6L65gK002316;
 Tue, 6 Dec 2022 21:10:30 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mad8y883t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Dec 2022 21:10:30 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 2B69VhG0008310;
 Tue, 6 Dec 2022 21:10:27 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
 by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3m9m5y1yjr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Dec 2022 21:10:27 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com
 [10.20.54.104])
 by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2B6LAP9o45285808
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 6 Dec 2022 21:10:25 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 47A7620049;
 Tue,  6 Dec 2022 21:10:25 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0083520040;
 Tue,  6 Dec 2022 21:10:24 +0000 (GMT)
Received: from heavy (unknown [9.171.86.248])
 by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTPS;
 Tue,  6 Dec 2022 21:10:24 +0000 (GMT)
Date: Tue, 6 Dec 2022 22:10:23 +0100
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: thuth@redhat.com
Subject: Re: [PATCH v3 13/13] tcg/s390x: Implement ctpop operation
Message-ID: <20221206211023.f4ule3arruvhxcis@heavy>
References: <20221202065200.224537-1-richard.henderson@linaro.org>
 <20221202065200.224537-14-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221202065200.224537-14-richard.henderson@linaro.org>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Hc9kHOXtG-TAtxM3AfKJ18H2M85GcxAW
X-Proofpoint-ORIG-GUID: Jj4aDzKi2jTEEfb_ucgtwNLqS871UCTM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-06_11,2022-12-06_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 impostorscore=0 bulkscore=0 adultscore=0 clxscore=1015 mlxlogscore=939
 phishscore=0 mlxscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212060177
Received-SPF: pass client-ip=148.163.158.5; envelope-from=iii@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
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

On Thu, Dec 01, 2022 at 10:52:00PM -0800, Richard Henderson wrote:
> There is an older form that produces per-byte results,
> and a newer form that produces per-register results,
> and a vector form that produces per-element results.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/s390x/tcg-target.h     |  5 ++--
>  tcg/s390x/tcg-target.c.inc | 51 ++++++++++++++++++++++++++++++++++++++
>  2 files changed, 54 insertions(+), 2 deletions(-)

Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>

