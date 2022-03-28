Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C7344E9A3D
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 16:58:20 +0200 (CEST)
Received: from localhost ([::1]:48184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYqp1-0006q1-5I
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 10:58:19 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nYqmv-0005Hf-Jq; Mon, 28 Mar 2022 10:56:16 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:12438)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nYqmp-00059B-RE; Mon, 28 Mar 2022 10:56:09 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22SDodrY024537; 
 Mon, 28 Mar 2022 14:55:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : content-type :
 mime-version; s=pp1; bh=zG2ocVOdM9PtZe/ZMM73Vk3RSlZpu73VzTP9pdKxDVs=;
 b=izSOnREWAmo9p0i6C+dyOVzBmolajeAdE+2G1aEk5gUNtKPQAixWPciA7l/AQmaF6129
 2/QXhzcihQEVpYTHwYNHi0AfdynSH7x8lQ8cGnnV9aBqdREuUH6HVNBLjuzsEgOX8Qjt
 Qkdo3hZWuwVwvsi/ynW1CdDnNnCEurMCuFD3tWaDcIYm3N+6RfJp7XpAOGbAkAJMBHER
 +AaHLcbBGYHmQNjN20B4ED6vljiT59NunxRT8u2ZkT6lChbOl61O8rljw6O+BKHsQS9N
 Om2OyoS80LrLZP5fLDwGQfV3W5/pjVulLToLru31P+R28LgcMLQsWKfw9Fxob6YB7yEd FQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3f3e8u1f3s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Mar 2022 14:55:45 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22SELid4024964;
 Mon, 28 Mar 2022 14:55:44 GMT
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3f3e8u1f30-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Mar 2022 14:55:44 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22SErRvL009650;
 Mon, 28 Mar 2022 14:54:42 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma02wdc.us.ibm.com with ESMTP id 3f1tf95xc9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Mar 2022 14:54:42 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22SEsgA724510934
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 28 Mar 2022 14:54:42 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 795E7AC05E;
 Mon, 28 Mar 2022 14:54:42 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CA3F0AC059;
 Mon, 28 Mar 2022 14:54:41 +0000 (GMT)
Received: from localhost (unknown [9.160.110.254])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTPS;
 Mon, 28 Mar 2022 14:54:41 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>, Leandro Lupori
 <leandro.lupori@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Subject: Re: [RFC PATCH 0/6] Port PPC64/PowerNV MMU tests to QEMU
In-Reply-To: <b232c4e6-61ba-0dc9-e2d0-53b4ad7cc93a@linaro.org>
References: <20220324190854.156898-1-leandro.lupori@eldorado.org.br>
 <b232c4e6-61ba-0dc9-e2d0-53b4ad7cc93a@linaro.org>
Date: Mon, 28 Mar 2022 11:54:39 -0300
Message-ID: <878rsuf7ps.fsf@linux.ibm.com>
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: vSEm6SHzATLKFNmZXS8R-lrQ0bYd_TQz
X-Proofpoint-ORIG-GUID: luGM81W9H6gg1PNZaw2vmPOX_q9JRbnE
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-28_06,2022-03-28_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 phishscore=0
 mlxscore=0 spamscore=0 priorityscore=1501 clxscore=1015 mlxlogscore=888
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203280084
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: danielhb413@gmail.com, groug@kaod.org, clg@kaod.org, pbonzini@redhat.com,
 alex.bennee@linaro.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Richard Henderson <richard.henderson@linaro.org> writes:

> On 3/24/22 13:08, Leandro Lupori wrote:
>> To be able to finish the test and return an exit code to the
>> calling process, the Processor Attention instruction is used.
>> As its behavior is implementation dependent, in QEMU PowerNV
>> it just calls exit with GPR[3] value, truncated to an uint8_t.
>
> I think you're simply thinking too small here, and should consider using the attn 
> instruction to implement a full -semihosting interface.  You might as well join arm and 
> riscv with CONFIG_ARM_COMPATIBLE_SEMIHOSTING.

I can't reach the semihosting docs at:
https://static.docs.arm.com/100863/0200/semihosting.pdf

Do we need to replace that URL with something else?

>
>
> r~

