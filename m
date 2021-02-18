Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C20631EE25
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 19:23:34 +0100 (CET)
Received: from localhost ([::1]:36966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCnxc-0002jg-Uc
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 13:23:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1lCnsC-0000Ik-3W; Thu, 18 Feb 2021 13:17:56 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:26394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1lCns8-00060U-8o; Thu, 18 Feb 2021 13:17:55 -0500
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 11IIHHxT141691; Thu, 18 Feb 2021 13:17:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=TNCxGFaIkapeHLeKO2s/Zv+s0JpTZt9Udx+sEVAT4jQ=;
 b=RP4yiNCGTSqYrcooF6ch+zvYXPsVzK+0ZqZDDDlGXL1gxlqHOdN8jq/d4tHlSvJfaSgX
 VRkHw816HiC8mk3ST8zxv0/g+am22BLG6ND8LHvymHEYbZ26uVOkADyWQwNnOxpD7TwW
 SpVU8CV7xZrS5Cccj5ilXyqNpCHvwIY8vkFLFN3AKNf+pAs++zVf0KlB3ZASahqxE9EU
 wxKj5Ud+7Xxkhbq4dIDl9a2N37zEWReJWli8YBXEfuOWP9eSQJQIz6sqQNCAIVK/uJFx
 hAFhYYqOm6PJ4LNunKUXELgXDXROQxhmZ+H/IGV/8bsSj0kBLMlcqEwohy/gy+s76N4P tQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36swct009e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Feb 2021 13:17:49 -0500
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 11IIHKLJ141798;
 Thu, 18 Feb 2021 13:17:48 -0500
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36swct008w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Feb 2021 13:17:48 -0500
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 11IIDCDk028155;
 Thu, 18 Feb 2021 18:17:46 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma06fra.de.ibm.com with ESMTP id 36p61hak32-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Feb 2021 18:17:46 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 11IIHhoC41877944
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 18 Feb 2021 18:17:43 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AE7AF4C040;
 Thu, 18 Feb 2021 18:17:43 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DA1604C044;
 Thu, 18 Feb 2021 18:17:42 +0000 (GMT)
Received: from li-e979b1cc-23ba-11b2-a85c-dfd230f6cf82 (unknown [9.171.71.158])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Thu, 18 Feb 2021 18:17:42 +0000 (GMT)
Date: Thu, 18 Feb 2021 19:17:39 +0100
From: Halil Pasic <pasic@linux.ibm.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH 1/1] hw/s390x: modularize virtio-gpu-ccw
Message-ID: <20210218191739.71bf8800.pasic@linux.ibm.com>
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
 definitions=2021-02-18_09:2021-02-18,
 2021-02-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 bulkscore=0 mlxlogscore=999 impostorscore=0 clxscore=1015
 adultscore=0 phishscore=0 mlxscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102180151
Received-SPF: pass client-ip=148.163.158.5; envelope-from=pasic@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
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

>   Hi,
> 
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
> Sounds like the easiest way forward.  

I believe the easiest way forward is what I propose in this patch. Does
this mean, that the code I propose here is not viable? If yes, why?

I'm not against cleaning up the includes for virtio-ccw devices, but I
tend to see that as a separate, less pressing issue.

> Alternatively add support for
> target-specific modules (which we don't really have right now).

I think a target-specific module is what I did in this patch.
Furthermore, I think any virtio-ccw device that is about to be built as
a module, must be built as a target-specific module. If the realized
(guest) architecture is not s390x, then there are no s390 IO instructions
and ccw won't fly. Yes, in theory other architectures could introduce the
exact same stuff, but I don't see that happening.

Even if I were to move the two functions like Connie suggests, I don't
see a way around making virtio-9p-ccw target specific.

Regards,
Halil

