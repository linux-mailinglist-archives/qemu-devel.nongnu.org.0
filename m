Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2022546ABD
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 18:46:54 +0200 (CEST)
Received: from localhost ([::1]:41376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzhmf-00024s-Sb
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 12:46:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzhBB-0007yO-IF
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 12:08:09 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:56210)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzhB8-0007Ir-Ej
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 12:08:09 -0400
Received: by mail-wm1-x329.google.com with SMTP id a10so11569599wmj.5
 for <qemu-devel@nongnu.org>; Fri, 10 Jun 2022 09:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=dwM07MgZ9U8IuH8vglEXLGz6MJ4yOYFMqsFY/ReOJHo=;
 b=j/ydB5cIsy/9tXF8PPVlZSw1UXHLDIyQglgzQ13WxUAjJFm9KsGA5DZ+PAe2BSexQV
 1tPoAmGqXNTki1IOcgTQf3eJC8eG4YO93Jr6CgTlQHmRsqScmwFZqtNVoj4Dmr/Tnomu
 O00AqqlxGuCSHmUf3r0byW5Qg5ldcMoxxWpcpJGspKarjx1ulXoaL3V8gdB5VmZXraMb
 PS/UsW3jf1jivQ+r10L+vlnDHLic7NteWvLtpAiJL/q3FE2rvzR3udJg3kVE+0NcIOmy
 IKIYzCVMWt1mmFHJht2PxuDAkK45DUuYnnfK38eSUFIuqZhdngB/PUrJlCjOt0JJA9OP
 Y3Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dwM07MgZ9U8IuH8vglEXLGz6MJ4yOYFMqsFY/ReOJHo=;
 b=pihlY4ZrHvTmWdvkNixTOM00DvqXgAer6/iDn10lGnff9xKqDZgThuOY+37SxLbj3Z
 0c6fML0f8BtzoGIvEh467qshBbRczKPu7/uNj4ZVg9OaCGp5GOSMBkwfiVZBjqsOySlV
 5zc6GnYJbWhl6RtnMTGRd6xTEg2X8m0soH671TNkDuD4rFer8CEdDlGh14v3bzBr6KSE
 Xvbj6iLkSHteSJRguOWObeYJcikqYAyou7fufkLnpt0Ui4cYL95YRjgceIoy4z6h7ty6
 wHG3oXTKqueIRNcVktpZ8E2peDkDse3+psl5vz/1QiJszeajuUBQJVvPg9PoavAvhs0e
 HDlA==
X-Gm-Message-State: AOAM530JdY/NYicgStv3j0cs+dM1qXFaG4hc9F+tUNCuzEsL7cuyZGvz
 NSkbuXGAp6d4BS0xUXbGvb7mtj0pWm0yXA==
X-Google-Smtp-Source: ABdhPJwDy1Evg5tZRNWr6YZNLVRPQyE0SBgDnv2lI65GWjgqA3XDc9j1Hfr9EqaCBBL6V/BfmgfGKQ==
X-Received: by 2002:a05:600c:4e0c:b0:39c:519f:9f35 with SMTP id
 b12-20020a05600c4e0c00b0039c519f9f35mr438808wmq.153.1654877284368; 
 Fri, 10 Jun 2022 09:08:04 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bp11-20020a5d5a8b000000b0020c5253d926sm14276053wrb.114.2022.06.10.09.08.03
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jun 2022 09:08:04 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 28/28] semihosting/config: Merge --semihosting-config option
 groups
Date: Fri, 10 Jun 2022 17:07:38 +0100
Message-Id: <20220610160738.2230762-29-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220610160738.2230762-1-peter.maydell@linaro.org>
References: <20220610160738.2230762-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently we mishandle the --semihosting-config option if the
user specifies it on the command line more than once. For
example with:
 --semihosting-config target=gdb --semihosting-config arg=foo,arg=bar

the function qemu_semihosting_config_options() is called twice, once
for each argument.  But that function expects to be called only once,
and it always unconditionally sets the semihosting.enabled,
semihost_chardev and semihosting.target variables.  This means that
if any of those options were set anywhere except the last
--semihosting-config option on the command line, those settings are
ignored.  In the example above, 'target=gdb' in the first option is
overridden by an implied default 'target=auto' in the second.

The QemuOptsList machinery has a flag for handling this kind of
"option group is setting global state": by setting
 .merge_lists = true;
we make the machinery merge all the --semihosting-config arguments
the user passes into a single set of options and call our
qemu_semihosting_config_options() just once.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Luc Michel <luc@lmichel.fr>
Message-id: 20220526190053.521505-3-peter.maydell@linaro.org
---
 semihosting/config.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/semihosting/config.c b/semihosting/config.c
index 50d82108e6e..3afacf54ab2 100644
--- a/semihosting/config.c
+++ b/semihosting/config.c
@@ -27,6 +27,7 @@
 
 QemuOptsList qemu_semihosting_config_opts = {
     .name = "semihosting-config",
+    .merge_lists = true,
     .implied_opt_name = "enable",
     .head = QTAILQ_HEAD_INITIALIZER(qemu_semihosting_config_opts.head),
     .desc = {
-- 
2.25.1


