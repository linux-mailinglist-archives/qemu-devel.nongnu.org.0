Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E7FC27D889
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Sep 2020 22:37:30 +0200 (CEST)
Received: from localhost ([::1]:51018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kNMNN-0007Fs-A7
	for lists+qemu-devel@lfdr.de; Tue, 29 Sep 2020 16:37:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kNM6G-0001v0-Ph
 for qemu-devel@nongnu.org; Tue, 29 Sep 2020 16:19:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20098)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kNM68-0003VT-5N
 for qemu-devel@nongnu.org; Tue, 29 Sep 2020 16:19:48 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601410778;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+y8WBegVr1mcgYnZsDfm07hSSSb0R6NW2of1/YagVKY=;
 b=W/maJruEPvSuD4VKD+e3AhZvFxJhaFs1AD5DkDIWqVJw6C8+7fC6c5cg1TVxvxyFgUqFd/
 ql3y8P29liqW8Zoj+XY1u8IY22wKZKkFdLZ5AW9DTcRatZ5MPBU0pWyPn+Q4XWX3bkUa33
 KVtEH314Ijr4E0Ov5O9TzN+sJpRk2Vg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-229-WNEVgQ8_OIO56PmiFg-hbg-1; Tue, 29 Sep 2020 16:19:32 -0400
X-MC-Unique: WNEVgQ8_OIO56PmiFg-hbg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A8EB3801AE3;
 Tue, 29 Sep 2020 20:19:31 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-101.ams2.redhat.com
 [10.36.112.101])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7B8A91002C01;
 Tue, 29 Sep 2020 20:19:31 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id DBC7411358D3; Tue, 29 Sep 2020 22:19:26 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 21/29] meson.build: Move SPHINX_ARGS to top level meson.build
 file
Date: Tue, 29 Sep 2020 22:19:18 +0200
Message-Id: <20200929201926.2155622-22-armbru@redhat.com>
In-Reply-To: <20200929201926.2155622-1-armbru@redhat.com>
References: <20200929201926.2155622-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/29 02:22:44
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.687,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

We're going to want to use SPHINX_ARGS in both docs/meson.build
and tests/qapi-schema/meson.build. Move the definition up to the
top level file so it is available to both subdirectories.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20200925162316.21205-14-peter.maydell@linaro.org>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 docs/meson.build | 8 --------
 meson.build      | 8 ++++++++
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/docs/meson.build b/docs/meson.build
index 663bdb9073..52e384be17 100644
--- a/docs/meson.build
+++ b/docs/meson.build
@@ -1,11 +1,3 @@
-SPHINX_ARGS = [config_host['SPHINX_BUILD'],
-               '-Dversion=' + meson.project_version(),
-               '-Drelease=' + config_host['PKGVERSION']]
-
-if get_option('werror')
-  SPHINX_ARGS += [ '-W' ]
-endif
-
 if build_docs
   configure_file(output: 'index.html',
                  input: files('index.html.in'),
diff --git a/meson.build b/meson.build
index 7eb2c9c01a..866321462e 100644
--- a/meson.build
+++ b/meson.build
@@ -672,6 +672,14 @@ foreach d : hx_headers
 endforeach
 genh += hxdep
 
+SPHINX_ARGS = [config_host['SPHINX_BUILD'],
+               '-Dversion=' + meson.project_version(),
+               '-Drelease=' + config_host['PKGVERSION']]
+
+if get_option('werror')
+  SPHINX_ARGS += [ '-W' ]
+endif
+
 # Collect sourcesets.
 
 util_ss = ss.source_set()
-- 
2.26.2


