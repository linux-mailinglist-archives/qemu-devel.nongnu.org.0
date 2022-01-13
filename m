Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B516048DEAD
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 21:14:12 +0100 (CET)
Received: from localhost ([::1]:47500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n86U7-0001hm-RU
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 15:14:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1n861z-0007uE-A9
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 14:45:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59866)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1n861w-0007Eu-TF
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 14:45:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642103103;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=hmWuDi0f9dmOTv1ClYSbadmA4qGpTxcnivkScP0hLMc=;
 b=W818i82yelPBSXimuclySfNygpqNMW5w3+X21h09c0nozXssMiDTQLfDYkYYU7JzVHgLX0
 WW58IP9IyL4mjOavlfmbgywgpye5YbHXAHZVT9vt1enAVXY56BzE6UqnFIoZzifYYcXC7F
 st08hArlNmSRuUFhlvFYF4MzAsisuvc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-632-ujMSS5lSPA-aY_mL0vONmw-1; Thu, 13 Jan 2022 14:45:00 -0500
X-MC-Unique: ujMSS5lSPA-aY_mL0vONmw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 226F184BA40;
 Thu, 13 Jan 2022 19:44:59 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.39.195.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B4BE3100E125;
 Thu, 13 Jan 2022 19:44:57 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, peter.maydell@linaro.org, quintela@redhat.com,
 marcandre.lureau@gmail.com
Subject: [PATCH v2 0/3] vmsd checks
Date: Thu, 13 Jan 2022 19:44:49 +0000
Message-Id: <20220113194452.254011-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.594,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: lsoaresp@redhat.com, peterx@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

Aftern the patch the other day where I added a missing END_OF_LIST,
Peter suggested adding something more robust.

Here I:
  add a check for a flag at the end of the list
  add a check that's performed in vmstate_register_with_alias_id
    only within qtest recursively for that canary and for
    subsection naming constraints.
  Fix a ppc issue that the vmstate naming constraint caught
    (Waiting for a reply from the PPC folk to check that).

The checks can't go in until I get the def into libslirp.

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>


Dr. David Alan Gilbert (3):
  ppc: Fix vmstate_pbr403 subsection name
  migration: Add canary to VMSTATE_END_OF_LIST
  migration: Perform vmsd structure check during tests

 include/migration/vmstate.h |  7 ++++++-
 migration/savevm.c          | 40 +++++++++++++++++++++++++++++++++++++
 migration/vmstate.c         |  2 ++
 target/ppc/machine.c        |  2 +-
 4 files changed, 49 insertions(+), 2 deletions(-)

-- 
2.34.1


