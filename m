Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A5C496571
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 20:06:29 +0100 (CET)
Received: from localhost ([::1]:57120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAzEy-0007Su-2Q
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 14:06:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nAyii-0001uZ-4y; Fri, 21 Jan 2022 13:33:08 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:53764)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nAyig-0000Qa-1n; Fri, 21 Jan 2022 13:33:07 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20LGGZ8a027821; 
 Fri, 21 Jan 2022 18:32:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : content-type :
 mime-version; s=pp1; bh=yYARYpjADIOWYoNBPyQkZyIwhgCKiQtw4nMwWnBPlNo=;
 b=oPT0nT0OkOuQfKUpYzHZiuATmlzjY0KTS7taFOjhbZsB0MqqAqx03lw6ZoHPFrWAL1XP
 Z+HdtpToPvMqvbGw9rqEZbwvEmQx7B1ucqn0ZtS4c5+kzBnS+gqfLzY9Bz+j2aHrPkBG
 LiLiWwwA0Cq9PajpLOTdfsj+Kr6gSeT7uSYwO565lEMQfcsquvimz/TdIilnO8BhKhG6
 HOE14719GtjCLV7CDBCZimm9IoAxmpZr6akAExsp97N4HIzqZtNSwrka59HaHGByWrSO
 SQaolouaKlttmBxFD1KlyneykzVSoCFqtQOBG3YOZN7YW9/c/ZPXAoTXO/EJn1h64bYH 2Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dr0782uwb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Jan 2022 18:32:49 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20LIR4ki014401;
 Fri, 21 Jan 2022 18:32:49 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dr0782uvx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Jan 2022 18:32:49 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20LIWR0P024647;
 Fri, 21 Jan 2022 18:32:48 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma04dal.us.ibm.com with ESMTP id 3dqjj9cddu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Jan 2022 18:32:48 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20LIWlGu24576406
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 21 Jan 2022 18:32:47 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 15E9CC6055;
 Fri, 21 Jan 2022 18:32:47 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5D1EDC6059;
 Fri, 21 Jan 2022 18:32:46 +0000 (GMT)
Received: from localhost (unknown [9.211.81.234])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Fri, 21 Jan 2022 18:32:46 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH 1/1] target/ppc: fix 'skip KVM' cond in
 cpu_interrupt_exittb()
In-Reply-To: <20220121160841.9102-1-danielhb413@gmail.com>
References: <20220121160841.9102-1-danielhb413@gmail.com>
Date: Fri, 21 Jan 2022 15:32:44 -0300
Message-ID: <874k5xey7n.fsf@linux.ibm.com>
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 6227dSqAqf5-tPW3m9KluqwzMjQlkDFz
X-Proofpoint-GUID: S9Oes42tEzw4kK0uuSDlfAGwX-CLYrkw
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-21_09,2022-01-21_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 clxscore=1015 mlxscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201210121
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 Greg Kurz <groug@kaod.org>, david@gibson.dropbear.id.au, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Daniel Henrique Barboza <danielhb413@gmail.com> writes:

> cpu_interrupt_exittb() was introduced by commit 044897ef4a22
> ("target/ppc: Fix system lockups caused by interrupt_request state
> corruption") as a way to wrap cpu_interrupt() helper in BQL.
>
> After that, commit 6d38666a8931 ("ppc: Ignore the CPU_INTERRUPT_EXITTB
> interrupt with KVM") added a condition to skip this interrupt if we're
> running with KVM.
>
> Problem is that the change made by the above commit, testing for
> !kvm_enabled() at the start of cpu_interrupt_exittb():
>
> static inline void cpu_interrupt_exittb(CPUState *cs)
> {
>     if (!kvm_enabled()) {
>         return;
>     }
>     (... do cpu_interrupt(cs, CPU_INTERRUPT_EXITTB) ...)
>
> is doing the opposite of what it intended to do. This will return
> immediately if not kvm_enabled(), i.e. it's a emulated CPU, and if
> kvm_enabled() it will proceed to fire CPU_INTERRUPT_EXITTB.
>
> Fix the 'skip KVM' condition so the function is a no-op when
> kvm_enabled().
>
> CC: Greg Kurz <groug@kaod.org>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/809
> Fixes: 6d38666a8931 ("ppc: Ignore the CPU_INTERRUPT_EXITTB interrupt with KVM")
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>

Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>

