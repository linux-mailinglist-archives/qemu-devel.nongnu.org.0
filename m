Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4530528A629
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Oct 2020 09:39:06 +0200 (CEST)
Received: from localhost ([::1]:49038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kRVwf-0002sw-8X
	for lists+qemu-devel@lfdr.de; Sun, 11 Oct 2020 03:39:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kRVsx-0006CG-JR
 for qemu-devel@nongnu.org; Sun, 11 Oct 2020 03:35:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50092)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kRVst-0003GG-3V
 for qemu-devel@nongnu.org; Sun, 11 Oct 2020 03:35:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602401710;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=koweVoE+93JxpLnB6JkIus7c7HjbsCClqkqgl+uqFPM=;
 b=CgOLBox4Lt/wqZQMJiGkXDQunB6saxKsjK583Qse/+HpHVmmFk0MatEptm7mMZ+EL28NuC
 z3miMfCrrLeMasljaEHIC33oCrR4u+DMst8EFFNUVZaoXwfsL/MCYfCL4Dw/9sJFfnkT1S
 1err8hzT434NNKGNNf0fSDPiaaPSKsA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-555-1dCdxCeLMbGj1BAquJVjrg-1; Sun, 11 Oct 2020 03:35:07 -0400
X-MC-Unique: 1dCdxCeLMbGj1BAquJVjrg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C95398030C3;
 Sun, 11 Oct 2020 07:35:06 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-182.ams2.redhat.com
 [10.36.112.182])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9755D76663;
 Sun, 11 Oct 2020 07:35:06 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1338E11329AE; Sun, 11 Oct 2020 09:35:05 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 0/7] qemu-storage-daemon: Remove QemuOpts from --object
Date: Sun, 11 Oct 2020 09:34:58 +0200
Message-Id: <20201011073505.1185335-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/11 02:10:40
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
Cc: kwolf@redhat.com, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This replaces the QemuOpts-based help code for --object in the storage
daemon with code based on the keyval parser.

Review of v3 led me to preexisting issues.  Instead of posting my
fixes separately, then working with Kevin to rebase his work on top of
mine, I did the rebase myself and am posting it together with my fixes
as v4.  Hope that's okay.

Note: to test qemu-storage-daemon --object help, you need Philippe's
"[PATCH v3] hw/nvram: Always register FW_CFG_DATA_GENERATOR_INTERFACE"
and its prerequisites (first 10 patches of Paolo's "[PULL 00/39] SCSI,
qdev, qtest, meson patches for 2020-10-10"), so it doesn't crash with
"missing interface 'fw_cfg-data-generator' for object 'tls-creds'".

v4:
- PATCH 1-3: New
- PATCH 4:
  * Rebased
  * Commit message typos [Eric]
  * Replace flawed is_help_option_n() by starts_with_help_option()
    [me]
  * Update grammar and accompanying prose [me]
  * Update keyval_parse_one()'s contract, tweak keyval_parse()'s [me]
  * Revert the keyval_parse_one() change to a rebased version of v1,
    because it's simpler and the edge case that led to the more
    complicated version no longer exists [me].
  * Rearrange tests so the simple cases come first
- PATCH 5-7: Unchanged

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

Markus Armbruster (3):
  keyval: Fix and clarify grammar
  test-keyval: Demonstrate misparse of ',' with implied key
  keyval: Fix parsing of ',' in value of implied key

 include/qemu/help_option.h           |  11 ++
 include/qemu/option.h                |   2 +-
 include/qom/object_interfaces.h      |  21 ++-
 qapi/qobject-input-visitor.c         |   2 +-
 qom/object_interfaces.c              |  99 ++++++++------
 storage-daemon/qemu-storage-daemon.c |  15 +--
 tests/test-keyval.c                  | 187 ++++++++++++++++++---------
 util/keyval.c                        | 103 +++++++++++----
 8 files changed, 297 insertions(+), 143 deletions(-)

-- 
2.26.2


