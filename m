Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81AC96F43D2
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 14:26:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptovA-00047u-Ql; Tue, 02 May 2023 08:15:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ptoui-0003oY-VF
 for qemu-devel@nongnu.org; Tue, 02 May 2023 08:15:36 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ptouX-0003Df-K6
 for qemu-devel@nongnu.org; Tue, 02 May 2023 08:15:20 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3f315735514so166133965e9.1
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 05:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683029712; x=1685621712;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=L0FhIczAk11/ENUFRdXcuofTB3Ur2iEW5T7cmTf0PiE=;
 b=R92fWyzsF/R0aEU+c+Zvsdm7ho7u2Oswdpw1LBoh2Yw7zXQBTkkH8KVeJ9Hb0U1FpJ
 SwLkEhDpiY3hwz0SYYq+2ozRNVj+j/PGJaTfxAsJMjuEoOCbHiS8fJWfjwtB2EAVVOU6
 fQkQDPI2lcrop3katql+QNtdFGnTGKuPFuxkvK++HLFcI78mb5j/kt6s1GmOn0sImYaq
 7PkRV5dkAGpoY/3DfLt3TkuGXwA2b+FGDbQzDjCOshiwJ3stNjSM4+9H+wizF4OaJrek
 UckrljGZn/Yz0v+9JdufmYfKi+NcBADoOuO7nngx7eaGrwE0/eTcbQFEHnCLoOA/IHVv
 Ie+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683029712; x=1685621712;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=L0FhIczAk11/ENUFRdXcuofTB3Ur2iEW5T7cmTf0PiE=;
 b=RetR/awBMm6x76qOA1InJpvfGSxZk1dYlGFr4MckXiJ8RKU22/YkSJbwpWsdzj0+fG
 c1jRJfpQkAno1H2HBSQkNIfdgllpsQQRrAlvLiKaXEugPza7maNfOKaGrIdStNp/nxWf
 A7NAwCNvZ6QAwm/Hg3hZG10gEMdPWA0qlhPvRcthwOHlC9SwStFm8QKE3udAoVTnuNrD
 swK0uOPZ4BeTQZdRObobo2FVCX3c4jKnvq70OP6Ln0zyVMqNLrC2lW+506nLzXjoQ3Bf
 5Rg2V1bmS9YafFb5Cht9js2lTMDMDyBr2yJ9SXzlLmjbvYw+W9waeRCCUb7Rz8bBAMQD
 fzMA==
X-Gm-Message-State: AC+VfDyMjD/zSHnEjExsJJ0mn3kC+paL2L4Yf7k2CSpwnDVa7K9HfNsv
 U83rAsDCXsaRwWebo4ZmmqmYKynh+31h7wLqOdY=
X-Google-Smtp-Source: ACHHUZ4UvVZruRKXW+n2JR8FwPfahLiJI/Q10Ad7UMnK0K4IipbYTSJgJ6xwlYFuKsjJQfbrx9aS6g==
X-Received: by 2002:a05:600c:4506:b0:3f1:6ebd:d995 with SMTP id
 t6-20020a05600c450600b003f16ebdd995mr9877603wmo.0.1683029712070; 
 Tue, 02 May 2023 05:15:12 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 g10-20020a7bc4ca000000b003f171234a08sm35040330wmk.20.2023.05.02.05.15.11
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 05:15:11 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 24/35] qapi/run-state.json: Fix missing newline at end of file
Date: Tue,  2 May 2023 13:14:48 +0100
Message-Id: <20230502121459.2422303-25-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230502121459.2422303-1-peter.maydell@linaro.org>
References: <20230502121459.2422303-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

The run-state.json file is missing a trailing newline; add it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-id: 20230417164041.684562-10-peter.maydell@linaro.org
---
 qapi/run-state.json | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qapi/run-state.json b/qapi/run-state.json
index e5f5d313954..09ea1202927 100644
--- a/qapi/run-state.json
+++ b/qapi/run-state.json
@@ -666,4 +666,4 @@
 # Since: 7.2
 ##
 { 'enum': 'NotifyVmexitOption',
-  'data': [ 'run', 'internal-error', 'disable' ] }
\ No newline at end of file
+  'data': [ 'run', 'internal-error', 'disable' ] }
-- 
2.34.1


