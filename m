Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 366813264A9
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 16:24:34 +0100 (CET)
Received: from localhost ([::1]:36840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFeyn-0007gJ-6f
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 10:24:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbuono@linux.vnet.ibm.com>)
 id 1lFevj-00068C-L8
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 10:21:24 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:41476
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbuono@linux.vnet.ibm.com>)
 id 1lFeve-00028J-TP
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 10:21:23 -0500
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11QF3SlC169259
 for <qemu-devel@nongnu.org>; Fri, 26 Feb 2021 10:21:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=gFb8SYXSLivsAxnSH6MWzYJOGIjQrUPb6RmgC4CkwaU=;
 b=iMmkXWSgmM3V10/JyGRdFyJR+NduIeh08y5dptqWeOSmemKNyOYb32lP+wdk+C3gdPAf
 b+1z0JeBIrZGXYZW6/F5CYAz6L45bUYinUNeBqXbprqSZ2YhHnoSisnVJJhP6eONMhnb
 sgM5Smo6HPbe3BXX1rl5MWgoob5QCWKZhmJJrkS+nzAWG0DrEc0gFjk5YrG7o6StyvG0
 h0gzLliC8lGsrUKXTV0rLb50j/U4ZY/T/xf2el0ffdYLQA5L2HQkFPYyP0rmMVCkpLpd
 KUUFT8piL/GS+HUSWdyNYpsckjeOw9LzuSMew4rTxxAlehdxP4GMUlgTt02Cmn4XZWGw 8Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 36xy9u8gub-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Fri, 26 Feb 2021 10:21:14 -0500
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 11QF3QQc168996
 for <qemu-devel@nongnu.org>; Fri, 26 Feb 2021 10:21:14 -0500
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0b-001b2d01.pphosted.com with ESMTP id 36xy9u8gu4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Feb 2021 10:21:14 -0500
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 11QFC7Uo029120;
 Fri, 26 Feb 2021 15:21:13 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma03wdc.us.ibm.com with ESMTP id 36tt29qhf7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Feb 2021 15:21:13 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 11QFLCce26607898
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 26 Feb 2021 15:21:12 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C96111376C6;
 Fri, 26 Feb 2021 15:21:12 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 72AD31376C2;
 Fri, 26 Feb 2021 15:21:12 +0000 (GMT)
Received: from Buonos-Thinkpad-X1.ibm.com (unknown [9.211.86.147])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 26 Feb 2021 15:21:12 +0000 (GMT)
From: Daniele Buono <dbuono@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/2] gitlab-ci.yml: Add jobs to test CFI
Date: Fri, 26 Feb 2021 10:21:06 -0500
Message-Id: <20210226152108.7848-1-dbuono@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-26_03:2021-02-24,
 2021-02-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0
 impostorscore=0 mlxscore=0 priorityscore=1501 spamscore=0 mlxlogscore=971
 phishscore=0 clxscore=1015 suspectscore=0 bulkscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102260117
Received-SPF: none client-ip=148.163.158.5;
 envelope-from=dbuono@linux.vnet.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Daniele Buono <dbuono@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For a few months now QEMU has had options to enable compiler-based
control-flow integrity if built with clang.

While this feature has a low maintenance, It's probably still better to
add tests to the CI environment to check that an update doesn't break it.

The patchset allow gitlab testing of:
* --enable-cfi: forward-edge cfi (function pointers)
* --enable-safe-stack: backward-edge cfi (return pointers)
As an added benefit, this also inherently tests LTO. 

The first patch allows a custom selection for linker parallelism.
Currently, make parallelism at build time is based on the number
of cpus available.
This doesn't work well with LTO at linking, because the linker has to
load in memory all the intermediate object files for optimization.
If the gitlab runner happens to run two linking processes at the same
time, the job will fail with an out-of-memory error,
The patch leverages the ability to maintain high parallelism at
compile time, but limit the number of linkers executed in parallel.

The second patch introduces the ci/cd jobs in the gitlab pipeline.
My original intention was to create a single chain of
build -> check -> acceptance, with all the targets compiled by default.
Unfortunately, the resulting artifact is too big and won't be uploaded.
So I split the test in two chains, that should cover all non-deprecated
targets as of today.
Build jobs are on the longer side (about 2h and 20m), but I thought it
would be better to just have 6 large jobs than tens of smaller ones.
For build, we have to select --enable-slirp=git, because CFI needs a
statically linked version of slirp, with CFI information. More info on
this can be found in a comment in .gitlab-ci.yml.

Test runs of the full pipeline are here (cfi-ci-v2 branch):
https://gitlab.com/dbuono/qemu/-/pipelines/261311362

v2:
- More details in the code about the issue of using system-wide slirp
- Use meson to only limit linker parallelism instead of forcing no
  parallelism on the whole compilation process.

Daniele Buono (2):
  gitlab-ci.yml: Allow custom # of parallel linkers
  gitlab-ci.yml: Add jobs to test CFI flags

 .gitlab-ci.yml | 97 ++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 97 insertions(+)

-- 
2.30.0


