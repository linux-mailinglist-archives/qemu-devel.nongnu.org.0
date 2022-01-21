Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27DA0495E14
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 12:03:08 +0100 (CET)
Received: from localhost ([::1]:57792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nArhC-0001YX-NS
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 06:03:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nArHZ-0003Ru-BI; Fri, 21 Jan 2022 05:36:37 -0500
Received: from [2a00:1450:4864:20::32f] (port=41506
 helo=mail-wm1-x32f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nArHW-0003aK-Kl; Fri, 21 Jan 2022 05:36:36 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 q141-20020a1ca793000000b00347b48dfb53so21487774wme.0; 
 Fri, 21 Jan 2022 02:36:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/jvIaCBMZG3MFfze4trUfKoA9w+9NS5OJInEkgsrJaE=;
 b=a2igcTj/cVTX9I7DCJubNgBqcLsCTtKZ2NhrFRyutBcT0lWiRBnqbhLjHDP9seOCUK
 mm+NEoKsMkw27pjN6CqHmXTgT/GtfH28UVoJEryyZqEWHhT5PrPl7TbKc0IW2sLMJHBA
 ldyPD7xPbXwheolm5CECQXDTMs4ISW6pkLnmH8qpwpYpvNs0SH9y/RJhibH+Lfm6zfHW
 /CYKorwTBC/LS0rGGJ/4T9doiDDCkeylzAoGMpP6XnuSU1riRM05sVaTTqFrQt4uO1E/
 xZMUDo7YfN6tm61PoXHLi4Gp/RuCBllF4Ms54jb+M1zZHDg8h8BhrVrciWeB7aJTA5EY
 KXuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=/jvIaCBMZG3MFfze4trUfKoA9w+9NS5OJInEkgsrJaE=;
 b=6kHnUM21Stz5dowbGbSpnLQrD30DXcHOc2QwzATyJBo0p/16WCI5XvefPcDt9zkpOE
 vbRjawnkYpFn8n8rInUh1qg8GuYBr8bCcwK/3u/x1I8dJUqqQSyp5oCe6XBGhJBUgXmx
 +MgaLJJUzqWfzJifLwYKQEOLyyrNovT38DLPWwqutHUUfBW5RvEYAiFrPCEPpLfANyIx
 nY4HNj10wOXQuPPL6AEL296bSxfUn5m0+GgWwenO2J36EKiBWmnNMHeVcHNKnSwn5ifu
 wx+xd2egEGcDkFH3ZKKQYmpmbdtgxjfjQEk9QqeuhEOZc7uboxHXMr2HhU/mAcqCkfiH
 k0Mw==
X-Gm-Message-State: AOAM53297WWZw502SL8/C1P9A3WiH07v2P3/WoiF6NLKX88VTOl384Lq
 HzuCKXtdq7mB5wDx8dmz8B5gcdwevS0=
X-Google-Smtp-Source: ABdhPJy8q7HKSbaE9kmNQib/S8oo8ELhhF/Oxv6l/IQgL9PNxo/OiPaX/fh51oP0WBBUDx7m2EEC4w==
X-Received: by 2002:a5d:5888:: with SMTP id n8mr3198518wrf.652.1642761390091; 
 Fri, 21 Jan 2022 02:36:30 -0800 (PST)
Received: from nuc.. (154.red-83-50-83.dynamicip.rima-tde.net. [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id
 l9sm5603707wrs.106.2022.01.21.02.36.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jan 2022 02:36:29 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Michael Tokarev <mjt@tls.msk.ru>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yonggang Luo <luoyonggang@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v4 1/8] MAINTAINERS: Cover lcitool submodule with build test /
 automation
Date: Fri, 21 Jan 2022 11:36:16 +0100
Message-Id: <20220121103623.288054-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220121103623.288054-1-f4bug@amsat.org>
References: <20220121103623.288054-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

lcitool is used by build test / automation, we want maintainers
to get notified if the submodule is updated.

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e4b3a4bcdf4..6d5539d46f1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3579,6 +3579,7 @@ F: .travis.yml
 F: scripts/ci/
 F: tests/docker/
 F: tests/vm/
+F: tests/lcitool/
 F: scripts/archive-source.sh
 W: https://gitlab.com/qemu-project/qemu/pipelines
 W: https://travis-ci.org/qemu/qemu
-- 
2.34.1


