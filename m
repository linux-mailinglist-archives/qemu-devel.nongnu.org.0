Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 169696F400F
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 11:25:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptmEk-0004zL-T4; Tue, 02 May 2023 05:23:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mads@ynddal.dk>) id 1ptmEi-0004yj-V6
 for qemu-devel@nongnu.org; Tue, 02 May 2023 05:23:52 -0400
Received: from mr85p00im-ztdg06021701.me.com ([17.58.23.196])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mads@ynddal.dk>) id 1ptmEg-0003yw-Vj
 for qemu-devel@nongnu.org; Tue, 02 May 2023 05:23:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ynddal.dk; s=sig1;
 t=1683019426; bh=FJhwtHJ3YSQC3owUOiP3HBOSdyBnuMHJV0J7ilgQUxo=;
 h=From:To:Subject:Date:Message-Id:MIME-Version:Content-Type;
 b=Xz/SrfB6rjfOEJWy+MWpnuSh8GZid1nPpQdgtYtcgIYETi93sB6WCRgzTrauztSPM
 K0g4Oo2/HmrEA662ssp4UmpQ9GAaJ5EbmUoI/VzyKHpgR9Dk7MEffm/er1Ceid51tN
 QQl/8loS2zmXmqKzKv8aFJwYXYasalSS64QWqUKRQeah0EfIFcg7lil52zgu73WQOC
 QZJUN6w5pfrNvVlms5FWXMd9lq+jKOBafiRApjRuUqSQXuppDPbmeo+4USKhZdH/gK
 D4PdMT5MUS+zMya6cWMUgFBwSpm8nh2naFi1S8Lw9cI7KpYJN7yTWOgoCFeLqv2Gbf
 SzEB2zhJpYxeg==
Received: from localhost.localdomain (mr38p00im-dlb-asmtp-mailmevip.me.com
 [17.57.152.18])
 by mr85p00im-ztdg06021701.me.com (Postfix) with ESMTPSA id EB92526338CB;
 Tue,  2 May 2023 09:23:43 +0000 (UTC)
From: Mads Ynddal <mads@ynddal.dk>
To: qemu-devel@nongnu.org
Cc: Cleber Rosa <crosa@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 John Snow <jsnow@redhat.com>, Mads Ynddal <mads@ynddal.dk>,
 Mads Ynddal <m.ynddal@samsung.com>
Subject: [PATCH v2 00/12] simpletrace: refactor and general improvements
Date: Tue,  2 May 2023 11:23:27 +0200
Message-Id: <20230502092339.27341-1-mads@ynddal.dk>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: kSBKuisdwSznXxf2Fwb6Q72A5h9zD8_m
X-Proofpoint-ORIG-GUID: kSBKuisdwSznXxf2Fwb6Q72A5h9zD8_m
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.425,18.0.816,17.11.62.513.0000000_definitions?=
 =?UTF-8?Q?=3D2022-01-18=5F01:2022-01-14=5F01,2022-01-18=5F01,2021-12-02?=
 =?UTF-8?Q?=5F01_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 adultscore=0 spamscore=0
 phishscore=0 clxscore=1030 mlxlogscore=369 bulkscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2305020080
Received-SPF: pass client-ip=17.58.23.196; envelope-from=mads@ynddal.dk;
 helo=mr85p00im-ztdg06021701.me.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

v2:
 * Added myself as maintainer of simpletrace.py
 * Improve docstring on `process`
 * Changed call to `process` in scripts/analyse-locks-simpletrace.py to reflect new argument types
 * Replaced `iteritems()` with `items()` in scripts/analyse-locks-simpletrace.py to support Python 3

Mads Ynddal (12):
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
  MAINTAINERS: add maintainer of simpletrace.py
  scripts/analyse-locks-simpletrace.py: changed iteritems() to items()
  scripts/analyse-locks-simpletrace.py: reflect changes to process in
    simpletrace.py

 MAINTAINERS                          |   8 +-
 scripts/analyse-locks-simpletrace.py |   5 +-
 scripts/simpletrace.py               | 307 ++++++++++++---------------
 3 files changed, 150 insertions(+), 170 deletions(-)

-- 
2.38.1


