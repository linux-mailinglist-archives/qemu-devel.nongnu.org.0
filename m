Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A8A48C8A8
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 17:43:32 +0100 (CET)
Received: from localhost ([::1]:58160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7gih-00016R-Kv
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 11:43:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1n7ggF-00073l-Cv; Wed, 12 Jan 2022 11:40:59 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:27380)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1n7ggC-0007w3-Cl; Wed, 12 Jan 2022 11:40:58 -0500
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20CFMdox006705; 
 Wed, 12 Jan 2022 16:40:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-transfer-encoding
 : mime-version; s=pp1; bh=reoJy5M75Eb3dzzwtwRLFBV9fh9yczNeRzXhQTUAV44=;
 b=eAWutfBHHQXnA+kMrCY7VNuOD5OaMWEEA9ZCDoCkONxVeVtkgg0kNwaX229rB5C+B/gT
 xq+v02HNpvYA81aAoaXVluGgWjAWBIOyfMNF95RInDgFdSxzR1hAEcMBsDtYOAsTzysF
 5TP1HyZcA56iK0WiRVGXIZpXliaZFePQL5CwSZf0xgNOBIWamtwlDGMUTRVuU4fmDliW
 l1Go7T/zh/ZWDr9+Uhwl3fouCru1DE+usNPp8Bcbl/jn7a78wMMmb6KrQrtzCE+tyOCP
 tu8C/08r9XQkHh9JrcWAxCFWAQZYGb6pZZfn3MQcvsi5w4wOzBp/v8FV2/e8vlMQz/KW fw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dj1jvsmsg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 16:40:53 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20CGeq19016833;
 Wed, 12 Jan 2022 16:40:52 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dj1jvsmru-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 16:40:52 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20CGMG0u020886;
 Wed, 12 Jan 2022 16:40:50 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03fra.de.ibm.com with ESMTP id 3df289kx59-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 16:40:50 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 20CGelFW15663400
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 12 Jan 2022 16:40:47 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0D686AE045;
 Wed, 12 Jan 2022 16:40:47 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EECFAAE04D;
 Wed, 12 Jan 2022 16:40:46 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Wed, 12 Jan 2022 16:40:46 +0000 (GMT)
Received: by tuxmaker.boeblingen.de.ibm.com (Postfix, from userid 4958)
 id 6BA1CE01B4; Wed, 12 Jan 2022 17:40:46 +0100 (CET)
From: Eric Farman <farman@linux.ibm.com>
To: Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: [RFC PATCH] MAINTAINERS: Add myself to s390 I/O areas
Date: Wed, 12 Jan 2022 17:40:44 +0100
Message-Id: <20220112164044.2210508-1-farman@linux.ibm.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211222105548.356852-1-cohuck@redhat.com>
References: <20211222105548.356852-1-cohuck@redhat.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: rVL2b_xAx86kTogdL9xkJnLnnZMZWOno
X-Proofpoint-ORIG-GUID: LKJW66oTKcajnHalHH9izceYCLzS90Q5
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-12_04,2022-01-11_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 spamscore=0 suspectscore=0 clxscore=1011 malwarescore=0
 impostorscore=0 mlxlogscore=999 mlxscore=0 priorityscore=1501 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201120104
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farman@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: Eric Farman <farman@linux.ibm.com>, David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Halil Pasic <pasic@linux.ibm.com>, qemu-s390x@nongnu.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

After the recent restructuring, I'd like to volunteer to help
in some of the s390 I/O areas.

Built on "[PATCH RFC v2] MAINTAINERS: split out s390x sections"

Signed-off-by: Eric Farman <farman@linux.ibm.com>
---
 MAINTAINERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5d37b0eec5..343f43e83d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1521,6 +1521,7 @@ S390 Machines
 S390 Virtio-ccw
 M: Halil Pasic <pasic@linux.ibm.com>
 M: Christian Borntraeger <borntraeger@linux.ibm.com>
+M: Eric Farman <farman@linux.ibm.com>
 S: Supported
 F: hw/s390x/
 F: include/hw/s390x/
@@ -1551,6 +1552,7 @@ L: qemu-s390x@nongnu.org
 S390 channel subsystem
 M: Halil Pasic <pasic@linux.ibm.com>
 M: Christian Borntraeger <borntraeger@linux.ibm.com>
+M: Eric Farman <farman@linux.ibm.com>
 S: Supported
 F: hw/s390x/ccw-device.[ch]
 F: hw/s390x/css.c
@@ -1975,6 +1977,7 @@ T: git https://github.com/stefanha/qemu.git block
 virtio-ccw
 M: Cornelia Huck <cohuck@redhat.com>
 M: Halil Pasic <pasic@linux.ibm.com>
+M: Eric Farman <farman@linux.ibm.com>
 S: Supported
 F: hw/s390x/virtio-ccw*.[hc]
 F: hw/s390x/vhost-vsock-ccw.c
-- 
2.32.0


