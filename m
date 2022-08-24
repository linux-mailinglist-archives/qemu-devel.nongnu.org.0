Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A417D59F761
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 12:23:35 +0200 (CEST)
Received: from localhost ([::1]:39594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQnXq-0003RW-Ij
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 06:23:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oQmte-0002vj-L7; Wed, 24 Aug 2022 05:42:04 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:34581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oQmtd-0001WL-44; Wed, 24 Aug 2022 05:42:02 -0400
Received: by mail-pf1-x42e.google.com with SMTP id x19so13186490pfq.1;
 Wed, 24 Aug 2022 02:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=7LWxjzLiMjVy2izI9dRF2Sjpli2Wn10pIJc7DSpn6QU=;
 b=brdxMJGzxUwCXxXL4kV2S6/E0Ku999Foeiqquf6mQi3/b3gHgiE6SXy5f+RlSqSsnz
 0+mdtqrFDKmqeWGKEZecGnrz2sek+LRQM/pLpEHeF8OOmt7kkGQZuULr6hgmAOJ5q0bl
 84rZ184Yxm020cPx1b7Hc2xdScQYWJqOqT5MTPoJ0RZmLWvqBwizoZOG5H46B0JPPTIM
 eP2V8gaPEoJ1hBbTjY/ejvgvMouDO5CDbSoa49Mjz91OS4NSy/BMgBzBA1cv2HOTRM9s
 vo+mzoYv0KS7l+ujdCfwmFLBMmCei+Hj27ksrNCYYt5oPr5/6m2dwcXYye1xYj+N0jL9
 ZeTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=7LWxjzLiMjVy2izI9dRF2Sjpli2Wn10pIJc7DSpn6QU=;
 b=yIaDef0FyHoE28sXMZWonTkZS3tTmgqdDUdBbNEiatL0mPVpsKBdDv2WGkFm7CzBSs
 5PQ1AdckBVRbp4m95fdEBzO4A4d8jZy8dYzl+g2RPiXcUBnJTuYZYCAwBf0NeaEPwlD7
 Gw1yfmuMilcax+cjW39HSlxkFFvS+j8uRbLQ0ivZ9R/pe3wUVN8OFyjbmWOML5lTWrm/
 SFIq7mHiTQuPEqJJd6c15cnPJQZVRMzRY14Fh9dr33lPUNkglsu6lgW+BcUemTgkSubu
 kWmG/MVbdGC6qwFsoTimOh4yraZF422H7mVES+9+yYMOZkt3kNTxCMIECMLhfv2eCYyb
 lhKA==
X-Gm-Message-State: ACgBeo2FwyGEU1DOPEpgN/9n03ZDiqxve0neL9i2+dtRsViM0B+Hsluz
 26pZgHQ8PRbGQLESxxm3x8hpUuCVElE=
X-Google-Smtp-Source: AA6agR5v/k8hr1mxNevhLJOqumg6Wn3LkoHhqDmQk7vcQw4U/bv+iHEsgxrihGpE0HpyeJOzfsoAjQ==
X-Received: by 2002:a65:6c10:0:b0:429:4a5:a4d0 with SMTP id
 y16-20020a656c10000000b0042904a5a4d0mr24185074pgu.614.1661334119236; 
 Wed, 24 Aug 2022 02:41:59 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 b14-20020a170903228e00b001728eb339e2sm12165972plh.286.2022.08.24.02.41.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 02:41:58 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Subject: [PATCH 08/51] block/vvfat: Unify the mkdir() call
Date: Wed, 24 Aug 2022 17:39:46 +0800
Message-Id: <20220824094029.1634519-9-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220824094029.1634519-1-bmeng.cn@gmail.com>
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

From: Bin Meng <bin.meng@windriver.com>

There is a difference in the mkdir() call for win32 and non-win32
platforms, and currently is handled in the codes with #ifdefs.

glib provides a portable g_mkdir_with_parents() API and we can use
it to unify the codes without #ifdefs.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 block/vvfat.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/block/vvfat.c b/block/vvfat.c
index d6dd919683..9c389ce5ea 100644
--- a/block/vvfat.c
+++ b/block/vvfat.c
@@ -2726,13 +2726,9 @@ static int handle_renames_and_mkdirs(BDRVVVFATState* s)
             mapping_t* mapping;
             int j, parent_path_len;
 
-#ifdef __MINGW32__
-            if (mkdir(commit->path))
+            if (g_mkdir_with_parents(commit->path, 0755)) {
                 return -5;
-#else
-            if (mkdir(commit->path, 0755))
-                return -5;
-#endif
+            }
 
             mapping = insert_mapping(s, commit->param.mkdir.cluster,
                     commit->param.mkdir.cluster + 1);
-- 
2.34.1


