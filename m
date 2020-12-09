Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 923DF2D48A2
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 19:10:22 +0100 (CET)
Received: from localhost ([::1]:50340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn3uv-0002xK-JN
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 13:10:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alejandro.j.jimenez@oracle.com>)
 id 1kn3fl-0006Ov-29
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 12:54:42 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:48288)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alejandro.j.jimenez@oracle.com>)
 id 1kn3fg-0003Tt-P0
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 12:54:40 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B9HnLqr181505;
 Wed, 9 Dec 2020 17:54:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id; s=corp-2020-01-29;
 bh=WjGEr7tw0uZ0BEwqBbYh1z0U+X+RgXOG73qd0cTuwkc=;
 b=XEqP/D2J7752Q/0XTTodlwaEqTlcgU4qtPkNw4yL8UASrWk4cZQncVVxXUfH9vsr0QiV
 B+9DbEgy8N8NH7wX6HElPGmk4B/8Bg7+E5F2pLy+q7agne/UxUGBcDjM7HRE5TSbgDHU
 p8pw4JiGEio9ugSgTIKV4sY2OUrsw3yDTSOe4akuvVekJb/Yg9/AcvmWCOdQHdFAgGXR
 maTCsNF/WIxBwBLgKw/OSL7rXTce05SQcOAI3Nikb+g/mDJG2GKXzSM5KtQ6z4TORB66
 oNhHjdthT9tbSZAsZNDL5KcBe8aNcnh+yJG0Zci1LVckkWQMuzyidmJ7cufGyL6loZDy 6A== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2120.oracle.com with ESMTP id 35825m9hpj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 09 Dec 2020 17:54:35 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B9HojYP034959;
 Wed, 9 Dec 2020 17:52:35 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3020.oracle.com with ESMTP id 358kyv1nfx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 09 Dec 2020 17:52:34 +0000
Received: from abhmp0008.oracle.com (abhmp0008.oracle.com [141.146.116.14])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0B9HqYqk007383;
 Wed, 9 Dec 2020 17:52:34 GMT
Received: from ban25x6uut148.us.oracle.com (/10.153.73.148)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 09 Dec 2020 09:52:33 -0800
From: Alejandro Jimenez <alejandro.j.jimenez@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/4] Add a new -action parameter
Date: Wed,  9 Dec 2020 12:52:12 -0500
Message-Id: <1607536336-24701-1-git-send-email-alejandro.j.jimenez@oracle.com>
X-Mailer: git-send-email 1.8.3.1
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9829
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 spamscore=0 mlxscore=0
 malwarescore=0 suspectscore=0 mlxlogscore=999 bulkscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012090126
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9829
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 adultscore=0 bulkscore=0
 phishscore=0 mlxlogscore=999 clxscore=1015 priorityscore=1501 mlxscore=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012090126
Received-SPF: pass client-ip=141.146.126.78;
 envelope-from=alejandro.j.jimenez@oracle.com; helo=aserp2120.oracle.com
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
Cc: david.edmondson@oracle.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

v2:
- Replaced the individual qmp commands in patch 3/4 for a generic set-action
command that takes a RunStateAction parameter, specifying an event|action pair.
- Removed qmp_ prefix from X_set_action() functions in runstate-action.c

***

This is a follow up to the proposal to add a "-no-panicstop" option to QEMU that would allow us to
control whether the VM is paused or allowed to continue running without intervention from a management layer
when a guest panic occurs. See the inital thread and replies for details:

https://lore.kernel.org/qemu-devel/1601606494-1154-1-git-send-email-alejandro.j.jimenez@oracle.com/

From that discussion came a request for a generic mechanism to group options like -no-shutdown, -no-reboot, etc,
that specify an action taken by QEMU in response to a guest event (reboot, shutdown, panic, and watchdog
expiration are the current options). The existing options would translate to the new option, like:

* -no-reboot --> "-action reboot=shutdown"
* -no-shutdown --> "-action shutdown=pause"

Please share any questions or comments.

Regards,
Alejandro

Alejandro Jimenez (4):
  vl: Add an -action option to respond to guest events
  vl: Add option to avoid stopping VM upon guest panic
  qmp: Allow setting -action parameters on the fly
  qtest/pvpanic: Test panic option that allows VM to continue

 MAINTAINERS                      |   2 +
 include/sysemu/runstate-action.h |  16 ++++
 include/sysemu/sysemu.h          |   2 +
 qapi/run-state.json              | 135 +++++++++++++++++++++++++++++
 qemu-options.hx                  |  25 ++++++
 softmmu/meson.build              |   1 +
 softmmu/runstate-action.c        | 182 +++++++++++++++++++++++++++++++++++++++
 softmmu/vl.c                     |  44 +++++++++-
 tests/qtest/pvpanic-test.c       |  26 +++++-
 9 files changed, 428 insertions(+), 5 deletions(-)
 create mode 100644 include/sysemu/runstate-action.h
 create mode 100644 softmmu/runstate-action.c

-- 
1.8.3.1


