Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE2A042BBEA
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 11:48:18 +0200 (CEST)
Received: from localhost ([::1]:40242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maarx-0004im-PS
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 05:48:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1maaEz-0002cW-BE
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 05:08:06 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:46993)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1maaEu-0005zc-Vf
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 05:08:01 -0400
Received: by mail-ed1-x531.google.com with SMTP id z20so7133128edc.13
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 02:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0p6Xy3m/q/Jw9/CEOKm+gyba6CHxYqCDNm/LIuD+WsE=;
 b=U9UH7fWTuqWmMC/IGtuL9mPzj0m7lqwYGhLmk/hQjyni+2ucKQ6cfPiJurjtaa23yD
 xh0mcQ23iHiQBNKl3UjSz9nbkyJpkjJPWdhZG/QEhTFV5p54fMHRNWugrsTLzG8WfkBq
 9ngsxEuQxO8xkMzh2slE9BYeSuzx2JIf+/P5JRTdizuVbSOnfDOcwat5/3M/0X5aVKMS
 i1BzL6mFQwWXQVKjlSZz4lqbXpUljd/inlHYbDcUoqgYCg1UF8+mH6v482dFVnVJwBXc
 RRb7JiPN51fyERUfRzDLhfiAM/gVZwf4fU8P5BuOu1DZb5+mnyQQUP5iO2rR27wgQ7td
 QmZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=0p6Xy3m/q/Jw9/CEOKm+gyba6CHxYqCDNm/LIuD+WsE=;
 b=3iF91EEf2GNS060q5BdK8sabfPsHfOPsMa/IE02DIp+UTYnai0QcftDKPAjWxfKp2v
 +WpoZgjgmgIakI70i9g+guoNE5giTfT18vPnFl/YSR8GRJBae+yiazVlt8k5+6CI3zQD
 ZDkpIgmpKPWqVHFq+tC3Xaijax5LzTNr6kp3d37eU7IlxACTN0LTAWSJPMivHEXqbdtN
 Atd21EqeULDuxQuxKe3H1CHFscxvBTC7UKp0F5zJsBSxolTIMz5PXz/B3dhnldmwVpE8
 X2AIR0DsZJH/9OjQ6R8JJhqY6ENsz9SOtdBO9qSGE2nlCfw3qBui2c6wk20Org4f8Wew
 UgNw==
X-Gm-Message-State: AOAM530vPj4EimdPXTaPSQzlW+gEHEZHGBc6OTK1hI8OUfF12L0wOzbx
 qSbT67lC9lrZg8A+NfbdobEmnDixWkE=
X-Google-Smtp-Source: ABdhPJwf+gQbmOMwDdKFNuXodTbtxF2CngOME6P9thpG9OECIQUlu+tec4IL+chk3rxE9rn6v9rqAw==
X-Received: by 2002:a17:906:ccde:: with SMTP id
 ot30mr17459446ejb.121.1634116075336; 
 Wed, 13 Oct 2021 02:07:55 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id c6sm6177849ejb.41.2021.10.13.02.07.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 02:07:55 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 37/40] monitor: Tidy up find_device_state()
Date: Wed, 13 Oct 2021 11:07:25 +0200
Message-Id: <20211013090728.309365-38-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211013090728.309365-1-pbonzini@redhat.com>
References: <20211013090728.309365-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x531.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Markus Armbruster <armbru@redhat.com>

Commit 6287d827d4 "monitor: allow device_del to accept QOM paths"
extended find_device_state() to accept QOM paths in addition to qdev
IDs.  This added a checked conversion to TYPE_DEVICE at the end, which
duplicates the check done for the qdev ID case earlier, except it sets
a *different* error: GenericError "ID is not a hotpluggable device"
when passed a QOM path, and DeviceNotFound "Device 'ID' not found"
when passed a qdev ID.  Fortunately, the latter won't happen as long
as we add only devices to /machine/peripheral/.

Earlier, commit b6cc36abb2 "qdev: device_del: Search for to be
unplugged device in 'peripheral' container" rewrote the lookup by qdev
ID to use QOM instead of qdev_find_recursive(), so it can handle
buss-less devices.  It does so by constructing an absolute QOM path.
Works, but object_resolve_path_component() is easier.  Switching to it
also gets rid of the unclean duplication described above.

While there, avoid converting to TYPE_DEVICE twice, first to check
whether it's possible, and then for real.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Damien Hedde <damien.hedde@greensocs.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20210916111707.84999-1-armbru@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 softmmu/qdev-monitor.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
index 0705f00846..3df99ce9fc 100644
--- a/softmmu/qdev-monitor.c
+++ b/softmmu/qdev-monitor.c
@@ -836,16 +836,12 @@ void qmp_device_add(QDict *qdict, QObject **ret_data, Error **errp)
 static DeviceState *find_device_state(const char *id, Error **errp)
 {
     Object *obj;
+    DeviceState *dev;
 
     if (id[0] == '/') {
         obj = object_resolve_path(id, NULL);
     } else {
-        char *root_path = object_get_canonical_path(qdev_get_peripheral());
-        char *path = g_strdup_printf("%s/%s", root_path, id);
-
-        g_free(root_path);
-        obj = object_resolve_path_type(path, TYPE_DEVICE, NULL);
-        g_free(path);
+        obj = object_resolve_path_component(qdev_get_peripheral(), id);
     }
 
     if (!obj) {
@@ -854,12 +850,13 @@ static DeviceState *find_device_state(const char *id, Error **errp)
         return NULL;
     }
 
-    if (!object_dynamic_cast(obj, TYPE_DEVICE)) {
+    dev = (DeviceState *)object_dynamic_cast(obj, TYPE_DEVICE);
+    if (!dev) {
         error_setg(errp, "%s is not a hotpluggable device", id);
         return NULL;
     }
 
-    return DEVICE(obj);
+    return dev;
 }
 
 void qdev_unplug(DeviceState *dev, Error **errp)
-- 
2.31.1



