Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB5F519179F
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Mar 2020 18:30:35 +0100 (CET)
Received: from localhost ([::1]:52632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jGnNq-0001IG-Sz
	for lists+qemu-devel@lfdr.de; Tue, 24 Mar 2020 13:30:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56773)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1jGnLW-0006pI-M4
 for qemu-devel@nongnu.org; Tue, 24 Mar 2020 13:28:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1jGnLV-0001oy-KS
 for qemu-devel@nongnu.org; Tue, 24 Mar 2020 13:28:10 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:54363)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>) id 1jGnLV-0001od-Go
 for qemu-devel@nongnu.org; Tue, 24 Mar 2020 13:28:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585070888;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Pzq0uCC0Zx30OcgNRelJ2/QIZziXegkzQygD1miRr34=;
 b=UMjlLs3dQPrUgC7hvdmC64TC/+0FRzQyIRoTE1BlV0pffaYcXM8VHAv1+vd8z/5PHGj06l
 tF2WIDCpgx0SSjNouuCOUfqofxItDDpnAaxYQt33txrQa9amWWWFcNalMJ96XkNoGQ62nZ
 mEbKgfn8YicHhNfaTNHZcmUzY3Pymcs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-386-7g4ylRZdMva_0n7spOW8Bw-1; Tue, 24 Mar 2020 13:28:06 -0400
X-MC-Unique: 7g4ylRZdMva_0n7spOW8Bw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0A4361005509;
 Tue, 24 Mar 2020 17:28:06 +0000 (UTC)
Received: from localhost (ovpn-114-213.ams2.redhat.com [10.36.114.213])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 75A5A60C05;
 Tue, 24 Mar 2020 17:28:05 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH for-5.0 v2 2/3] iotests: Add poke_file_[bl]e functions
Date: Tue, 24 Mar 2020 18:27:56 +0100
Message-Id: <20200324172757.1173824-3-mreitz@redhat.com>
In-Reply-To: <20200324172757.1173824-1-mreitz@redhat.com>
References: <20200324172757.1173824-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 63.128.21.74
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Similarly to peek_file_[bl]e, we may want to write binary integers into
a file.  Currently, this often means messing around with poke_file and
raw binary strings.  I hope these functions make it a bit more
comfortable.

Signed-off-by: Max Reitz <mreitz@redhat.com>
Code-suggested-by: Eric Blake <eblake@redhat.com>
---
 tests/qemu-iotests/common.rc | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/tests/qemu-iotests/common.rc b/tests/qemu-iotests/common.rc
index 4c246c0450..bf3b9fdea0 100644
--- a/tests/qemu-iotests/common.rc
+++ b/tests/qemu-iotests/common.rc
@@ -53,6 +53,30 @@ poke_file()
     printf "$3" | dd "of=3D$1" bs=3D1 "seek=3D$2" conv=3Dnotrunc &>/dev/nu=
ll
 }
=20
+# poke_file_le $img_filename $offset $byte_width $value
+# Example: poke_file_le "$TEST_IMG" 512 2 65534
+poke_file_le()
+{
+    local img=3D$1 ofs=3D$2 len=3D$3 val=3D$4 str=3D''
+
+    while ((len--)); do
+        str+=3D$(printf '\\x%02x' $((val & 0xff)))
+        val=3D$((val >> 8))
+    done
+
+    poke_file "$img" "$ofs" "$str"
+}
+
+# poke_file_be $img_filename $offset $byte_width $value
+# Example: poke_file_be "$TEST_IMG" 512 2 65279
+poke_file_be()
+{
+    local img=3D$1 ofs=3D$2 len=3D$3 val=3D$4
+    local str=3D$(printf "%0$((len * 2))x\n" $val | sed 's/\(..\)/\\x\1/g'=
)
+
+    poke_file "$img" "$ofs" "$str"
+}
+
 # peek_file_le 'test.img' 512 2 =3D> 65534
 peek_file_le()
 {
--=20
2.25.1


