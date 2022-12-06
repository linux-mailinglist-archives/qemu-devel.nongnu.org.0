Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F30644D68
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Dec 2022 21:42:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2el8-0003X2-Tl; Tue, 06 Dec 2022 15:41:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1p2el4-0003Wr-De
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 15:41:42 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1p2ekl-0002SS-Pz
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 15:41:42 -0500
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2B6IuilQ022275; Tue, 6 Dec 2022 20:41:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=+KbvP9CiLnywuUDRNU69Tc8pBibeKJ91MjeebnUUD0o=;
 b=swr+Oe62s5qqqGBpWCpviwuvEVi+91iAERiDLtjdFjtBgIEDE7eSt1VVD07BCB84xanG
 ymqaD9nJHEtJon7IDOPNzxNNxNTPQ+uP0RJff5bUNEhee0ZwsvRsBEEjaX26KFKQ9I97
 SZyU3Qx4eo+58QnsvnzPLPMAkf3jYKXZ7Wamo7eDYnmiegNkNu2z7BHSQQsu4X2EIhY8
 Pkymn0Jbcn50EZdFej5t7T4Aca71goavipvrBGUdE0aod+z35l7cNEepHdpJ58g1dAsj
 A/6JN2EAaaE2Vuir5dy5l/VxFctBqCcQHRu6apcKEM99HH2aFqtJRyvgRZSLyCKix7fy WA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mabfa2emb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Dec 2022 20:41:18 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2B6JlRtM027013;
 Tue, 6 Dec 2022 20:41:18 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mabfa2ekc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Dec 2022 20:41:17 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 2B6DIglj012037;
 Tue, 6 Dec 2022 20:41:15 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
 by ppma02fra.de.ibm.com (PPS) with ESMTPS id 3m9mb21fky-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Dec 2022 20:41:15 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com
 [10.20.54.104])
 by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2B6KfDk040305126
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 6 Dec 2022 20:41:13 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 339CF20043;
 Tue,  6 Dec 2022 20:41:13 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DCAF820040;
 Tue,  6 Dec 2022 20:41:12 +0000 (GMT)
Received: from heavy (unknown [9.171.86.248])
 by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTPS;
 Tue,  6 Dec 2022 20:41:12 +0000 (GMT)
Date: Tue, 6 Dec 2022 21:41:09 +0100
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: thuth@redhat.com
Subject: Re: [PATCH v3 11/13] tcg/s390x: Support SELGR instruction in movcond
Message-ID: <20221206204109.wsnh5zw2jwm4hgw2@heavy>
References: <20221202065200.224537-1-richard.henderson@linaro.org>
 <20221202065200.224537-12-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221202065200.224537-12-richard.henderson@linaro.org>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 2hCP2DiktjxSi5Sy1cAX1bU22lfKKSaw
X-Proofpoint-ORIG-GUID: yj_w51VPQN5OOJwu2aAdJo120Igp8vqy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-06_11,2022-12-06_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 clxscore=1015 mlxscore=0 mlxlogscore=883
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2212060172
Received-SPF: pass client-ip=148.163.156.1; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
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

On Thu, Dec 01, 2022 at 10:51:58PM -0800, Richard Henderson wrote:
> The new select instruction provides two separate register inputs,
> whereas the old load-on-condition instruction overlaps one of the
> register inputs with the destination.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/s390x/tcg-target.c.inc | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)

Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>

