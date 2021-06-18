Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A0B3AD5D1
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 01:25:55 +0200 (CEST)
Received: from localhost ([::1]:40974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luNs2-00059R-95
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 19:25:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1luNYU-0007CL-Ta
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 19:05:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47140)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1luNYK-0006IZ-Io
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 19:05:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624057531;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Yb3aWZJZXaQJF41iuUg4ZftcCXsFeNVWDepobLoVsZo=;
 b=ehKwHCN1lx1uUqggHaF4XWH7gOkUx8XdlBqbVs4Bq0zXj2JBr6lmeX8Pye2lodC0fBPi4b
 GptRtn/QCFbLp8eHEVd2lCLrpQ1upg8/1g3A1venW5ePBDWyDX4y/CUUd5MnYSBUCg0EWa
 o0kjxfBX0Xi6dHx3LKD5WC3S0lPWD1c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-292-yFvSx_mwOR636_5mMFXiSA-1; Fri, 18 Jun 2021 19:05:30 -0400
X-MC-Unique: yFvSx_mwOR636_5mMFXiSA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 86B64100C663;
 Fri, 18 Jun 2021 23:05:29 +0000 (UTC)
Received: from scv.redhat.com (ovpn-113-126.rdu2.redhat.com [10.10.113.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 33F2B1017CE5;
 Fri, 18 Jun 2021 23:05:28 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 28/72] scripts/qemu-ga-client: move to
 python/qemu/qmp/qemu_ga_client.py
Date: Fri, 18 Jun 2021 19:04:11 -0400
Message-Id: <20210618230455.2891199-29-jsnow@redhat.com>
In-Reply-To: <20210618230455.2891199-1-jsnow@redhat.com>
References: <20210618230455.2891199-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.194,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The script itself will be unavailable for a few commits before being
restored, with no way to run it right after this commit. This helps move
git history into the new file. To prevent linter regressions, though, we
do need to immediately touch up the filename to remove dashes (to make
the module importable), and remove the executable bit.

Signed-off-by: John Snow <jsnow@redhat.com>
Message-id: 20210604155532.1499282-10-jsnow@redhat.com
Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qmp/qemu-ga-client => python/qemu/qmp/qemu_ga_client.py | 2 --
 1 file changed, 2 deletions(-)
 rename scripts/qmp/qemu-ga-client => python/qemu/qmp/qemu_ga_client.py (99%)

diff --git a/scripts/qmp/qemu-ga-client b/python/qemu/qmp/qemu_ga_client.py
similarity index 99%
rename from scripts/qmp/qemu-ga-client
rename to python/qemu/qmp/qemu_ga_client.py
index a7d0ef8347..d2938ad47c 100755
--- a/scripts/qmp/qemu-ga-client
+++ b/python/qemu/qmp/qemu_ga_client.py
@@ -52,8 +52,6 @@
     Sequence,
 )
 
-
-sys.path.append(os.path.join(os.path.dirname(__file__), '..', '..', 'python'))
 from qemu import qmp
 from qemu.qmp import SocketAddrT
 
-- 
2.31.1


