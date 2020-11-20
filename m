Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE172BB243
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 19:17:29 +0100 (CET)
Received: from localhost ([::1]:45116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgAyO-0001cx-64
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 13:17:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1kgAwb-0000RD-Ou; Fri, 20 Nov 2020 13:15:37 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:54234
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1kgAwa-0002dt-1V; Fri, 20 Nov 2020 13:15:37 -0500
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AKI206l122322; Fri, 20 Nov 2020 13:15:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject : date : message-id; s=pp1;
 bh=dTjq0KYtNwxbHdSQuAcoo83oIXScJe2QaqfpyqitlYI=;
 b=f73n1gdrqKpOj7qkSi3ZnHZh3yQKE2JNvebMYt6XQRblJN/FHIFhPoawWxHc/apd6Mud
 fChqgQw69LY4Xu9Kud/wlqbZu7sR0Er7YQ2i39hiCn9BPJ8bY8uvxIU+i+umZIgo/Q4S
 ZzyGsqth48Y1XXbkd4MLZRwuNjDu7qiq9FbmTzot2ruRbQyEWCVz2Zzm+FdQg5kTN2Th
 /BhxFk8eA+Ngqywb5nf++h8Zzuudwcof7sluC+sRxoVrixxv6TPCfx7l0atTXhhpdyA4
 AvmrdzntIjhR0l/I7Hh9RQDhkC41llvn14dNNWMHogkNmPpQEGYj8nIntDtunfk413Fi Yw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 34xhk82x3n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 Nov 2020 13:15:33 -0500
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0AKI28Zv125743;
 Fri, 20 Nov 2020 13:15:32 -0500
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 34xhk82x2g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 Nov 2020 13:15:32 -0500
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AKI8VUv031084;
 Fri, 20 Nov 2020 18:15:30 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma06ams.nl.ibm.com with ESMTP id 34w4yfjc9x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 Nov 2020 18:15:30 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 0AKIFRJL52691222
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 20 Nov 2020 18:15:28 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DBC6AA4040;
 Fri, 20 Nov 2020 18:15:27 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CACABA404D;
 Fri, 20 Nov 2020 18:15:27 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Fri, 20 Nov 2020 18:15:27 +0000 (GMT)
Received: by tuxmaker.boeblingen.de.ibm.com (Postfix, from userid 4958)
 id 90141E23B0; Fri, 20 Nov 2020 19:15:27 +0100 (CET)
From: Eric Farman <farman@linux.ibm.com>
To: Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>
Subject: [PATCH v2 0/2] vfio-ccw: Implement request notifier
Date: Fri, 20 Nov 2020 19:15:24 +0100
Message-Id: <20201120181526.96446-1-farman@linux.ibm.com>
X-Mailer: git-send-email 2.17.1
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-20_09:2020-11-20,
 2020-11-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 priorityscore=1501 lowpriorityscore=0 mlxlogscore=999 spamscore=0
 mlxscore=0 clxscore=1015 bulkscore=0 impostorscore=0 malwarescore=0
 adultscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2011200120
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farman@linux.ibm.com;
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
Cc: Eric Farman <farman@linux.ibm.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org, Matthew Rosato <mjrosato@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Updated QEMU code for the request notifier, to match version 2
of the kernel code [1]. No changes since the v1/RFC [2],
other than including Conny's r-b on patch 2 (Thank you!).

This registers the QEMU vfio-ccw code's ability to respond to
a request from the kernel to release the device, because of a
(probably fatal) device error that has removed it from the host
configuration, and thus its ability to be used by the guest.

[1] https://lore.kernel.org/kvm/20201120180740.87837-1-farman@linux.ibm.com/
[2] https://lore.kernel.org/qemu-devel/20201117032605.56831-1-farman@linux.ibm.com/

Eric Farman (2):
  Update linux headers
  vfio-ccw: Connect the device request notifier

 hw/vfio/ccw.c              | 40 ++++++++++++++++++++++++++++++++++----
 linux-headers/linux/vfio.h |  1 +
 2 files changed, 37 insertions(+), 4 deletions(-)

-- 
2.17.1


