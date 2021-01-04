Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3DCE2E9EC8
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jan 2021 21:24:57 +0100 (CET)
Received: from localhost ([::1]:47806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwWPQ-0002FK-LC
	for lists+qemu-devel@lfdr.de; Mon, 04 Jan 2021 15:24:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1kwWLt-0000H9-Fc; Mon, 04 Jan 2021 15:21:17 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:20788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1kwWLj-0004zN-T3; Mon, 04 Jan 2021 15:21:17 -0500
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 104KFlEK073103; Mon, 4 Jan 2021 15:21:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references; s=pp1;
 bh=OKKbwXLs9iHpHeHlYT6mWDTbDPunKiNZqv7Sl7wzV6A=;
 b=UQikxStpUNnwfET0qxqKuPJWdwzo0+/TCm3LSPwOnMdYWV0x3R+Icj9AvDU+Lt9TtuIn
 aDt7J8/uAlGEZTGbuXTH5sdfAd7xLKBeqCtHn7uPuvjkK4Z5Um/BwFaeo3uXrj0uP4Q1
 Dx0b8m0uq1yAvd8C0mZNwXb56akLHkcGfZwCjIcz2XosmVE+rbHRtBlEpaKLX0gq8z4U
 MTiumAn/4t8UsObBAnONkBlQuNL9E8D6dYF4kbt7RV10+713Rit3Xk6ap95yVAyxd6u2
 tcUCpHExwcklE52JJZ0bIIBgrn4zQx+uWHCAwjgxnYAl8VqxUHBeK85eQnCUK5sfbsxc +g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35v9war2nm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 Jan 2021 15:21:04 -0500
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 104KK3HO101161;
 Mon, 4 Jan 2021 15:21:04 -0500
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35v9war2n1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 Jan 2021 15:21:04 -0500
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 104K7WES016210;
 Mon, 4 Jan 2021 20:21:01 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04ams.nl.ibm.com with ESMTP id 35u3pmhkkd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 Jan 2021 20:21:01 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 104KKxGq38797594
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 4 Jan 2021 20:20:59 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 243F0A4060;
 Mon,  4 Jan 2021 20:20:59 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 10EFAA405B;
 Mon,  4 Jan 2021 20:20:59 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Mon,  4 Jan 2021 20:20:59 +0000 (GMT)
Received: by tuxmaker.boeblingen.de.ibm.com (Postfix, from userid 4958)
 id B5476E0384; Mon,  4 Jan 2021 21:20:58 +0100 (CET)
From: Eric Farman <farman@linux.ibm.com>
To: Cornelia Huck <cohuck@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v3 1/3] update-linux-headers: Include const.h
Date: Mon,  4 Jan 2021 21:20:55 +0100
Message-Id: <20210104202057.48048-2-farman@linux.ibm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210104202057.48048-1-farman@linux.ibm.com>
References: <20210104202057.48048-1-farman@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-04_12:2021-01-04,
 2021-01-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 adultscore=0 mlxlogscore=999
 phishscore=0 suspectscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101040123
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farman@linux.ibm.com;
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
Cc: qemu-s390x@nongnu.org, Eric Farman <farman@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Kernel commit a85cbe6159ff ("uapi: move constants from
<linux/kernel.h> to <linux/const.h>") breaks our script
because of the unrecognized include. Let's add that to
our processing.

Signed-off-by: Eric Farman <farman@linux.ibm.com>
---
 scripts/update-linux-headers.sh | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/scripts/update-linux-headers.sh b/scripts/update-linux-headers.sh
index 9efbaf2f84..fa6f2b6272 100755
--- a/scripts/update-linux-headers.sh
+++ b/scripts/update-linux-headers.sh
@@ -41,6 +41,7 @@ cp_portable() {
                                      -e 'pvrdma_verbs' \
                                      -e 'drm.h' \
                                      -e 'limits' \
+                                     -e 'linux/const' \
                                      -e 'linux/kernel' \
                                      -e 'linux/sysinfo' \
                                      -e 'asm-generic/kvm_para' \
@@ -190,7 +191,9 @@ for i in "$tmpdir"/include/linux/*virtio*.h \
          "$tmpdir/include/linux/input.h" \
          "$tmpdir/include/linux/input-event-codes.h" \
          "$tmpdir/include/linux/pci_regs.h" \
-         "$tmpdir/include/linux/ethtool.h" "$tmpdir/include/linux/kernel.h" \
+         "$tmpdir/include/linux/ethtool.h" \
+         "$tmpdir/include/linux/const.h" \
+         "$tmpdir/include/linux/kernel.h" \
          "$tmpdir/include/linux/vhost_types.h" \
          "$tmpdir/include/linux/sysinfo.h"; do
     cp_portable "$i" "$output/include/standard-headers/linux"
-- 
2.17.1


