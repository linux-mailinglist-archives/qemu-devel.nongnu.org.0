Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACF896C890B
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Mar 2023 00:12:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfqXd-0002MH-1K; Fri, 24 Mar 2023 19:09:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3sy0eZAgKCq4kiVOchgVUccUZS.QcaeSai-RSjSZbcbUbi.cfU@flex--wuhaotsh.bounces.google.com>)
 id 1pfqXZ-0002LR-Oz
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 19:09:45 -0400
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3sy0eZAgKCq4kiVOchgVUccUZS.QcaeSai-RSjSZbcbUbi.cfU@flex--wuhaotsh.bounces.google.com>)
 id 1pfqXY-00082u-3T
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 19:09:45 -0400
Received: by mail-pf1-x44a.google.com with SMTP id
 e14-20020a056a00162e00b0062804a7a79bso1656948pfc.23
 for <qemu-devel@nongnu.org>; Fri, 24 Mar 2023 16:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1679699380;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=bWCWaB7OU5al4gbSkBBDX/6O+Cte3jJAaB+5x9qhbBA=;
 b=YpWPHB2y5IP20uq066o5twARiRsgJPjyRLKttWII1BaeibtfZXM81F7Kf4ie8X4Gw7
 wTCDikMbmQSI5JnS4ES/OtSAAchthNu6XNIQMyie2R8LnBpM3Srdyn7U1xZL89DTNpT1
 UVR/jravhqbJC8VlaLfs49uMXSsmmfOXqsCyFKup2EHLyQ/+o6fFVEbFjyZ03Zw6/5sS
 RUjMnQEsoMLs9zu/8/zYG27xQX1/4nvjaJC8a0Ej1O6dWk8ImfeGIu63BwkrG9+hyc9G
 YMjNU+2l2U2ZU1bNmILe+bqbSDIkVtLR3jVKwgfcu07JLKez/xDJyyI8LNyNWEbYfb5d
 8qGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679699380;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bWCWaB7OU5al4gbSkBBDX/6O+Cte3jJAaB+5x9qhbBA=;
 b=AqFUBHEFXVxJ/7TDZbd0ksjLqmBDwvniIcXz5pmwNPeAjIVEc2cYkolYEvDVoVs4Py
 2bq23AVn96talJW5hb22c1y7EI9ziUwjGvgxvu50iZ9+8zeNMjOVOe+gtwC4AKbAoSVr
 LvpT++rvoAYmNGWRUsCmDL32bW71aaQsjRY+LC9J7TkvRJ+BZyVANvjWi7avknQYk6Ch
 hV0M3mTg48teMavoj3TJP0G2P8vVNRXNWXeSBDR2/cQicpnnzXwsXQtf6+sGM+EB7aKp
 /CSAmiTPFwqhyezHaa96oi96vCgcjzNpSJtp2cKCjwGoy7RQ+C0wdaOaO8AdS48xrqGB
 KLjA==
X-Gm-Message-State: AAQBX9ep3qZ1hmM4W9QA6T6XbbGMpI4V5NI61Flv0auHtSwmTOR5n3Sw
 p74zmtDmmxNInLWWVvnYLNTk208ntgpDJg==
X-Google-Smtp-Source: AK7set/NcL5WzOPr89dmY5ErxuZKEjnVnS0g1eIJ96v6qLB/6gWoF+0E8qW2SkTEDzQRiNfwOPc9gEncMOz6VA==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a05:6a00:1a0b:b0:625:4ff8:3505 with SMTP
 id g11-20020a056a001a0b00b006254ff83505mr2536953pfv.1.1679699379982; Fri, 24
 Mar 2023 16:09:39 -0700 (PDT)
Date: Fri, 24 Mar 2023 16:08:58 -0700
In-Reply-To: <20230324230904.3710289-1-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20230324230904.3710289-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.40.0.348.gf938b09366-goog
Message-ID: <20230324230904.3710289-2-wuhaotsh@google.com>
Subject: [PATCH v2 1/7] docs: enable sphinx blockdiag extension
From: Hao Wu <wuhaotsh@google.com>
To: minyard@acm.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wuhaotsh@google.com, 
 venture@google.com, Avi.Fishman@nuvoton.com, kfting@nuvoton.com, 
 hskinnemoen@google.com, titusr@google.com, peter.maydell@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::44a;
 envelope-from=3sy0eZAgKCq4kiVOchgVUccUZS.QcaeSai-RSjSZbcbUbi.cfU@flex--wuhaotsh.bounces.google.com;
 helo=mail-pf1-x44a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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

From: Havard Skinnemoen <hskinnemoen@google.com>

This allows use to add block diagrams in documentations,
such as the block diagram in docs/specs/impi.rst.

Signed-off-by: Havard Skinnemoen <hskinnemoen@google.com>
Signed-off-by: Hao Wu <hskinnemoen@google.com>
---
 docs/conf.py | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/docs/conf.py b/docs/conf.py
index 00767b0e24..6974647408 100644
--- a/docs/conf.py
+++ b/docs/conf.py
@@ -71,7 +71,11 @@
 # Add any Sphinx extension module names here, as strings. They can be
 # extensions coming with Sphinx (named 'sphinx.ext.*') or your custom
 # ones.
-extensions = ['kerneldoc', 'qmp_lexer', 'hxtool', 'depfile', 'qapidoc']
+extensions = ['kerneldoc', 'qmp_lexer', 'hxtool', 'depfile', 'qapidoc',
+        'sphinxcontrib.blockdiag']
+
+# Fontpath for blockdiag (truetype font)
+blockdiag_fontpath = '/usr/share/fonts/truetype/liberation/LiberationSans-Regular.ttf'
 
 if sphinx.version_info[:3] > (4, 0, 0):
     tags.add('sphinx4')
-- 
2.40.0.348.gf938b09366-goog


