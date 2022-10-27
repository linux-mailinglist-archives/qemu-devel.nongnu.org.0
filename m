Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B74560FA4E
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 16:22:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo3jF-0007nI-MW; Thu, 27 Oct 2022 10:19:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1oo3iv-0007jA-IC
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 10:19:25 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1oo3it-0007xz-2n
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 10:19:08 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29RE4TpV020620;
 Thu, 27 Oct 2022 14:19:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=pp1;
 bh=zDkI6UffU6lyCHRGbeXHktCqC7HkeIGq6NrAPmFMPok=;
 b=pddjaY2I0u55Jw0USlb4ATgWZ7jd0oV01sxXHr9WetZBI5qPZft96LnTsWhiwQR6j65X
 cTOUFJGcI2dnHX9J3dw3NKep36bFARBxcJy15ZWVryc7aqxUEjATdHsETv0DvwuG2Ezy
 yosZlGG3FCu2Ro9Aknz/IK6st2hEFZeVdUmJKiCXb9aXdAmAI8fA9YK0KGsVmt7f6Psq
 Az4pOGhW6O3y/zDFGW/exIQkmHwhIT9VitmbNXVS+9ZHsMHoq0mX8ePKUn25aZw8gAF0
 T7nEyLEUdAj8pOXhoLsIJ7pikV0YKx2y+KMSFA+74mlJc6veXvLrfoDhue8GpTyk02e2 4Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3kfu4qsgmq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Oct 2022 14:19:03 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29REG6ko032308;
 Thu, 27 Oct 2022 14:19:03 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3kfu4qsgkr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Oct 2022 14:19:02 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29RE65ej002514;
 Thu, 27 Oct 2022 14:19:01 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma04ams.nl.ibm.com with ESMTP id 3kftf1r3tb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Oct 2022 14:19:01 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 29REIwdB20382212
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 27 Oct 2022 14:18:58 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AEE794C046;
 Thu, 27 Oct 2022 14:18:58 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 630704C04A;
 Thu, 27 Oct 2022 14:18:58 +0000 (GMT)
Received: from heavy (unknown [9.171.39.72])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Thu, 27 Oct 2022 14:18:58 +0000 (GMT)
Date: Thu, 27 Oct 2022 16:18:56 +0200
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: stefanha@redhat.com, Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PULL 15/20] include/hw/core: Create struct CPUJumpCache
Message-ID: <20221027141856.w5umjgklawgu7pqv@heavy>
References: <20221004195241.46491-1-richard.henderson@linaro.org>
 <20221004195241.46491-16-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221004195241.46491-16-richard.henderson@linaro.org>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Pmxpt1_2gry-HHMgRKsU5AKaHdFW2kL9
X-Proofpoint-ORIG-GUID: fPAK49yrQYTI67oas8CQzwuA3IhIeYhk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-27_07,2022-10-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0
 mlxlogscore=999 suspectscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2210270076
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Oct 04, 2022 at 12:52:36PM -0700, Richard Henderson wrote:
> Wrap the bare TranslationBlock pointer into a structure.
> 
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  accel/tcg/tb-hash.h       |  1 +
>  accel/tcg/tb-jmp-cache.h  | 24 ++++++++++++++++++++++++
>  include/exec/cpu-common.h |  1 +
>  include/hw/core/cpu.h     | 15 +--------------
>  include/qemu/typedefs.h   |  1 +
>  accel/stubs/tcg-stub.c    |  4 ++++
>  accel/tcg/cpu-exec.c      | 10 +++++++---
>  accel/tcg/cputlb.c        |  9 +++++----
>  accel/tcg/translate-all.c | 28 +++++++++++++++++++++++++---
>  hw/core/cpu-common.c      |  3 +--
>  plugins/core.c            |  2 +-
>  trace/control-target.c    |  2 +-
>  12 files changed, 72 insertions(+), 28 deletions(-)
>  create mode 100644 accel/tcg/tb-jmp-cache.h

Hi,

After this patch, I get:

    qemu-s390x: qemu/include/qemu/rcu.h:102: rcu_read_unlock: Assertion `p_rcu_reader->depth != 0' failed.

in one of the wasmtime tests (host=x86_64, guest=s390x).
GDB shows that the root cause is actually this:

    Thread 181 "wasi_tokio::pat" received signal SIGSEGV, Segmentation fault.
    [Switching to Thread 0x7ffff6c54640 (LWP 168352)]
    0x0000555555626736 in do_tb_phys_invalidate (tb=tb@entry=0x7fffea4b8500 <code_gen_buffer+38503635>, rm_from_page_list=rm_from_page_list@entry=true) at qemu/accel/tcg/translate-all.c:1192
    1192	        if (qatomic_read(&jc->array[h].tb) == tb) {
    (gdb) bt
    #0  0x0000555555626736 in do_tb_phys_invalidate (tb=tb@entry=0x7fffea4b8500 <code_gen_buffer+38503635>, rm_from_page_list=rm_from_page_list@entry=true) at qemu/accel/tcg/translate-all.c:1192
    #1  0x0000555555626b98 in tb_phys_invalidate__locked (tb=0x7fffea4b8500 <code_gen_buffer+38503635>) at qemu/accel/tcg/translate-all.c:1211
    #2  tb_invalidate_phys_page_range__locked (p=<optimized out>, start=start@entry=836716683264, end=end@entry=836716687360, retaddr=0, pages=0x0) at qemu/accel/tcg/translate-all.c:1678
    #3  0x0000555555626dfb in tb_invalidate_phys_range (start=836716683264, start@entry=836716584960, end=end@entry=836716982272) at qemu/accel/tcg/translate-all.c:1753
    #4  0x0000555555639e43 in target_munmap (start=start@entry=836716584960, len=len@entry=397312) at qemu/linux-user/mmap.c:769

Let me know if you need more information, I can try to extract a
minimal reproducer.

Best regards,
Ilya

