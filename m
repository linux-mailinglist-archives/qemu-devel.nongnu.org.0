Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF122B6A5A
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 17:34:12 +0100 (CET)
Received: from localhost ([::1]:39130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf3vn-0004UP-QO
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 11:34:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kf3sp-0001uK-41
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 11:31:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kf3sn-0007rk-3w
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 11:31:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605630664;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=unzN6rySqxtmhwhd1tTsQM5A9gtBf+0ddoIIzskmeOY=;
 b=XvLxqeXLGtRy6T11G8tmefq0+U8eqRynX0m3NKjzyXtMZVLBS4OBshUsMgt7HT/0azF7zM
 oW0uAvPeU8mr2EmBYz/zKyLZWnYu1seYb5SFzyrcK1fQkBM+tj471WEtajlNLSYnS6Ogs2
 UApyp5KFbDQUdtKnzQe/QDS4Qy3oXvU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-11-FIRAZ1LmMpGwmH76IDy72g-1; Tue, 17 Nov 2020 11:31:00 -0500
X-MC-Unique: FIRAZ1LmMpGwmH76IDy72g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7BB575F9E6
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 16:30:59 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-114-113.ams2.redhat.com [10.36.114.113])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9C7C66BF6B;
 Tue, 17 Nov 2020 16:30:58 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for-5.2? 1/2] authz-pam: Check that 'service' property is set
Date: Tue, 17 Nov 2020 17:30:44 +0100
Message-Id: <20201117163045.307451-2-kwolf@redhat.com>
In-Reply-To: <20201117163045.307451-1-kwolf@redhat.com>
References: <20201117163045.307451-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 01:18:45
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
Cc: kwolf@redhat.com, berrange@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If the 'service' property is not set, we'll call pam_start() with a NULL
pointer for the service name. This fails and leaves a message like this
in the syslog:

qemu-storage-daemon[294015]: PAM pam_start: invalid argument: service == NULL

Make specifying the property mandatory and catch the error already
during the creation of the object.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 authz/pamacct.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/authz/pamacct.c b/authz/pamacct.c
index e67195f7be..c862d9ff39 100644
--- a/authz/pamacct.c
+++ b/authz/pamacct.c
@@ -84,6 +84,12 @@ qauthz_pam_prop_get_service(Object *obj,
 static void
 qauthz_pam_complete(UserCreatable *uc, Error **errp)
 {
+    QAuthZPAM *pauthz = QAUTHZ_PAM(uc);
+
+    if (!pauthz->service) {
+        error_setg(errp, "The 'service' property must be set");
+        return;
+    }
 }
 
 
-- 
2.28.0


