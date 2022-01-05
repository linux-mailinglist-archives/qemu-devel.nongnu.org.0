Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5D1485842
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 19:30:38 +0100 (CET)
Received: from localhost ([::1]:33416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5B3U-0001xf-L1
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 13:30:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1n5B0J-0000ag-9l; Wed, 05 Jan 2022 13:27:19 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:30692
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1n5B0B-00006R-Pv; Wed, 05 Jan 2022 13:27:15 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 205I6bIl014002; 
 Wed, 5 Jan 2022 18:27:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=WxZouKSNZQoELmSuDzMkC41eA5iKkdJTJ/hk36zP1Sc=;
 b=EpGjN6wt0RqkvfXK6MguAq3RdSXHPQ6mjqM4t91V21IkRbw5bwGpal/mddnuPIFXol6L
 x+4c1zEySMVc7XxNHu3c2cmuE1ClGDg7a7xE9e8ICiKuPR9PppDNuDDRA0nUQDVCzLAe
 TKA6QaW22rdN0Fa56UmaS30hBPtRLEYkfOSdD38CevFRVO3vYwOeTjr4CIvcetKf9hl5
 X/El78YCotAuAHpe0KdXOY/BGSTR6XC5zg86aIuFBvt+Ir9cuvLySHJR+oDBxhezuVUB
 ANqy9giAizsIEVDsNxsZkyktaYEwWB+p+MFrmDFQ1IdCL5hwZaJCv9il6k7HuKt1XMot EA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dcpka4crn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Jan 2022 18:27:06 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 205ICllW007191;
 Wed, 5 Jan 2022 18:27:05 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dcpka4crb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Jan 2022 18:27:05 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 205IMqCY006807;
 Wed, 5 Jan 2022 18:27:05 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma04wdc.us.ibm.com with ESMTP id 3daekb3j2q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Jan 2022 18:27:04 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 205IR47s32244018
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 5 Jan 2022 18:27:04 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2C8DCAE062;
 Wed,  5 Jan 2022 18:27:04 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BF17DAE06B;
 Wed,  5 Jan 2022 18:27:01 +0000 (GMT)
Received: from farman-thinkpad-t470p (unknown [9.211.71.239])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed,  5 Jan 2022 18:27:01 +0000 (GMT)
Message-ID: <aa11d65c8cb303b381c4e53aa948818b7b65a228.camel@linux.ibm.com>
Subject: Re: [PATCH RFC v2] MAINTAINERS: split out s390x sections
From: Eric Farman <farman@linux.ibm.com>
To: Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org
Date: Wed, 05 Jan 2022 13:27:00 -0500
In-Reply-To: <20211222105548.356852-1-cohuck@redhat.com>
References: <20211222105548.356852-1-cohuck@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-18.el8) 
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: XUbq-b0pz7EYJAlODGaTfz5frMnZxlJF
X-Proofpoint-ORIG-GUID: EK3JqBN0rT1JNfu7akf_kKZXg8m3dITh
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-05_05,2022-01-04_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 bulkscore=0
 spamscore=0 impostorscore=0 adultscore=0 mlxscore=0 clxscore=1015
 malwarescore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201050118
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farman@linux.ibm.com;
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
Cc: Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 2021-12-22 at 11:55 +0100, Cornelia Huck wrote:
> Split out some more specialized devices etc., so that we can build
> smarter lists of people to be put on cc: in the future.
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Acked-by: David Hildenbrand <david@redhat.com>
> Acked-by: Christian Borntraeger <borntraeger@de.ibm.com>
> Acked-by: Thomas Huth <thuth@redhat.com>
> Acked-by: Halil Pasic <pasic@linux.ibm.com>
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>

(Late to the party, Happy New Year!) I like the rearrangement:

Acked-by: Eric Farman <farman@linux.ibm.com>

Of course, you also said in v1:

"""
- The new sections have inherited the maintainers of the sections
  they have been split out of (except where people had already
  volunteered). That's easy to change, obviously, and I hope that
  the cc: list already contains people who might have interest in
  volunteering for some sections.
"""

As someone on cc, I could volunteer to help with these sections:

S390 Machines
-------------
S390 Virtio-ccw
S390 channel subsystem

Devices
-------
virtio-ccw

