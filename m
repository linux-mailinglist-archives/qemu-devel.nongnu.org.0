Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2205431F413
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 03:53:59 +0100 (CET)
Received: from localhost ([::1]:59722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCvvZ-0003z7-KJ
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 21:53:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1lCvu2-0003OJ-Os; Thu, 18 Feb 2021 21:52:22 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:44138)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1lCvtz-00024r-QI; Thu, 18 Feb 2021 21:52:22 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 11J2hs3x107176; Thu, 18 Feb 2021 21:52:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=PVydxVJNoZ/KS+0992AsNfLpRyb83ZCkz00xAlclK9Q=;
 b=fENlIQcjYJv40KVN6O66Nk3v/SvSNYd3bqj6YJz4WxwuUdWgsD9DWvEBNiHFrlkFJ9b6
 EZIe7CkldHBK3r44tdty6KPfqecvYgBDS9duIRhXO4baOAwGLD7W7zxpzL7+kZ4vuLFq
 /e5K6ek6+gp5lGlwks94u1BFc0vfzyx+fhizSFnLERcq/81YzH5yXwyQbcLsZGaQjEyD
 VN0Cg3Cg/mQhRHd3O60B36Hi5Gv7cdTkGleifivqgo8WdG4GXwt2ZNbXrEU79OdVIfiY
 0v2vpbhu2EAyuM2vhKdstgTlSAEW5cO2MVfmlhqb3p4j4kmQaM2AdjusM9ffyUFR4hc+ 0A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36t4t2055m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Feb 2021 21:52:16 -0500
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 11J2i41B107342;
 Thu, 18 Feb 2021 21:52:16 -0500
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36t4t20552-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Feb 2021 21:52:16 -0500
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 11J2qEfc015559;
 Fri, 19 Feb 2021 02:52:14 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma06ams.nl.ibm.com with ESMTP id 36p61hd6ae-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Feb 2021 02:52:13 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 11J2qA2c38666610
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 19 Feb 2021 02:52:10 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4B06D4C046;
 Fri, 19 Feb 2021 02:52:10 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8962B4C044;
 Fri, 19 Feb 2021 02:52:09 +0000 (GMT)
Received: from li-e979b1cc-23ba-11b2-a85c-dfd230f6cf82 (unknown [9.171.71.158])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Fri, 19 Feb 2021 02:52:09 +0000 (GMT)
Date: Fri, 19 Feb 2021 03:52:06 +0100
From: Halil Pasic <pasic@linux.ibm.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH 1/1] hw/s390x: modularize virtio-gpu-ccw
Message-ID: <20210219035206.730f145e.pasic@linux.ibm.com>
In-Reply-To: <20210218133820.cflf455nj44mxzja@sirius.home.kraxel.org>
References: <20210218022227.979741-1-pasic@linux.ibm.com>
 <6c0f5acf-9ebb-ba04-1389-c6690796a6ad@redhat.com>
 <20210218113438.3fe80078.pasic@linux.ibm.com>
 <20210218135618.06532573.cohuck@redhat.com>
 <20210218133820.cflf455nj44mxzja@sirius.home.kraxel.org>
Organization: IBM
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-18_14:2021-02-18,
 2021-02-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 phishscore=0 adultscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 mlxlogscore=999 clxscore=1015 mlxscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102190016
Received-SPF: pass client-ip=148.163.156.1; envelope-from=pasic@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Boris Fiuczynski <fiuczy@linux.ibm.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Bruce Rogers <brogers@suse.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 18 Feb 2021 14:38:20 +0100
Gerd Hoffmann <kraxel@redhat.com> wrote:

> > > The explanation is simple. Unlike most devices, the ccw devices aren't
> > > portable. In particular both css.c and css.h includes "cpu.h", and
> > > virtio-ccw-gpu.c includes "qemu/osdep.h". Furthermore osdep.h contains:
> > > #ifdef NEED_CPU_H
> > > #include CONFIG_TARGET
> > > #else
> > > #include "exec/poison.h"
> > > #endif
> > > so if we don't have NEED_CPU_H, among others CONFIG_KVM is poisoned, and
> > > CONFIG_KVM is used in "css.h". Frankly, I can't tell under what circumstances
> > > does css need "cpu.h".   
> > 
> > s390_crw_mchk() and s390_io_interrupt() are in cpu.h. Nowadays, they
> > use the flic to inject interrupts; but their earlier implementations
> > had a dummy cpu state.
> > 
> > I'm wondering whether s390_flic.h is a better place for functions
> > injecting floating interrupts, now that we don't have the non-flic
> > support anymore.  
> 
> Sounds like the easiest way forward.  Alternatively add support for
> target-specific modules (which we don't really have right now).

Thanks Gerd! 

Now I realize what do you mean by support for target-specific modules.
I'm mostly concerned with the s390x targets and I didn't have a good
enough understanding of this. I didn't realize the modules are shared
for all targets, that's why I've tried to build it only for s390x
targets.

I don't see way around target-specific modules. With the modifications
suggested by Thomas and Connie, I was able to get the new module to
compile regardless of the target, but that "fixes" s390x at the expense
of breaking all the other targets. For example:
./qemu-system-x86_64 -device help
Type 'virtio-gpu-ccw' is missing its parent 'virtio-ccw-device'
Aborted
because each target specific qemu will try to load my module. For s390x
it will work as expected, for everybody else not at all.

Making the list of modules in module.c depend on the target, i.e.
something like
     { "vhost-user-gpu-pci",    "hw-", "display-virtio-gpu-pci" }
+#ifdef TARGET_S390X
     { "virtio-gpu-ccw",        "hw-", "s390x-virtio-gpu-ccw"   },
+#endif
doesn't look viable either.

Since you are the author of 28457744c3 ("module: qom module support") and
7b0de5b796 ("virtio-gpu: build modular"), before I start working on
target-specific modules I would like to ask you, what is in your opinion
the best way to implement these?

Regards,
Halil

