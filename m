Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2FC6644CA2
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Dec 2022 20:48:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2dv2-0005K4-2C; Tue, 06 Dec 2022 14:47:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1p2dur-0005Fv-Bv
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 14:47:50 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1p2duo-0000dP-Jm
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 14:47:43 -0500
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2B6JEemo005020; Tue, 6 Dec 2022 19:47:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=q+xiJOtXHmOjHHimoBDTVeZccafdwo6v2jBjlCPqq5E=;
 b=hqOsVdmfG0g9TTxp2hsE+I3XeZfk56SPxU9zh9MXZtuuQ+n+NpFU7N0Mdrslor1Z2atH
 aA/6SbCLKAEwf/0oUSwEwaYYZKCGEXejiXBPXqfXagywIDL91pVoI2fAtTlCVZd3ZO9X
 6pZ5aWAQNFhOlU9MHeZWzshTUOZNbiGrR80qY0CmW+N+KeYBCJq4W7NuQGZu3u1nfjIE
 xeiF2iyiX7PedzwAhHlwB1diY96tf1N448F0sY6//ChhE9e3wApIQptI1SFe0YWti/vP
 s2RncAcDp6T5Ia7/uAoegwpPeH8Qka2KmVK5aYBLEaQIwSYUWCKf0eY9wc8UJ6swRU45 zA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mabqfrp2g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Dec 2022 19:47:40 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2B6Jlevo003491;
 Tue, 6 Dec 2022 19:47:40 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mabqfrp1r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Dec 2022 19:47:40 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 2B6DG1OM008095;
 Tue, 6 Dec 2022 19:47:37 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
 by ppma03fra.de.ibm.com (PPS) with ESMTPS id 3m9ktqhcr8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Dec 2022 19:47:37 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com
 [10.20.54.102])
 by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2B6JlZ5440567100
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 6 Dec 2022 19:47:35 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2B15920043;
 Tue,  6 Dec 2022 19:47:35 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D715D20040;
 Tue,  6 Dec 2022 19:47:34 +0000 (GMT)
Received: from heavy (unknown [9.171.86.248])
 by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTPS;
 Tue,  6 Dec 2022 19:47:34 +0000 (GMT)
Date: Tue, 6 Dec 2022 20:47:33 +0100
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: thuth@redhat.com
Subject: Re: [PATCH v3 05/13] tcg/s390x: Distinguish RIE formats
Message-ID: <20221206194733.rypaji22dy73c26b@heavy>
References: <20221202065200.224537-1-richard.henderson@linaro.org>
 <20221202065200.224537-6-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221202065200.224537-6-richard.henderson@linaro.org>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: AgE_FGl_Ezar0buApS2x1RzSXiVVOXuz
X-Proofpoint-ORIG-GUID: s_dyQDUTtyXj25EtFQkDAXWGcYbKgYFO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-06_11,2022-12-06_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 clxscore=1015 mlxlogscore=747 adultscore=0 phishscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212060163
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

On Thu, Dec 01, 2022 at 10:51:52PM -0800, Richard Henderson wrote:
> There are multiple variations, with different fields.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/s390x/tcg-target.c.inc | 47 +++++++++++++++++++++-----------------
>  1 file changed, 26 insertions(+), 21 deletions(-)

Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>

