Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ACE96535CF
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 19:04:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p83Qk-0001Yt-Q0; Wed, 21 Dec 2022 13:03:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p83QO-0001N1-Pr
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 13:02:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p83QK-0004N1-8u
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 13:02:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671645755;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UUQU3z+7mm9jDbX62tkp0yPYmJk5AZgplqBgQFHgKds=;
 b=ckhjd0/BrMNUlnDCBzQ+TlBtd5vOhNdEPjoTAFw0TeouDAHpnDMXKWDDePgLs0r3WnSdrJ
 9fC9k+AXBlYS/iMRtMJuAU/ftyp415Y/s9tb/ogJQ62v+ZUbWeqR+eoXLEcve/wnzfIGXB
 Oawr5o5ZHz56QOO80T/DBoDp2tW8+6g=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-615-OEWI9ItnNM6kzLl94mHPsw-1; Wed, 21 Dec 2022 13:02:34 -0500
X-MC-Unique: OEWI9ItnNM6kzLl94mHPsw-1
Received: by mail-ed1-f69.google.com with SMTP id
 t17-20020a056402525100b00478b85eecedso8358274edd.18
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 10:02:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UUQU3z+7mm9jDbX62tkp0yPYmJk5AZgplqBgQFHgKds=;
 b=4bTsJRqUYb98vVgKLHDQ/TV6eJCVb3EhO8mQOTzMbhicGhrzXY9LbhEbTkTb7XeuDT
 Bzy3loURYG8C3QJ09gjqMcYueSNn34BI34zbCJU4K9ttcDtfa1EsoF32eDg4M4VVpzd6
 APxXNwau3B/4ru8iCNuyaX0bKFMtvphWCGMyy/HkQ6ISuuwCU8+1cdhaZgkq+EaGjvdA
 RR9WtKOOQCgZ0oKbQhbbd7V6a93Nknax+CFrKmpsCHMj01IvF1x7PZOCp0Bxr9YckFdg
 mb/b5D3tiLHxsc6OkNEp9VW2dgpO0WiG0MK2UOeXwpY33KKxDMve5kAQrZZ5L3SpwvGw
 uafA==
X-Gm-Message-State: AFqh2kpvr/w+uwITnV6knHJWw6AqKHEePH74zd6yv/jM+iICtAZ1L50y
 YURBLEkFLZ/3MMAkN0IwrY1bGgmFwU6qsZkF3CNHt87PtV1zKEmPSDfvsrDZpuX9S39CEJ86RwL
 QFwF/51A3X99Wr9wuK9MlrzHPNt4Nmqjbfw7AE4Gg5f3gXFXXgiXsHivWh3HQWiLbntY=
X-Received: by 2002:a17:906:b142:b0:7c1:6fd3:1efa with SMTP id
 bt2-20020a170906b14200b007c16fd31efamr5572416ejb.28.1671645752437; 
 Wed, 21 Dec 2022 10:02:32 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvMWmDCwHx5BYhejiaY6gKbaskkZ3gS489Sbt/W6q0R3pxMpaCPKmXaXN5eN7BucXPOpHBe3w==
X-Received: by 2002:a17:906:b142:b0:7c1:6fd3:1efa with SMTP id
 bt2-20020a170906b14200b007c16fd31efamr5572400ejb.28.1671645752188; 
 Wed, 21 Dec 2022 10:02:32 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 r9-20020a1709061ba900b0081586470b7csm5150946ejg.173.2022.12.21.10.02.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 10:02:31 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org
Subject: [PULL 18/24] meson: accept relative symlinks in "meson introspect
 --installed" data
Date: Wed, 21 Dec 2022 19:01:35 +0100
Message-Id: <20221221180141.839616-19-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221221180141.839616-1-pbonzini@redhat.com>
References: <20221221180141.839616-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

When installing shared libraries, as is the case for libvfio-user.so,
Meson will include relative symbolic links in the output of
"meson introspect --installed":

  {
    "libvfio-user.so": "/usr/local/lib64/libvfio-user.so",
    ...
  }

In the case of scripts/symlink-install-tree.py, this will
be a symbolic link to a symbolic link but, in any case, there is
no issue in creating it.

Cc: qemu-stable@nongnu.org
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/symlink-install-tree.py | 1 -
 1 file changed, 1 deletion(-)

diff --git a/scripts/symlink-install-tree.py b/scripts/symlink-install-tree.py
index a5bf0b0d6d7c..67cb86dd523a 100644
--- a/scripts/symlink-install-tree.py
+++ b/scripts/symlink-install-tree.py
@@ -17,7 +17,6 @@ def destdir_join(d1: str, d2: str) -> str:
 out = subprocess.run([*introspect.split(' '), '--installed'],
                      stdout=subprocess.PIPE, check=True).stdout
 for source, dest in json.loads(out).items():
-    assert os.path.isabs(source)
     bundle_dest = destdir_join('qemu-bundle', dest)
     path = os.path.dirname(bundle_dest)
     try:
-- 
2.38.1


