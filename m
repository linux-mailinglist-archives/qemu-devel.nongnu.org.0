Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C9268F43C
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 18:19:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPo6d-0003XN-D6; Wed, 08 Feb 2023 12:19:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pPo6Z-0003X5-2K
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 12:19:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pPo6X-0000Kp-7E
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 12:19:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675876772;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c9DI6AAsVfYANdpqWn77PRtU8xlVrgWkxwckQG3CZwA=;
 b=A/c2CWBV97uGkJvn4fj5Co4C9m7qqkG1ML+eV/Rz5PV5ZhULNSMOOp8x7BNK6x31ZJnWZp
 vMnbszbm/V9QKQa4M8a5T0YQwT0oX/b6kzO4BgEW9s9zeQudAeaKxkwjfkYARTVnuH4UJ/
 ZKQPds5yJEaSJBLCJHuUP/hGf0E26cE=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-448-rhIuwYMEPACHqi1pwCFzgA-1; Wed, 08 Feb 2023 12:19:30 -0500
X-MC-Unique: rhIuwYMEPACHqi1pwCFzgA-1
Received: by mail-ed1-f69.google.com with SMTP id
 bo27-20020a0564020b3b00b004a6c2f6a226so12561461edb.15
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 09:19:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c9DI6AAsVfYANdpqWn77PRtU8xlVrgWkxwckQG3CZwA=;
 b=lUthNm7w4lQ/mqoHX6iA6VL/sOUBIEHCySLdr5yomjVd0QW+DPFyajA0qUe+MV8Por
 r7HHmpZH+b89Hs7TRpBOuu0ju1soz4nFXeyFZblFRatfSh9Nhv7YhGPCDO4YZUMMeUoV
 yBFcI8UxPm/HDGjnoA6nD6vi396d3+9NS5Fhd2JymC14+LC+7vckn6Umyo6gnn5udmmv
 IA0jJMB+PfeYjfyRbS1U4UCQN46ZwCfgnfMgnGb0+QQBJNUF6mG5+JRG2iBDC6yXc6dt
 jQrF3uxfQiUin8X+wrKDnR6zI1Ak0FsexAwYYHgDqIJ8TdZ3mZLYn92vrwLrBhcAxzRS
 a4FQ==
X-Gm-Message-State: AO0yUKWtyFZnrfd3wDqg7odrgq5C0wNX5Ks8JYVa6Y5wtfBZNhQDOtef
 P9DX2oq6jupcP/LLy4j568hBA3qxlxyMMYWXCJb3awIcvYQjQbzcseTGkYOeBchrVDksBPEK7vb
 SDfkpKvCXk0X573AwWpMam58HQe6WiN7w4i9s1BwMuSMZ1+U2n2ageq4hZxMKRxCihTBpfW3W
X-Received: by 2002:a50:c316:0:b0:4aa:b38d:772f with SMTP id
 a22-20020a50c316000000b004aab38d772fmr8459774edb.31.1675876768437; 
 Wed, 08 Feb 2023 09:19:28 -0800 (PST)
X-Google-Smtp-Source: AK7set8LdYt41NED4pVuLecDO6Xr3QKtnCMETBt5VREAwFXC5QJeBuGoMGp2+eE/ABNffzcCx97tGg==
X-Received: by 2002:a50:c316:0:b0:4aa:b38d:772f with SMTP id
 a22-20020a50c316000000b004aab38d772fmr8459751edb.31.1675876768045; 
 Wed, 08 Feb 2023 09:19:28 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id
 q26-20020a170906a09a00b007aece68483csm8556368ejy.193.2023.02.08.09.19.27
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Feb 2023 09:19:27 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 01/11] build: make meson-buildoptions.sh stable
Date: Wed,  8 Feb 2023 18:19:12 +0100
Message-Id: <20230208171922.95048-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230208171922.95048-1-pbonzini@redhat.com>
References: <20230208171922.95048-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The library directory can change depending on the multilib setup of the host.
It would be even better to detect it in configure with the same algorithm
that Meson uses, but the important thing to avoid confusing developers is
to have identical contents of scripts/meson-buildoptions.sh, independent
of the distro and architecture on which it was created.

So, for now just give a custom default value to libdir.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/meson-buildoptions.py | 7 +++++--
 scripts/meson-buildoptions.sh | 2 +-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/scripts/meson-buildoptions.py b/scripts/meson-buildoptions.py
index 3e2b4785388f..a04dcc70a5b7 100755
--- a/scripts/meson-buildoptions.py
+++ b/scripts/meson-buildoptions.py
@@ -61,7 +61,10 @@
 
 # Convert the default value of an option to the string used in
 # the help message
-def value_to_help(value):
+def get_help(opt):
+    if opt["name"] == "libdir":
+        return 'system default'
+    value = opt["value"]
     if isinstance(value, list):
         return ",".join(value)
     if isinstance(value, bool):
@@ -88,7 +91,7 @@ def sh_print(line=""):
 def help_line(left, opt, indent, long):
     right = f'{opt["description"]}'
     if long:
-        value = value_to_help(opt["value"])
+        value = get_help(opt)
         if value != "auto" and value != "":
             right += f" [{value}]"
     if "choices" in opt and long:
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
index 0f71e92dcba6..d663c9cadfbe 100644
--- a/scripts/meson-buildoptions.sh
+++ b/scripts/meson-buildoptions.sh
@@ -49,7 +49,7 @@ meson_options_help() {
   printf "%s\n" '  --includedir=VALUE       Header file directory [include]'
   printf "%s\n" '  --interp-prefix=VALUE    where to find shared libraries etc., use %M for'
   printf "%s\n" '                           cpu name [/usr/gnemul/qemu-%M]'
-  printf "%s\n" '  --libdir=VALUE           Library directory [lib64]'
+  printf "%s\n" '  --libdir=VALUE           Library directory [system default]'
   printf "%s\n" '  --libexecdir=VALUE       Library executable directory [libexec]'
   printf "%s\n" '  --localedir=VALUE        Locale data directory [share/locale]'
   printf "%s\n" '  --localstatedir=VALUE    Localstate data directory [/var/local]'
-- 
2.39.1


