Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B346D7AFA
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 13:17:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pk17N-0006OX-5m; Wed, 05 Apr 2023 07:15:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_acaggian@quicinc.com>)
 id 1pk17L-0006OF-0r
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 07:15:55 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_acaggian@quicinc.com>)
 id 1pk17F-0005Re-5k
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 07:15:54 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 335AUm6V009664; Wed, 5 Apr 2023 11:15:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=Qyaxf0DIACoe+I5SRtSSKC0xJqmF0t/CsmsiQzW0+N0=;
 b=LhWDM1dkYKFdnbF/EPJ3ow11If5AVdlX1GlrW9dH89vxCOyyIC5Hshs51eiTZ8YAvMOp
 9C9Yrw3QgxExd9biYpd8Tu3UPBQx23uzqStPrfwxWEnj3SbzuAoM4aDKEOWrIKyd+AFw
 Rvu19v69ajptLEZs3Zx8oImprblKRWCBlSiTRm0gOQsPlDcZDYaTsXVAx3uBf4LMZvaX
 XuFxYVDcFTx1ME0iVZS854TgLxQwmezm1Rea5jSPy/G9fbI824ftUY0b+QlA/R3QZ4T3
 D7AYeK+bQxwTmS4/hsjlD7igCKAtoRFpzUDZuZdEkBb4pvt6EqRlGwdTGQdCHADRvnTi OA== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3prmkmtu53-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Apr 2023 11:15:44 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 335BFhka013732
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 5 Apr 2023 11:15:43 GMT
Received: from ACAGGIAN-mac.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Wed, 5 Apr 2023 04:15:41 -0700
From: Antonio Caggiano <quic_acaggian@quicinc.com>
To: <mburton@quicinc.com>, <quic_acaggian@quicinc.com>
CC: Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>, "David
 Hildenbrand" <david@redhat.com>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Subject: [PATCH RFC 1/1] memory: Address space map listener
Date: Wed, 5 Apr 2023 13:15:15 +0200
Message-ID: <20230405111515.62137-2-quic_acaggian@quicinc.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230405111515.62137-1-quic_acaggian@quicinc.com>
References: <20230405111515.62137-1-quic_acaggian@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: p6XMh1LYjdXs4l2YOGVwujExGDO_WZ3D
X-Proofpoint-ORIG-GUID: p6XMh1LYjdXs4l2YOGVwujExGDO_WZ3D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-05_07,2023-04-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 malwarescore=0
 priorityscore=1501 mlxlogscore=999 impostorscore=0 adultscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 bulkscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304050102
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=quic_acaggian@quicinc.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Introduce a MemoryListener callback for address space map events.

This will require a change to the memory listener callbacks: while it
currently uses "self" as first argument for the callbacks, this new
approach is going to use an "opaque" member, effectively following the
model used for MemoryRegion and MemoryRegionOps.

Signed-off-by: Antonio Caggiano <quic_acaggian@quicinc.com>
---
 include/exec/memory.h | 19 +++++++++++++++++++
 softmmu/physmem.c     | 34 ++++++++++++++++++++++++++++++++++
 2 files changed, 53 insertions(+)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 7ec6df3289..f959d53a12 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -1045,6 +1045,18 @@ struct MemoryListener {
      */
     void (*coalesced_io_del)(MemoryListener *listener, MemoryRegionSection *section,
                                hwaddr addr, hwaddr len);
+
+    /**
+     * @map:
+     *
+     * Called during an address space map.
+     *
+     * @opaque: User data opaque object
+     * @addr: address within that address space
+     * @len: length of buffer
+     */
+    void (*map)(void *opaque, hwaddr addr, hwaddr len);
+
     /**
      * @priority:
      *
@@ -1054,6 +1066,13 @@ struct MemoryListener {
      */
     unsigned priority;
 
+    /**
+     * @opaque:
+     *
+     * Opaque pointer to user data
+     */
+    void *opaque;
+
     /**
      * @name:
      *
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 9486a1ebdf..0f8bad6b40 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -3246,6 +3246,38 @@ flatview_extend_translation(FlatView *fv, hwaddr addr,
     }
 }
 
+enum ListenerDirection { Forward, Reverse };
+
+/*
+ * This will require a change to the memory listener callbacks:
+ * while it currently uses "self" as first argument for the callbacks, this new
+ * approach is going to use an "opaque" member, effectively following the model
+ * used for MemoryRegion and MemoryRegionOps.
+ */
+#define MEMORY_LISTENER_CALL(_as, _callback, _direction, _args...) \
+    do {                                                                \
+        MemoryListener *_listener;                                      \
+                                                                        \
+        switch (_direction) {                                           \
+        case Forward:                                                   \
+            QTAILQ_FOREACH(_listener, &(_as)->listeners, link_as) {     \
+                if (_listener->_callback) {                             \
+                    _listener->_callback(_listener->opaque, ##_args);   \
+                }                                                       \
+            }                                                           \
+            break;                                                      \
+        case Reverse:                                                   \
+            QTAILQ_FOREACH_REVERSE(_listener, &(_as)->listeners, link_as) { \
+                if (_listener->_callback) {                             \
+                    _listener->_callback(_listener->opaque, ##_args);   \
+                }                                                       \
+            }                                                           \
+            break;                                                      \
+        default:                                                        \
+            abort();                                                    \
+        }                                                               \
+    } while (0)
+
 /* Map a physical memory region into a host virtual address.
  * May map a subset of the requested range, given by and returned in *plen.
  * May return NULL if resources needed to perform the mapping are exhausted.
@@ -3268,6 +3300,8 @@ void *address_space_map(AddressSpace *as,
         return NULL;
     }
 
+    MEMORY_LISTENER_CALL(as, map, Reverse, addr, len);
+
     l = len;
     RCU_READ_LOCK_GUARD();
     fv = address_space_to_flatview(as);
-- 
2.40.0


