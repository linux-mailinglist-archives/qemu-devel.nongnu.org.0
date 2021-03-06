Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF97E32F9A2
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Mar 2021 12:07:41 +0100 (CET)
Received: from localhost ([::1]:52808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIUma-00082W-Qw
	for lists+qemu-devel@lfdr.de; Sat, 06 Mar 2021 06:07:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lIUZz-00061Q-TA
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 05:54:41 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:35568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lIUZx-0008DG-R4
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 05:54:39 -0500
Received: by mail-wr1-x430.google.com with SMTP id l12so5216333wry.2
 for <qemu-devel@nongnu.org>; Sat, 06 Mar 2021 02:54:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nEvq3zCUGEMnaqz6FiGYyto4ewbJo+45jcuvmd2iy3s=;
 b=fRWe54mJkPHuh9TJSzG1GMz08viM4A+fPaACuCTwd0rvLgqizKOvoZF7L78joo9OxO
 DlRdCFk7j8VkBdUZqBb5lPHFljeBSAxiC62xmVMm3Kzc+q/GQcHVX6jwpI2dcOl/hoT6
 ENf9lZubpqomAV1PD7AJzBZ8I7andiv23lwcp8zWKUAMHnmd+VGsfn2/mBB5HwfoHlw3
 PPYNQkUwfwAq6H1JhjDXrVFjjIVzBfMMqq3/y3u7M3EUS65dK4hrsOAzO8idq/YfYAks
 u/gtEIWKvLtocCWNpzM7bbImEKR1kMmuZ2Ee92hLltRDVpQYpUACMtZOTp+C99cocr0c
 HEag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=nEvq3zCUGEMnaqz6FiGYyto4ewbJo+45jcuvmd2iy3s=;
 b=kZno6Mp9boRu+cQmBg7sjdVFY8jxgK1udPrbalzADy4Nf6ROeimIxkJJRtMs/inPLg
 z7sXdq0TXUOLjyY3dxTGfoUZabCUr2socYa3rnpOyIz34nMPftPL4w1IfMTne/xVffso
 PvLjAutduqH4/BX593/YuAsa2Arwkt7F+j+Bu7KxFvpUjNx8YdTu2m+D2kgsYqA1cHwS
 YDy4GgWwwLdnvziUdmrDZJUB9tbXmnAmiRlDtMgiJfet/alNSygP9D0QUOhPUA4BsiGK
 6ppKKFbT0fOo/1BspLyCoEY1R7tLVJRg4g7C0HsE/QdNNokOE6UHfHWH9yXU6VR5g83p
 SpOw==
X-Gm-Message-State: AOAM53394WcH9TFE3RTVycijvBJMyXDFID9WCn6pMKBZgGP76gTt1JRr
 XCX2GmsxK+pJtr48o6QP1ni2CGxb2qs=
X-Google-Smtp-Source: ABdhPJwEPex30J2UsF6JtRn1XHGzWwHR3xcjzl9t1raCoOyMKrByGl/msVJEVYQigSnszTz8Q0j+Qw==
X-Received: by 2002:a5d:67cf:: with SMTP id n15mr13442322wrw.95.1615028076277; 
 Sat, 06 Mar 2021 02:54:36 -0800 (PST)
Received: from avogadro.redhat.com ([93.56.170.5])
 by smtp.gmail.com with ESMTPSA id i26sm9326472wmb.18.2021.03.06.02.54.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Mar 2021 02:54:35 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 18/23] qemu-option: do not suggest using the delay option
Date: Sat,  6 Mar 2021 11:54:14 +0100
Message-Id: <20210306105419.110503-19-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210306105419.110503-1-pbonzini@redhat.com>
References: <20210306105419.110503-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The "delay" option was a hack that was introduced to allow writing "nodelay".
We are adding a "nodelay" option to be used as "nodelay=on", so recommend it
instead of "delay".

This is quite ugly, but a proper deprecation of "delay"
cannot be done if QEMU starts suggesting it.  Since it's the
only case I opted for this very much ad-hoc patch.

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/system/deprecated.rst | 6 ++++++
 util/qemu-option.c         | 6 +++++-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
index fcf0ca4068..cfabe69846 100644
--- a/docs/system/deprecated.rst
+++ b/docs/system/deprecated.rst
@@ -134,6 +134,12 @@ Boolean options such as ``share=on``/``share=off`` could be written
 in short form as ``share`` and ``noshare``.  This is now deprecated
 and will cause a warning.
 
+``delay`` option for socket character devices (since 6.0)
+'''''''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+The replacement for the ``nodelay`` short-form boolean option is ``nodelay=on``
+rather than ``delay=off``.
+
 ``--enable-fips`` (since 6.0)
 '''''''''''''''''''''''''''''
 
diff --git a/util/qemu-option.c b/util/qemu-option.c
index 40564a12eb..9678d5b682 100644
--- a/util/qemu-option.c
+++ b/util/qemu-option.c
@@ -785,7 +785,11 @@ static const char *get_opt_name_value(const char *params,
             }
             if (!is_help && warn_on_flag) {
                 warn_report("short-form boolean option '%s%s' deprecated", prefix, *name);
-                error_printf("Please use %s=%s instead\n", *name, *value);
+                if (g_str_equal(*name, "delay")) {
+                    error_printf("Please use nodelay=%s instead\n", prefix[0] ? "on" : "off");
+                } else {
+                    error_printf("Please use %s=%s instead\n", *name, *value);
+                }
             }
         }
     } else {
-- 
2.29.2



