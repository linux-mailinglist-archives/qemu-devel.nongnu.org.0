Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C1A69DC7F
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 10:02:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUOWU-0007eO-J1; Tue, 21 Feb 2023 04:01:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mads@ynddal.dk>) id 1pUOWS-0007do-M0
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 04:01:16 -0500
Received: from mr85p00im-ztdg06011201.me.com ([17.58.23.181])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mads@ynddal.dk>) id 1pUOWQ-0005SS-KR
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 04:01:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ynddal.dk; s=sig1;
 t=1676970069; bh=QZoKDwoGoISnaX+hgH56Hoc2Owv81hb73bRcvefDx08=;
 h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version;
 b=UTNGsro7t+VRLHrvbh/eeOkGOURQliEJlTKPymJApTYyOAy44/Ldy8U3K1SRh+jZT
 NbRc7wgYsRYEZhFSFVhjlyQ+bNpGQmeOnTlLCItLqnyl77PbsSYic22wRi2NMYa5aq
 75X20Eemwipor5SvO8Feza6HyW11FGj/eKdIF0p9SWetvdGfvWMq+Jf2zQNJ9VhaEm
 K2jLg68Dc5jkromnlCxSkvI0olZKwo2h7x3VrnSqHB2Em+wfJJWs4MKqYeOsjJyrcw
 wRmMJkXekS+j4sSzVtZjUywOQIgwxKlXLuZtWzsONjh7s72rFkZvCBq82GmpOG0+YM
 qwsDG1YVvS6dQ==
Received: from localhost.localdomain (mr38p00im-dlb-asmtp-mailmevip.me.com
 [17.57.152.18])
 by mr85p00im-ztdg06011201.me.com (Postfix) with ESMTPSA id 8294596267B;
 Tue, 21 Feb 2023 09:01:07 +0000 (UTC)
From: Mads Ynddal <mads@ynddal.dk>
To: qemu-devel@nongnu.org
Cc: John Snow <jsnow@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Mads Ynddal <m.ynddal@samsung.com>
Subject: [PATCH 0/9] simpletrace: refactor and general improvements
Date: Tue, 21 Feb 2023 10:00:55 +0100
Message-Id: <20230221090104.86103-1-mads@ynddal.dk>
X-Mailer: git-send-email 2.38.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 0Aqbbbuwla09BDeHBmC8SljaRUg24nRX
X-Proofpoint-GUID: 0Aqbbbuwla09BDeHBmC8SljaRUg24nRX
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.425,18.0.816,17.0.605.474.0000000_definitions?=
 =?UTF-8?Q?=3D2022-01-18=5F01:2022-01-14=5F01,2022-01-18=5F01,2020-01-23?=
 =?UTF-8?Q?=5F02_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxlogscore=617
 phishscore=0 adultscore=0 spamscore=0 clxscore=1030 bulkscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2302210078
Received-SPF: pass client-ip=17.58.23.181; envelope-from=mads@ynddal.dk;
 helo=mr85p00im-ztdg06011201.me.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Mads Ynddal <m.ynddal@samsung.com>

I wanted to use simpletrace.py for an internal project, so I tried to update
and polish the code. Some of the commits resolve specific issues, while some
are more subjective.

I've tried to divide it into commits so we can discuss the
individual changes, and I'm ready to pull things out, if it isn't needed.

Mads Ynddal (9):
  simpletrace: Improve parsing of sys.argv; fix files never closed.
  simpletrace: Annotate magic constants from QEMU code
  simpletrace: changed naming of edict and idtoname to improve
    readability
  simpletrace: update code for Python 3.11
  simpletrace: Changed Analyzer class to become context-manager
  simpletrace: Simplify construction of tracing methods
  simpletrace: Improved error handling on struct unpack
  simpletrace: define exception and add handling
  simpletrace: Refactor to separate responsibilities

 scripts/simpletrace.py | 293 ++++++++++++++++++-----------------------
 1 file changed, 127 insertions(+), 166 deletions(-)

-- 
2.38.1


