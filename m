Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 249E06D7D19
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 14:58:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pk2iN-0007gg-Ae; Wed, 05 Apr 2023 08:58:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_acaggian@quicinc.com>)
 id 1pk2iK-0007g3-Uw
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 08:58:12 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_acaggian@quicinc.com>)
 id 1pk2iI-0001uM-Gc
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 08:58:11 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3359cjjb002563
 for <qemu-devel@nongnu.org>; Wed, 5 Apr 2023 12:58:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : subject
 : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=ekTB4UYemVx9nxG4GoPyMcoLj/8NAhKRJ6xHJ2q4emM=;
 b=enZEiXbRDUsitI6qlE+HuHZzlEjkbP10c2tODpwqIMIvbJYf2r00IlDYRDr74GeIYsbM
 QBVTKXxMoRRcsVAGSGAhB4pa222HZNS0D4G+/sHVh12wyN6e7iPbDSr/aBm5SLBZpawJ
 KYR92wlsAJwtlsY8Tyy8vyIq5IrCv6S33FZfTsX2kP2Ic/MjUNw5wuZVrOQEMzHRvk6U
 emuRMcyjcA7kDsx3n4LofYgGWc6FgcQ0uAMvJZ0St7slsUq9hJl/+8/CV2Cp1DrxP59g
 7uGqdQo0NBZPHu5zvPFMbqCwVmHaQBT9xUdDhfc9Xh2GdpaCOCNSQyIP8epV+c8ildFZ DA== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3prnvg2rgm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Wed, 05 Apr 2023 12:58:07 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 335Cw699009419
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Wed, 5 Apr 2023 12:58:06 GMT
Received: from ACAGGIAN-mac.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Wed, 5 Apr 2023 05:58:05 -0700
From: Antonio Caggiano <quic_acaggian@quicinc.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH RFC 0/1] MemoryListener address_space_map callback
Date: Wed, 5 Apr 2023 14:57:55 +0200
Message-ID: <20230405125756.63290-1-quic_acaggian@quicinc.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: G0IuzyC6aTN9koyc-NXvXu5uohqMno-v
X-Proofpoint-ORIG-GUID: G0IuzyC6aTN9koyc-NXvXu5uohqMno-v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-05_07,2023-04-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 spamscore=0 mlxscore=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 mlxlogscore=758
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304050115
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

Hi! This is the RFC about the memory issue I mentioned in our last KVM call.

In our use case, QEMU is used as a library, where RAM and Alias MemoryRegions
are created by listening to read/write events through MemoryRegionOps callbacks.
In this case, no read/write happened yet, so we did not have a chance to create
those memory regions yet.

The callstack looks like this:
- virtio_blk_get_request
  - virtqueue_pop -> virtqueue_split_pop -> virtqueue_map_desc
    - dma_memory_map -> address_space_map

The address_space_map function calls flatview_translate to get the memory region
for a certain address. If the memory region is not directly accessible, the
bounce buffer is used which only allows one mapping at a time, forcing to unmap
before mapping again.

The virtqueue_map_desc function calls iteratively address_space_map for a region
of 4KB but address_space_map is only mapping 1KB using the bounce buffer.
Then virtqueue_map_desc calls address_space_map again for mapping the missing
3KB, but address_space_map returns NULL as the bounce is in use now.

With this patch a MemoryListener callback is introduced for listening to address
space map events, before calling flatview_translate, so that listeners might
have a chance to create any needed alias or RAM memory region for that address
space. Effectively making flatview_translate return a directly accessible memory
region, and avoiding address_space_map to use the bounce buffer.

This will require a change to the memory listener callbacks: while it
currently uses "self" as first argument for the callbacks, this new
approach is going to use an "opaque" member, effectively following the
model used for MemoryRegion and MemoryRegionOps.

Antonio Caggiano (1):
  memory: Address space map listener

 include/exec/memory.h | 19 +++++++++++++++++++
 softmmu/physmem.c     | 34 ++++++++++++++++++++++++++++++++++
 2 files changed, 53 insertions(+)

-- 
2.40.0


