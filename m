Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F7F36A736A
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 19:26:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXR7f-0005T9-8q; Wed, 01 Mar 2023 13:24:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pXR7c-0005JT-LI
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 13:24:12 -0500
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pXR7a-0006ns-Ta
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 13:24:12 -0500
Received: by mail-io1-xd2e.google.com with SMTP id y140so5745650iof.6
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 10:24:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112; t=1677695049;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UDKo+pEqLr25ECZFRWghhYmC5CZ9G4l3ZCThpSQaZZ4=;
 b=qX7eGIrRItpdTrClA/kXJpb/cIdP6kfCZl+Y2P9uDtB+kePJOaAu4BtIIqT2U1e6u1
 FokiIRQiG7HREBXrpept0+Zk3UgnGhVmuOYvS/np6353f7rvZmuYobicYRWGa7Syg67Y
 KKyT+af1pZmbVYOhH3jfRm0I3GyTaswUwAufeG/ttaxaI8/jN/lk8fMiSTFLPXW35/Dr
 vBRd7N43+DxhRwdyVrnL7qAYf2LuzylGEFJr5BDVRnnhXeI4U1C8u7jiWxvmUoREd1ui
 fSaEdJhNM5A6nFmtb+bczY09RhiZvWDLCuKMjLwpMDfEmnt4aqB39jS6OUReqQkA7bDK
 urWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677695049;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UDKo+pEqLr25ECZFRWghhYmC5CZ9G4l3ZCThpSQaZZ4=;
 b=AEqbbksrjRxcI2MGgwFjTVJ5tPZfVLYXMT8VFmxscmYC4JwoGb+PH63lL0uF8WC1pt
 5+S6pPQ8MWgMCmWEkNGtQbWWdHM9jY3V5QIz4Kt515fWy/Gq+eCDuUjHD0hQIuItY6xn
 +sVuEwhrjAxs1060ZvecTV9HIt0qH1SVrkM2nbzzqdZDwXaB6Y48NdY6V4xNCflQAKsq
 3SzaD6FdEQKFpAdVEHkrv2wGZOTxtPAKARlenDftXrQwPBu5a2bwHE6GcL2e88mLMu69
 kwOOxnvK2jwoN+kaEC4JP6Id/oh47byABuCYiCBur1WYl6SSmVeCn5A6Bv+yENZBMERn
 ha4Q==
X-Gm-Message-State: AO0yUKVS6FpfOEHlRY61qxkylb5FZTsxdRd74RrgnCgflVT4NUXTTpCY
 kUrb09pxsqB9BoBCN5ShBUJAzFQg+EtlkCjW
X-Google-Smtp-Source: AK7set9D42skVUUaz9EZrC9JbSjHqbQkgGIS/MNKv/9efGl0nzl4K3b7m7iswwDfM5+73Nj5gEbD3g==
X-Received: by 2002:a5d:844c:0:b0:734:e7c0:2058 with SMTP id
 w12-20020a5d844c000000b00734e7c02058mr5137379ior.9.1677695048927; 
 Wed, 01 Mar 2023 10:24:08 -0800 (PST)
Received: from dune.bsdimp.com (c-71-237-47-177.hsd1.co.comcast.net.
 [71.237.47.177]) by smtp.gmail.com with ESMTPSA id
 l5-20020a6b7b05000000b0073f8a470bacsm4169316iop.16.2023.03.01.10.24.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 10:24:08 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Kyle Evans <kevans@freebsd.org>, Warner Losh <imp@bsdimp.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 richard.henderson@linaro.org, f4bug@amsat.org,
 Paolo Bonzini <pbonzini@redhat.com>, Stacey Son <sson@FreeBSD.org>,
 Juergen Lock <nox@jelal.kn-bremen.de>
Subject: [PULL 03/10] bsd-user: Add sysarch syscall
Date: Wed,  1 Mar 2023 11:23:46 -0700
Message-Id: <20230301182353.21559-4-imp@bsdimp.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230301182353.21559-1-imp@bsdimp.com>
References: <20230301182353.21559-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2e;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

From: Stacey Son <sson@FreeBSD.org>

Connect up the sysarch system call.

Signed-off-by: Juergen Lock <nox@jelal.kn-bremen.de>
Co-authored-by: Juergen Lock <nox@jelal.kn-bremen.de>
Signed-off-by: Stacey Son <sson@FreeBSD.org>
Reviewed-by: Warner Losh <imp@bsdimp.com>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/freebsd/os-syscall.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/bsd-user/freebsd/os-syscall.c b/bsd-user/freebsd/os-syscall.c
index b4a663fc021..e00997a818c 100644
--- a/bsd-user/freebsd/os-syscall.c
+++ b/bsd-user/freebsd/os-syscall.c
@@ -491,6 +491,13 @@ static abi_long freebsd_syscall(void *cpu_env, int num, abi_long arg1,
         ret = do_bsd_undelete(arg1);
         break;
 
+        /*
+         * sys{ctl, arch, call}
+         */
+    case TARGET_FREEBSD_NR_sysarch: /* sysarch(2) */
+        ret = do_freebsd_sysarch(cpu_env, arg1, arg2);
+        break;
+
     default:
         qemu_log_mask(LOG_UNIMP, "Unsupported syscall: %d\n", num);
         ret = -TARGET_ENOSYS;
-- 
2.39.1


