Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB7DC2DFC6D
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 14:52:17 +0100 (CET)
Received: from localhost ([::1]:34022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krLbk-0004JC-T9
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 08:52:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1krLZK-0002DD-KX; Mon, 21 Dec 2020 08:49:46 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:54330)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1krLZF-00050A-Oh; Mon, 21 Dec 2020 08:49:46 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BLDiaah080311;
 Mon, 21 Dec 2020 13:49:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=corp-2020-01-29; bh=UgLEVAEDzCGblbDeByYDA+kCXgohKbFMlBdOWSVFmyI=;
 b=dbE7guwDmfIjtEahYIt4Ltlo3iEPPXRtZ0OCoyHibwv3Orbi2edfgoWl2B1yVpD4ECTm
 xB9EoeoUEis8zVmuNyvucEQqEgkkPsyQutmoTaMutlnewR55fheO5AeDbcFhs//8fiiR
 cYpjxkAIZsmp2wtErdGBva/qn7WR9Tfwjzs3KAGJKo/uUTXbOHd4s4Ql98/J9hYFsKNj
 blow9iX1+mpWrTB1FO6GI54BSkeh0yNehsR/3Yf2/1BtHP+BXK3frZ0Q5aeMLgolw+YL
 NySe0pB5EUACG6PGg5DYcvUsuUw1zv/rFjAyKYRfHsvctY++AltyYAlkp4T1n1kLRBPH Ag== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2130.oracle.com with ESMTP id 35h8xqwcj2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 21 Dec 2020 13:49:36 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BLDjYm0075096;
 Mon, 21 Dec 2020 13:49:35 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3030.oracle.com with ESMTP id 35hu3mcqn9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 21 Dec 2020 13:49:35 +0000
Received: from abhmp0008.oracle.com (abhmp0008.oracle.com [141.146.116.14])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0BLDnYGM029744;
 Mon, 21 Dec 2020 13:49:34 GMT
Received: from disaster-area.hh.sledj.net (/81.187.26.238)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 21 Dec 2020 05:49:33 -0800
Received: from localhost (disaster-area.hh.sledj.net [local])
 by disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id 95b2af05;
 Mon, 21 Dec 2020 13:49:31 +0000 (UTC)
From: David Edmondson <david.edmondson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/2] block: report errno when flock fcntl fails
Date: Mon, 21 Dec 2020 13:49:29 +0000
Message-Id: <20201221134931.1194806-1-david.edmondson@oracle.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9841
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxlogscore=950
 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012210098
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9841
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 clxscore=1015
 priorityscore=1501 mlxscore=0 lowpriorityscore=0 adultscore=0
 mlxlogscore=968 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012210098
Received-SPF: pass client-ip=156.151.31.86;
 envelope-from=david.edmondson@oracle.com; helo=userp2130.oracle.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, David Edmondson <david.edmondson@oracle.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As Kevin pointed out, adding the error reported by fcntl to the
reported error required updates to the tests.

When running the tests there were lots of failures due to output
comparison problems, such as:

@@ -6,7 +6,9 @@
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=SIZE
 { 'execute': 'qmp_capabilities' }
 {"return": {}}
-{'execute':'drive-mirror', 'arguments':{ 'device': 'src', 'target': 'TEST_DIR/t.IMGFMT', 'mode': 'existing', 'sync': 'full'}}
+{'execute':'drive-mirror', 'arguments':{
+            'device': 'src', 'target': 'TEST_DIR/t.IMGFMT',
+            'mode': 'existing', 'sync': 'full'}}
 WARNING: Image format was not specified for 'TEST_DIR/t.raw' and probing guessed raw.
          Automatically detecting the format is dangerous for raw images, write operations on block 0 will be restricted.
          Specify the 'raw' format explicitly to remove the restrictions.

To avoid this, the second patch flattens the input command that will
be sent to the tool before it is echoed back for later comparison.

v2:
- Update the tests appropriately (Kevin).
- Removed qemu-trivial given that there was debate.
- Filter the input echoed before sending to qemu* during testing such
  that comparisons succeed.

David Edmondson (2):
  block: report errno when flock fcntl fails
  tests: Collapse echoed JSON input to a single line

 block/file-posix.c               | 20 ++++-----
 tests/qemu-iotests/153.out       | 76 ++++++++++++++++----------------
 tests/qemu-iotests/182.out       |  2 +-
 tests/qemu-iotests/common.filter |  6 +++
 tests/qemu-iotests/common.qemu   |  2 +-
 5 files changed, 56 insertions(+), 50 deletions(-)

-- 
2.29.2


