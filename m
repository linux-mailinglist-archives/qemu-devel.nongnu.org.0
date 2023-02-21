Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 533D169DD55
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 10:52:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUPE5-0006gW-8a; Tue, 21 Feb 2023 04:46:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pUPDp-0006Xy-Dv
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 04:46:08 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pUPDm-0005hm-Lh
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 04:46:05 -0500
Received: by mail-wr1-x42c.google.com with SMTP id j2so3531303wrh.9
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 01:46:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TA6OOWQ91gwMPVdJaiqremUPesLCo2/3y2+/jq8dGYs=;
 b=NpIh7un1vqUK8m7PlxTTbmWgl87vvyqbHz//QFdv6SAY1iOknzAM6DgACweetBf2Cf
 uZXgFXW/EWjSisvJRPbU49rirlESKvn3ODFFCHKZ5l4DrZymW0K55EtyDEhalR7x4VEd
 Mp8CnQ6b6salwmDhDBiGOcfKEc0i5Nv8IaV6h9jq3DtbwMuQM7u3Rc7fCV1SxeLjKbEu
 22lQBEXP5DXOXTu6Z7anuR1vv8V/9u+Mc6dh0POgCGp9PTITSheiifD8B+zWjBX8OqCa
 1Xkh0Rs3XpW/vWIO4AOKkHb5fVORAudp9dRiWop9r0161rARncrjuHBDjddNtuMhM4g0
 d0KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TA6OOWQ91gwMPVdJaiqremUPesLCo2/3y2+/jq8dGYs=;
 b=3qIIg7Ms23xNa1/V4StNxp2UmhoZMmxWHKQok2T8UpugoFi0X5mIMYSNqfKBJLU6gH
 jtycj+ca2kjFXpopJzyFaYCcGX5ZI23vyH1eoFFn5DNUS0kyLJ16EfhwfcL4nXfs7zFX
 Q0CHDWOgwL4zFJgJAJbhuXB/D/9I/3qclrbP3Ngs2rw2xCkdMnkTcshVt5AirIVipOn8
 NGohjfDn6RLR3F3OhC2WkJ5VgwvkC4H4jXRwcU+fh71qboaoRMKDuFtXQ8GLFf6lyZpX
 sqDi88iokF0WvgR2i4ED/nxw2uWVO+oUC/zJD1QcFOiL+Rjo3y61pzR9ku2VocGjJ0PV
 6MrQ==
X-Gm-Message-State: AO0yUKVWsMPmL5oxzmhrM2eRbRsUDNVvje4xzODpeJgRbMSo8OiFtnb+
 W2tGqkvBTKE/upUXczZqG2k9jw==
X-Google-Smtp-Source: AK7set8yMnaCeXnimv1Hkwtqw5471BRZueeARFvd8MNs6l2wRqxkj/MZDVvfBxnlCkfV53OpGCpQuQ==
X-Received: by 2002:a5d:4149:0:b0:2c4:695:d644 with SMTP id
 c9-20020a5d4149000000b002c40695d644mr3686090wrq.9.1676972761241; 
 Tue, 21 Feb 2023 01:46:01 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 j9-20020adff009000000b002c3ea5ebc73sm4712263wro.101.2023.02.21.01.45.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Feb 2023 01:46:00 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7BF181FFBC;
 Tue, 21 Feb 2023 09:45:59 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Yonggang Luo <luoyonggang@gmail.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Ed Maste <emaste@freebsd.org>, Bandan Das <bsd@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 qemu-block@nongnu.org, Beraldo Leal <bleal@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-arm@nongnu.org,
 Michael Roth <michael.roth@amd.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Alexander Bulekov <alxndr@bu.edu>, Darren Kenny <darren.kenny@oracle.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v2 04/14] tests: be a bit more strict cleaning up fifos
Date: Tue, 21 Feb 2023 09:45:48 +0000
Message-Id: <20230221094558.2864616-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230221094558.2864616-1-alex.bennee@linaro.org>
References: <20230221094558.2864616-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

When we re-factored we dropped the unlink() step which turns out to be
required for rmdir to do its thing. If we had been checking the return
value we would have noticed so lets do that with this fix.

Fixes: 68406d1085 (tests/unit: cleanups for test-io-channel-command)
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Suggested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tests/unit/test-io-channel-command.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tests/unit/test-io-channel-command.c b/tests/unit/test-io-channel-command.c
index 04b75ab3b4..c6e66a8c33 100644
--- a/tests/unit/test-io-channel-command.c
+++ b/tests/unit/test-io-channel-command.c
@@ -42,6 +42,7 @@ static void test_io_channel_command_fifo(bool async)
     g_auto(GStrv) dstargv = g_strsplit(dstargs, " ", -1);
     QIOChannel *src, *dst;
     QIOChannelTest *test;
+    int err;
 
     if (mkfifo(fifo, 0600)) {
         g_error("mkfifo: %s", strerror(errno));
@@ -61,7 +62,10 @@ static void test_io_channel_command_fifo(bool async)
     object_unref(OBJECT(src));
     object_unref(OBJECT(dst));
 
-    g_rmdir(tmpdir);
+    err = g_unlink(fifo);
+    g_assert(err == 0);
+    err = g_rmdir(tmpdir);
+    g_assert(err == 0);
 }
 
 static void test_io_channel_command_fifo_async(void)
-- 
2.39.1


