Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8026339635
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 19:23:09 +0100 (CET)
Received: from localhost ([::1]:54254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKmRI-00039z-NJ
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 13:23:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lKlhc-0001OI-IM
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 12:35:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36027)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lKlha-0005Mp-BA
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 12:35:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615570551;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=C2E9vB9I2egGA1cB/CM47bDAgVcUfcsjCnTu27Lr9ng=;
 b=PgEtL3cFvjhihBvpHo0lg8faexU6Z1ZJD/U72P/B7yY6iDWOUjKZyCd0/jlPXyqlxfskfj
 RAA0VPaX4+MZ8d7zDDA+WUbVUR3vVupSiqlaU+5+mhY0eQuT2u3Na4Txh7CV2bzBBpHrXL
 KeMygj+0IvBqkW2bDulCZbVL5/GMNns=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-127-dWn4HmLFMy630ZRZZuEudw-1; Fri, 12 Mar 2021 12:35:49 -0500
X-MC-Unique: dWn4HmLFMy630ZRZZuEudw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 29C598018A3
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 17:35:48 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AD79F5C1C5;
 Fri, 12 Mar 2021 17:35:47 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/3] vl: QAPIfy -object
Date: Fri, 12 Mar 2021 12:35:44 -0500
Message-Id: <20210312173547.1283477-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a replacement for -object QAPIfication that keeps QemuOpts
in order to not break some of the CLI parsing extensions that OptsVisitor
includes.  Since keyval is not used, support for directly passing
JSON syntax to the option must be added manually, which is what patch
3 does.  However, both the QemuOpts and the JSON paths go through
the new ObjectOptions interface, just with two different visitors,
so we can reuse all the new type-safe code that Kevin has added.

Patch 1 is a patch that I already had lying around, which I included
to be able to remove user_creatable_add_opts completely in patch 2.

Paolo

Based-on: <20210311144811.313451-1-kwolf@redhat.com>

Paolo Bonzini (3):
  tests: convert check-qom-proplist to keyval
  qom: move user_creatable_add_opts logic to vl.c and QAPIfy it
  vl: allow passing JSON to -object

 include/qom/object_interfaces.h | 47 -------------------
 qom/object_interfaces.c         | 54 ---------------------
 softmmu/vl.c                    | 83 ++++++++++++++++++++++++++-------
 tests/check-qom-proplist.c      | 77 +++++++++++++++++++++---------
 4 files changed, 120 insertions(+), 141 deletions(-)

v1->v2: avoid g_assert with side effects, fix -object without qom-type

-- 
2.26.2


