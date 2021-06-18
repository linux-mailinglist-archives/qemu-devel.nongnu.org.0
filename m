Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB043AD5A8
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 01:10:06 +0200 (CEST)
Received: from localhost ([::1]:37970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luNcj-0007Hf-TZ
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 19:10:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1luNYL-000790-Q3
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 19:05:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49512)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1luNYF-0006FE-SG
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 19:05:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624057527;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oG5wOw4TFxKxWQoEk4mGwaCIp3hTcIiEKmt6SFVmwz0=;
 b=hWlYFte7y9wqWTaO493vc/FNMdTeOJ3+V/tIGMfa6H/m1mpjtW6r6WpA3TvPnWBibEXtg6
 d5upvmQ+0QBFvQLcLqpuHgZH5Idj5b5euONUxpkYTIFty+hUixjOpx/cGLNNXnnmniWG90
 GyhL3vU4FCssfYK1LOrUNAg2uPSQ4pQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-409-1HZtXUVLNm61YOSnews1Nw-1; Fri, 18 Jun 2021 19:05:25 -0400
X-MC-Unique: 1HZtXUVLNm61YOSnews1Nw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 70933100C662;
 Fri, 18 Jun 2021 23:05:24 +0000 (UTC)
Received: from scv.redhat.com (ovpn-113-126.rdu2.redhat.com [10.10.113.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BD1BB1017CE5;
 Fri, 18 Jun 2021 23:05:23 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 23/72] scripts/qemu-ga-client: replace deprecated optparse with
 argparse
Date: Fri, 18 Jun 2021 19:04:06 -0400
Message-Id: <20210618230455.2891199-24-jsnow@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.194,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

optparse isn't supported anymore, it's from the python2 days. Replace it
with the mostly similar argparse.

Signed-off-by: John Snow <jsnow@redhat.com>
Message-id: 20210604155532.1499282-5-jsnow@redhat.com
Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qmp/qemu-ga-client | 32 +++++++++++++++-----------------
 1 file changed, 15 insertions(+), 17 deletions(-)

diff --git a/scripts/qmp/qemu-ga-client b/scripts/qmp/qemu-ga-client
index 7aba09f0fe..8eb4015e61 100755
--- a/scripts/qmp/qemu-ga-client
+++ b/scripts/qmp/qemu-ga-client
@@ -37,8 +37,8 @@
 # See also: https://wiki.qemu.org/Features/QAPI/GuestAgent
 #
 
+import argparse
 import base64
-import optparse
 import os
 import random
 import sys
@@ -255,7 +255,7 @@ def _cmd_reboot(client, args):
 commands = [m.replace('_cmd_', '') for m in dir() if '_cmd_' in m]
 
 
-def main(address, cmd, args):
+def send_command(address, cmd, args):
     if not os.path.exists(address):
         print('%s not found' % address)
         sys.exit(1)
@@ -283,25 +283,23 @@ def main(address, cmd, args):
     globals()['_cmd_' + cmd](client, args)
 
 
-if __name__ == '__main__':
+def main():
     address = os.environ.get('QGA_CLIENT_ADDRESS')
 
-    usage = ("%prog [--address=<unix_path>|<ipv4_address>]"
-             " <command> [args...]\n")
-    usage += '<command>: ' + ', '.join(commands)
-    parser = optparse.OptionParser(usage=usage)
-    parser.add_option('--address', action='store', type='string',
-                      default=address,
-                      help='Specify a ip:port pair or a unix socket path')
-    options, args = parser.parse_args()
+    parser = argparse.ArgumentParser()
+    parser.add_argument('--address', action='store',
+                        default=address,
+                        help='Specify a ip:port pair or a unix socket path')
+    parser.add_argument('command', choices=commands)
+    parser.add_argument('args', nargs='*')
 
-    address = options.address
-    if address is None:
+    args = parser.parse_args()
+    if args.address is None:
         parser.error('address is not specified')
         sys.exit(1)
 
-    if len(args) == 0:
-        parser.error('Less argument')
-        sys.exit(1)
+    send_command(args.address, args.command, args.args)
 
-    main(address, args[0], args[1:])
+
+if __name__ == '__main__':
+    main()
-- 
2.31.1


