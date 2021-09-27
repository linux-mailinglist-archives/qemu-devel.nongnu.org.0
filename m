Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC74E419514
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 15:28:46 +0200 (CEST)
Received: from localhost ([::1]:35804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUqgX-0001Q9-Pb
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 09:28:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mUqLf-0003Y1-Hg
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 09:07:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52141)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mUqLV-0003oL-Qu
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 09:07:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632748021;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LSG/uh8jCjcZoH005UyBUF4D20nFAhsXpBisETAju9A=;
 b=AYyvgWGIk8T73PQdjoFaxyyjYwraT2c5W9bHGtnY+1NwEFjKjiJXgbWeRmLPWX0e6XJ3h5
 mS8bp0pso7FDv2wvf1UcyTUIDf0/23mf9xrWY9yFzooxUL9NpFbF7SYFf3mjNqEEiwFAJS
 udTOgiIwuUpqnNiKd2P+hIviIIaxb8w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-203-P21QmrYaNue-KlPDFvJsIA-1; Mon, 27 Sep 2021 09:06:58 -0400
X-MC-Unique: P21QmrYaNue-KlPDFvJsIA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E65ED100C66D;
 Mon, 27 Sep 2021 13:06:57 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4FB182B399;
 Mon, 27 Sep 2021 13:06:53 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id CC77A1135A7F; Mon, 27 Sep 2021 15:06:47 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 24/25] tests/qapi-schema: Use Python OSError instead of
 outmoded IOError
Date: Mon, 27 Sep 2021 15:06:46 +0200
Message-Id: <20210927130647.1271533-25-armbru@redhat.com>
In-Reply-To: <20210927130647.1271533-1-armbru@redhat.com>
References: <20210927130647.1271533-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: peter.maydell@linaro.org, John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

https://docs.python.org/3.6/library/exceptions.html has

    Changed in version 3.3: EnvironmentError, IOError, WindowsError,
    socket.error, select.error and mmap.error have been merged into
    OSError, and the constructor may return a subclass.

and

    The following exceptions are kept for compatibility with previous
    versions; starting from Python 3.3, they are aliases of OSError.

    exception EnvironmentError

    exception IOError

    exception WindowsError

        Only available on Windows.

Switch to the preferred name.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20210922125619.670673-2-armbru@redhat.com>
Reviewed-by: John Snow <jsnow@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
[Details added to commit message]
---
 tests/qapi-schema/test-qapi.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/qapi-schema/test-qapi.py b/tests/qapi-schema/test-qapi.py
index 73cffae2b6..2e384f5efd 100755
--- a/tests/qapi-schema/test-qapi.py
+++ b/tests/qapi-schema/test-qapi.py
@@ -154,7 +154,7 @@ def test_and_diff(test_name, dir_name, update):
         errfp = open(os.path.join(dir_name, test_name + '.err'), mode)
         expected_out = outfp.readlines()
         expected_err = errfp.readlines()
-    except IOError as err:
+    except OSError as err:
         print("%s: can't open '%s': %s"
               % (sys.argv[0], err.filename, err.strerror),
               file=sys.stderr)
@@ -180,7 +180,7 @@ def test_and_diff(test_name, dir_name, update):
         errfp.truncate(0)
         errfp.seek(0)
         errfp.writelines(actual_err)
-    except IOError as err:
+    except OSError as err:
         print("%s: can't write '%s': %s"
               % (sys.argv[0], err.filename, err.strerror),
               file=sys.stderr)
-- 
2.31.1


