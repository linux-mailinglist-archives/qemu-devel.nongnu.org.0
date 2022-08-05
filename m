Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E7CA58A9A3
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 12:46:08 +0200 (CEST)
Received: from localhost ([::1]:40702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJuqE-0008CN-Ka
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 06:46:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1oJuZQ-0003dw-EO; Fri, 05 Aug 2022 06:28:44 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:14604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1oJuZM-0001A4-Te; Fri, 05 Aug 2022 06:28:44 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 275AL2xq005017;
 Fri, 5 Aug 2022 10:28:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=f3VvH4NZWqU3cSdVyWaE6mQozfj6VBRpH6LBRL9vjZE=;
 b=a7uWpnaKQyzHDAJgSK3mGZR6Ez/kKupCMYGzZ1VVvyc9jQJFR5lzbBzUIFVs5EtMsf59
 4i3wrNBR0kYKGK25CvWpiAYcmvri2yuFOG2qf9jESTubf7jMAVlaLUCXoWeO7JCMyr+Z
 j/0jq7wXpu6JJ7wSQqRdXM7P9bRbDEA1le1V6QmqiMbgsD4RxKNeIP1blXB+ZmecxjIg
 5SX7AW/kTuYYeAK85OiTum3cdhTZwSIvjfn8huz1xQWm3HV8MYJsd75JFd5pQScgocZV
 6EE/YFbvY3CbelC7Cy47+yFZlJp86tt2UIEAdV0nWr6gKP5MGU9VWvwxkXj2AUOdBL3L YA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hs1c905y6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Aug 2022 10:28:32 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 275ALZ5c005674;
 Fri, 5 Aug 2022 10:28:31 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hs1c905x9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Aug 2022 10:28:31 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 275AM2G4006386;
 Fri, 5 Aug 2022 10:28:29 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma03ams.nl.ibm.com with ESMTP id 3hmv98y90r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Aug 2022 10:28:29 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 275ASRxj29360492
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 5 Aug 2022 10:28:27 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 279EE4203F;
 Fri,  5 Aug 2022 10:28:27 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 90AA642041;
 Fri,  5 Aug 2022 10:28:26 +0000 (GMT)
Received: from [9.171.89.138] (unknown [9.171.89.138])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  5 Aug 2022 10:28:26 +0000 (GMT)
Message-ID: <6aafa461732e7c98670c0e9c765cc95a5d88e8f0.camel@linux.ibm.com>
Subject: Re: [PATCH 1/2] linux-user: Fix siginfo_t contents when jumping to
 non-readable pages
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Laurent Vivier <laurent@vivier.eu>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>, Yanan Wang
 <wangyanan55@huawei.com>, Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org, Christian Borntraeger <borntraeger@linux.ibm.com>
Date: Fri, 05 Aug 2022 12:28:26 +0200
In-Reply-To: <CAFEAcA9FG+b4=-QNujG5Prx_me8uw7YTWjk-mqr3_X1Wb0wHzg@mail.gmail.com>
References: <20220804182359.830058-1-iii@linux.ibm.com>
 <20220804182359.830058-2-iii@linux.ibm.com>
 <CAFEAcA9FG+b4=-QNujG5Prx_me8uw7YTWjk-mqr3_X1Wb0wHzg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 5nrwMDKNpj9X0r37X5knwcgiTvRY4b9g
X-Proofpoint-ORIG-GUID: 6Sfe8QK2vqK6pPOS_8fwb_xBjonDpju-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-05_03,2022-08-05_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 spamscore=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 impostorscore=0 phishscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2208050049
Received-SPF: pass client-ip=148.163.158.5; envelope-from=iii@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
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

On Fri, 2022-08-05 at 09:50 +0100, Peter Maydell wrote:
> On Thu, 4 Aug 2022 at 19:50, Ilya Leoshkevich <iii@linux.ibm.com>
> wrote:
> > 
> > When the first instruction of a translation block is located in a
> > non-readable page, qemu-user fills siginfo_t correctly. For the
> > other
> > instructions the result is as if it were the first instruction,
> > which
> > is not correct.
> > 
> > The reason is that the current logic expects translate_insn() hook
> > to
> > stop at the page boundary. This way only the first instruction can
> > cause a SEGV. However, this is quite difficult to properly
> > implement
> > when the problematic instruction crosses a page boundary, and
> > indeed
> > the actual implementations do not do this. Note that this can also
> > break self-modifying code detection when only bytes on the second
> > page
> > are modified, but this is outside of the scope of this patch.
> 
> Which guests do you observe this on ? I think we should indeed
> fix this in the translators. More specifically, I think we should
> get this correct already on Arm, and I would expect it to work
> correctly on all the fixed-insn-width architectures, which can't
> have page-crossing-insns to start with. x86 probably gets this wrong.
> 
> thanks
> -- PMM

I first discovered this on s390x, and then realized x86_64 is broken as
well. Fixing this in translators means adding page boundary checks to
all code loads. Actually, on s390x it doesn't look as nasty as I
thought it would, since we quickly figure out the length and load
everything in one place:

$ grep ld.*code target/s390x/tcg/translate.c | wc -l
6

On x86_64 it's as bad as expected:

$ grep x86_ld.*code target/i386/tcg/translate.c | wc -l
96

Implementing this there would mean changing x86_ldub_code() and friends
to macros, and then making sure we undo everything that we did since
the start of the instruction. E.g. bt/bts/btr/btc mix parsing and
op emission. There might be something that touches DisasContext as
well. Therefore I thought that the generic approach from this patch
would be more reliable.

