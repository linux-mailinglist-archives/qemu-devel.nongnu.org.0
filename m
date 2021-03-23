Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91B03345B50
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 10:49:28 +0100 (CET)
Received: from localhost ([::1]:47712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOdfD-0004sy-6L
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 05:49:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lOdWk-0001Pp-BQ
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 05:40:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60417)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lOdWg-00020P-DB
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 05:40:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616492437;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VVyW/9lR9dRFjF0U31MDFFcovWErVPqgdD9pATVxj6w=;
 b=f5w/zlefvGf3Dz8weYDL9MFFBS+W05zo+R1vfGRD69wac/lRm7snI+bm5ViKePIP+zBeXf
 65XN6LbmiSFGHp9+DEAjPv8oRui5mmrY3MOjFgiuCVJZSRhYDtHfbeAZFiQuSROR8b1a42
 pJXzTqKLwUPkhVBwuftLcFiHY3xB2cI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-505-5V2KUYpENNuP-6W7yCW_qw-1; Tue, 23 Mar 2021 05:40:35 -0400
X-MC-Unique: 5V2KUYpENNuP-6W7yCW_qw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8765F87A82A;
 Tue, 23 Mar 2021 09:40:34 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 530F560BE5;
 Tue, 23 Mar 2021 09:40:34 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 186E111326AD; Tue, 23 Mar 2021 10:40:26 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 25/28] tests/qapi-schema: Switch member name clash test to
 struct
Date: Tue, 23 Mar 2021 10:40:22 +0100
Message-Id: <20210323094025.3569441-26-armbru@redhat.com>
In-Reply-To: <20210323094025.3569441-1-armbru@redhat.com>
References: <20210323094025.3569441-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: jsnow@redhat.com, michael.roth@amd.com, marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Test args-name-clash covers command parameter name clash.  This
effectively covers struct member name clash as well.  The next commit
will make paramater name clash impossible.  Convert args-name-clash
from testing command to testing a struct, and rename it to
struct-member-name-clash.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 tests/qapi-schema/args-name-clash.err                           | 2 --
 tests/qapi-schema/meson.build                                   | 2 +-
 tests/qapi-schema/struct-member-name-clash.err                  | 2 ++
 .../{args-name-clash.json => struct-member-name-clash.json}     | 2 +-
 .../{args-name-clash.out => struct-member-name-clash.out}       | 0
 5 files changed, 4 insertions(+), 4 deletions(-)
 delete mode 100644 tests/qapi-schema/args-name-clash.err
 create mode 100644 tests/qapi-schema/struct-member-name-clash.err
 rename tests/qapi-schema/{args-name-clash.json => struct-member-name-clash.json} (64%)
 rename tests/qapi-schema/{args-name-clash.out => struct-member-name-clash.out} (100%)

diff --git a/tests/qapi-schema/args-name-clash.err b/tests/qapi-schema/args-name-clash.err
deleted file mode 100644
index 3e04817bc0..0000000000
--- a/tests/qapi-schema/args-name-clash.err
+++ /dev/null
@@ -1,2 +0,0 @@
-args-name-clash.json: In command 'oops':
-args-name-clash.json:4: parameter 'a_b' collides with parameter 'a-b'
diff --git a/tests/qapi-schema/meson.build b/tests/qapi-schema/meson.build
index 4e7635f0a8..8ba6917132 100644
--- a/tests/qapi-schema/meson.build
+++ b/tests/qapi-schema/meson.build
@@ -30,7 +30,6 @@ schemas = [
   'args-member-array-bad.json',
   'args-member-case.json',
   'args-member-unknown.json',
-  'args-name-clash.json',
   'args-union.json',
   'args-unknown.json',
   'bad-base.json',
@@ -177,6 +176,7 @@ schemas = [
   'struct-member-if-invalid.json',
   'struct-member-invalid-dict.json',
   'struct-member-invalid.json',
+  'struct-member-name-clash.json',
   'trailing-comma-list.json',
   'trailing-comma-object.json',
   'type-bypass-bad-gen.json',
diff --git a/tests/qapi-schema/struct-member-name-clash.err b/tests/qapi-schema/struct-member-name-clash.err
new file mode 100644
index 0000000000..6ac042d59d
--- /dev/null
+++ b/tests/qapi-schema/struct-member-name-clash.err
@@ -0,0 +1,2 @@
+struct-member-name-clash.json: In struct 'Oops':
+struct-member-name-clash.json:4: member 'a_b' collides with member 'a-b'
diff --git a/tests/qapi-schema/args-name-clash.json b/tests/qapi-schema/struct-member-name-clash.json
similarity index 64%
rename from tests/qapi-schema/args-name-clash.json
rename to tests/qapi-schema/struct-member-name-clash.json
index 61423cb893..3fb69cc2ce 100644
--- a/tests/qapi-schema/args-name-clash.json
+++ b/tests/qapi-schema/struct-member-name-clash.json
@@ -1,4 +1,4 @@
 # C member name collision
 # Reject members that clash when mapped to C names (we would have two 'a_b'
 # members).
-{ 'command': 'oops', 'data': { 'a-b': 'str', 'a_b': 'str' } }
+{ 'struct': 'Oops', 'data': { 'a-b': 'str', 'a_b': 'str' } }
diff --git a/tests/qapi-schema/args-name-clash.out b/tests/qapi-schema/struct-member-name-clash.out
similarity index 100%
rename from tests/qapi-schema/args-name-clash.out
rename to tests/qapi-schema/struct-member-name-clash.out
-- 
2.26.3


