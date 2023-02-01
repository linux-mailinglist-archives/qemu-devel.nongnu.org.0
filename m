Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71128686665
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 14:08:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNCqa-0008JD-VB; Wed, 01 Feb 2023 08:08:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1pNCqL-0008E6-93
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 08:08:08 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1pNCqJ-0000bL-2r
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 08:08:05 -0500
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 311Cmstf016755; Wed, 1 Feb 2023 13:08:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=UvaEmAhMrpwYD0H3KUBmYmUYxiMeK+wS7Jq7ml2Ew9c=;
 b=By3ZGIH1vewvAZZHlsj9YrUhsYnjoU1UAA2KWoF2DC7KmIAXdwb/ZuGVj6I5IbwKxfC7
 OglKuwfW9a1KzNc+7pXRIjJtTKHVaQMIebcekx60jG/dIYW9ioKpKLI2s1lKfCD40vHm
 U+xvsp+fm1wT88EUUdW/7k26p73OuOFC7EuoV5hVEk6pWPKOJRmc2DwX1y6p09eNlimI
 uyp48l+OHIr7tt+ICrpLUBnmiK56nl3LGOoIvPBaYcMm5QKwzK8q1kJde+oFMdWKtAz+
 yXrIxdF8dGu7CKiVCgorHWknrYC/HaS1Kfvj0hpO+8h3ZYjc82wNQWQ7h6oaZzFfjZPw RQ== 
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nfrdugen0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Feb 2023 13:08:01 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3116j6nt013346;
 Wed, 1 Feb 2023 13:07:59 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
 by ppma03fra.de.ibm.com (PPS) with ESMTPS id 3ncvshbg0a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Feb 2023 13:07:58 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com
 [10.20.54.106])
 by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 311D7uj629229368
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 1 Feb 2023 13:07:56 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 634E62004D;
 Wed,  1 Feb 2023 13:07:56 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3EBCE20040;
 Wed,  1 Feb 2023 13:07:56 +0000 (GMT)
Received: from [9.155.209.149] (unknown [9.155.209.149])
 by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Wed,  1 Feb 2023 13:07:56 +0000 (GMT)
Message-ID: <4db3d7ce4d835056e6ecc98f382174b06f80f7b3.camel@linux.ibm.com>
Subject: Re: [PATCH 1/4] cpus: Make {start,end}_exclusive() recursive
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>, Alex
 =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: Christian Borntraeger <borntraeger@linux.ibm.com>, qemu-devel@nongnu.org
Date: Wed, 01 Feb 2023 14:07:56 +0100
In-Reply-To: <20230201004609.3005029-2-iii@linux.ibm.com>
References: <20230201004609.3005029-1-iii@linux.ibm.com>
 <20230201004609.3005029-2-iii@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: RjSnf2DkYx2YWWMKkOn0-Sxio_O-zg4j
X-Proofpoint-ORIG-GUID: RjSnf2DkYx2YWWMKkOn0-Sxio_O-zg4j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-01_04,2023-01-31_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 spamscore=0 mlxlogscore=330
 mlxscore=0 adultscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302010112
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

On Wed, 2023-02-01 at 01:46 +0100, Ilya Leoshkevich wrote:
> Currently dying to one of the core_dump_signal()s deadlocks, because
> dump_core_and_abort() calls start_exclusive() two times: first via
> stop_all_tasks(), and then via preexit_cleanup() ->
> qemu_plugin_user_exit().
>=20
> There are a number of ways to solve this: resume after dumping core;
> check cpu_in_exclusive_context() in qemu_plugin_user_exit(); or make
> {start,end}_exclusive() recursive. Pick the last option, since it's
> the most straightforward one.
>=20
> Fixes: da91c1920242 ("linux-user: Clean up when exiting due to a
> signal")
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>

Hi,

I noticed that fork()ed CPUs start with in_exclusive_context set (in
this patch it is renamed to exclusive_context_count, but the point
stands). That was not important before, since only pending_cpus decided
what happens in start_exclusive()/end_exclusive(). Now that
exclusive_context_count is also important, we need something like:

--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -161,13 +161,15 @@ void fork_end(int child)
         }
         qemu_init_cpu_list();
         gdbserver_fork(thread_cpu);
-        /* qemu_init_cpu_list() takes care of reinitializing the
-         * exclusive state, so we don't need to end_exclusive() here.
-         */
     } else {
         cpu_list_unlock();
-        end_exclusive();
     }
+    /*
+     * qemu_init_cpu_list() reinitialized the child exclusive state,
but we
+     * also need to keep current_cpu consistent, so call
end_exclusive() for
+     * both child and parent.
+     */
+    end_exclusive();
 }
=20
 __thread CPUState *thread_cpu;
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 1f8c10f8ef9..70fad4bed01 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -6776,6 +6776,7 @@ static int do_fork(CPUArchState *env, unsigned
int flags, abi_ulong newsp,
             cpu_clone_regs_parent(env, flags);
             fork_end(0);
         }
+        g_assert(!cpu_in_exclusive_context(cpu));
     }
     return ret;
 }

I can include this in v2, if the overall recursive lock approach is
considered appropriate.

Best regards,
Ilya

