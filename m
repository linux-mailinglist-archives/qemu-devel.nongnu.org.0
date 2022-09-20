Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E42E5BEF20
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 23:28:27 +0200 (CEST)
Received: from localhost ([::1]:54836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oakn4-0004yb-6X
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 17:28:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <miguel.luis@oracle.com>)
 id 1oag1h-0004kE-3z; Tue, 20 Sep 2022 12:23:25 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:52642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <miguel.luis@oracle.com>)
 id 1oag1e-0000Gh-Co; Tue, 20 Sep 2022 12:23:12 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28KGJPQq003286;
 Tue, 20 Sep 2022 16:23:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : reply-to :
 mime-version : content-transfer-encoding; s=corp-2022-7-12;
 bh=QWIsJi1HQq2Hh0hKyNFjS67GbB0SqS7YxSBRZqhqqy8=;
 b=BadKcqR3Jy0KeC7r8Pk+lJUDLtl8hv2MFeKj0sV34c58V1I+b1GwFrasoeWU6kztsLTZ
 w+jgO9sbodae5V9azBa9KestPS3WP6d1NH9XIYkjon986qp57Gk8XzpYLmSQHCvpTYM6
 zxjtpEYLNiRpjhMZeB+R+XIcVydUZpm26V/E+htK3mrgEDoydU2c84EMQVz4KYi2Q1uJ
 k6s/GsImJ9ceRUptBDTQbeE+FVspShjyDKXbMDP1soV6+XHETIoJ7hc7tf50a1mvXszE
 BwC8xpP02KWKf7Ho4I1AhjCLDnP7p9IxHAWgGv0myprkqLseMeGM2QlrXs7iwUxkWHOz LA== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3jn68m7j3n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 20 Sep 2022 16:23:06 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 28KGCKwx027876; Tue, 20 Sep 2022 16:23:06 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3jp3cng7wk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 20 Sep 2022 16:23:06 +0000
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28KGMqUv016251;
 Tue, 20 Sep 2022 16:23:05 GMT
Received: from mlluis-mac.uk.oracle.com (dhcp-10-175-195-182.vpn.oracle.com
 [10.175.195.182])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id
 3jp3cng7mf-2; Tue, 20 Sep 2022 16:23:05 +0000
From: Miguel Luis <miguel.luis@oracle.com>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: mst@redhat.com, imammedo@redhat.com, ani@anisinha.ca,
 shannon.zhaosl@gmail.com, peter.maydell@linaro.org,
 Miguel Luis <miguel.luis@oracle.com>
Subject: [PATCH 1/3] tests/acpi: virt: allow acpi GTDT changes
Date: Tue, 20 Sep 2022 16:21:35 +0000
Message-Id: <20220920162137.75239-2-miguel.luis@oracle.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220920162137.75239-1-miguel.luis@oracle.com>
References: <20220920162137.75239-1-miguel.luis@oracle.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-20_06,2022-09-20_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxlogscore=999
 spamscore=0 adultscore=0 mlxscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209200097
X-Proofpoint-ORIG-GUID: JdJ4Dtc2vrFLC9xfCwLNLv6ssCbtZamq
X-Proofpoint-GUID: JdJ4Dtc2vrFLC9xfCwLNLv6ssCbtZamq
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

Step 3 from bios-tables-test.c documented procedure.

Signed-off-by: Miguel Luis <miguel.luis@oracle.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..957bd1b4f6 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,4 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/virt/GTDT",
+"tests/data/acpi/virt/GTDT.memhp",
+"tests/data/acpi/virt/GTDT.numamem",
-- 
2.36.0


