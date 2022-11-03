Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54790617BE2
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 12:50:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqYAM-0006DL-Hs; Thu, 03 Nov 2022 07:13:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1oqYAH-0006A3-AU; Thu, 03 Nov 2022 07:13:41 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1oqYA8-00034N-FM; Thu, 03 Nov 2022 07:13:40 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2A3AOjdR019840;
 Thu, 3 Nov 2022 11:13:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=iFxLPgKl0WCnlX8f4umk6MwtyXy8my1CKpAlG26JCEs=;
 b=OxrxVf5mz0RDc1IYhhOcVTTG6+MpxewZ6FxfO8SweqjEUFXbOtrj5xDAzNWht3jD5aUK
 MMvULbWATYZJJDaC12HpYptOK+wl5z5wjwNPIXkmLwmz9yBBPjMm8RJ6lIF2MqZh61Dt
 jpg/nKiI4rK1UmB0Ghp4WKm2WXOO9Wc/nhjqn8dskyQiK7cVoHBDzLS5R4DcU6HsRp/3
 xJcdriFXoP424Sd3pHWDv60rJoPkq41vsmTR4lo5UKaQxdQNzkUIx9ekmS58kheMA3/s
 4vumGYFMIQvaoe/z434P5q4emN030kVG2fhcuXNJg7G/54/iC2slFaNLP5Qf6vKd3J/Z Ww== 
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kmbva9bad-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Nov 2022 11:13:30 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2A3B7I7h002454;
 Thu, 3 Nov 2022 11:13:28 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma06fra.de.ibm.com with ESMTP id 3kguejeerg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Nov 2022 11:13:28 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2A3BDPDZ36373202
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 3 Nov 2022 11:13:25 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CCEA5A4057;
 Thu,  3 Nov 2022 11:13:25 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 94405A404D;
 Thu,  3 Nov 2022 11:13:25 +0000 (GMT)
Received: from heavy (unknown [9.171.39.72])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Thu,  3 Nov 2022 11:13:25 +0000 (GMT)
Date: Thu, 3 Nov 2022 12:13:24 +0100
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org
Subject: Re: [PATCH 05/26] target/s390x: Change help_goto_direct to work on
 displacements
Message-ID: <20221103111324.tc62zg5yfc67befu@heavy>
References: <20221006034421.1179141-1-richard.henderson@linaro.org>
 <20221006034421.1179141-6-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221006034421.1179141-6-richard.henderson@linaro.org>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: S1tsMs7KvSeUDL_RkhwVXlzPqLXluREp
X-Proofpoint-GUID: S1tsMs7KvSeUDL_RkhwVXlzPqLXluREp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-03_02,2022-11-03_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015
 mlxlogscore=691 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 adultscore=0 priorityscore=1501 mlxscore=0 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2211030076
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Oct 05, 2022 at 08:44:00PM -0700, Richard Henderson wrote:
> In preparation for TARGET_TB_PCREL, reduce reliance on absolute values.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/s390x/tcg/translate.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)

Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>

