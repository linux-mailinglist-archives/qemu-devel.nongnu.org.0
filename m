Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC4E6465E96
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 08:18:49 +0100 (CET)
Received: from localhost ([::1]:59714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msgMi-0000FZ-To
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 02:18:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1msg9N-0005Uj-R0
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 02:05:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24512)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1msg9K-0006Eg-5a
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 02:05:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638428697;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4JA9jZf/1CWOlKDFFrg38jfybtFHYIAChdjm9CwITIk=;
 b=DIoQnKxWsJD5c6YJmT/+zyndxjAj1cknp0yBPvtOD/0RGOXuRXnDpVMs8eAtbRreUYq55W
 bENdjYq4C5NJNzvZpSWJDfP0iCdS5gl/SxSaHLFA0kO7S8BtT0SzMjQDKj0h4E7f096HNg
 S4H4wFVSJmhNC/uhXTM9NZJBXZd1PRI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-190-FWOmzbrMONy0_lzA1d6k7A-1; Thu, 02 Dec 2021 02:04:54 -0500
X-MC-Unique: FWOmzbrMONy0_lzA1d6k7A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9F0F81023F4E;
 Thu,  2 Dec 2021 07:04:53 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6B1845D6BA;
 Thu,  2 Dec 2021 07:04:53 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3823E1138223; Thu,  2 Dec 2021 08:04:50 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC 10/11] vl: Disregard lack of 'allow-preconfig': true
Date: Thu,  2 Dec 2021 08:04:49 +0100
Message-Id: <20211202070450.264743-11-armbru@redhat.com>
In-Reply-To: <20211202070450.264743-1-armbru@redhat.com>
References: <20211202070450.264743-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: damien.hedde@greensocs.com, berrange@redhat.com, mark.burton@greensocs.com,
 edgar.iglesias@gmail.co, mirela.grujic@greensocs.com,
 marcandre.lureau@redhat.com, pbonzini@redhat.com, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I'd like to use device cold plug as an example for how how the user
can now interleave CLI with startup.  Doesn't work, because only
commands with 'allow-preconfig': true are available before phase
@machine-ready, and device_add isn't.  Instead of changing just
device_add, this hack allows all commands all the time, for easy
experimentation.  Some commands don't work, but this is RFC.

Hot pci-serial works:

    $ qemu-system-x86_64 '{"execute": "until-phase", "arguments": {"phase": "machine-ready"}}' '{"execute": "device_add", "arguments": {"driver": "pci-serial"}}'

Hot isa-serial fails as it should:

    $ qemu-system-x86_64 '{"execute": "until-phase", "arguments": {"phase": "machine-ready"}}' '{"execute": "device_add", "arguments": {"driver": "isa-serial"}}'
    [...]
    qemu-system-x86_64: {"execute": "device_add", "arguments": {"driver": "isa-serial"}}: Bus 'isa.0' does not support hotplugging

Cold isa-serial works:

    $ qemu-system-x86_64 '{"execute": "until-phase", "arguments": {"phase": "machine-initialized"}}' '{"execute": "device_add", "arguments": {"driver": "isa-serial"}}'

A command that works even in phase @no-machine:

    $ qemu-system-x86_64 '{"execute": "chardev-add", "arguments": {"id": "chr0", "backend": {"type": "null", "data": {}}}}'
    {"QMP": {"version": {"qemu": {"micro": 92, "minor": 1, "major": 6}, "package": "v6.2.0-rc2-38-gff2c6103bf"}, "capabilities": ["oob"]}}
    {"execute": "qmp_capabilities", "arguments": {"enable": ["oob"]}}
    {"return": {}}
    {"execute": "query-chardev"}
    {"return": [{"frontend-open": false, "filename": "null", "label": "chr0"}, {"frontend-open": true, "filename": "stdio", "label": "compat_monitor0"}]}

A command that doesn't work there:

    $ qemu-system-x86_64 '{"execute": "screendump", "arguments": {"filename": "scr"}}'
    qemu-system-x86_64: ../qapi/qmp-dispatch.c:226: qmp_dispatch: Assertion `!oob && qemu_in_coroutine() && !(cmd->options & QCO_COROUTINE)' failed.
    Aborted (core dumped)

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 softmmu/qdev-monitor.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
index 067f6cdeab..ddb12c68e6 100644
--- a/softmmu/qdev-monitor.c
+++ b/softmmu/qdev-monitor.c
@@ -1041,11 +1041,13 @@ int qemu_global_option(const char *str)
 
 bool qmp_command_available(const QmpCommand *cmd, Error **errp)
 {
+#if 0
     if (!phase_check(PHASE_MACHINE_READY) &&
         !(cmd->options & QCO_ALLOW_PRECONFIG)) {
         error_setg(errp, "The command '%s' is permitted only after machine initialization has completed",
                    cmd->name);
         return false;
     }
+#endif
     return true;
 }
-- 
2.31.1


