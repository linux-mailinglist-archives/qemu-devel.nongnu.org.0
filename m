Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 706396866ED
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 14:30:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNDA8-0003Vm-GV; Wed, 01 Feb 2023 08:28:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1pND9T-0003L3-MZ
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 08:27:57 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1pND9R-0005hG-Pv
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 08:27:51 -0500
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 311Bvj7j015760; Wed, 1 Feb 2023 13:27:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=qArNmRMPlMzGGGEa4b4WRJ4yPv3wZXGfiNjXeLouxAU=;
 b=BT94v/X+FZ4SMz71tytrwj/FcQHea8ZriVfUzjW/TBB6rtOgwN36TahKUZjhWRGydyXy
 /4s2GtOy7bEOU64N3KCWyCWy2Rj3txl5bLLCoxz5HqmJA9jYjL2OcgTwwBSEJw4xAI7m
 D0BkHwkZanjfBPha5ITYPeUsATsDY52mzNjaOI/6wbxg0jDDeKHF3X9CE0sfZW7d/VNo
 G1PT8C7kvQd1HhX6YuexItOXjuzD7ldV1n+3/FdmrKCTLM8eRII6ZoiMqKrkTA/XJoZZ
 LTUs9fqIDQPD7lFuynfw1LVIZ++eEk+9uY2Zqq3LCfnbuSEnSzfvhG0RfWjoUJ22NdUV nA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3nfqnwj71f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Feb 2023 13:27:48 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 311Bw7mm017372;
 Wed, 1 Feb 2023 13:27:47 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3nfqnwj70s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Feb 2023 13:27:47 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3119Lops027465;
 Wed, 1 Feb 2023 13:27:45 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
 by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3ncvttvwas-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Feb 2023 13:27:45 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com
 [10.20.54.104])
 by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 311DRhtq43581786
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 1 Feb 2023 13:27:43 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 577BC20043;
 Wed,  1 Feb 2023 13:27:43 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 276E320040;
 Wed,  1 Feb 2023 13:27:43 +0000 (GMT)
Received: from [9.155.209.149] (unknown [9.155.209.149])
 by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Wed,  1 Feb 2023 13:27:43 +0000 (GMT)
Message-ID: <51a3cc7cd7f617f0b39569221c96aaf3716ce9f0.camel@linux.ibm.com>
Subject: Re: [PATCH v6 32/36] target/s390x: Use tcg_gen_atomic_cmpxchg_i128
 for CDSG
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, philmd@linaro.org, David Hildenbrand
 <david@redhat.com>
Date: Wed, 01 Feb 2023 14:27:42 +0100
In-Reply-To: <20230130214844.1158612-33-richard.henderson@linaro.org>
References: <20230130214844.1158612-1-richard.henderson@linaro.org>
 <20230130214844.1158612-33-richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: tH44xQts7gpEAci6KBrkIxxk5-hp4n-E
X-Proofpoint-ORIG-GUID: 0SUjCPTJZAPAan5iJ9Cx4QC_eZKuVVOJ
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-01_04,2023-01-31_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 mlxlogscore=806 spamscore=0 suspectscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302010112
Received-SPF: pass client-ip=148.163.158.5; envelope-from=iii@linux.ibm.com;
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

On Mon, 2023-01-30 at 11:48 -1000, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Ilya Leoshkevich <iii@linux.ibm.com>
> ---
>  target/s390x/helper.h            |  2 --
>  target/s390x/tcg/insn-data.h.inc |  2 +-
>  target/s390x/tcg/mem_helper.c    | 52 ------------------------------
>  target/s390x/tcg/translate.c     | 55
> +++++++++++++++++++-------------
>  4 files changed, 33 insertions(+), 78 deletions(-)

Acked-by: Ilya Leoshkevich <iii@linux.ibm.com>

I wrote a test for this a while ago [1], but apparently it was lost in
the mail. I will post a rebased version here.

[1] https://lists.gnu.org/archive/html/qemu-devel/2022-11/msg04506.html

