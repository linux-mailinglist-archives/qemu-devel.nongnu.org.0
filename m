Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F026E89E3
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 07:54:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppN9y-0007f6-V7; Thu, 20 Apr 2023 01:48:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ppN9w-0007b9-4v
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 01:48:44 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ppN9t-0001JS-Vj
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 01:48:43 -0400
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-63b73203e0aso4472605b3a.1
 for <qemu-devel@nongnu.org>; Wed, 19 Apr 2023 22:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1681969720; x=1684561720;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xnagxZ+E2n9TVg5oW3uGy+jRWdbtBn+94wc6hhrGdGg=;
 b=D5ud44Ahexa++SR+FdiFdbY9IPv//S/qgD5AxdNtwQ/aTI8E+l603In2trHLRLqpWS
 pd0aHXvnQUb99eCFdr4JPUuJ9Q8nqXzpfsSR0iBH3VhT8f//vp3yDMZ5bvi0CvDbBQcv
 9VkvtqpoXcxva/FmWeO7pKYqSbYAf/ciH0GhxJgg+kjBOJJBhBgx8T+oW/bglXZSTJ9R
 bq635IitakMYvMHsONEMi6sTnLuiN5uV06ac7Bi17wrs9gvREXntQRGEkntcNOEt9TyR
 h0WqnA+LjM1NPrvBsMf2S/NusKUsjHv62mmRusm7+TzpLyEFpo4Jzk8hMiAoQDE1JtZz
 hijg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681969720; x=1684561720;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xnagxZ+E2n9TVg5oW3uGy+jRWdbtBn+94wc6hhrGdGg=;
 b=ghDSjNaEFip9WveLbljC+5O5kOfQcztrUtPEnlcHKV6KPpDO7byHabP+J624rrNZD9
 rRKSJftM/Qh+zpq2ufO3NZ1Tq7qFuCdwP4ZuPAs9stMLyuV4PPuXM10Xdan12tTjDdc3
 pTc89cVda1w4Mkh/odFVogefB7Uqw0KtAGfa2U8/Yi+mahr6TRLjw73LlZYY9MsfPhSn
 +EQ6BJuQGwC8SNOi7wXu9VAwURJwUeeWXB/VbgfiWRW40TMSb6hRtdI3y7QuePWQe/pv
 uwgtzg1n+YYSafXKURy7L//wcZENjE6Sdw9wWjgP3/FqcLSuuiAodRKL24gpdDLcRI4l
 RHNw==
X-Gm-Message-State: AAQBX9cyMDKZ8JJCHy3md/A55O8a0SwBd0wd6gMp/flvUVjcSl8ewl91
 ZRR7Yn3Z24WAe+BtTOVO1L5bhg==
X-Google-Smtp-Source: AKy350Zrki9iJuI5DW+L8PUAIDVv6PUUaGsliHNFpmdT0cfFcCKDxiB9pU0AHw8hfRXK9gfGe8Nmjg==
X-Received: by 2002:a17:90a:c404:b0:247:2da0:8f42 with SMTP id
 i4-20020a17090ac40400b002472da08f42mr5254854pjt.20.1681969720366; 
 Wed, 19 Apr 2023 22:48:40 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 x15-20020a17090a46cf00b00247164c1947sm2769255pjg.0.2023.04.19.22.48.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Apr 2023 22:48:40 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org, Tomasz Dzieciol <t.dzieciol@partner.samsung.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v2 18/41] igb: Always log status after building rx metadata
Date: Thu, 20 Apr 2023 14:46:34 +0900
Message-Id: <20230420054657.50367-19-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230420054657.50367-1-akihiko.odaki@daynix.com>
References: <20230420054657.50367-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::42d;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Without this change, the status flags may not be traced e.g. if checksum
offloading is disabled.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/net/igb_core.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
index 0182880adf..dabf1a91d8 100644
--- a/hw/net/igb_core.c
+++ b/hw/net/igb_core.c
@@ -1303,9 +1303,8 @@ igb_build_rx_metadata(IGBCore *core,
         trace_e1000e_rx_metadata_l4_cso_disabled();
     }
 
-    trace_e1000e_rx_metadata_status_flags(*status_flags);
-
 func_exit:
+    trace_e1000e_rx_metadata_status_flags(*status_flags);
     *status_flags = cpu_to_le32(*status_flags);
 }
 
-- 
2.40.0


