Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D91E561576
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jun 2022 10:53:45 +0200 (CEST)
Received: from localhost ([::1]:33298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6pvj-0006ea-59
	for lists+qemu-devel@lfdr.de; Thu, 30 Jun 2022 04:53:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <svens@linux.ibm.com>)
 id 1o6ppg-00042m-H6; Thu, 30 Jun 2022 04:47:28 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:15952
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <svens@linux.ibm.com>)
 id 1o6ppe-0001xi-Cp; Thu, 30 Jun 2022 04:47:28 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25U7cTIs018366;
 Thu, 30 Jun 2022 08:47:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : references : date : in-reply-to : message-id : mime-version :
 content-type; s=pp1; bh=O3Ghtke8P8c5jDK5oE79xurpUppNQpfGxqrYg9b5TwE=;
 b=TDBfTyD7GU9/f0d6WRZ+wr37WbHPur3twJFZNlo8DSCdL70iSxPOtWcAWZgUk4FlQMJZ
 oXBm89MZ92pz3yf8HWiGlsRekuAzTSLwmmzm9Tknl/aiDGvCmYSbV9ZcquGr5YsF0um3
 9r0hgIIPsEM06wwxf0R9wZs0+RzVv2Q0J42PDRb0tpFWqJT2FZ8pf7wkRkpz2M6ol8Bf
 Mhp08dS9qiIk5tqPPjxtYniBMruUTCMBOpc8z7rmQJbfixI4BjeTD0YbmQNEVYVN/9Jj
 gLrr4LE2sjMdKY9rbJx/f12wHjbX7vrKcaytlxizJ+IW678qY3uSXenuhclCH1rrnCss xg== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3h17ch2ag3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Jun 2022 08:47:21 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25U8ZCaA005485;
 Thu, 30 Jun 2022 08:47:19 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma03ams.nl.ibm.com with ESMTP id 3gwt08yrkm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Jun 2022 08:47:19 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 25U8lHNs25362758
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 30 Jun 2022 08:47:17 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2418EAE051;
 Thu, 30 Jun 2022 08:47:17 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F3A6EAE045;
 Thu, 30 Jun 2022 08:47:16 +0000 (GMT)
Received: from tuxmaker.linux.ibm.com (unknown [9.152.85.9])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Thu, 30 Jun 2022 08:47:16 +0000 (GMT)
From: Sven Schnelle <svens@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-s390x@nongnu.org
Subject: Re: [PATCH] target/s390x: Exit tb after executing ex_value
References: <20220630031635.271353-1-richard.henderson@linaro.org>
Date: Thu, 30 Jun 2022 10:47:17 +0200
In-Reply-To: <20220630031635.271353-1-richard.henderson@linaro.org> (Richard
 Henderson's message of "Thu, 30 Jun 2022 08:46:35 +0530")
Message-ID: <yt9dtu82fsh6.fsf@linux.ibm.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.0.50 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: PchE54vl9whzIZjXrL6TnDj0UEJTrTxE
X-Proofpoint-ORIG-GUID: PchE54vl9whzIZjXrL6TnDj0UEJTrTxE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-30_05,2022-06-28_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 mlxlogscore=313
 lowpriorityscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 clxscore=1015 mlxscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2204290000 definitions=main-2206300031
Received-SPF: pass client-ip=148.163.158.5; envelope-from=svens@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Richard,

Richard Henderson <richard.henderson@linaro.org> writes:

> When EXECUTE sets ex_value to interrupt the constructed instruction,
> we implicitly disable interrupts so that the value is not corrupted.
> Exit to the main loop after execution, so that we re-evaluate any
> pending interrupts.
>
> Reported-by: Sven Schnelle <svens@linux.ibm.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>
> Hi Sven.  Will you test this vs your testcase?  Thanks,

Of course, i'm happy if someone fixes this so i don't have to. :-)

Unfortunately it doesn't fix the issue:

exec_tb_exit tb:(nil) flags=0x0
exec_tb tb:0x3ff35c66f00 pc=0x400
exec_tb tb:0x3ff3410f300 pc=0x1edf7f8
tcg_handle_interrupt: 2
exec_tb_exit tb:0x3ff340d2d00 flags=0x3
ignoring irq during EX
ignoring irq during EX
exec_tb tb:0x3ff340d2d00 pc=0x1edf810

writing dc->base.is_jmp to the qemu log shows:

s390x_tr_translate_insn: is_jmp: 3
s390x_tr_translate_insn: is_jmp: 3
s390x_tr_translate_insn: is_jmp: 3
s390x_tr_translate_insn: is_jmp: 3
s390x_tr_translate_insn: is_jmp: 3
s390x_tr_translate_insn: is_jmp: 3
[..]

So is_jump is always 3, which is DISAS_TARGET_0. I think the
if (dc->base.is_jmp == DISAS_NEXT) condition therefore never matches.


