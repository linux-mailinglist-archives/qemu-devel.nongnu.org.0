Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D298314278
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 23:00:24 +0100 (CET)
Received: from localhost ([::1]:59292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9EZx-0005ty-OJ
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 17:00:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l9BCO-00034h-E6
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 13:23:48 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:38074)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l9BCN-00066b-0W
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 13:23:48 -0500
Received: by mail-wr1-x42f.google.com with SMTP id b3so18382099wrj.5
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 10:23:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WW9FjE01j//RL/qhn41ULN+iS845r2HT2fAeuJfLQAw=;
 b=gbed6NQ1Af+p/c/1vSg6J0npdPCXfPbpF+0b5ZrLj1ygEUtqklW1VGT5xBcETEO/2f
 erOd3ZzcrR/S741BFH4bzYYkLupSOUU0Hf0tZK1QZXKxByaTDHNSpzotOjszWtu0D9On
 Y4gGXxkfCQQfCkuoZ7Bga91Uir/NhkPfdeq0VXikLmcBL0GPnur35BAv/98XzS/kZH3s
 HKsLm9nGeBfmt9vI3BKRIvrqkXZn0PJqZy45PGYztuPxtLNNQzHOrW7KdvuCX7TcA1f4
 t4fSbMtvVblbsqtc24gL8cxTdZKeYUySEmN0LoT0Rg7V9yIyChfLImlbSeTJhiLcwrKM
 r76A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=WW9FjE01j//RL/qhn41ULN+iS845r2HT2fAeuJfLQAw=;
 b=awm64/9IlavvAwrdd4uNGhYZP2kIeKhF0wg/TshRHMQJFvKAl98aVCL5f0gOv4Cifw
 aFE6CZ2LnPSCXBb3kmcryS2gnXrbv3gd/PbBR+qX4IEuBm3P8xlFGlS9JLPlkZfQYqBa
 H5WeZwSp3yqMUW3eH0HvFZ8GFITKGn2BoFXzqGMLpLJ/2oiaa2rkhI9J48Qdt+vwSUBg
 xGcM10aQ2uDCqiNLBm9UaXvkxE2F96lTXFvZoj0I+pW+EUdd5v0KTnTKsaZ0tTboLhMn
 RS7zMIe7i3lfh72Hq+TOoHGXx/QTg1MDUtzz3txeeDNj4B4r+psWfLE6dbDFn22KhLuB
 BLVw==
X-Gm-Message-State: AOAM5316IQ0Sy5xDQvmash6zxSqZ+jSlktuxqh3uOnLlMVo428EP5zT9
 RCagtvsQW6kDHVhbRQIb8hviXog4oWs+Mg==
X-Google-Smtp-Source: ABdhPJwCQjgrgwfEOSTcXT4KiV2CaYQwW9PcmYYPm5DUTvyyjxURMvhWBlITgBQcAFgHreRXVmqqzg==
X-Received: by 2002:adf:ea02:: with SMTP id q2mr21506413wrm.25.1612808625750; 
 Mon, 08 Feb 2021 10:23:45 -0800 (PST)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 x22sm19670wmc.25.2021.02.08.10.23.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 10:23:44 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 13/46] fuzz: fix wrong index in clear_bits
Date: Mon,  8 Feb 2021 19:22:58 +0100
Message-Id: <20210208182331.58897-14-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210208182331.58897-1-pbonzini@redhat.com>
References: <20210208182331.58897-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Qiuhao Li <Qiuhao.Li@outlook.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Qiuhao Li <Qiuhao.Li@outlook.com>

Signed-off-by: Qiuhao Li <Qiuhao.Li@outlook.com>
Message-Id: <SYCPR01MB3502E9F6EB06DEDCD484F738FCBA9@SYCPR01MB3502.ausprd01.prod.outlook.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/oss-fuzz/minimize_qtest_trace.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/oss-fuzz/minimize_qtest_trace.py b/scripts/oss-fuzz/minimize_qtest_trace.py
index 4cba96dee2..20825768c2 100755
--- a/scripts/oss-fuzz/minimize_qtest_trace.py
+++ b/scripts/oss-fuzz/minimize_qtest_trace.py
@@ -261,7 +261,7 @@ def clear_bits(newtrace, outpath):
                 data_try = hex(int("".join(data_bin_list), 2))
                 # It seems qtest only accepts padded hex-values.
                 if len(data_try) % 2 == 1:
-                    data_try = data_try[:2] + "0" + data_try[2:-1]
+                    data_try = data_try[:2] + "0" + data_try[2:]
 
                 newtrace[i] = "{prefix} {data_try}\n".format(
                         prefix=prefix,
-- 
2.29.2



