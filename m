Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3BE8598B3C
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Aug 2022 20:32:50 +0200 (CEST)
Received: from localhost ([::1]:56346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOkK1-0004NY-Kt
	for lists+qemu-devel@lfdr.de; Thu, 18 Aug 2022 14:32:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1oOkGR-0002cy-A7; Thu, 18 Aug 2022 14:29:07 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:3424
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1oOkGP-0004Al-6s; Thu, 18 Aug 2022 14:29:07 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27IIRS0v019835;
 Thu, 18 Aug 2022 18:28:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=Luggojym6lnMWHJnU6HeK4WJrCSeNhTnWC1cURRzC34=;
 b=FLtB+ctSqujrSNl01zn+obvkgf3qp4GZ+z0vpSagkV5nAV+C8gRyc8xv+K0HlOeggXNL
 Gf1acINP2rCTK/NHr5jxqGME9BgeFkqpa9DyTeTyo1aRPQmOuEuIMJSagJkV9qNCaTH4
 fMYfr4hixLNs8wdTQDF94wmBH0hHQLx41pcd794WunwczzwRLFspwAn6iw0tA4l+GrcS
 39GCbD4o63OrcNLbWQ33K3yjBJ2cojuaILCI7seZAfZchpAJiDZThHowctV1eR1fo/eM
 adftIb4oLoawStrzSQJ4ahG3VDqhu94LjnGUFYSmmQ9EBkoN1TNDxLZld2zbBzdvPPiI Cg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3j1tqf81x5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Aug 2022 18:28:45 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27IIRYW1020100;
 Thu, 18 Aug 2022 18:28:44 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3j1tqf81v9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Aug 2022 18:28:44 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27IIKhlH004856;
 Thu, 18 Aug 2022 18:28:42 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04fra.de.ibm.com with ESMTP id 3hx3k8vnf0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Aug 2022 18:28:42 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 27IIPpO932178556
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 18 Aug 2022 18:25:51 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0268CA4053;
 Thu, 18 Aug 2022 18:28:40 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 57917A4051;
 Thu, 18 Aug 2022 18:28:39 +0000 (GMT)
Received: from [9.171.16.188] (unknown [9.171.16.188])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 18 Aug 2022 18:28:39 +0000 (GMT)
Message-ID: <87c1495f29d7f3c04ec0c863aada8b87947a140e.camel@linux.ibm.com>
Subject: Re: [PATCH v5 0/4] linux-user: Fix siginfo_t contents when jumping
 to non-readable pages
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Vivian Wang <dramforever@live.com>, Laurent Vivier <laurent@vivier.eu>,
 Eduardo Habkost <eduardo@habkost.net>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?=
 <f4bug@amsat.org>, Yanan Wang <wangyanan55@huawei.com>, Richard Henderson
 <richard.henderson@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>, David
 Hildenbrand <david@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-s390x@nongnu.org, Christian Borntraeger
 <borntraeger@linux.ibm.com>
Date: Thu, 18 Aug 2022 20:28:39 +0200
In-Reply-To: <TYYP286MB1439C85770DC0C4AA39550BAC66D9@TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM>
References: <20220817150506.592862-1-iii@linux.ibm.com>
 <TYYP286MB1439C85770DC0C4AA39550BAC66D9@TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35) 
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: y_BepSi1Kdz7rE9puAuY4gqBhxfb_v6y
X-Proofpoint-ORIG-GUID: FlZJ_0DaopfxDy2SGr-zRdAmhEpuIejc
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-18_14,2022-08-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0
 clxscore=1015 priorityscore=1501 mlxlogscore=999 lowpriorityscore=0
 spamscore=0 mlxscore=0 phishscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208180065
Received-SPF: pass client-ip=148.163.158.5; envelope-from=iii@linux.ibm.com;
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

On Fri, 2022-08-19 at 00:55 +0800, Vivian Wang wrote:
> Hi,
> Could this be related to issue 1155 [1]? On RISC-V, I'm getting
> incorrect [m|s]tval/[m|s]epc combinations for page faults in system
> emulation and incorrect si_addr and program counter on SIGSEGV in
> user emulation. Since it seems to only affect instructions that cross
> page boundaries, and RISC-V also has variable length instructions, it
> seems that I've run into the same problem as what is fixed here.
> Could this fix be extended be extended to targets/riscv?
> dram
> [1]: https://gitlab.com/qemu-project/qemu/-/issues/1155

Yes, this looks quite similar.
I'm not too familiar with riscv, but I just googled [1].
If the following is correct:

---
However, the instruction set reserves enough opcode space to make it
possible to differentiate between 16-bit, 32-bit, 48-bit, and 64-bit
instructions.  Instructions that start with binary 11 (in the lowest
bit position of the instruction) are 32-bit sized instructions (but one
pattern is reserved: so they cannot start with 11111).  The compact
instructions use 00, 01, and 10 in that same position.  48-bit
instructions use starting sequence 011111, and 64-bit instructions
start with 0111111.
---

then we can fix this the same way s390x is being fixed here.

[1]
https://stackoverflow.com/questions/56874101/how-does-risc-v-variable-length-of-instruction-work-in-detail

