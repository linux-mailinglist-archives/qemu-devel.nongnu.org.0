Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AF4F6E10CA
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Apr 2023 17:15:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmyeI-0003M3-BQ; Thu, 13 Apr 2023 11:14:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sbhat@linux.ibm.com>)
 id 1pmyeE-0003LS-Vl; Thu, 13 Apr 2023 11:14:07 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sbhat@linux.ibm.com>)
 id 1pmyeC-0006qv-JY; Thu, 13 Apr 2023 11:14:06 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33DEbjEh027445; Thu, 13 Apr 2023 15:13:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : from : to : cc
 : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=HcNE87o0f0C+/KDhMsNvMltg4rU/Zv0SfTFvCiZuAWo=;
 b=L/Z6B953UK+N8ZZVzUQz0nAX5gXF0/oUkFPp/kSyRBt85yFKXRh783gLhhD3CddxvheG
 EWBNTgwSENnbcR98NfnMMn9AJGlFM6ixM8O8P3QwRY3z/R74pEaJJF3pUCVgQma+JmIn
 dk/orNb2Dnig8YaJnCqfH0PicO5Nmrv+Fzn94jUoxKeGuURGGw87HRVGVUcWkPIL+ERp
 ZMYf6hKqNOTEabXBssgcgiFtV8vAMfPk3vgtWkGyX4v4wVCzcDuFXCAwzbXD0k8wA80u
 SqfwgbcWT056KnrVr3RiFShkVUDv9I25h6mnpWrFMTMAhW6sPMHSwXC81X2pxdwvEDHz Cw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pxjn0d63w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Apr 2023 15:13:47 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33DDV020010905;
 Thu, 13 Apr 2023 15:13:47 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pxjn0d62m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Apr 2023 15:13:47 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 33D2xqjb003977;
 Thu, 13 Apr 2023 15:13:44 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
 by ppma02fra.de.ibm.com (PPS) with ESMTPS id 3pu0h5tkk6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Apr 2023 15:13:44 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com
 [10.20.54.105])
 by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 33DFDgeX39911948
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 13 Apr 2023 15:13:42 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5DDD020043;
 Thu, 13 Apr 2023 15:13:42 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BF64220040;
 Thu, 13 Apr 2023 15:13:40 +0000 (GMT)
Received: from ltc-boston1.aus.stglabs.ibm.com (unknown [9.40.193.18])
 by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Thu, 13 Apr 2023 15:13:40 +0000 (GMT)
Subject: [PATCH 1/2] tcg: ppc64: Fix mask generation for vextractdm
From: Shivaprasad G Bhat <sbhat@linux.ibm.com>
To: philmd@linaro.org, richard.henderson@linaro.org, danielhb413@gmail.com,
 lucas.araujo@eldorado.org.br, qemu-ppc@nongnu.org, clg@kaod.org,
 david@gibson.dropbear.id.au, groug@kaod.org, qemu-ppc@nongnu.org
Cc: john_platts@hotmail.com, sbhat@linux.ibm.com, qemu-devel@nongnu.org
Date: Thu, 13 Apr 2023 15:01:01 -0400
Message-ID: <168141245022.3026479.1619179446205380588.stgit@ltc-boston1.aus.stglabs.ibm.com>
In-Reply-To: <168141244011.3026479.13697197743885252330.stgit@ltc-boston1.aus.stglabs.ibm.com>
References: <168141244011.3026479.13697197743885252330.stgit@ltc-boston1.aus.stglabs.ibm.com>
User-Agent: StGit/1.5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: N5J1HaLOCk2ZigvGhUaL2HtuBlYhHBYl
X-Proofpoint-GUID: edl9RAQdxJFsCUMPlpGODDWTTIkh4IVQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-13_10,2023-04-13_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 mlxlogscore=999 malwarescore=0
 spamscore=0 mlxscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304130134
Received-SPF: pass client-ip=148.163.156.1; envelope-from=sbhat@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: 10
X-Spam_score: 1.0
X-Spam_bar: +
X-Spam_report: (1.0 / 5.0 requ) BAYES_00=-1.9, DATE_IN_FUTURE_03_06=3.027,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

In function do_extractm() the mask is calculated as
dup_const(1 << (element_width - 1)). '1' being signed int
works fine for MO_8,16,32. For MO_64, on PPC64 host
this ends up becoming 0 on compilation. The vextractdm
uses MO_64, and it ends up having mask as 0.

Explicitly use 1ULL instead of signed int 1 like its
used everywhere else.

Signed-off-by: Shivaprasad G Bhat <sbhat@linux.ibm.com>
---
 target/ppc/translate/vmx-impl.c.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/vmx-impl.c.inc
index 112233b541..c8712dd7d8 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -2058,7 +2058,7 @@ static bool trans_VEXPANDQM(DisasContext *ctx, arg_VX_tb *a)
 static bool do_vextractm(DisasContext *ctx, arg_VX_tb *a, unsigned vece)
 {
     const uint64_t elem_width = 8 << vece, elem_count_half = 8 >> vece,
-                   mask = dup_const(vece, 1 << (elem_width - 1));
+                   mask = dup_const(vece, 1ULL << (elem_width - 1));
     uint64_t i, j;
     TCGv_i64 lo, hi, t0, t1;
 



