Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2FB467A0E4
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 19:08:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKNhg-0005jW-W9; Tue, 24 Jan 2023 13:07:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pKNhP-0005BN-5D
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 13:07:13 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pKNhJ-00076B-0A
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 13:07:10 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 f12-20020a7bc8cc000000b003daf6b2f9b9so13413424wml.3
 for <qemu-devel@nongnu.org>; Tue, 24 Jan 2023 10:07:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zLUEvU5bY0ExRO47bg7V9ZKZhkWcMmVUuADKI9X2kjc=;
 b=KHeTK4rKeezifMN4ixGaknuC7fJiy+yQLVgqTK6z0JMINmx1huEOakpOamFQRDzCI1
 uFZLkY21O+3OKXUVnEwB+lxkj/ATAxnDyVnaiNGMZiEu/34ZxTLP7imdiHVsORh0NB8G
 xXCiRinCB9tHir7PYVl620Pof0RHgpWgfhwslqBkJ9Fl2Bs/2r6Ofrkr8X/F+zWleXzW
 hV/F2Mz1IB7SeX1OYWsqkTEiDnZpnkwOFLwljIAlOa96wocWlMxr5GcRFtATf17MP4uC
 JwL5NyOXqHbB1W2nfwHZDqhuhTY4DAawc6yu5kctbXflsVd2+ZrHAWOq5FSLLc0YVc/R
 hKKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zLUEvU5bY0ExRO47bg7V9ZKZhkWcMmVUuADKI9X2kjc=;
 b=tMr8x/sIFiHpckISlWpyFGaZ/+GXWuPHTzP903N3gm3cA7ul98ZGeMs/Pp+I5/b3Bv
 zic9yrvrElou6FeLCY7BiRKTeU3qdtSN4wamrQkq4p+Ar76yIzMGlWIcGGG5qpHh3sJa
 7341HFa/G7kFVk6TaHI7HkTL5UH8TwVcN8xe9h7+f4EvdmLuYE3HBeg+efoJBUMda2h+
 3L8iUaVMQHGzL1R6KClMKKO1MJgsI5QfmysECwBwK3xq0sfKtPxqAc2icG1n1aQvmhie
 0Drl1aJqdfd7lIV7TYIkd2PB6kfFm6Hf0iRQ4SCes+zz6JZfKb7QE5HJhTYRyq2RGI0n
 POPg==
X-Gm-Message-State: AFqh2koYuUZSpgoUrdIC1bWKqypic9EeCEUFJ1wAncok2N/Cp6GCYHR1
 94U/Z5CAD5yHCFBzAX6XfQO1BQ==
X-Google-Smtp-Source: AMrXdXuPKGsY8jAho5FvorEqyTIVJK+jufXMZS9QyO9J+WHx4bZUnoVSqqdRPdTNQ9YKvo568pwVWw==
X-Received: by 2002:a05:600c:1c8b:b0:3d9:f492:f25f with SMTP id
 k11-20020a05600c1c8b00b003d9f492f25fmr28182942wms.16.1674583623629; 
 Tue, 24 Jan 2023 10:07:03 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 a18-20020a056000101200b002be25db0b7bsm2469169wrx.10.2023.01.24.10.06.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jan 2023 10:07:02 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E4D8F1FFCF;
 Tue, 24 Jan 2023 18:01:30 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Ed Maste <emaste@freebsd.org>, Thomas Huth <thuth@redhat.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Markus Armbruster <armbru@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Bandan Das <bsd@redhat.com>, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Michael Roth <michael.roth@amd.com>, Eduardo Habkost <eduardo@habkost.net>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 John Snow <jsnow@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, qemu-arm@nongnu.org,
 Yanan Wang <wangyanan55@huawei.com>, Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Li-Wen Hsu <lwhsu@freebsd.org>, Peter Maydell <peter.maydell@linaro.org>,
 Emilio Cota <cota@braap.org>
Subject: [PATCH v2 27/35] util/qht: add missing atomic_set(hashes[i])
Date: Tue, 24 Jan 2023 18:01:19 +0000
Message-Id: <20230124180127.1881110-28-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230124180127.1881110-1-alex.bennee@linaro.org>
References: <20230124180127.1881110-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
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

From: Emilio Cota <cota@braap.org>

We forgot to add this one in "a890643958 util/qht: atomically set b->hashes".

Detected with tsan.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Emilio Cota <cota@braap.org>
Message-Id: <20230111151628.320011-3-cota@braap.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 util/qht.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/util/qht.c b/util/qht.c
index 065fc501f4..15866299e6 100644
--- a/util/qht.c
+++ b/util/qht.c
@@ -688,7 +688,7 @@ static inline void qht_bucket_remove_entry(struct qht_bucket *orig, int pos)
     int i;
 
     if (qht_entry_is_last(orig, pos)) {
-        orig->hashes[pos] = 0;
+        qatomic_set(&orig->hashes[pos], 0);
         qatomic_set(&orig->pointers[pos], NULL);
         return;
     }
-- 
2.34.1


