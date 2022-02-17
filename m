Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA09E4B9FCC
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 13:10:18 +0100 (CET)
Received: from localhost ([::1]:60078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKfc1-0003e8-GO
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 07:10:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nKfPj-0002pS-FQ
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 06:57:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40028)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nKfPh-00010m-Ua
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 06:57:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645099053;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nl/NUF7XY5PmJgqKy/oDBr2WuBZ2G2910ajw3T0ldxM=;
 b=hFidMBfQtIHEVoZJQkcqmgeE7aY7mPVKu0JiOgErV4l7AqOYJkp7UBo/yvEf9umCQcCzol
 pr8vUjTXzqewkTSTflMPO9cdDYvnrRPzX0cMRfHry77ZbK2LA3mxTJYd9vJOhg22Pl3f9g
 1EP7nvARCcCdFlmD6rOxFw3zTH+pGe0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-86-lenGwh7tM3eLwNnfopw6aA-1; Thu, 17 Feb 2022 06:57:30 -0500
X-MC-Unique: lenGwh7tM3eLwNnfopw6aA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 43B161F2DC;
 Thu, 17 Feb 2022 11:57:29 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.132])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7DCA7108648D;
 Thu, 17 Feb 2022 11:57:27 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 01/10] block: better document SSH host key fingerprint checking
Date: Thu, 17 Feb 2022 11:57:14 +0000
Message-Id: <20220217115723.1782616-2-berrange@redhat.com>
In-Reply-To: <20220217115723.1782616-1-berrange@redhat.com>
References: <20220217115723.1782616-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Kashyap Chamarthy <kchamart@redhat.com>,
 "Richard W.M. Jones" <rjones@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Hanna Reitz <hreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The docs still illustrate host key fingerprint checking using the old
md5 hashes which are considered insecure and obsolete. Change it to
illustrate using a sha256 hash. Also show how to extract the hash
value from the known_hosts file.

Reviewed-by: Hanna Reitz <hreitz@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 docs/system/qemu-block-drivers.rst.inc | 30 ++++++++++++++++++++++----
 1 file changed, 26 insertions(+), 4 deletions(-)

diff --git a/docs/system/qemu-block-drivers.rst.inc b/docs/system/qemu-block-drivers.rst.inc
index e313784426..dfe5d2293d 100644
--- a/docs/system/qemu-block-drivers.rst.inc
+++ b/docs/system/qemu-block-drivers.rst.inc
@@ -778,10 +778,32 @@ The optional *HOST_KEY_CHECK* parameter controls how the remote
 host's key is checked.  The default is ``yes`` which means to use
 the local ``.ssh/known_hosts`` file.  Setting this to ``no``
 turns off known-hosts checking.  Or you can check that the host key
-matches a specific fingerprint:
-``host_key_check=md5:78:45:8e:14:57:4f:d5:45:83:0a:0e:f3:49:82:c9:c8``
-(``sha1:`` can also be used as a prefix, but note that OpenSSH
-tools only use MD5 to print fingerprints).
+matches a specific fingerprint. The fingerprint can be provided in
+``md5``, ``sha1``, or ``sha256`` format, however, it is strongly
+recommended to only use ``sha256``, since the other options are
+considered insecure by modern standards. The fingerprint value
+must be given as a hex encoded string::
+
+  host_key_check=sha256:04ce2ae89ff4295a6b9c4111640bdcb3297858ee55cb434d9dd88796e93aa795
+
+The key string may optionally contain ":" separators between
+each pair of hex digits.
+
+The ``$HOME/.ssh/known_hosts`` file contains the base64 encoded
+host keys. These can be converted into the format needed for
+QEMU using a command such as::
+
+   $ for key in `grep 10.33.8.112 known_hosts | awk '{print $3}'`
+     do
+       echo $key | base64 -d | sha256sum
+     done
+     6c3aa525beda9dc83eadfbd7e5ba7d976ecb59575d1633c87cd06ed2ed6e366f  -
+     12214fd9ea5b408086f98ecccd9958609bd9ac7c0ea316734006bc7818b45dc8  -
+     d36420137bcbd101209ef70c3b15dc07362fbe0fa53c5b135eba6e6afa82f0ce  -
+
+Note that there can be multiple keys present per host, each with
+different key ciphers. Care is needed to pick the key fingerprint
+that matches the cipher QEMU will negotiate with the remote server.
 
 Currently authentication must be done using ssh-agent.  Other
 authentication methods may be supported in future.
-- 
2.34.1


