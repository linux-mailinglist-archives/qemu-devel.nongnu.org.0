Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0932233D3F8
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 13:36:55 +0100 (CET)
Received: from localhost ([::1]:46098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lM8wP-0004X3-Ph
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 08:36:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1lM8nH-0004XT-D6; Tue, 16 Mar 2021 08:27:27 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:7926
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1lM8nB-0007TS-23; Tue, 16 Mar 2021 08:27:27 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12GC3d8C133110; Tue, 16 Mar 2021 08:27:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=qcNu/cuz8FBOhgAx7OEm3nI7E+1IniLSVAcmRbsldvg=;
 b=AOJpu7p40Odm5Gv8SNjNYnbNeHV0Ia3zP6s0/N/vXPqr8HJ2r3QdeWjQmNjW/8lSCzWR
 yQ64qaZLiM5KwJeY0ENtf0Ey8Wp9ckmuRNWXe8eZofu/g0c/nHiaxW1qcHbgu4mykxXb
 C4ZBBq5blPj1N9N2fw9xblj9bEBzma7UArqBmQ05Q+YHZ56IHpu06BUQfCxTYaKqIvur
 vbj6eWtxxpHqXKtV0iny8ySUmbwwuYq/RK3Q9BjTrDsNp5083Z+vpyqhPtX3uhynjOPj
 nFeJo102XuVlY5vAhH2dnQAdMCNtaB09TmNr4ngxBFkDbTqBJ/cf13M1VUxbcHFee7Yd vg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37ah311snj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Mar 2021 08:27:04 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 12GC4E18139132;
 Tue, 16 Mar 2021 08:27:03 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37ah311smu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Mar 2021 08:27:03 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12GCC28w002763;
 Tue, 16 Mar 2021 12:27:01 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma05fra.de.ibm.com with ESMTP id 378n189g9j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Mar 2021 12:27:01 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12GCQwtD12714350
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 16 Mar 2021 12:26:58 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 98B13A404D;
 Tue, 16 Mar 2021 12:26:58 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DBCA0A4051;
 Tue, 16 Mar 2021 12:26:57 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 16 Mar 2021 12:26:57 +0000 (GMT)
From: Halil Pasic <pasic@linux.ibm.com>
To: Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Alexey Kardashevskiy <aik@ozlabs.ru>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Anup Patel <anup@brainfault.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alejandro Jimenez <alejandro.j.jimenez@oracle.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
Subject: [RFC PATCH 0/2] hw/s390x: modularize virtio-gpu-ccw 
Date: Tue, 16 Mar 2021 13:26:46 +0100
Message-Id: <20210316122648.3372459-1-pasic@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-16_03:2021-03-16,
 2021-03-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 malwarescore=0 bulkscore=0 mlxscore=0 adultscore=0 impostorscore=0
 spamscore=0 clxscore=1011 suspectscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103160085
Received-SPF: pass client-ip=148.163.158.5; envelope-from=pasic@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: Halil Pasic <pasic@linux.ibm.com>, Boris Fiuczynski <fiuczy@linux.ibm.com>,
 "Daniel P. Berrange" <berrange@redhat.com>, Bruce Rogers <brogers@suse.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series explores Daniels idea he proposed in [1], and
is a successor to the v3.

I decided to go with the RFC tag because there are several
things I have doubts about, and I hope somebody more familiar
with the topic can help me out. I kept running into situations
where meson felt like something I have to cheat and defeat.

One thing that required special attention is keeping things functional
from the build tree (i.e. not requiring an install).  First I failed to
generate a meson output form a custom_target() in a qemu target specific
folder. So I decided to generate scripts that can be used both for
installation and during compilation to massage the build tree so that
goal is accomplished.

The solution for running the scripts as a part of the build is kind of
ugly, because for custom_target() output is mandatory, but my output is
invalid. So I lied.

When I thought, I was done with an RFC quality solution, I tested it from
scratch (deleting my builddir), and it turns out for
meson.add_install_script(script_name) script_name is supposed to be
around, and executable already at configure time. So my generated
scripts won't do because not around in the beginning. I decided to work
that around quick and dirty by introducing a wrapper script.

One alternative to this would be to have the logic in a single script in
the source-tree, and just generate the list of modules for each target,
which would be a parameter of this single script along with the target
name. The downside of this is that we require 2 new in source tree
scripts this way as well, but it is less flexible, because it can't be
used for other generated scripts.

Another thing I'm not really super satisfied with is this
modules_restricted interface, but for my use case it does the job, and
when something new emerges we can re-evaluate.

But before I continue agonizing on these matters, I would like to get
some feedback regarding, is this approach to the problem what the
community wants (or is the whole symlinks idea controversial).

[1] https://mail.gnu.org/archive/html/qemu-s390x/2021-03/msg00206.html

Changelog v3 --> RFC:
* switch to the symlinks approach (Daniel)
* split s390x and common in separate patches (Eduardo)


Halil Pasic (2):
  modules: introduce target specific modules
  hw/s390x: modularize virtio-gpu-ccw

 hw/s390x/meson.build               |  8 +++++-
 include/hw/s390x/css.h             |  7 -----
 include/hw/s390x/s390_flic.h       |  3 +++
 include/qemu/module.h              |  2 ++
 meson.build                        | 43 +++++++++++++++++++++++++++++-
 roms/SLOF                          |  2 +-
 roms/opensbi                       |  2 +-
 scripts/call_generated_script.sh   |  6 +++++
 scripts/modules/target-symlinks.sh | 31 +++++++++++++++++++++
 softmmu/runstate.c                 |  1 +
 target/s390x/cpu.h                 |  9 ++++---
 util/module.c                      | 14 ++++++++--
 12 files changed, 112 insertions(+), 16 deletions(-)
 create mode 100755 scripts/call_generated_script.sh
 create mode 100755 scripts/modules/target-symlinks.sh


base-commit: 2615a5e433aeb812c300d3a48e1a88e1303e2339
-- 
2.25.1


