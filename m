Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB0D6C1B43
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 17:22:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peIGc-0002LN-52; Mon, 20 Mar 2023 12:21:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imbrenda@linux.ibm.com>)
 id 1peIGK-00028i-Ep
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 12:21:35 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imbrenda@linux.ibm.com>)
 id 1peIGH-00071E-C7
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 12:21:31 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32KF6Yre024151; Mon, 20 Mar 2023 16:21:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=fm5IcbjH2AJp/R1Un8bmLF16+H/UgqGAD14mxprdAC8=;
 b=S0SS/OKP/5jM39vPgjKfnYoUbOT2dP/QpkHimHOzjK+BXB5jK5ZSthvFd+565ndJS3na
 hctAbU5aUIo/t3YsF8wDRbdaozm8f5kSzDeK2Qd4YVUqdOcf4LrL/Q/r5/7UGiQIvBL5
 Am5PZGb+K63D268blMXps01cJR/hXJKVVR772d5m36q2VutKQXulN7baHwaAdKLUBiSN
 eCTexhHNNvj6be2g9RgOjmg/Mb1QNDEghIAkcs3LFrszjXlcSfo8Rk26Rtc9Q+A46C/Z
 8Cme1FDU32d3bQZya+SMlusAt5706Mh+KhrbnRGKyUipDliidjkxZ+OLLbey8/86KSHB Rg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3per7dn9qu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Mar 2023 16:21:26 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32KGIkAe016358;
 Mon, 20 Mar 2023 16:21:25 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3per7dn9q4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Mar 2023 16:21:25 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32K47Dre015074;
 Mon, 20 Mar 2023 16:21:23 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
 by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3pd4jfbgke-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Mar 2023 16:21:23 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com
 [10.20.54.103])
 by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32KGLJgQ16450232
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 20 Mar 2023 16:21:19 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5B5B72004D;
 Mon, 20 Mar 2023 16:21:19 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0742120040;
 Mon, 20 Mar 2023 16:21:19 +0000 (GMT)
Received: from p-imbrenda (unknown [9.152.224.56])
 by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Mon, 20 Mar 2023 16:21:18 +0000 (GMT)
Date: Mon, 20 Mar 2023 17:21:17 +0100
From: Claudio Imbrenda <imbrenda@linux.ibm.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, pbonzini@redhat.com, qemu-devel@nongnu.org,
 david@redhat.com, borntraeger@de.ibm.com, frankja@linux.ibm.com,
 fiuczy@linux.ibm.com, pasic@linux.ibm.com, berrange@redhat.com,
 alex.bennee@linaro.org
Subject: Re: [PATCH v2 1/1] util/async-teardown: wire up
 query-command-line-options
Message-ID: <20230320172117.44df0fc9@p-imbrenda>
In-Reply-To: <87355zmmrw.fsf@pond.sub.org>
References: <20230320131648.61728-1-imbrenda@linux.ibm.com>
 <20230320131648.61728-2-imbrenda@linux.ibm.com>
 <87v8ivmocr.fsf@pond.sub.org>
 <6a9ef526-1b30-e9a6-37ee-59ca3dadea9d@redhat.com>
 <87355zmmrw.fsf@pond.sub.org>
Organization: IBM
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ieg96tFSenlo1G3BIMIG5SVmg1pk5Om7
X-Proofpoint-ORIG-GUID: hqkFevfFWN5c1OeiA3k0LEAboqC9iQ4R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-20_12,2023-03-20_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0
 malwarescore=0 impostorscore=0 spamscore=0 mlxlogscore=999
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 mlxscore=0
 clxscore=1015 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303200136
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=imbrenda@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Mon, 20 Mar 2023 17:05:07 +0100
Markus Armbruster <armbru@redhat.com> wrote:

