Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B033C6C0CEA
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 10:15:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peBaU-000226-D6; Mon, 20 Mar 2023 05:13:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imbrenda@linux.ibm.com>)
 id 1peBaR-00021o-Ml
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 05:13:51 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imbrenda@linux.ibm.com>)
 id 1peBaN-0003k9-W7
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 05:13:50 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32K7ulHV024107; Mon, 20 Mar 2023 09:13:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=AbdDdN6P7ZKuMGysCFjE3a+NI9+s+q4kSBpJalgLinA=;
 b=lHXJb1k4dFUDiqcvztMgzDh+8rBYnMYQChtxNa/OQ5Lys8aCMD4wZPjJtzhlkVLxe4dx
 zwVIXkE1gLT7buuMSAaB+GDm7sn7OYLq8iv0XenRpu6Z/2TbWMS1977ej3X2o+N2AaJO
 JOHz/J6eGYfgddvmUpCVWm0AXs5HFUpHoN0CU1eBhFXcQOoQ3e02g6VULwlLPNRS3aRd
 y6ureGAl5ZSPbPCcG5+B2/YCxcacdTEaVore7gE800tpq/qw8wfAmOyCOav1JNt750E7
 ByV+msnqVWptOZrTk9l0lVm+PbdK+O5ymbTVSXNif5pTc47dk9Z4ptL+OItvFBGcg34x 7w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pdprjbf6c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Mar 2023 09:13:42 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32K8L1N6025258;
 Mon, 20 Mar 2023 09:13:42 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pdprjbf5q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Mar 2023 09:13:42 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32K4Jkd8023079;
 Mon, 20 Mar 2023 09:13:40 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
 by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3pd4x6ayym-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Mar 2023 09:13:39 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com
 [10.20.54.105])
 by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32K9DaLq29950488
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 20 Mar 2023 09:13:36 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2488A20043;
 Mon, 20 Mar 2023 09:13:36 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8B19520040;
 Mon, 20 Mar 2023 09:13:35 +0000 (GMT)
Received: from p-imbrenda (unknown [9.155.208.187])
 by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Mon, 20 Mar 2023 09:13:35 +0000 (GMT)
Date: Mon, 20 Mar 2023 10:13:33 +0100
From: Claudio Imbrenda <imbrenda@linux.ibm.com>
To: Thomas Huth <thuth@redhat.com>
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org, david@redhat.com,
 borntraeger@de.ibm.com, frankja@linux.ibm.com, fiuczy@linux.ibm.com,
 pasic@linux.ibm.com, berrange@redhat.com, alex.bennee@linaro.org,
 armbru@redhat.com
Subject: Re: [PATCH v1 1/1] util/async-teardown: wire up
 query-command-line-options
Message-ID: <20230320101333.12cb1dd7@p-imbrenda>
In-Reply-To: <5a8a18e1-f4ad-59dd-a2a9-e68684182b6a@redhat.com>
References: <20230320074855.11130-1-imbrenda@linux.ibm.com>
 <5a8a18e1-f4ad-59dd-a2a9-e68684182b6a@redhat.com>
Organization: IBM
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: IArCOj0hFujpxolchFjPsawrJB7-gFP4
X-Proofpoint-GUID: Hs7iq6i3dkOETEM17bigecUZ9tc_WpT5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-20_06,2023-03-16_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 mlxscore=0 bulkscore=0
 adultscore=0 mlxlogscore=999 phishscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303200077
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

On Mon, 20 Mar 2023 09:56:05 +0100
Thomas Huth <thuth@redhat.com> wrote:

> On 20/03/2023 08.48, Claudio Imbrenda wrote:
> > The recently introduced -async-teardown commandline option was not
> > wired up properly and did not show up in the output of the QMP command
> > query-command-line-options. This means that libvirt will have no way to
> > discover whether the feature is supported.
> > 
> > This patch fixes the issue by correctly wiring up the commandline
> > option so that it appears in the output of query-command-line-options.
> > 
> > Reported-by: Boris Fiuczynski <fiuczy@linux.ibm.com>
> > Fixes: c891c24b1a ("os-posix: asynchronous teardown for shutdown on Linux")
> > Signed-off-by: Claudio Imbrenda <imbrenda@linux.ibm.com>
> > ---
> >   util/async-teardown.c | 18 ++++++++++++++++++
> >   1 file changed, 18 insertions(+)
> > 
> > diff --git a/util/async-teardown.c b/util/async-teardown.c
> > index 62cdeb0f20..9a2e7bc146 100644
> > --- a/util/async-teardown.c
> > +++ b/util/async-teardown.c
> > @@ -12,6 +12,9 @@
> >    */
> >   
> >   #include "qemu/osdep.h"
> > +#include "qemu/config-file.h"
> > +#include "qemu/option.h"
> > +#include "qemu/module.h"
> >   #include <dirent.h>
> >   #include <sys/prctl.h>
> >   #include <sched.h>
> > @@ -144,3 +147,18 @@ void init_async_teardown(void)
> >       clone(async_teardown_fn, new_stack_for_clone(), CLONE_VM, NULL);
> >       sigprocmask(SIG_SETMASK, &old_signals, NULL);
> >   }
> > +
> > +static QemuOptsList qemu_async_teardown_opts = {
> > +    .name = "async-teardown",
> > +    .implied_opt_name = "enable",  
> 
> Are you sure about the "implied_opt_name" field? If I got that right, it's 

yeah that should not be there, I'll fix and send a v2

> used for options where you can omit the part before the "=" in the first 
> paramter, e.g.
> 
>   -netdev user
> 
> is the same as:
> 
>   -netdev type=user
> 
> ... but as far as I can see, there is no way to use
> 
>   -async-teardown enable=off
> 
> at the command line?
> 
>   Thomas
> 
> 
> > +    .head = QTAILQ_HEAD_INITIALIZER(qemu_async_teardown_opts.head),
> > +    .desc = {
> > +        { /* end of list */ }
> > +    },
> > +};
> > +
> > +static void register_async_teardown(void)
> > +{
> > +    qemu_add_opts(&qemu_async_teardown_opts);
> > +}
> > +opts_init(register_async_teardown);  
> 


