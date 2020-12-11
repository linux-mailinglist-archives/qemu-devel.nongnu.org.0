Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1CC32D7BDE
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 18:03:33 +0100 (CET)
Received: from localhost ([::1]:43962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knlpM-0005m7-OM
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 12:03:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alejandro.j.jimenez@oracle.com>)
 id 1knlh2-0001DF-GO
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 11:54:59 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:43908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alejandro.j.jimenez@oracle.com>)
 id 1knlgz-00053H-Gm
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 11:54:56 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BBGrfnJ006452;
 Fri, 11 Dec 2020 16:54:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id; s=corp-2020-01-29;
 bh=dD4iN379Hz58oBY21Pm8ldgJC2ca7eb8jfvCArxIGDw=;
 b=Ed695jBe1CQje2+GgdnKV9vWs9xyodNhw8LIJPnyFIY8TXwF9by+TUtan4m21cMG7y7/
 bgh0Qo5+Ox2kfQ4vkck0GxxVH5lLXAZgW3CfPVczW1MYbBnPMyv9w49dMwhD66CsoU1i
 5ZBjRCqAqzykZ/O7KGdhKdvUFNGLG1G5o4WRSaKQ3jSH7Q5o/SI21O7R9SSA9NBBOFSf
 ZOMg3/vm9OTaSNZ4A1pcGQI25gOtJ9julFOEwYAYjazluOIn5Io0ZmQ872yDptwvcU+n
 LdLovrbi+MKmXOp/HIFA8AL19e3gTQ7QlaliQOCx03e2admo8+25V4ICL2856ah7x2tk sw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2120.oracle.com with ESMTP id 35825mkm64-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 11 Dec 2020 16:54:50 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BBGig7Y189169;
 Fri, 11 Dec 2020 16:52:50 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3020.oracle.com with ESMTP id 358m43vgrr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 11 Dec 2020 16:52:50 +0000
Received: from abhmp0001.oracle.com (abhmp0001.oracle.com [141.146.116.7])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0BBGqn2e021662;
 Fri, 11 Dec 2020 16:52:49 GMT
Received: from ban25x6uut148.us.oracle.com (/10.153.73.148)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 11 Dec 2020 08:52:49 -0800
From: Alejandro Jimenez <alejandro.j.jimenez@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/4] Add a new -action parameter
Date: Fri, 11 Dec 2020 11:52:40 -0500
Message-Id: <1607705564-26264-1-git-send-email-alejandro.j.jimenez@oracle.com>
X-Mailer: git-send-email 1.8.3.1
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9832
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 malwarescore=0 adultscore=0
 bulkscore=0 phishscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012110112
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9832
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 adultscore=0 bulkscore=0
 phishscore=0 mlxlogscore=999 clxscore=1015 priorityscore=1501 mlxscore=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012110113
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
Cc: david.edmondson@oracle.com, pbonzini@redhat.com, mihai.carabas@oracle.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

v3:
- Replaced the no_reboot and no_shutdown internal flags with enumerations that hold the current action
selected in case of reboot or shutdown events. The same approach is used for panic and watchdog events.
- Ensured that -no-shutdown option overrides any previously issued action panic=poweroff setting.
- Added TODO comment to add more panic actions if viable (debug, reset).
- Modified QMP command to take multiple optional args specifying actions for each event type,
and added 'allow-preconfig': true

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
 include/sysemu/runstate-action.h |  22 ++++++
 include/sysemu/sysemu.h          |   1 -
 monitor/qmp-cmds.c               |   3 +-
 qapi/run-state.json              | 149 +++++++++++++++++++++++++++++++++++++++
 qemu-options.hx                  |  25 +++++++
 softmmu/meson.build              |   1 +
 softmmu/runstate-action.c        | 142 +++++++++++++++++++++++++++++++++++++
 softmmu/vl.c                     |  64 ++++++++++++++---
 tests/qtest/pvpanic-test.c       |  26 ++++++-
 ui/sdl2.c                        |   5 +-
 11 files changed, 424 insertions(+), 16 deletions(-)
 create mode 100644 include/sysemu/runstate-action.h
 create mode 100644 softmmu/runstate-action.c

-- 
1.8.3.1


