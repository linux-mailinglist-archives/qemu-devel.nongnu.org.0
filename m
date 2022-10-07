Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED7E85F7AA8
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 17:38:20 +0200 (CEST)
Received: from localhost ([::1]:33202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogpQa-0007BE-0k
	for lists+qemu-devel@lfdr.de; Fri, 07 Oct 2022 11:38:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <miguel.luis@oracle.com>)
 id 1ogocJ-0007xp-Ks; Fri, 07 Oct 2022 10:46:24 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:51660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <miguel.luis@oracle.com>)
 id 1ogocH-00009f-EQ; Fri, 07 Oct 2022 10:46:23 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 297BxAZE002163;
 Fri, 7 Oct 2022 14:46:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : reply-to : mime-version :
 content-transfer-encoding; s=corp-2022-7-12;
 bh=MCD9N8SXr5IffM7ZJOmyqklKUUIAejsmT7cxIXncdO4=;
 b=LeykRMZsZML4M3H3kRM9cB+CLkwf/q8iTdOCTtl757F+9KJwgWKCuTbRjpWXDmcz/ICh
 LXUfWW7uGYilVszc7XNfeYCwtqTMc29qTdT7oZWI32wGN5yi1GDVd3uXtKEYxh6JYGMD
 X9gL4oWhhsxhHIpqm3rOjgxjZOkxTHjH4hNq3OSJwfpQ8VicwKUFG5cFFhXLuzrnxxWw
 X105gep+ixd/BqUl3jP4iED7vmURgVCSMJ9C8qTLHgZZLScOyWaVUBhRRf8C/U74+90G
 7JRnDWNCoJgGtYg59syKQyKQ+OSXpBqlEa7f794JwGVPpOF+aGhVrQyeaYHCepfDDBpq wg== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3jxdeafcp7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 07 Oct 2022 14:46:14 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 297D3cUV002947; Fri, 7 Oct 2022 14:46:13 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3jxc0d8n1b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 07 Oct 2022 14:46:13 +0000
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 297EkCYG028446;
 Fri, 7 Oct 2022 14:46:12 GMT
Received: from mlluis-mac.uk.oracle.com (dhcp-10-175-212-78.vpn.oracle.com
 [10.175.212.78])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id
 3jxc0d8n08-1; Fri, 07 Oct 2022 14:46:12 +0000
From: Miguel Luis <miguel.luis@oracle.com>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: mst@redhat.com, imammedo@redhat.com, ani@anisinha.ca,
 shannon.zhaosl@gmail.com, peter.maydell@linaro.org, miguel.luis@oracle.com
Subject: [PATCH v2 0/3] fix for two ACPI GTDT physical addresses
Date: Fri,  7 Oct 2022 14:45:50 +0000
Message-Id: <20221007144553.79648-1-miguel.luis@oracle.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-06_05,2022-10-07_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0 mlxscore=0
 malwarescore=0 adultscore=0 spamscore=0 mlxlogscore=918 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2210070088
X-Proofpoint-GUID: 4rkcieIB3BK55CufiwPe5KD7qGT6T6y6
X-Proofpoint-ORIG-GUID: 4rkcieIB3BK55CufiwPe5KD7qGT6T6y6
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=miguel.luis@oracle.com; helo=mx0a-00069f02.pphosted.com
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

Changelog:

v2:
    Updated with collected tags from v1.

v1: https://lists.nongnu.org/archive/html/qemu-devel/2022-09/msg02847.html

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
2.37.3


