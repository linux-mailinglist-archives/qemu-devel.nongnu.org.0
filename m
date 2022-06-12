Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B885E547C10
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Jun 2022 22:51:22 +0200 (CEST)
Received: from localhost ([::1]:47552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0UYL-00089h-9O
	for lists+qemu-devel@lfdr.de; Sun, 12 Jun 2022 16:51:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o0UVo-0005Xn-2X
 for qemu-devel@nongnu.org; Sun, 12 Jun 2022 16:48:44 -0400
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b]:37751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o0UVm-00006k-0S
 for qemu-devel@nongnu.org; Sun, 12 Jun 2022 16:48:43 -0400
Received: by mail-il1-x12b.google.com with SMTP id d6so3030519ilm.4
 for <qemu-devel@nongnu.org>; Sun, 12 Jun 2022 13:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A84gV9Jtit3CFQbzmGzq5ixbn+21Voj12wbqYsyy5is=;
 b=Oa1TLAkBjf9wkHfaJC1RzhdvPap6zeu6e9kZ9d3FdDnJQieuHuiqbLBOvAPVuenzgS
 BqM0xFHCvvdxQm0aY3ZkiqT4SCEtSlZfKHK/YtyRc2V2cPRp/YTXiCHui8fgU5FmSWwO
 RAvDGDpIuKolBDK9ANRFeZ5blkSa++73kFfaZR7T41FLhTYZ+IsMO0vJjvab/wUXeo2V
 LPnkk0dQr+vq2G1+gAG85iwqnjNcc1S/f/78Rn2a34eeItpvXuJXxbiFLXw6lkp6YT1q
 YvRbTCc4pyW/XrTicBLrf1u+iY/oDt6xoqClgHNdjhVhLGygoPx+vahF8+iljhbxpeCF
 Ty6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A84gV9Jtit3CFQbzmGzq5ixbn+21Voj12wbqYsyy5is=;
 b=QStbPC64aVbGT3iky/J9EyPhPDddjcspxxlSpH0IY27AZnYqxZTwWFToqoxD8kp28o
 0WqFGhEfh6zy0T4oPMrbnkY3rw9rAwyvPdvhfACo4vAl6GLXZhtulrjqJpVOP7ddaLSG
 4DslR6R1WkKPYVPla7IJDrC7iKGR7FUTEhOVsf4Hmg1xnLKtTBo1VOEFvZtLSF1SAUPq
 TA1TIoxq/b4QffSmnrWqsQjUXYlUHolQkPt/OIqCpdmiMac7EdCODcgC2Ir1ilJjx5ke
 3NlXLar0NKmjER3nKEq0EpIOLEstQA98s+8rpoekZqN2oHSb0PA3iHGssDvARLYDYTnq
 JWng==
X-Gm-Message-State: AOAM532ppCsnkvHCRtwBpTqc+ygE7kKAvdqQlV2mFMiE4+rk+asY8wFH
 Pb/Kina4Bas5XlErjsTIrbV9FFutZRAKfQ==
X-Google-Smtp-Source: ABdhPJzKZMAzdx0r5Uc2dZVxkP78pgdHKS4BCQAuWMRDb9vlkBa5LIZMNHq5O06gPcbHGzEBPsx2ww==
X-Received: by 2002:a05:6e02:19cc:b0:2d3:e20f:4959 with SMTP id
 r12-20020a056e0219cc00b002d3e20f4959mr32572315ill.40.1655066920357; 
 Sun, 12 Jun 2022 13:48:40 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174]) by smtp.gmail.com with ESMTPSA id
 j2-20020a056e02124200b002d1d8de99e7sm2911612ilq.40.2022.06.12.13.48.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Jun 2022 13:48:40 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: jrtc27@FreeBSD.org, Warner Losh <imp@bsdimp.com>, def@FreeBSD.org,
 arrowd@freebsd.org, Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stacey Son <sson@FreeBSD.org>, Jung-uk Kim <jkim@FreeBSD.org>
Subject: [PATCH 02/11] bsd-user: Implement fdatasync, fsync and close_from
Date: Sun, 12 Jun 2022 14:48:42 -0600
Message-Id: <20220612204851.19914-3-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220612204851.19914-1-imp@bsdimp.com>
References: <20220612204851.19914-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::12b;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12b.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement fdatasync(2), fsync(2) and close_from(2).

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Jung-uk Kim <jkim@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/bsd-file.h           | 22 ++++++++++++++++++++++
 bsd-user/freebsd/os-syscall.c | 12 ++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/bsd-user/bsd-file.h b/bsd-user/bsd-file.h
index fb54905b46f..3e0f160e312 100644
--- a/bsd-user/bsd-file.h
+++ b/bsd-user/bsd-file.h
@@ -240,4 +240,26 @@ static inline abi_long do_bsd_close(abi_long arg1)
     return get_errno(close(arg1));
 }
 
+/* fdatasync(2) */
+static abi_long do_bsd_fdatasync(abi_long arg1)
+{
+
+    return get_errno(fdatasync(arg1));
+}
+
+/* fsync(2) */
+static abi_long do_bsd_fsync(abi_long arg1)
+{
+
+    return get_errno(fsync(arg1));
+}
+
+/* closefrom(2) */
+static abi_long do_bsd_closefrom(abi_long arg1)
+{
+
+    closefrom(arg1);  /* returns void */
+    return get_errno(0);
+}
+
 #endif /* BSD_FILE_H */
diff --git a/bsd-user/freebsd/os-syscall.c b/bsd-user/freebsd/os-syscall.c
index a824785fee8..f7d09909925 100644
--- a/bsd-user/freebsd/os-syscall.c
+++ b/bsd-user/freebsd/os-syscall.c
@@ -273,6 +273,18 @@ static abi_long freebsd_syscall(void *cpu_env, int num, abi_long arg1,
         ret = do_bsd_close(arg1);
         break;
 
+    case TARGET_FREEBSD_NR_fdatasync: /* fdatasync(2) */
+        ret = do_bsd_fdatasync(arg1);
+        break;
+
+    case TARGET_FREEBSD_NR_fsync: /* fsync(2) */
+        ret = do_bsd_fsync(arg1);
+        break;
+
+    case TARGET_FREEBSD_NR_freebsd12_closefrom: /* closefrom(2) */
+        ret = do_bsd_closefrom(arg1);
+        break;
+
     default:
         qemu_log_mask(LOG_UNIMP, "Unsupported syscall: %d\n", num);
         ret = -TARGET_ENOSYS;
-- 
2.33.1


