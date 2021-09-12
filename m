Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D68407D62
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Sep 2021 14:51:29 +0200 (CEST)
Received: from localhost ([::1]:52410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPOxE-00021m-H2
	for lists+qemu-devel@lfdr.de; Sun, 12 Sep 2021 08:51:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mPOuV-0008Ap-1x
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 08:48:39 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:38456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mPOuT-0006hD-JG
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 08:48:38 -0400
Received: by mail-ed1-x530.google.com with SMTP id q3so9892345edt.5
 for <qemu-devel@nongnu.org>; Sun, 12 Sep 2021 05:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TsYTlESRc4bqZT7Ve+3h2xK8+VNwpejqMQbh6qsz484=;
 b=Z+1253upnhei46+yNU5VATSGGLQS0NwfoxlXe+QIKRO+XVWMR35TicloAOdl172jGd
 LbddFw1C+k399yvmOHwRBf9EarBIlr2dAB/AY4RK2YS0shMLQYsDMmzuS8h/u7LAeWSX
 4gUG4l9W1LBeoaBawMqZ59pOL/yCaGseNYc/Kwt9JiCmdn+wziOrGgf+VbJKuSoZ9eG+
 gm+mmSu6AutL02TDA37l1HP6VK4ah7jZRrWS7DeOUWJskzeMkUSqiD+fYRdT8B/hnB2n
 FhshnsoYaMz3Q2Id0RqXiMjw0Er/yC9t6ZQUuQhpRsftJk99LkRvoZwT0qVR+A3fXQps
 YvAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=TsYTlESRc4bqZT7Ve+3h2xK8+VNwpejqMQbh6qsz484=;
 b=i8KvYQv/rLU7zBnpfJ3jxYo/MlY8YqiuL/fFGfg3VLdxWRpZkKTJnjQJ8v9koRIlib
 gzm4L6a0PB9S59WaOItZATQtuzhsktYn9GvXgLGIRYtsE0H1JuEulIZCvHJhSaEiP8+X
 bPXLlebedf2UrGBLNnJILW75Bcg6XZVstU9py2n5M2b5BIjluWBMijS25TYWMdQAQuRp
 jnEXtlVPGTryHCGvx/hrJXncBEVGGQCSlNtFShVMsszTgN0+6bC5lcoaL3eafj1T2DtT
 4hwMPsPacWInrmKcni2M4EYN+xacQM/4quTswkSjVAT8NxVu1UMumQVbPo73LvaPT8lO
 vXow==
X-Gm-Message-State: AOAM531N91rVDRtfJOGwvu0Cm6CNwL/MdMyNH9hfSSgFW2n72wDhjzt5
 2bBLbicXJGUXhVwFiohLCgL5mNWuAcw=
X-Google-Smtp-Source: ABdhPJxlJyTkdkewUBmiF4Doa7X1vknRqwZYDoN3UGO+7oM4NYn5w0wIOOUoi4Qq9LOhTdhqH2KEfg==
X-Received: by 2002:a05:6402:493:: with SMTP id
 k19mr8031314edv.386.1631450915966; 
 Sun, 12 Sep 2021 05:48:35 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id
 z2sm2205909edb.18.2021.09.12.05.48.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Sep 2021 05:48:35 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] qapi: define cleanup function for g_autoptr(Error)
Date: Sun, 12 Sep 2021 14:48:34 +0200
Message-Id: <20210912124834.503032-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x530.google.com
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

Allow replacing calls to error_free() with g_autoptr(Error)
declarations.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/qapi/error.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/qapi/error.h b/include/qapi/error.h
index 4a9260b0cc..8564657baf 100644
--- a/include/qapi/error.h
+++ b/include/qapi/error.h
@@ -437,6 +437,8 @@ Error *error_copy(const Error *err);
  */
 void error_free(Error *err);
 
+G_DEFINE_AUTOPTR_CLEANUP_FUNC(Error, error_free);
+
 /*
  * Convenience function to assert that *@errp is set, then silently free it.
  */
-- 
2.31.1


