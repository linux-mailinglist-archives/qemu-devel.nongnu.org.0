Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AFC42B012A
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 09:24:01 +0100 (CET)
Received: from localhost ([::1]:59752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kd7tg-0001zF-5M
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 03:24:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kd7sb-0001Vn-8d
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 03:22:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49816)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kd7sY-0002uk-PK
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 03:22:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605169369;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=coxtMFad6zPKwMDmeylZtabibB5s/RJMfUNABKeG290=;
 b=MWq0KSrQ4LROYhMa4eMW5DPD07Nu/I6p58ZduAqnevhV/a0iwAuoQ1b9kcfihGoAinVI9q
 ljFRdNmmRe6ZVDY/o207z9PIo+zQnH8VZbXtEMZUzqobGi0zwKC8CitxDWxpvvBPgNypkK
 MhGMKmjVxaFQB4S496s6HXSRFP5nueU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-323-AIasAjcbOI287LOHDLanYg-1; Thu, 12 Nov 2020 03:22:47 -0500
X-MC-Unique: AIasAjcbOI287LOHDLanYg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3EAC1804752
 for <qemu-devel@nongnu.org>; Thu, 12 Nov 2020 08:22:46 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9E3376198C;
 Thu, 12 Nov 2020 08:22:39 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0AF3C11386A0; Thu, 12 Nov 2020 09:22:38 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH 1/2] char: Skip CLI aliases in query-chardev-backends
References: <20201111130834.33985-1-kwolf@redhat.com>
 <20201111130834.33985-2-kwolf@redhat.com>
Date: Thu, 12 Nov 2020 09:22:38 +0100
In-Reply-To: <20201111130834.33985-2-kwolf@redhat.com> (Kevin Wolf's message
 of "Wed, 11 Nov 2020 14:08:33 +0100")
Message-ID: <877dqrkmr5.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 00:51:38
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
Cc: libvir-list@redhat.com, pbonzini@redhat.com, qemu-devel@nongnu.org,
 marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Kevin Wolf <kwolf@redhat.com> writes:

> The aliases "tty" and "parport" are only valid on the command line, QMP
> commands like chardev-add don't know them. query-chardev-backends should
> describe QMP and therefore not include them in the list of available
> backends.
>
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>

I'd call that a bug.

In the light of PATCH 2, I propose to put that one first (with the
help_string_append() hunk dropped), then remove the aliases from CLI
help, too, like this:


diff --git a/chardev/char.c b/chardev/char.c
index aa4282164a..8b6e78a122 100644
--- a/chardev/char.c
+++ b/chardev/char.c
@@ -568,13 +568,8 @@ static void
 chardev_name_foreach(void (*fn)(const char *name, void *opaque), void *opaque)
 {
     ChadevClassFE fe = { .fn = fn, .opaque = opaque };
-    int i;
 
     object_class_foreach(chardev_class_foreach, TYPE_CHARDEV, false, &fe);
-
-    for (i = 0; i < (int)ARRAY_SIZE(chardev_alias_table); i++) {
-        fn(chardev_alias_table[i].alias, opaque);
-    }
 }
 
 static void


