Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D7D66D6682
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 17:00:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pji8L-0004ID-Mu; Tue, 04 Apr 2023 10:59:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pji8E-0004D8-KZ
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 10:59:35 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pji87-0005AR-QY
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 10:59:30 -0400
Received: by mail-wm1-x330.google.com with SMTP id s13so19196228wmr.4
 for <qemu-devel@nongnu.org>; Tue, 04 Apr 2023 07:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680620366;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aAf+TE0WUqHD9GQJtq5AggVi3R+s0Li7ZN1ZFaHMUt0=;
 b=ftp8OB1wIRjD4kMxXPqAODo5trzK11UJo9uxmhcNElR6hnQiEOQXjsp3ILYMaK1Jgb
 UFIeqb0bRGXV9PHmjKDzi6clodXIJj6pIn763a4KNt/GnWluvSw9XJQDo6LiWjccXU56
 S/dOXpLEDRBYBgf/8pcAt/G2bZnf9r98FatEV+RVXwztoJYXpWDz3bhqZ460aaiBy+If
 f1nBAkXpan9EJzxAs0L2G2NwVC7cEmYac0BKrm6bNN/hDaqXH2Q7qIWFZHnu9i+EIlbM
 5m0CHfhtzvhvDmE22ysiu4TcqTINcxRKarmaYIcP22w2E2SDvujYfK9JhCAJRphzx4gX
 Thyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680620366;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aAf+TE0WUqHD9GQJtq5AggVi3R+s0Li7ZN1ZFaHMUt0=;
 b=QzVI0A/JkyQq3Q+uQot31na8huweYgFOs40yUkkurNAmR7FFMlwEO1kVQ5wXOfR4u6
 BV424AZ9Dq4O/9WNmfo1fqBl59g9lG1qJG6EfYnP9zICURZQKrcG8liFMnbu69JfqdB3
 Mim3j8jF/a6bhvIrD0LyQ5S3v/tUBOno62t/xffSSR2ILRzHjOZFvzkuKbd5h4IbYfYE
 Bg1kzgIcrFhOYNL0pSHA4xYw4lP8KPligK7laOtyJiNLEGqW0u9mfuTtSCHo9yYQnv0c
 7/Yu7rN5A8eR2daLjZiHTUM7lmY5SbST5gDlAOOgFyPaJ8pzHdflV0CUtJqeJ7URdYat
 nD+g==
X-Gm-Message-State: AAQBX9cCZqSEJ1F2ZNqktLOQYjSBIi3KaqEtI5+lY+F/SvobyOrIr+vB
 QoZGeyYW8FqIWnYSFEu8iCI2MQ==
X-Google-Smtp-Source: AKy350aAE0iJt3JyZ7CtXvOvQrLrgeQxnt8eHmDXKt+Lq4trjUL4oogWBuqJbLBDMvaZ8rCkZcbmkw==
X-Received: by 2002:a05:600c:4591:b0:3f0:3070:f4ea with SMTP id
 r17-20020a05600c459100b003f03070f4eamr14116162wmo.11.1680620366187; 
 Tue, 04 Apr 2023 07:59:26 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 o9-20020a05600c4fc900b003ef6bc71cccsm23234584wmq.27.2023.04.04.07.59.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 07:59:25 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6844E1FFBB;
 Tue,  4 Apr 2023 15:59:25 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Warner Losh <imp@bsdimp.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 03/10] gdbstub: don't report auxv feature unless on Linux
Date: Tue,  4 Apr 2023 15:59:18 +0100
Message-Id: <20230404145925.2638152-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230404145925.2638152-1-alex.bennee@linaro.org>
References: <20230404145925.2638152-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
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

The later handler if conditionally compiled only for Linux but we
forgot to ensure we don't advertise it lest we confuse our BSD
brethren.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Fixes: 51c623b0de ("gdbstub: add support to Xfer:auxv:read: packet")
Reported-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Warner Losh <imp@bsdimp.com>
Tested-by: Warner Losh <imp@bsdimp.com>
Message-Id: <20230403134920.2132362-4-alex.bennee@linaro.org>

diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index 2a66371aa5..0760d78685 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -1468,7 +1468,7 @@ static void handle_query_supported(GArray *params, void *user_ctx)
             ";ReverseStep+;ReverseContinue+");
     }
 
-#ifdef CONFIG_USER_ONLY
+#if defined(CONFIG_USER_ONLY) && defined(CONFIG_LINUX)
     if (gdbserver_state.c_cpu->opaque) {
         g_string_append(gdbserver_state.str_buf, ";qXfer:auxv:read+");
     }
-- 
2.39.2


