Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ABA92A063B
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Oct 2020 14:08:42 +0100 (CET)
Received: from localhost ([::1]:35646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kYU93-0004xV-87
	for lists+qemu-devel@lfdr.de; Fri, 30 Oct 2020 09:08:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <03f68c7ec08064e20f43797f4eb4305ad21e1e8e@lizzy.crudebyte.com>)
 id 1kYTw9-0003s0-Vo
 for qemu-devel@nongnu.org; Fri, 30 Oct 2020 08:55:22 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:34047)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <03f68c7ec08064e20f43797f4eb4305ad21e1e8e@lizzy.crudebyte.com>)
 id 1kYTw7-0003is-3r
 for qemu-devel@nongnu.org; Fri, 30 Oct 2020 08:55:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Content-ID:
 Content-Description; bh=ggk0zVJExqzQJWFysZF+9gRAqWsEdg45sGxfkkiHXA8=; b=YAotc
 00CjnOK2MULH9/RvdB7yW18Ii2PIRbbsZ935JmUW4Y0iEyIBE9fN25CgbmibOiPZt+CxkMaBEZtFZ
 Ek7nPhHnSrlj5w+h/ejRzBFU5nAU9FkDRpVpE0moyxr9LXuQBUjg0MpPcBQjtdZ1XqookdynU0lx0
 KzkGTPIAIKdcSQr6y3xxsMHhwGPUyux/cJFboBbgNNNBY48d8XAzwePgZpYDpTve/aJEVPf8SI0Vc
 DWO38p0vuOkk3qV6qB0WJsSKVeU0eddvXHR2j5vd1a0EDl6HdEy1PtyFL0oavOMNCAbC1vIW1hlP+
 Y9ZnS+lDAHXz4gvVoM7CmpRzmkDgQ==;
Message-Id: <cover.1604061839.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Fri, 30 Oct 2020 13:43:59 +0100
Subject: [PATCH v2 0/2] 9pfs: test suite fixes
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=03f68c7ec08064e20f43797f4eb4305ad21e1e8e@lizzy.crudebyte.com;
 helo=lizzy.crudebyte.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/30 07:59:50
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Fixes two bugs with the 9pfs 'local' tests as discussed with latest 9P PR
(2020-10-23). See the discussion of that PR for details.

v1->v2:

  - Added Greg's tested-by tag [patch 1].

  - Log an info-level message if mkdir() failed [patch 2].

  - Update commit log message about coverity being the reporter and
    details of the coverity report [patch 2].

Christian Schoenebeck (2):
  tests/9pfs: fix test dir for parallel tests
  tests/9pfs: fix coverity error in create_local_test_dir()

 tests/qtest/libqos/virtio-9p.c | 32 +++++++++++++++++++++++++-------
 1 file changed, 25 insertions(+), 7 deletions(-)

-- 
2.20.1


