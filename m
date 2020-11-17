Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6692B6AC2
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 17:56:42 +0100 (CET)
Received: from localhost ([::1]:55228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf4HZ-00074H-EP
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 11:56:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kf4EL-0001vF-V4
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 11:53:21 -0500
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643]:45003)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kf4EJ-00071x-7g
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 11:53:21 -0500
Received: by mail-ej1-x643.google.com with SMTP id y17so24740561ejh.11
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 08:53:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8GhvAvrzm3gZ/KhG/DzPgYp9uBo/iVatk34KwPcwZjM=;
 b=KIDssoS+raLR9y6g8Vb4RLAeNALSd8rgMBTLdIE5WXFB1EVvblZEAl3K8/h6XECsBb
 TD+4R487F9ivYkamXVortTo9KOFU7jMUOEBTgz7P0pxKyKhlgaBU/MGS0xK6xGq4a7Dg
 8L7TUc/+l758JqdDT/K39d+FBJU/rFd3YOOSrLGOGZ61FvI59ZB/5eVakoLVNu5gLeLf
 I8gUMYhWldHFX+5nS5eKWzKAe5JO5xHQ5JA1d4hcMf+gF1xjZpEvP0G65kz6D6iaJm6B
 3svwJachOHxXggVqsfsV6UTryJEhZ/+4dmGo5skOWSOw6ad158ceesbfi4Bnv55IBfzK
 2HOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=8GhvAvrzm3gZ/KhG/DzPgYp9uBo/iVatk34KwPcwZjM=;
 b=RtIMkBtEFkYldLknNSvwSkwsSHoureP1tP5hTv4x5BTqMW7xB5rGV+NGHJUSW4P7lJ
 CJefQXINfbTE/af3x97r0MGeKaM52ExNco9j/FJGEzHs1JoCQ+bRHa00S+qfEovR7T+s
 6KXOcA7b667Zp/hGs50/wb88X5/j2wwUC9GZXlLTUs6G9KpR8bAJJA3CcptpiaZyjcyd
 YIIAb+Q8mu6bI6G/L7aIMopr99tCF3csalVDi8J/XzExqMoM5jo4JX7I6nduSSBWUUtm
 qj4hNG7SeQnk6oKTPi7wdiJ9j/74wgUyR6zDExvVRkBEpx60Sy62sy3IM2U9ZDT5vkiU
 N0gQ==
X-Gm-Message-State: AOAM531OyzMt3xhUp/yBzKMze6ZNsBpsHhGmNst16+iibFOlgPTNRL2X
 jAcTS2sb18BFD9C2AH9hXYs9XIKmwoY=
X-Google-Smtp-Source: ABdhPJzDQftyxkCFZ+oNsCnY6F2Bx1NDNMMFpKNA70STRjqDYR0+ynZbdzoa5wg93NxNvpALjm1cSw==
X-Received: by 2002:a17:906:3958:: with SMTP id
 g24mr20571356eje.360.1605631997373; 
 Tue, 17 Nov 2020 08:53:17 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id u7sm639067ejf.83.2020.11.17.08.53.16
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 08:53:16 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 02/29] kernel-doc: add support for
 ____cacheline_aligned_in_smp attribute
Date: Tue, 17 Nov 2020 17:52:45 +0100
Message-Id: <20201117165312.118257-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201117165312.118257-1-pbonzini@redhat.com>
References: <20201117165312.118257-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::643;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x643.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: André Almeida <andrealmeid@collabora.com>

Subroutine dump_struct uses type attributes to check if the struct
syntax is valid. Then, it removes all attributes before using it for
output. `____cacheline_aligned_in_smp` is an attribute that is
not included in both steps. Add it, since it is used by kernel structs.

Signed-off-by: André Almeida <andrealmeid@collabora.com>
Signed-off-by: Jonathan Corbet <corbet@lwn.net>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/kernel-doc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/kernel-doc b/scripts/kernel-doc
index d6bdb77ceb..2f421b7313 100755
--- a/scripts/kernel-doc
+++ b/scripts/kernel-doc
@@ -1092,7 +1092,7 @@ sub dump_struct($$) {
     my $x = shift;
     my $file = shift;
 
-    if ($x =~ /(struct|union)\s+(\w+)\s*\{(.*)\}(\s*(__packed|__aligned|__attribute__\s*\(\([a-z0-9,_\s\(\)]*\)\)))*/) {
+    if ($x =~ /(struct|union)\s+(\w+)\s*\{(.*)\}(\s*(__packed|__aligned|____cacheline_aligned_in_smp|__attribute__\s*\(\([a-z0-9,_\s\(\)]*\)\)))*/) {
 	my $decl_type = $1;
 	$declaration_name = $2;
 	my $members = $3;
@@ -1107,6 +1107,7 @@ sub dump_struct($$) {
 	$members =~ s/\s*__aligned\s*\([^;]*\)/ /gos;
 	$members =~ s/\s*__packed\s*/ /gos;
 	$members =~ s/\s*CRYPTO_MINALIGN_ATTR/ /gos;
+	$members =~ s/\s*____cacheline_aligned_in_smp/ /gos;
 	# replace DECLARE_BITMAP
 	$members =~ s/DECLARE_BITMAP\s*\(([^,)]+),\s*([^,)]+)\)/unsigned long $1\[BITS_TO_LONGS($2)\]/gos;
 	# replace DECLARE_HASHTABLE
-- 
2.28.0



