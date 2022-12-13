Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7761D64B9E5
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 17:37:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p58Gb-0007ov-GL; Tue, 13 Dec 2022 11:36:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1p58GQ-0007nK-A6
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 11:36:19 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1p58GA-0003Of-1q
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 11:36:09 -0500
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BDG8mGB017499; Tue, 13 Dec 2022 16:35:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=Ko4LjSpt8W17cfxWuMP61HqGs1ZQp+fj0+zcgmI3orA=;
 b=fwYSKrEjDVWgYgLO1Om9FzApplmHCGdxyQyCxjSEw1keAu2fsZoo/PB8rWwcaDSC7fVn
 RI2eBbvsxENzbop0w+Cs/6w5AAbulvdrwf08AFWAEFsjQP8AQuPkCEsW5sykxpL3X85g
 mUTCpgdy4GLYINzA0wd6B6Tx6RnZr6281oMNWhh+nf8OLo3sqZjl/ATUJFQ06beaIIcQ
 +ZR/0S4tnHg4GMEfORhuSWcGKlkmzSgW1cIj1IBa44PNkhwSnccfEXmcDKC3GX0DWg2O
 2s3YUtmlsKLTT7FxXYnWZ2stRLLI6g6MP+mcK2EwKS/JMJdjOlDLXelwaPxan3DWT9lm vg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3mevnegum9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Dec 2022 16:35:44 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2BDGJ75U029652;
 Tue, 13 Dec 2022 16:35:43 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3mevnegujq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Dec 2022 16:35:43 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.17.1.19/8.16.1.2) with ESMTP id 2BD6RQxP029015;
 Tue, 13 Dec 2022 16:35:41 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
 by ppma06fra.de.ibm.com (PPS) with ESMTPS id 3mchceu7uy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Dec 2022 16:35:41 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com
 [10.20.54.106])
 by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2BDGZdqF35586402
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 13 Dec 2022 16:35:39 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1AB4020049;
 Tue, 13 Dec 2022 16:35:39 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AC86620043;
 Tue, 13 Dec 2022 16:35:38 +0000 (GMT)
Received: from heavy (unknown [9.179.23.216])
 by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTPS;
 Tue, 13 Dec 2022 16:35:38 +0000 (GMT)
Date: Tue, 13 Dec 2022 17:35:37 +0100
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: thuth@redhat.com
Subject: Re: [PATCH v4 00/27] tcg/s390x: misc patches
Message-ID: <20221213163537.esgnm3t2t624gxqt@heavy>
References: <20221209020530.396391-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221209020530.396391-1-richard.henderson@linaro.org>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: _21_Q7HYRk1RwzWBa4jPMJZQ3vXx_hoj
X-Proofpoint-ORIG-GUID: uyHe5uYreS4FbTLGoyZNK4tTUypuZMCV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-13_03,2022-12-13_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0
 impostorscore=0 mlxlogscore=999 priorityscore=1501 phishscore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212130147
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

On Thu, Dec 08, 2022 at 08:05:03PM -0600, Richard Henderson wrote:
> Based-on: 20221202053958.223890-1-richard.henderson@linaro.org
> ("[PATCH for-8.0 v3 00/34] tcg misc patches")
> 
> Changes from v3:
>   * Require z196 as minimum cpu -- 6 new patches removing checks.
>   * Tighten constraints on AND, OR, XOR, CMP, trying get the register
>     allocator to hoist things that can't be done in a single insn.
>   * Avoid the constant pool for movi.
> 
> I believe that I have addressed all of the discussion in v3,
> except perhaps for goto_tb concurrent modifications to jumps.
> I'm still not quite sure what to do about that.

I asked around, and apparently some other JITs (e.g. Java and .NET) are
doing atomic branch offset patching (provided the offset is aligned,
which QEMU does already ensure) on s390x for a long time now, and
without known issues. So I'm okay with keeping this code as is.

<...>

Best regards,
Ilya

