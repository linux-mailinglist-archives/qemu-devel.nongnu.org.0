Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D5472B82B9
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 18:13:46 +0100 (CET)
Received: from localhost ([::1]:36508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfR1d-00017l-BR
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 12:13:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kfQz5-0007is-E4
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 12:11:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:34694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kfQz0-00013H-DK
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 12:11:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605719461;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type;
 bh=th+o+wty2Ru60QdMDbS9a1IRrAG6e3xH9+X0nqIMfqk=;
 b=SUc52Fn7N9vwpoE0hrXq6MCRPiTqsN4npaKeXhDaF5Ve787IF/rBpuuoMBNSBZbLt9roUi
 7U0uc6CO2SFXDmMqiV6dP7OR1tnu2glr9ndht+X9XAP2e1aksTt7muqGFYHf61m7NNicJi
 aeLLj26QLCqqdTPHedxThRFUrayMDRE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-316-N8p6MAREPWqs6dTSP9XPjw-1; Wed, 18 Nov 2020 12:10:57 -0500
X-MC-Unique: N8p6MAREPWqs6dTSP9XPjw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5288D10073B2;
 Wed, 18 Nov 2020 17:10:56 +0000 (UTC)
Received: from thuth.com (ovpn-113-139.ams2.redhat.com [10.36.113.139])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 059C960BE2;
 Wed, 18 Nov 2020 17:10:54 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 0/6] configure / meson: Move check for headers to meson.build
Date: Wed, 18 Nov 2020 18:10:46 +0100
Message-Id: <20201118171052.308191-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 19:41:43
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The checks for header files can be done much shorter and nicer in
meson.build. Let's move them there. 

Thomas Huth (6):
  configure: Remove the obsolete check for ifaddrs.h
  configure / meson: Move check for pty.h to meson.build
  configure / meson: Move check for drm.h to meson.build
  configure / meson: Move check for sys/signal.h to meson.build
  configure / meson: Move check for sys/signal.h to meson.build
  configure / meson: Move check for linux/btrfs.h to meson.build

 configure                 | 58 ---------------------------------------
 linux-user/ioctls.h       |  2 +-
 linux-user/syscall.c      |  4 +--
 linux-user/syscall_defs.h |  2 +-
 meson.build               |  5 ++++
 5 files changed, 9 insertions(+), 62 deletions(-)

-- 
2.18.4


