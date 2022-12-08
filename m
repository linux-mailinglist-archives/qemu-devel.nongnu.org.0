Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8089564741E
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Dec 2022 17:22:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3Jdw-0008FJ-Jp; Thu, 08 Dec 2022 11:21:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3Jdr-0008Eo-5b
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 11:21:00 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3Jdp-0005PI-AI
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 11:20:58 -0500
Received: by mail-wr1-x431.google.com with SMTP id y16so2222431wrm.2
 for <qemu-devel@nongnu.org>; Thu, 08 Dec 2022 08:20:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ORV8lB1xtzAjtK0MGnq2okA7cpON1mRvSayS0/wGNEE=;
 b=HlO9UStzLMGfTv3rmS+tRDICU0t5dkCEU+fbqoDZRdE/3VVAUcakooXA0lJjXKwach
 PRl7oXD8oGLS+v8XaBduMnJP1x6+nhWvDHlkrc64DVu9Oe2uamXfzA9py/KAoWPBhJTu
 yWfZ+3c7J4l2i3/sq9DWh58meoXhUGTAYYOBFVRB+WTIkKw9Qe5PouuNZpIsd5AbNIgR
 PKmVnpXYcNisYKEw9kjgAEI4ifYE+jPOjjHcdN3TsqOwj+Dp3fv0GcaO8gei+Ra/FqkZ
 2Lob3FWFbWlp62JJpnGzeTdU5r4afxhZg4dddFAFyyw3+AeLt6sY89jKOdpqoDL6U9DK
 79Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ORV8lB1xtzAjtK0MGnq2okA7cpON1mRvSayS0/wGNEE=;
 b=GFse3o5CrWhTtLFZTT2XUuyemNeqqsx1SlIfsf7vWeC/K3Yccu66d0CJU8y8BNamJw
 aFWfTPerkj0zhQIwUwinoG3uqcVk+CNooArZwreDw4B3JcVhyJiy3+3bA0cuxPHQpdl1
 ywBQ/e05y/O2h45do0r+esgcLzhAmCyze3JQ6cHxPFiM7NCcB/cnWLk87f/MFh0Nr8/+
 VgFwUKELyuZPcm9ZGWwcoMkWuMO5p9kt3U6TGvalv0NEIlD+cLz8MZmvT7Yo5/4x0dSt
 eBv4I3nJxIT2Qovf5mDz7gqeOSlIKL2RzLio2fOGgDI9tcCuM6CH+iyCwLdIf67BUaVH
 bqAA==
X-Gm-Message-State: ANoB5pnOxmctndFcBbRrpMd1GrsWY/XPEJrWw4sMbuJnTkeDdZdpXfIZ
 LhOiLie+nj+W/UScqdak/5xsrflOmDyWQRFLzqs=
X-Google-Smtp-Source: AA0mqf7Z9/IMaXW/Gl0pjNMoJOb0aCLV3RRMvS+38WJycGN+yGeyEd0RhhrAAJmid3xvPEsPZvs1CA==
X-Received: by 2002:a5d:4746:0:b0:242:931:6f63 with SMTP id
 o6-20020a5d4746000000b0024209316f63mr1735859wrs.64.1670516455235; 
 Thu, 08 Dec 2022 08:20:55 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 w1-20020a5d5441000000b002422b462975sm21608850wrv.34.2022.12.08.08.20.53
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 08 Dec 2022 08:20:54 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-trivial@nongnu.org,
 Thomas Huth <thuth@redhat.com>, Eric Blake <eblake@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH] scripts/archive-source: Use more portable argument with tar
 command
Date: Thu,  8 Dec 2022 17:20:51 +0100
Message-Id: <20221208162051.29509-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

When using the archive-source.sh script on Darwin we get:

  tar: Option --concatenate is not supported
  Usage:
    List:    tar -tf <archive-filename>
    Extract: tar -xf <archive-filename>
    Create:  tar -cf <archive-filename> [filenames...]
    Help:    tar --help

Replace the long argument added by commit 8fc76176f6 ("scripts: use
git-archive in archive-source") by their short form to keep this
script functional.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 scripts/archive-source.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/archive-source.sh b/scripts/archive-source.sh
index 23e042dacd..6a710a212e 100755
--- a/scripts/archive-source.sh
+++ b/scripts/archive-source.sh
@@ -67,7 +67,7 @@ for sm in $submodules; do
     esac
     (cd $sm; git archive --format tar --prefix "$sm/" $(tree_ish)) > "$sub_file"
     test $? -ne 0 && error "failed to archive submodule $sm ($smhash)"
-    tar --concatenate --file "$tar_file" "$sub_file"
+    tar -c -f "$tar_file" "$sub_file"
     test $? -ne 0 && error "failed append submodule $sm to $tar_file"
 done
 exit 0
-- 
2.38.1


