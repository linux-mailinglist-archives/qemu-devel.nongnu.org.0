Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B051032D0B5
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 11:32:57 +0100 (CET)
Received: from localhost ([::1]:35686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHlHs-0003HY-OM
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 05:32:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lHlDc-000172-7p
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 05:28:32 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:33739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lHlDa-00072o-IT
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 05:28:31 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 w203-20020a1c49d40000b029010c706d0642so4267093wma.0
 for <qemu-devel@nongnu.org>; Thu, 04 Mar 2021 02:28:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uT53odMmH0OuSfN5jrN9VScapjAxXUSAk46g1pzI/eY=;
 b=RasIiW0LVKwaAxNingCHXas5PI60s77+bDfGsotZByL2m/1eec57z36GsX+VPxMXcP
 6PI8zMszWiobuR6atmE9DFgGD/+Z3Zf6JU50KBsXridIMW4TBbTk0uxWVpi6ItR5p7mD
 PATt8Zgq4u46ku+ZQ+6GxCHxs4+Zvvj5q65qRYbPxiujGp1el6Yz6tI7zBlSC3cr2ext
 GkdCrMt0jSmZw+3XixGeLAgdDymuYmGpVl7rqvD6scyxrxZdlS7kiin8JewDEwzApUXW
 px376E40V5XNQoY6Veh+V/8K4bn1fB4nJ3zbVbdWDYLvrYhxeRvcZw+OOtV3Am7JIAf6
 GoAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=uT53odMmH0OuSfN5jrN9VScapjAxXUSAk46g1pzI/eY=;
 b=phaBtONTtJUgZaCKhmYr+4VGMMH4BQowsLdefZTWuEpoHdPqUhn1STYsSDERKy/L8Q
 GKW9cVft0HDITJhS8VlaFl24geuqUMpAHJGNS4I0P5/I9fVPTaaV0KjgGUNjDapETO3c
 AAR1cyZhXbjVlPnIQAE0bKBNlXob9MqQCe6CHil2uZYu0qwOFrOdyT9ACyfNpY+QRhpO
 EcgrF0eFKN0sZJfPRjx2kcq2joHB2TZrIViy/iQ1JO/jJCCQMOESwKPy4sgbD1rjYDT2
 Kr7PawWlRPLFtpqUHSPmYUxHZtv/BC9fdQMMoRXgHSGVR7AKMtb+B4iUd5Hct/fVAd5Z
 v5XQ==
X-Gm-Message-State: AOAM533Uj3xxCFN2wQk2kjFZXASlCit+KrYH36S+6NVuSFK0OzMidbl8
 +FEESrdtP3Q67Av2phW4x1rpganHg5Y=
X-Google-Smtp-Source: ABdhPJy7KG/tySFTXmNRxgwYFV8khM53pk3qoeEhBVqf4lypwL82c+lJGn8oeH4BNNMqdpoTGV/9UA==
X-Received: by 2002:a05:600c:35c1:: with SMTP id
 r1mr3238990wmq.143.1614853708486; 
 Thu, 04 Mar 2021 02:28:28 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id f9sm29436294wro.77.2021.03.04.02.28.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Mar 2021 02:28:28 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] qemu-option: do not suggest using the delay option
Date: Thu,  4 Mar 2021 11:28:27 +0100
Message-Id: <20210304102827.106522-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: berrange@redhat.com, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The "delay" option was a hack that was introduced to allow writing "nodelay".
We are adding a "nodelay" option to be used as "nodelay=on", so recommend it
instead of "delay".

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
        This is quite ugly, so I am posting it as RFC in case others
        have better idea.  Nevertheless, a proper deprecation of "delay"
        cannot be done if QEMU starts suggesting it, and since it's the
        only case I opted for this very much ad-hoc patch.
---
 docs/system/deprecated.rst | 6 ++++++
 util/qemu-option.c         | 7 ++++++-
 2 files changed, 12 insertions(+), 1 deletion(-)

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
index 40564a12eb..3057942a5c 100644
--- a/util/qemu-option.c
+++ b/util/qemu-option.c
@@ -785,7 +785,12 @@ static const char *get_opt_name_value(const char *params,
             }
             if (!is_help && warn_on_flag) {
                 warn_report("short-form boolean option '%s%s' deprecated", prefix, *name);
-                error_printf("Please use %s=%s instead\n", *name, *value);
+                if (g_str_equal(name, "delay")) {
+                    error_printf("Please use nodelay=%s instead\n", *name,
+                                 prefix[0] ? "on" : "off");
+                } else {
+                    error_printf("Please use %s=%s instead\n", *name, *value);
+                }
             }
         }
     } else {
-- 
2.29.2


