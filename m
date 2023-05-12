Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C7B6FFDAC
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 02:10:59 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxGLv-0006d9-Lg; Thu, 11 May 2023 20:09:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1pxGLt-0006cx-EU
 for qemu-devel@nongnu.org; Thu, 11 May 2023 20:09:41 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1pxGLr-0004D7-If
 for qemu-devel@nongnu.org; Thu, 11 May 2023 20:09:41 -0400
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34C09Siu022814
 for <qemu-devel@nongnu.org>; Fri, 12 May 2023 00:09:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=kLB0mBfcgiOXfxx+WTtYGcl/nAt481KQC85CP2CSKGs=;
 b=La30aNbq+FnMJRK0bSmKH/wTIAXhB6l6KApadBW/ejV5VKXhxkafVGCie6rrTHH0Jjkb
 5BUDBbjE79O0uTpt/VsXu73N0ARk4LPK7xpB7JG5jf+3k1JPTJ8MJXM7aKFKvnZDlRAy
 DP0y7BA7QxeDpFZ0UN/quXAEp7YJygMhhLWaYdsEwHa7ARMwf1sfu9Ks3XxD2OshNidV
 wbtsoFRZl0T35sDlcpWdcjKcdwXd/RX8I78GfCtPgUGoNJmV7TcqB4gbRg2tH9r1Uthd
 JtxmY/clEDuKSuZF3isodSvhhGDiau7wVz/Nng9RURp/NuRTtWWN3HGw0EN4ZlEqcVjB Hg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qh8cybrxw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Fri, 12 May 2023 00:09:37 +0000
Received: from m0353722.ppops.net (m0353722.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 34C09aVA023455
 for <qemu-devel@nongnu.org>; Fri, 12 May 2023 00:09:36 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qh8cybrt8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 May 2023 00:09:35 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 34BNaDC8027300;
 Fri, 12 May 2023 00:05:24 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
 by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3qf896t0qy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 May 2023 00:05:24 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com
 [10.20.54.106])
 by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 34C05MRS43385144
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 12 May 2023 00:05:22 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0BFE52004D;
 Fri, 12 May 2023 00:05:22 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B14E120040;
 Fri, 12 May 2023 00:05:21 +0000 (GMT)
Received: from li-ce58cfcc-320b-11b2-a85c-85e19b5285e0 (unknown [9.179.0.234])
 by smtpav07.fra02v.mail.ibm.com (Postfix) with SMTP;
 Fri, 12 May 2023 00:05:21 +0000 (GMT)
Date: Fri, 12 May 2023 02:05:19 +0200
From: Halil Pasic <pasic@linux.ibm.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org, Halil Pasic
 <pasic@linux.ibm.com>
Subject: Re: css_clear_io_interrupt() error handling
Message-ID: <20230512020519.6dab1a81.pasic@linux.ibm.com>
In-Reply-To: <87r0rnjbz0.fsf@pond.sub.org>
References: <87fs87ny6e.fsf@pond.sub.org> <873547dwn0.fsf@redhat.com>
 <20230509193637.678780aa.pasic@linux.ibm.com>
 <874jokae8j.fsf@pond.sub.org>
 <20230511034355.0b916dcb.pasic@linux.ibm.com>
 <87r0rnjbz0.fsf@pond.sub.org>
Organization: IBM
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: IF_7C4fGP8DfzbUe_kq44UVG_LuBccNk
X-Proofpoint-ORIG-GUID: qm5lkBJIDUPQL4-Q2Qy5zkTIG3sG1CEP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-11_19,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=725 clxscore=1015
 impostorscore=0 suspectscore=0 malwarescore=0 mlxscore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2304280000
 definitions=main-2305110205
Received-SPF: pass client-ip=148.163.158.5; envelope-from=pasic@linux.ibm.com;
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, 11 May 2023 14:20:51 +0200
Markus Armbruster <armbru@redhat.com> wrote:
[..]
> >
> > In my opinion the best way to deal with such situations would be to
> > abort() in test/development and log a warning in production. Of course  
> 
> Understand, but...
> 
> > assert() wouldn't give me that, and it wouldn't be locally consistent at
> > all.  
> 
> ... nothing behaves like that so far.
> 

I understand. And I agree with all statements from your previous mail. 

> Let's try to come to a conclusion.  We can either keep the current
> behavior, i.e. abort().  Or we change it to just print something.
> 
> If we want the latter: fprintf() to stderr, warn_report(), or trace
> point?
> 
> You are the maintainer, so the decision is yours.
> 
> I could stick a patch into a series of error-related cleanup patches I'm
> working on.

I would gladly take that offer. Given that we didn't see any crashes and
thus violations of assumptions up till now, and that both the kvm and the
qemu implementations are from my perspective stable, I think not forcing
a crash is a good option. From the options you offered, warn_report()
looks the most compelling to me, but I would trust your expertise to pick
the actually best one.

Thank you very much.

> 
> 
> [*] I'm rather fond of the trick to have oopsie() fork & crash.

I never thought of this, but I do actually find it very compelling
to get a dump while keeping the workload alive. Especially if
it was oopsie_once() so one does not get buried in dumps. But we don't
do things like this in QEMU, or do we?

Regards,
Halil


