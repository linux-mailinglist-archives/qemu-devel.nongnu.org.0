Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A954F35C808
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Apr 2021 15:58:02 +0200 (CEST)
Received: from localhost ([::1]:46978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lVx4j-0002Yt-7N
	for lists+qemu-devel@lfdr.de; Mon, 12 Apr 2021 09:58:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1lVx3U-000224-10; Mon, 12 Apr 2021 09:56:45 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:2286)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1lVx3Q-0002gL-Vx; Mon, 12 Apr 2021 09:56:43 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13CDX2GO077958; Mon, 12 Apr 2021 09:56:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=nRH4uMU9POYuIE5B3uCfXNxjMyGw3stt3R/k4+2D7F0=;
 b=q/IxYdAANwUDLDpLQT6G6LHmR9oJcpns8ZZfglfhKFt1aDHEPyP4Oy7AgvYXSwdCKYae
 ucJfRP2cf9MYrdiOs0WSKWyOHaPdIzOHcR621i026brXipidti57LQw5bhvBMzixTrYM
 ak0Wb4m0zk7BK2ig5j8+nrhypRJD6UIUE4RBJUHfGkWtxRC1z6X7fvQ6RJnl8USNKHtH
 JdNcAs+lBptRB5oBKzIqNxtlhJTJMRhL8uK1Qr7jgHmIsqutIzfouO629H2MMM/vkEib
 bFnsZdwGVsbQaR5pI1pkYbmwCJpRjhQVS9XZuJL85LLvViNy09IF23O9/YB6+Wdh1tvl Qg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37usk9whxb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Apr 2021 09:56:29 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 13CDX36M078031;
 Mon, 12 Apr 2021 09:56:28 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37usk9whwy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Apr 2021 09:56:28 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13CDpoJh030580;
 Mon, 12 Apr 2021 13:56:27 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma03wdc.us.ibm.com with ESMTP id 37uhcmcths-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Apr 2021 13:56:27 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13CDuQNt26935592
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Apr 2021 13:56:26 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 95379BE04F;
 Mon, 12 Apr 2021 13:56:26 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DA1B6BE053;
 Mon, 12 Apr 2021 13:56:25 +0000 (GMT)
Received: from localhost (unknown [9.211.82.34])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Mon, 12 Apr 2021 13:56:25 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>, David Gibson
 <david@gibson.dropbear.id.au>, Thomas Huth <thuth@redhat.com>
Subject: RE: [PATCH 1/4] target/ppc: Code motion required to build disabling
 tcg
In-Reply-To: <CP2PR80MB44994CEF7BA3C917016749B0C7709@CP2PR80MB4499.lamprd80.prod.outlook.com>
References: <CP2PR80MB44994CEF7BA3C917016749B0C7709@CP2PR80MB4499.lamprd80.prod.outlook.com>
Date: Mon, 12 Apr 2021 10:56:23 -0300
Message-ID: <87a6q361yw.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: H-NkjP4Q5GNA9Q0BDKpSEROGCWU1L5QS
X-Proofpoint-GUID: n58cgAYO1YRfuT64EdCVSj8G4Oc9nRAu
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-12_10:2021-04-12,
 2021-04-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=999 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104120091
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Andre Fernando da Silva <andre.silva@eldorado.org.br>,
 Lucas Mateus Martins Araujo e Castro <lucas.araujo@eldorado.org.br>,
 Fernando Eckhardt Valle <fernando.valle@eldorado.org.br>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 "lagarcia@br.ibm.com" <lagarcia@br.ibm.com>,
 Matheus Kowalczuk Ferst <matheus.ferst@eldorado.org.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Bruno Piazera Larsen <bruno.larsen@eldorado.org.br> writes:

>> > This commit does the necessary code motion from translate_init.c.inc
>>
>> For instance, I don't immediately see why these changes are necessary. I
>> see that translate_init.c.inc already has some `#ifdef CONFIG_TCG`, so
>> why do we need to move a bunch of code into cpu.c instead of just adding
>> more code under ifdef CONFIG_TCG? (I'm not saying it's wrong, just trying to
>> understand the reasoning).
>
> There are 3 main reasons for this decision. The first is kind of
> silly, but when I read translate.c my mind jumped to translating
> machine code to TCG, and the amount of TCGv variables at the start
> reinforced this notion.  The second was that both s390x and i386
> removed it (translate.c) from compilation, so I had no good reason to
> doubt it.  The last (and arguably most important) is that translate.c
> is many thousands of lines long (translate_init.c.inc alone was almost
> 11k). The whole point of disabling TCG is to speed up compilation and
> reduce the final file size, so I think it makes sense to remove that
> big file.  And the final nail in the coffin is that at no point did it
> cross my mind to keep the init part of translation, but remove the
> rest

Ok, so whatever you decide to do, make sure you state: "this is where
TCG functions go", "this file is built on KVM|TCG only", and so on. And
it's ok in principle to do a partial move for the RFC, but please
mention that somewhere so we're all in the same page.

>
> Also, I'm not a fan of big ifdefs, because it's kinda hard to follow
> them when viewing code in vim. Adding that to already having a cpu.c
> file, where it makes sense (to me, at least) to add all CPU related
> functions, just sounded like a good idea.

My point about ifdefs is that it would be easier to understand if you
either:

a) wrapped code in ifdefs, got the RCF going and then later moved all
ifdef'ed code into a new tcg-only file;

or

b) define which is the tcg-only file right away and just move code in
there.

When you moved code into cpu.c *along with* the ifdefs, you kind of did
both at the same time, which got confusing; to me at least.

About moving CPU related functions into cpu.c, that's fine. But it is
not strictly related to disable-tcg, so maybe send that in a separate
patch that does it explicitly at the start of the series.

>
>> Is translate_init.c.inc intended to be TCG only? But then I see you
>> moved TCG-only functions out of it (ppc_fixup_cpu) and left not TCG-only
>> functions (gen_spr_generic).
>
> This is me misjudging what is TCG and what is not, mostly. I think
> that actually moving everything to cpu.c and adding ifdefs, or
> creating a cpu_tcg.c.inc or similar, would be the most sensible code
> motion, but every function I removed from translate gave me 3 new
> errors, at some point I felt like I should leave something behind
> otherwise we're compiling everything from TCG again, just in different
> files, so I tried to guess what was TCG and what was not (also, I
> really wanted the RFC out by the weekend, I _may_ have rushed a few
> choices).

Ok, so you left out some things on purpose to reduce complexity for the
first RFC. That's fine, we just need to state these kinds of thing more
clearly.

>
>> > This moves all functions that start with gdb_* into target/ppc/gdbstub.c
>> > and creates a new function that calls those and is called by ppc_cpu_realize
>>
>> This looks like it makes sense regardless of disable-tcg, could we have
>> it in a standalone patch?
>
> Sure, I'll try and get it ready ASAP, and make sure I didn't miss one
> function before sending. Just a noob question... do I edit the patch
> manually to have it only contain the gdb code motion, or is there a
> way to move back to before I actually made the commit without needing
> to re-do the changes?

You could git rebase -i back into your first patch and then split it in
two (git reset HEAD~1 and stage + commit each one), one for moving CPU
code into cpu.c and other for moving GDB code into gdbstub.c.

Or just checkout a new branch, apply the patch on top of it and commit
just the GDB change.

Feel free to ping me on IRC if you need help.

