Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA193A5A8C
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Jun 2021 23:11:25 +0200 (CEST)
Received: from localhost ([::1]:42154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsXO8-0002Tc-8Y
	for lists+qemu-devel@lfdr.de; Sun, 13 Jun 2021 17:11:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thorpej@me.com>) id 1lsXNA-0001la-TT
 for qemu-devel@nongnu.org; Sun, 13 Jun 2021 17:10:24 -0400
Received: from mr85p00im-hyfv06011401.me.com ([17.58.23.191]:47981)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thorpej@me.com>) id 1lsXN7-0005br-GU
 for qemu-devel@nongnu.org; Sun, 13 Jun 2021 17:10:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai;
 t=1623618615; bh=tNOhiYNYzV6StnGIYqlvcD6hsD49uzPXGxsMboGH6h8=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=v7virgmQqMXJfc3XjSwk5hb6m2GbhPRlfODHrsjBYu7fDt5aTs5Cf+XT8l7S/oQMW
 ft0G+qB9P2ZRgsrg0R9IXZw3KzSOPTS2pHG/G/Xtjz5RiUVlkUm9aWTA2hQJrfpDGN
 Qe3ZnThDyCaD21tLyS8OkgcXlHAd9uAzPtqeu+J6chp8WlpsgfPKN+Utsw+5oALBac
 Mx/hSAnzHbOG/5D/yX6pzCneVjG3NgPfnnWEx8/vy5DLxtDbCt9IHbiKXho95aEUwN
 sfpFHZ+Fo5cBOfoVe6odNRJlI1xXn8htqc8zqCZjh1JcQPGZDund6sG8hDbQhNM3U2
 ej2Ti0i5moviw==
Received: from the-ripe-vessel.ktnet (c-67-180-181-196.hsd1.ca.comcast.net
 [67.180.181.196])
 by mr85p00im-hyfv06011401.me.com (Postfix) with ESMTPSA id D7EC5D20361;
 Sun, 13 Jun 2021 21:10:14 +0000 (UTC)
From: Jason Thorpe <thorpej@me.com>
To: qemu-devel@nongnu.org
Cc: Jason Thorpe <thorpej@me.com>,
	richard.henderson@linaro.org
Subject: [PATCH v2 0/1] PALcode fixes for guest OS console initialization
Date: Sun, 13 Jun 2021 14:09:33 -0700
Message-Id: <20210613210934.21143-1-thorpej@me.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.391,18.0.761,17.0.607.475.0000000_definitions?=
 =?UTF-8?Q?=3D2021-06-13=5F10:2021-06-11=5F06,2021-06-13=5F10,2020-04-07?=
 =?UTF-8?Q?=5F01_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=684
 clxscore=1015
 mlxscore=0 adultscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 spamscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2106130150
Received-SPF: pass client-ip=17.58.23.191; envelope-from=thorpej@me.com;
 helo=mr85p00im-hyfv06011401.me.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a follow-up on my previous set of patches for the Qemu PALcode,
which were merged except for the CTB patch.  The patch has incorporated
review feedback, but there is still some research going on about how
real DEC SRM initializes a particular field in various circumstances;
this is my best guess based on available documentation and observed
behavior of real machines, and is sufficient for the BSD operating systems.

Jason Thorpe (1):
  Provide a minimal Console Terminal Block in the HWRPB.

 hwrpb.h  | 54 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 init.c   | 36 +++++++++++++++++++++++++++++++++---
 protos.h |  2 ++
 vgaio.c  |  2 ++
 4 files changed, 91 insertions(+), 3 deletions(-)

-- 
2.30.2


