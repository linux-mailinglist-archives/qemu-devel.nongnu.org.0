Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E14655ED025
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 00:20:11 +0200 (CEST)
Received: from localhost ([::1]:42706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odIvt-0001V7-KH
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 18:20:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1odIrN-0006xH-V6; Tue, 27 Sep 2022 18:15:26 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:60414
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1odIrL-0004W6-BU; Tue, 27 Sep 2022 18:15:25 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28RKe2mA024418;
 Tue, 27 Sep 2022 22:15:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=T1OpkYrrl/dse3okh4/3MFFqVhc39JALYVSukffZj48=;
 b=WbCMPevMJxqtGWbsdafCBpoDWYW1M0m/NZxy2ZXb9XtFjPVVRv3bVl/7py/9s+s0q3SF
 QGrQ4PNGKtDrKYhhAWE5MWe1xRf05vrx6GLcbzWLN9fmEj5rD2dGz7eVPXkyUDgSK+Qs
 oDgmVZ0quAA0RveuMs4rQoHV6hFaC5lxneAeN4+cv+qT9s6NKdrcGBwHTxmfHTVyg84t
 RGTrRpScAQgijDAwQxzOhe1Ssz3CNONL2zgMtiuacRjOMcPzGK46KttWhjFLkW91LlLf
 6GC9Tb912pZ6nr+ErDfhn7IhuMZoEubTVJIcEnRnvJ6DHafOlH66W2IDbJigKfImmTaf 6w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3jv4eu0xg1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Sep 2022 22:15:07 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28RMF118024570;
 Tue, 27 Sep 2022 22:15:07 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3jv4eu0xey-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Sep 2022 22:15:07 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28RM5JnK007780;
 Tue, 27 Sep 2022 22:14:13 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma02dal.us.ibm.com with ESMTP id 3jsshacye9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Sep 2022 22:14:13 +0000
Received: from smtpav04.wdc07v.mail.ibm.com ([9.208.128.116])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 28RMECEu6750740
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 27 Sep 2022 22:14:13 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 62CD758050;
 Tue, 27 Sep 2022 22:14:12 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AAAD958045;
 Tue, 27 Sep 2022 22:14:11 +0000 (GMT)
Received: from localhost (unknown [9.77.133.152])
 by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTPS;
 Tue, 27 Sep 2022 22:14:11 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Matheus Ferst <matheus.ferst@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, fbarrat@linux.ibm.com, alex.bennee@linaro.org, Matheus
 Ferst <matheus.ferst@eldorado.org.br>
Subject: Re: [RFC PATCH v2 13/29] target/ppc: remove unused interrupts from
 p8_pending_interrupt
In-Reply-To: <20220927201544.4088567-14-matheus.ferst@eldorado.org.br>
References: <20220927201544.4088567-1-matheus.ferst@eldorado.org.br>
 <20220927201544.4088567-14-matheus.ferst@eldorado.org.br>
Date: Tue, 27 Sep 2022 19:14:09 -0300
Message-ID: <87a66kv51q.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: rFmOreqkn2YBqnGu-t1pi70knORkgziB
X-Proofpoint-ORIG-GUID: 02qTMeeHbx8Ii70AMnCwGXC1noYPuZ0m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-27_11,2022-09-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 bulkscore=0 mlxscore=0 suspectscore=0
 phishscore=0 spamscore=0 adultscore=0 clxscore=1011 mlxlogscore=885
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209270135
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Matheus Ferst <matheus.ferst@eldorado.org.br> writes:

> Remove the following unused interrupts from the POWER8 interrupt masking
> method:
> - PPC_INTERRUPT_RESET: only raised for 6xx, 7xx, 970, and POWER5p;
> - Debug Interrupt: removed in Power ISA v2.07;
> - Hypervisor Virtualization: introduced in Power ISA v3.0;
> - Critical Input, Watchdog Timer, and Fixed Interval Timer: only defined
>   for embedded CPUs;
> - Hypervisor Doorbell, Doorbell, and Critical Doorbell: processor does

We still need the first two.
0xe80 - Directed hypervisor doorbell
0xa00 - Directed privileged doorbell

>   not implement the "Embedded.Processor Control" category;
> - Programmable Interval Timer: 40x-only;
> - PPC_INTERRUPT_THERM: only raised for 970 and POWER5p;
>

