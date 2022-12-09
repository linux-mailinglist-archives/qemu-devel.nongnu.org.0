Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B88736481E1
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 12:40:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3bdu-0003NF-Hy; Fri, 09 Dec 2022 06:34:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3bdj-0003LS-S8
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 06:34:04 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3bdS-0000IP-Ua
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 06:34:02 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 ay8-20020a05600c1e0800b003d0808d2826so5601364wmb.1
 for <qemu-devel@nongnu.org>; Fri, 09 Dec 2022 03:33:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dLA8QEjrYdTNf33My29KKVDGQuaGLbZ2RRxkNnsl2uI=;
 b=Uw4evc2tCg3N2e/Fnf2zQ4uznEWGggsANlDwOzhmJlXHJxTbLkZpy0VpFrwfynQEPK
 Wkw4EQ0VTOu1Cp8AN+azO8tKfs4HAoUbBBvY1EuIoyioCIyyzthPyVLYEcrrV6cNad/e
 tm6WHicVnLNMiPAEGmJdKhq6UhK8t6qAJrtsMzwGMn/CtGsVP9YFyvtHoSNkV/eIlYoo
 1t0fqdHBsWxg+nPFCl5Zz/uTLMzwPZS0z2MtZj1qbiCkJPK5MM5uG8ARdxdPegiLlKdv
 53jOO9SZB+ysyyLTG/fqAJCXTbv53mvWhgWQCk1HT6eFMm0DJUzvNKpDA/kftX6wnfC6
 TILA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dLA8QEjrYdTNf33My29KKVDGQuaGLbZ2RRxkNnsl2uI=;
 b=OlAJIba3I30bKoHhBwBvV13FFI7WXnOSVJA1Y0PVph/99AKip+oTrQph4u+KmLSazU
 /I1wA136HWLq4ZpzdvUpT4MMtP24M76xBRmhcFcP8ANgz6Uk3GxtkQFnij98VE49/itU
 6e4nKZ5owvhy2F1mQVcAUJq9WEWbRX8tJjc9O+xv7KK5jWw4oNvbkc6E8CZhKztmdltr
 kMqMCvMlneC2n7Dmj+BkDg9SzwjI7KN85DNOYY5IzMQppUE+NZ2BwW68XjVLc+hSa7d7
 0+SqWbQUzzfuTKTHs9WsdcINh6ViWZNkj+tz5AkkxcUw/uxNxmyPATVuS2Xxen9hEMz+
 q2RQ==
X-Gm-Message-State: ANoB5pkcGtTzdV1cg9CKEkrjzxZM3MobcI4N2EOEk6jdnrcJUw/gMhUI
 w8ltYysIf+Ia/1IFUMColfzPV9Xg78/JDYQnQwo=
X-Google-Smtp-Source: AA0mqf5pZ8/0JzVg2RjX9zPCaZYkM3QE2Blevv5hbduTbNVBbtdIk/GKu66OgKj/i9GCQiIgHRKFlQ==
X-Received: by 2002:a05:600c:538b:b0:3cf:8d51:fae1 with SMTP id
 hg11-20020a05600c538b00b003cf8d51fae1mr4825907wmb.0.1670585625010; 
 Fri, 09 Dec 2022 03:33:45 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 v24-20020a05600c215800b003cf6a55d8e8sm1575290wml.7.2022.12.09.03.33.43
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 09 Dec 2022 03:33:44 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-trivial@nongnu.org,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eric Blake <eblake@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: [PATCH v2] scripts/archive-source: Use GNU tar on Darwin
Date: Fri,  9 Dec 2022 12:33:42 +0100
Message-Id: <20221209113342.61053-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

When using the archive-source.sh script on Darwin we get:

  tar: Option --concatenate is not supported
  Usage:
    List:    tar -tf <archive-filename>
    Extract: tar -xf <archive-filename>
    Create:  tar -cf <archive-filename> [filenames...]
    Help:    tar --help

'tar' default to the BSD implementation:

  $ tar --version
  bsdtar 3.5.3 - libarchive 3.5.3 zlib/1.2.11 liblzma/5.0.5 bz2lib/1.0.8

Try to use the GNU implementation if it is available (from homebrew).

Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
Supersedes: <20221208162051.29509-1-philmd@linaro.org>
---
 scripts/archive-source.sh | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/archive-source.sh b/scripts/archive-source.sh
index 23e042dacd..e3d0c23fe5 100755
--- a/scripts/archive-source.sh
+++ b/scripts/archive-source.sh
@@ -18,6 +18,7 @@ if test $# -lt 1; then
     error "Usage: $0 <output tarball>"
 fi
 
+test $(uname -s) = "Darwin" && tar=gtar || tar=tar
 tar_file=$(realpath "$1")
 sub_tdir=$(mktemp -d "${tar_file%.tar}.sub.XXXXXXXX")
 sub_file="${sub_tdir}/submodule.tar"
@@ -67,7 +68,7 @@ for sm in $submodules; do
     esac
     (cd $sm; git archive --format tar --prefix "$sm/" $(tree_ish)) > "$sub_file"
     test $? -ne 0 && error "failed to archive submodule $sm ($smhash)"
-    tar --concatenate --file "$tar_file" "$sub_file"
+    $tar --concatenate --file "$tar_file" "$sub_file"
     test $? -ne 0 && error "failed append submodule $sm to $tar_file"
 done
 exit 0
-- 
2.38.1