> Thomas Huth <thuth@redhat.com> writes:
> 
> > On 20/03/2023 16.31, Markus Armbruster wrote:  
> >> Claudio Imbrenda <imbrenda@linux.ibm.com> writes:
> >>   
> >>> The recently introduced -async-teardown commandline option was not
> >>> wired up properly and did not show up in the output of the QMP command
> >>> query-command-line-options. This means that libvirt will have no way to
> >>> discover whether the feature is supported.  
> >> 
> >> There was nothing improper in its wiring.  The issue is that
> >> query-command-line-options is junk.  See my recent post
> >> 
> >>      Subject: query-command-line-options (was: [PATCH 1/7] qemu: capabilities: Introduce QEMU_CAPS_MACHINE_ACPI)
> >>      Date: Tue, 07 Mar 2023 10:40:23 +0100
> >>      Message-ID: <87jzzsc320.fsf_-_@pond.sub.org>
> >>   
> >>> This patch fixes the issue by correctly wiring up the commandline
> >>> option so that it appears in the output of query-command-line-options.
> >>>
> >>> Reported-by: Boris Fiuczynski <fiuczy@linux.ibm.com>
> >>> Fixes: c891c24b1a ("os-posix: asynchronous teardown for shutdown on Linux")
> >>> Signed-off-by: Claudio Imbrenda <imbrenda@linux.ibm.com>
> >>> ---
> >>>   util/async-teardown.c | 17 +++++++++++++++++
> >>>   1 file changed, 17 insertions(+)
> >>>
> >>> diff --git a/util/async-teardown.c b/util/async-teardown.c
> >>> index 62cdeb0f20..c9b9a3cdb2 100644
> >>> --- a/util/async-teardown.c
> >>> +++ b/util/async-teardown.c
> >>> @@ -12,6 +12,9 @@
> >>>    */
> >>>   
> >>>   #include "qemu/osdep.h"
> >>> +#include "qemu/config-file.h"
> >>> +#include "qemu/option.h"
> >>> +#include "qemu/module.h"
> >>>   #include <dirent.h>
> >>>   #include <sys/prctl.h>
> >>>   #include <sched.h>
> >>> @@ -144,3 +147,17 @@ void init_async_teardown(void)
> >>>       clone(async_teardown_fn, new_stack_for_clone(), CLONE_VM, NULL);
> >>>       sigprocmask(SIG_SETMASK, &old_signals, NULL);
> >>>   }
> >>> +
> >>> +static QemuOptsList qemu_async_teardown_opts = {
> >>> +    .name = "async-teardown",
> >>> +    .head = QTAILQ_HEAD_INITIALIZER(qemu_async_teardown_opts.head),
> >>> +    .desc = {
> >>> +        { /* end of list */ }
> >>> +    },
> >>> +};
> >>> +
> >>> +static void register_async_teardown(void)
> >>> +{
> >>> +    qemu_add_opts(&qemu_async_teardown_opts);
> >>> +}
> >>> +opts_init(register_async_teardown);  
> >> 
> >> Now it *is* improperly wired up :)
> >> 
> >> You're defining new QemuOpts config group "async-teardown" with
> >> arbitrary option parameters, but don't actually use it for parsing or
> >> recording the option.  I figure because you can't: there is no option
> >> argument to parse and record, which is what QemuOpts is designed to do.
> >> 
> >> If you need the feature to be visible in query-command-line-options, you
> >> should make it an option parameter (a KEY, not a GROUP), preferably of
> >> an existing group / option.  
> >
> > Would it make sense to add it e.g. to "-action" instead, i.e. something like 
> > "-action teardown=async" ?  
> 
> I believe the new parameter "teardown" would be visible in
> query-command-line-options.
> 
> How well does it fit -action?

I guess it can be shoehorned in. generally action is about stuff that
happens in/to the guest, while in this case it's about how qemu will
perform the teardown of its address space once it terminates.

the important parts are: this is an OS-specific option (Linux), and it
needs to be parsed and enabled before sandboxing (otherwise clone(2)
might not work)