> ---
> 
> v1->v2: move some sections to "Devices", some minor tweaks
> 
> I guess that can go with the next set of s390x patches.
> 
> ---
>  MAINTAINERS | 85 ++++++++++++++++++++++++++++++++++++++++++++++-----
> --
>  1 file changed, 74 insertions(+), 11 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5dcefc0d012a..e4d88f7eb2ba 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -297,7 +297,6 @@ M: David Hildenbrand <david@redhat.com>
>  S: Maintained
>  F: target/s390x/
>  F: target/s390x/tcg
> -F: target/s390x/cpu_models_*.[ch]
>  F: hw/s390x/
>  F: disas/s390.c
>  F: tests/tcg/s390x/
> @@ -396,16 +395,10 @@ M: Halil Pasic <pasic@linux.ibm.com>
>  M: Christian Borntraeger <borntraeger@linux.ibm.com>
>  S: Supported
>  F: target/s390x/kvm/
> -F: target/s390x/ioinst.[ch]
>  F: target/s390x/machine.c
>  F: target/s390x/sigp.c
> -F: target/s390x/cpu_features*.[ch]
> -F: target/s390x/cpu_models.[ch]
>  F: hw/s390x/pv.c
>  F: include/hw/s390x/pv.h
> -F: hw/intc/s390_flic.c
> -F: hw/intc/s390_flic_kvm.c
> -F: include/hw/s390x/s390_flic.h
>  F: gdb-xml/s390*.xml
>  T: git https://github.com/borntraeger/qemu.git s390-next
>  L: qemu-s390x@nongnu.org
> @@ -1529,12 +1522,8 @@ S390 Virtio-ccw
>  M: Halil Pasic <pasic@linux.ibm.com>
>  M: Christian Borntraeger <borntraeger@linux.ibm.com>
>  S: Supported
> -F: hw/char/sclp*.[hc]
> -F: hw/char/terminal3270.c
>  F: hw/s390x/
>  F: include/hw/s390x/
> -F: hw/watchdog/wdt_diag288.c
> -F: include/hw/watchdog/wdt_diag288.h
>  F: configs/devices/s390x-softmmu/default.mak
>  F: tests/avocado/machine_s390_ccw_virtio.py
>  T: git https://github.com/borntraeger/qemu.git s390-next
> @@ -1559,6 +1548,37 @@ F: hw/s390x/s390-pci*
>  F: include/hw/s390x/s390-pci*
>  L: qemu-s390x@nongnu.org
>  
> +S390 channel subsystem
> +M: Halil Pasic <pasic@linux.ibm.com>
> +M: Christian Borntraeger <borntraeger@linux.ibm.com>
> +S: Supported
> +F: hw/s390x/ccw-device.[ch]
> +F: hw/s390x/css.c
> +F: hw/s390x/css-bridge.c
> +F: include/hw/s390x/css.h
> +F: include/hw/s390x/css-bridge.h
> +F: include/hw/s390x/ioinst.h
> +F: target/s390x/ioinst.c
> +L: qemu-s390x@nongnu.org
> +
> +S390 CPU models
> +M: David Hildenbrand <david@redhat.com>
> +S: Maintained
> +F: target/s390x/cpu_features*.[ch]
> +F: target/s390x/cpu_models.[ch]
> +L: qemu-s390x@nongnu.org
> +
> +S390 SCLP-backed devices
> +M: Halil Pasic <pasic@linux.ibm.com>
> +M: Christian Borntraeger <borntraeger@linux.ibm.com>
> +S: Supported
> +F: include/hw/s390x/event-facility.h
> +F: include/hw/s390x/sclp.h
> +F: hw/char/sclp*.[hc]
> +F: hw/s390x/event-facility.c
> +F: hw/s390x/sclp*.c
> +L: qemu-s390x@nongnu.org
> +
>  X86 Machines
>  ------------
>  PC
> @@ -1957,6 +1977,7 @@ M: Halil Pasic <pasic@linux.ibm.com>
>  S: Supported
>  F: hw/s390x/virtio-ccw*.[hc]
>  F: hw/s390x/vhost-vsock-ccw.c
> +F: hw/s390x/vhost-user-fs-ccw.c
>  T: git https://gitlab.com/cohuck/qemu.git s390-next
>  T: git https://github.com/borntraeger/qemu.git s390-next
>  L: qemu-s390x@nongnu.org
> @@ -2295,6 +2316,48 @@ F: hw/timer/mips_gictimer.c
>  F: include/hw/intc/mips_gic.h
>  F: include/hw/timer/mips_gictimer.h
>  
> +S390 3270 device
> +M: Halil Pasic <pasic@linux.ibm.com>
> +M: Christian Borntraeger <borntraeger@linux.ibm.com>
> +S: Odd fixes
> +F: include/hw/s390x/3270-ccw.h
> +F: hw/char/terminal3270.c
> +F: hw/s390x/3270-ccw.c
> +L: qemu-s390x@nongnu.org
> +
> +S390 diag 288 watchdog
> +M: Halil Pasic <pasic@linux.ibm.com>
> +M: Christian Borntraeger <borntraeger@linux.ibm.com>
> +S: Supported
> +F: hw/watchdog/wdt_diag288.c
> +F: include/hw/watchdog/wdt_diag288.h
> +L: qemu-s390x@nongnu.org
> +
> +S390 storage key device
> +M: Halil Pasic <pasic@linux.ibm.com>
> +M: Christian Borntraeger <borntraeger@linux.ibm.com>
> +S: Supported
> +F: hw/s390x/storage-keys.h
> +F: hw/390x/s390-skeys*.c
> +L: qemu-s390x@nongnu.org
> +
> +S390 storage attribute device
> +M: Halil Pasic <pasic@linux.ibm.com>
> +M: Christian Borntraeger <borntraeger@linux.ibm.com>
> +S: Supported
> +F: hw/s390x/storage-attributes.h
> +F: hw/s390/s390-stattrib*.c
> +L: qemu-s390x@nongnu.org
> +
> +S390 floating interrupt controller
> +M: Halil Pasic <pasic@linux.ibm.com>
> +M: Christian Borntraeger <borntraeger@linux.ibm.com>
> +M: David Hildenbrand <david@redhat.com>
> +S: Supported
> +F: hw/intc/s390_flic*.c
> +F: include/hw/s390x/s390_flic.h
> +L: qemu-s390x@nongnu.org
> +
>  Subsystems
>  ----------
>  Overall Audio backends


