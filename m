Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F86A4A6656
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 21:47:42 +0100 (CET)
Received: from localhost ([::1]:45024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nF03x-0004F3-HN
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 15:47:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nExnX-0008Cv-5Q
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 13:22:36 -0500
Received: from [2a00:1450:4864:20::636] (port=42868
 helo=mail-ej1-x636.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nExmZ-0000f1-Ui
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 13:21:41 -0500
Received: by mail-ej1-x636.google.com with SMTP id m4so56932296ejb.9
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 10:21:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+TZjr7w9Hd6JZaVgTs5fEwS15BZhJQxhutquuynkbQQ=;
 b=phcxV2wVubU5kFqiurq0Cl29kCy0Kf/H4xeLkQSeoPvOt1i5PNHiicdhy3XuDqcMd/
 Q51qtavyw8S6wMo6wE6L/ImzhFKFRlL3j1sGVlE2HDfeQRYuCcuYYgidUy4Eqh535q5I
 ls4j/PCzL1V4xaJmk7gXOvF7T+QCywM6wnvxBHFNqV3H0oXriulSjsKkOEAEPhWdHlg+
 HG0bpAjUa+Z4yBZbE2cUwc6HTysBIGbxwFzX+9QU3ajHfipVCB+Hptu1obJYtutICkU4
 u2MEaEe5Zm/wDzIC0POAVbs6ts+E6nsUPJ4Slaw6oMIFVfmsX3TvV9yL/m8UIbfbNUUU
 b8Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+TZjr7w9Hd6JZaVgTs5fEwS15BZhJQxhutquuynkbQQ=;
 b=QqAYKfl75TCmr0wUYTeG/UOWf0Szvxx1yVbIvGV/2MtHtrHyqxzY9lvi0VXYqxbmFr
 7N8UOr97y7nbwBu4Hah3h6/5e6Q+sqwvrPggx3Lbk9RvF7oY/iftLHx8SwfT55bg0+H4
 tQs0cFix3I2PiaPlG6B90W2ccezOMNvTFnxdShF5ZevaKODn1UeYPV0uT/A5aSUKSy2s
 YBXwj9Oee3dpZiaLW70TSX2e//9ZgHJk0pfQOmcXZzoYkz3TR1zT9/MbO7AAFt93dVBW
 cDsqjvjTGVbIgidrU68efnNAlewBvtBLSUuRBI0eLN7/XJnhH3Zv6+Gq+j5z70JVH5n8
 3S4A==
X-Gm-Message-State: AOAM5323vtMBLjETV2i14d/Vo2iRcAveTw82z/Oa4Pdq+LmfQyQgWC5G
 3tmjnN5uI0vFd+LM78nQyu+5LQ==
X-Google-Smtp-Source: ABdhPJyvjMp9yF8GX/dweIl/zz71Du/rSTmdW4/i69/AWcrWs+SlBOxMZQb7kuaompVzRtbCnFBVnA==
X-Received: by 2002:a17:907:72c6:: with SMTP id
 du6mr22862141ejc.224.1643739671914; 
 Tue, 01 Feb 2022 10:21:11 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id bl12sm14818961ejb.75.2022.02.01.10.20.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 10:21:08 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1DEB31FFC7;
 Tue,  1 Feb 2022 18:20:52 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 15/25] block: fix FreeBSD build failure with fallocate
Date: Tue,  1 Feb 2022 18:20:40 +0000
Message-Id: <20220201182050.15087-16-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220201182050.15087-1-alex.bennee@linaro.org>
References: <20220201182050.15087-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::636
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x636.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: fam@euphon.net, Hanna Reitz <hreitz@redhat.com>, berrange@redhat.com,
 stefanha@redhat.com, "open list:FUSE block device..." <qemu-block@nongnu.org>,
 crosa@redhat.com, aaron@os.amperecomputing.com, robhenry@microsoft.com,
 f4bug@amsat.org, mahmoudabdalghany@outlook.com, minyihh@uci.edu,
 cota@braap.org, Luke.Craig@ll.mit.edu, pbonzini@redhat.com,
 kuhn.chenqun@huawei.com, ma.mandourr@gmail.com, Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We already use the CONFIG_FALLOCATE_PUNCH_HOLE symbol elsewhere in the
code so use it here.

Fixes: 4ca37a96a7 ("fuse: (Partially) implement fallocate()")
Cc: Hanna Reitz <hreitz@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 block/export/fuse.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/block/export/fuse.c b/block/export/fuse.c
index 6710d8aed8..7ed69c4a05 100644
--- a/block/export/fuse.c
+++ b/block/export/fuse.c
@@ -625,6 +625,7 @@ static void fuse_fallocate(fuse_req_t req, fuse_ino_t inode, int mode,
         return;
     }
 
+#ifdef CONFIG_FALLOCATE_PUNCH_HOLE
     if (mode & FALLOC_FL_KEEP_SIZE) {
         length = MIN(length, blk_len - offset);
     }
@@ -643,6 +644,7 @@ static void fuse_fallocate(fuse_req_t req, fuse_ino_t inode, int mode,
             length -= size;
         } while (ret == 0 && length > 0);
     }
+#endif
 #ifdef CONFIG_FALLOCATE_ZERO_RANGE
     else if (mode & FALLOC_FL_ZERO_RANGE) {
         if (!(mode & FALLOC_FL_KEEP_SIZE) && offset + length > blk_len) {
-- 
2.30.2


