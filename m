Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD2ED2DB377
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 19:17:11 +0100 (CET)
Received: from localhost ([::1]:57806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpEso-000813-PZ
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 13:17:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kpEXW-0003Fp-7J
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 12:55:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47443)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kpEXN-0001W4-5S
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 12:55:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608054900;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IoIooY5kTNto+GVUebzq1nsJ9dybl104U1SgaGltCvs=;
 b=DQvuK9rjH+8a3Qgnkbp0651MEeGh3v7e3nzPsFKNnp8gbrtFvNvb2pstyNFjURJ8buzWKl
 9S4z4ki4gsYGhSLNlTPHAh9y1Fr2XgbbEPvQLv1TscA6KsLp+FjOPNckjrawHGJQXLgr+I
 tiH2wTsZ6YQtey4hTN/H0CWyXVRihWc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-488-HAMrdilJNPynCZ-jEJw2FQ-1; Tue, 15 Dec 2020 12:54:58 -0500
X-MC-Unique: HAMrdilJNPynCZ-jEJw2FQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E9F7910054FF
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 17:54:57 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A82145C1C4;
 Tue, 15 Dec 2020 17:54:57 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 28/45] qemu-option: pass QemuOptsList to opts_accepts_any
Date: Tue, 15 Dec 2020 12:54:28 -0500
Message-Id: <20201215175445.1272776-29-pbonzini@redhat.com>
In-Reply-To: <20201215175445.1272776-1-pbonzini@redhat.com>
References: <20201215175445.1272776-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
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
Cc: Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A QemuOptsList can be of one of two kinds: either it is pre-validated, or
it accepts any key and validation happens somewhere else (typically in
a Visitor or against a list of QOM properties).  opts_accepts_any
returns true if a QemuOpts instance was created from a QemuOptsList of
the latter kind, but there is no function to do the check on a QemuOptsList.

Since this property comes from the QemuOptsList and almost all callers of
opts_accepts_any use opts->list anyway, modify the function to accept
QemuOptsList.

Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 util/qemu-option.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/util/qemu-option.c b/util/qemu-option.c
index 6bd654a473..c88e159f18 100644
--- a/util/qemu-option.c
+++ b/util/qemu-option.c
@@ -460,16 +460,16 @@ static bool qemu_opt_parse(QemuOpt *opt, Error **errp)
     }
 }
 
-static bool opts_accepts_any(const QemuOpts *opts)
+static bool opts_accepts_any(const QemuOptsList *list)
 {
-    return opts->list->desc[0].name == NULL;
+    return list->desc[0].name == NULL;
 }
 
 int qemu_opt_unset(QemuOpts *opts, const char *name)
 {
     QemuOpt *opt = qemu_opt_find(opts, name);
 
-    assert(opts_accepts_any(opts));
+    assert(opts_accepts_any(opts->list));
 
     if (opt == NULL) {
         return -1;
@@ -500,9 +500,10 @@ static bool opt_validate(QemuOpt *opt, bool *help_wanted,
                          Error **errp)
 {
     const QemuOptDesc *desc;
+    const QemuOptsList *list = opt->opts->list;
 
-    desc = find_desc_by_name(opt->opts->list->desc, opt->name);
-    if (!desc && !opts_accepts_any(opt->opts)) {
+    desc = find_desc_by_name(list->desc, opt->name);
+    if (!desc && !opts_accepts_any(list)) {
         error_setg(errp, QERR_INVALID_PARAMETER, opt->name);
         if (help_wanted && is_help_option(opt->name)) {
             *help_wanted = true;
@@ -535,9 +536,10 @@ bool qemu_opt_set_bool(QemuOpts *opts, const char *name, bool val,
 {
     QemuOpt *opt;
     const QemuOptDesc *desc;
+    const QemuOptsList *list = opts->list;
 
-    desc = find_desc_by_name(opts->list->desc, name);
-    if (!desc && !opts_accepts_any(opts)) {
+    desc = find_desc_by_name(list->desc, name);
+    if (!desc && !opts_accepts_any(list)) {
         error_setg(errp, QERR_INVALID_PARAMETER, name);
         return false;
     }
@@ -557,9 +559,10 @@ bool qemu_opt_set_number(QemuOpts *opts, const char *name, int64_t val,
 {
     QemuOpt *opt;
     const QemuOptDesc *desc;
+    const QemuOptsList *list = opts->list;
 
-    desc = find_desc_by_name(opts->list->desc, name);
-    if (!desc && !opts_accepts_any(opts)) {
+    desc = find_desc_by_name(list->desc, name);
+    if (!desc && !opts_accepts_any(list)) {
         error_setg(errp, QERR_INVALID_PARAMETER, name);
         return false;
     }
@@ -1107,7 +1110,7 @@ bool qemu_opts_validate(QemuOpts *opts, const QemuOptDesc *desc, Error **errp)
 {
     QemuOpt *opt;
 
-    assert(opts_accepts_any(opts));
+    assert(opts_accepts_any(opts->list));
 
     QTAILQ_FOREACH(opt, &opts->head, next) {
         opt->desc = find_desc_by_name(desc, opt->name);
-- 
2.26.2



