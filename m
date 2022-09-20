Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0312F5BEF0F
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 23:19:32 +0200 (CEST)
Received: from localhost ([::1]:53396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oakeR-00011q-3Y
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 17:19:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <miguel.luis@oracle.com>)
 id 1oag1X-0004gJ-Rs; Tue, 20 Sep 2022 12:23:04 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:21290)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <miguel.luis@oracle.com>)
 id 1oag1T-0000EC-KH; Tue, 20 Sep 2022 12:23:03 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28KGJNh1018151;
 Tue, 20 Sep 2022 16:22:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : reply-to : mime-version :
 content-transfer-encoding; s=corp-2022-7-12;
 bh=sKCdbPqoVW2GG4TICbgESjGduy1RL3n9W6alo80hVWc=;
 b=xJwoXAYfGWUIVX/8iGfoQPlYpWLacbe0ZCPANakkvwPFI3jfX0lWslGnqNImtXJJOD15
 viKABbR3li5dSQY2svOdvI258/FkziYiudyKfXpGr3YUsSVlfEk3iFhbv3QYp+t7dtmw
 ZUB2LjJIv6zXe3RLKN0l4u+DFpWQXeXhmbZBcnJAWKSw1HHN7Wk7QlJ2d/MWPbADjV5f
 D3lFK6YHpaVZqLIz5s7KeVvZDQsKrxr48pxg695gBmI/ZXKReSLr5OPYM6QV5BbLtV/E
 mCZZ3utEdGX1WGbLoMxadZS1D8EBeedFina8BR5auDDyVYyZm0o3CHwsvugHrjHagZ9A GA== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3jn69kqjd9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 20 Sep 2022 16:22:54 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 28KGBffB027918; Tue, 20 Sep 2022 16:22:53 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3jp3cng7nt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 20 Sep 2022 16:22:53 +0000
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28KGMqUt016251;
 Tue, 20 Sep 2022 16:22:52 GMT
Received: from mlluis-mac.uk.oracle.com (dhcp-10-175-195-182.vpn.oracle.com
 [10.175.195.182])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id
 3jp3cng7mf-1; Tue, 20 Sep 2022 16:22:52 +0000
From: Miguel Luis <miguel.luis@oracle.com>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: mst@redhat.com, imammedo@redhat.com, ani@anisinha.ca,
 shannon.zhaosl@gmail.com, peter.maydell@linaro.org,
 Miguel Luis <miguel.luis@oracle.com>
Subject: [PATCH 0/3] fix for two ACPI GTDT physical addresses
Date: Tue, 20 Sep 2022 16:21:34 +0000
Message-Id: <20220920162137.75239-1-miguel.luis@oracle.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-20_06,2022-09-20_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxlogscore=754
 spamscore=0 adultscore=0 mlxscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209200096
X-Proofpoint-ORIG-GUID: rJJTH8BMPTFeWu_JWqsO7q9g7dLVXDp8
X-Proofpoint-GUID: rJJTH8BMPTFeWu_JWqsO7q9g7dLVXDp8
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=miguel.luis@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: miguel.luis@oracle.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The ACPI GTDT table contains two invalid 64-bit physical addresses according to
the ACPI spec. 6.5 [1]. Those are the Counter Control Base physical address and
the Counter Read Base physical address. Those fields of the GTDT table should be
set to 0xFFFFFFFFFFFFFFFF if not provided, rather than 0x0.

[1]: https://uefi.org/specs/ACPI/6.5/05_ACPI_Software_Programming_Model.html#gtdt-table-structure

Miguel Luis (3):
  tests/acpi: virt: allow acpi GTDT changes
  acpi: arm/virt: build_gtdt: fix invalid 64-bit physical addresses
  tests/acpi: virt: update ACPI GTDT binaries

 hw/arm/virt-acpi-build.c          |   5 ++---
 tests/data/acpi/virt/GTDT         | Bin 96 -> 96 bytes
 tests/data/acpi/virt/GTDT.memhp   | Bin 96 -> 96 bytes
 tests/data/acpi/virt/GTDT.numamem | Bin 96 -> 96 bytes
 4 files changed, 2 insertions(+), 3 deletions(-)

-- 
2.36.0


