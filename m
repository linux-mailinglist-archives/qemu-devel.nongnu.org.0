Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C9C8286551
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Oct 2020 18:56:20 +0200 (CEST)
Received: from localhost ([::1]:46908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kQCjh-0008Bd-DP
	for lists+qemu-devel@lfdr.de; Wed, 07 Oct 2020 12:56:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kQCct-0000kw-9Y
 for qemu-devel@nongnu.org; Wed, 07 Oct 2020 12:49:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49372)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kQCcq-0002Fb-RM
 for qemu-devel@nongnu.org; Wed, 07 Oct 2020 12:49:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602089352;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=gt7+y7EWj3qmKfn8754NYLNJAoa2kRa2zmAatmYIYRk=;
 b=Ij6+mvB7Pkl/e42BKQEt10VNmBO4LyfBhFyGOlCoT0ZVLuEYRd1V8QVTpga61QZbRrWOJT
 CQuFoRjCyqVywaGQpnKCVLewqNDnVueUUMAYxgKqGgQPgyYXryr+GKClDHw+bTgW1kgeN2
 D9Q0jUdayonVx5jFqeWLZ7R41xiHKOA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-361-x2ySc7g8NRSK5Fow831hyw-1; Wed, 07 Oct 2020 12:49:10 -0400
X-MC-Unique: x2ySc7g8NRSK5Fow831hyw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 75C3864141;
 Wed,  7 Oct 2020 16:49:09 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-113-169.ams2.redhat.com
 [10.36.113.169])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 582765D9DD;
 Wed,  7 Oct 2020 16:49:07 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v3 0/4] qemu-storage-daemon: Remove QemuOpts from --object
 parser
Date: Wed,  7 Oct 2020 18:48:59 +0200
Message-Id: <20201007164903.282198-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/07 00:54:30
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.742,
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
Cc: kwolf@redhat.com, armbru@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This replaces the QemuOpts-based help code for --object in the storage
daemon with code based on the keyval parser.

v3:
- Always parse help options, no matter if the caller implements help or
  not. If it doesn't, return an error. [Markus]
- Document changes to the keyval parser grammar [Markus]
- Support both 'help' and '?' [Eric]
- Test case fixes [Eric]
- Improved documentation of user_creatable_print_help(_from_qdict)
  [Markus]

v2:
- Fixed double comma by reusing the existing key and value parsers [Eric]
- More tests to cover the additional cases

Kevin Wolf (4):
  keyval: Parse help options
  qom: Factor out helpers from user_creatable_print_help()
  qom: Add user_creatable_print_help_from_qdict()
  qemu-storage-daemon: Remove QemuOpts from --object parser

 include/qemu/help_option.h           |   5 +
 include/qemu/option.h                |   2 +-
 include/qom/object_interfaces.h      |  21 ++-
 qapi/qobject-input-visitor.c         |   2 +-
 qom/object_interfaces.c              |  99 ++++++++-----
 storage-daemon/qemu-storage-daemon.c |  15 +-
 tests/test-keyval.c                  | 205 +++++++++++++++++++--------
 util/keyval.c                        |  54 ++++++-
 8 files changed, 280 insertions(+), 123 deletions(-)

-- 
2.25.4


