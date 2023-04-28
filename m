Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 665166F185E
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 14:44:04 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psNQ4-0000r0-He; Fri, 28 Apr 2023 08:41:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imbrenda@linux.ibm.com>)
 id 1psNPo-00084K-5T
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 08:41:35 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imbrenda@linux.ibm.com>)
 id 1psNPk-0001CF-JX
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 08:41:31 -0400
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33SCa7W4003027; Fri, 28 Apr 2023 12:41:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=Lzy3Fuyr0n4HxmcHb8BX/FynnXGk+08Agho/XDGy2Jw=;
 b=fFZAQ8CENRCgQo+XqYZpMRhYoyS2QGJ3UEF3sdfxx1rBumoTmFkdZ0HTp8S5wnta3075
 sTOBeqUdWOUU1TbK6JGGUuKz6x9WneFSxS8k5YExcM1+3PfTJ5NDW9+QEQ13Z5l0WB3s
 9Vto2hUoyYPXLEJwRYBbK6TiYePEXTaiy/52TTdX3DZAhUBtkZnDpfrDI/oUSJRj2axu
 Kvr4FazuFkVo3GyyjkE6wHK6QPGvho6yDfKGeByrGEa1vwJOIXaN0EpfPyn3FiBnrz+u
 Wk8rrS3emF8vyyYD9NXvfPoj4CdtvSQ5xgbdkAbqhjyn/FVf357as1ylBTX/2f2a4lL2 bg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3q8e4s0fnr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Apr 2023 12:41:24 +0000
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33SCaX8E006683;
 Fri, 28 Apr 2023 12:38:19 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3q8e4s0bms-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Apr 2023 12:38:19 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 33S5qNir028339;
 Fri, 28 Apr 2023 12:36:58 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
 by ppma05fra.de.ibm.com (PPS) with ESMTPS id 3q4776twnt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Apr 2023 12:36:58 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com
 [10.20.54.100])
 by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 33SCaqxh57082358
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 28 Apr 2023 12:36:52 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6084F2004B;
 Fri, 28 Apr 2023 12:36:52 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F06DF20040;
 Fri, 28 Apr 2023 12:36:51 +0000 (GMT)
Received: from p-imbrenda (unknown [9.152.224.56])
 by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Fri, 28 Apr 2023 12:36:51 +0000 (GMT)
Date: Fri, 28 Apr 2023 14:36:49 +0200
From: Claudio Imbrenda <imbrenda@linux.ibm.com>
To: Thomas Huth <thuth@redhat.com>
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org, david@redhat.com,
 borntraeger@de.ibm.com, frankja@linux.ibm.com, fiuczy@linux.ibm.com,
 pasic@linux.ibm.com, nsg@linux.ibm.com, berrange@redhat.com,
 alex.bennee@linaro.org, armbru@redhat.com
Subject: Re: [PATCH v6 1/1] util/async-teardown: wire up
 query-command-line-options
Message-ID: <20230428143649.43057feb@p-imbrenda>
In-Reply-To: <e3d52859-7613-0a1d-aa15-36e1f92ff8d6@redhat.com>
References: <20230428111224.37140-1-imbrenda@linux.ibm.com>
 <20230428111224.37140-2-imbrenda@linux.ibm.com>
 <e3d52859-7613-0a1d-aa15-36e1f92ff8d6@redhat.com>
Organization: IBM
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: cORDzPVS9zJ0TONbzgP4htSO4s-BVomW
X-Proofpoint-ORIG-GUID: WIU7CY-9a3yt_rGYdebYCyg3XRqCdXgZ
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-28_04,2023-04-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 mlxlogscore=999 phishscore=0 clxscore=1015 spamscore=0 malwarescore=0
 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304280102
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=imbrenda@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, 28 Apr 2023 14:16:42 +0200
Thomas Huth <thuth@redhat.com> wrote:

> On 28/04/2023 13.12, Claudio Imbrenda wrote:
> > Add new -run-with option with an async-teardown=on|off parameter. It is
> > visible in the output of query-command-line-options QMP command, so it
> > can be discovered and used by libvirt.
> > 
> > The option -async-teardown is now redundant, deprecate it.
> > 
> > Reported-by: Boris Fiuczynski <fiuczy@linux.ibm.com>
> > Fixes: c891c24b1a ("os-posix: asynchronous teardown for shutdown on Linux")
> > Signed-off-by: Claudio Imbrenda <imbrenda@linux.ibm.com>
> > ---
> >   docs/about/deprecated.rst |  5 +++++
> >   os-posix.c                | 15 +++++++++++++++
> >   qemu-options.hx           | 34 +++++++++++++++++++++++-----------
> >   util/async-teardown.c     | 21 +++++++++++++++++++++
> >   4 files changed, 64 insertions(+), 11 deletions(-)
> > 
> > diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
> > index 1ca9dc33d6..0986db9a86 100644
> > --- a/docs/about/deprecated.rst
> > +++ b/docs/about/deprecated.rst
> > @@ -111,6 +111,11 @@ Use ``-machine acpi=off`` instead.
> >   The HAXM project has been retired (see https://github.com/intel/haxm#status).
> >   Use "whpx" (on Windows) or "hvf" (on macOS) instead.
> >   
> > +``-async-teardown`` (since 8.1)
> > +,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,
> > +
> > +Use ``-run-with async-teardown=on`` instead.
> > +
> >   
> >   QEMU Machine Protocol (QMP) commands
> >   ------------------------------------
> > diff --git a/os-posix.c b/os-posix.c
> > index 5adc69f560..117ad2bdc1 100644
> > --- a/os-posix.c
> > +++ b/os-posix.c
> > @@ -36,6 +36,8 @@
> >   #include "qemu/log.h"
> >   #include "sysemu/runstate.h"
> >   #include "qemu/cutils.h"
> > +#include "qemu/config-file.h"
> > +#include "qemu/option.h"
> >   
> >   #ifdef CONFIG_LINUX
> >   #include <sys/prctl.h>
> > @@ -132,6 +134,8 @@ static bool os_parse_runas_uid_gid(const char *optarg)
> >    */
> >   int os_parse_cmd_args(int index, const char *optarg)
> >   {
> > +    QemuOpts *opts;  
> 
> Fails to compile on FreeBSD:
> 
> ../src/os-posix.c:137:15: error: unused variable 'opts' 
> [-Werror,-Wunused-variable]
>      QemuOpts *opts;
>                ^
> 1 error generated.
> 
> Apart from that, the patch looks fine to me.

oops, I'll move the variable inside the ifdef

> 
>   Thomas
> 


