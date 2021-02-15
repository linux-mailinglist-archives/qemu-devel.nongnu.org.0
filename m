Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B2131BA52
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 14:28:19 +0100 (CET)
Received: from localhost ([::1]:41970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBdvG-0005tx-TW
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 08:28:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lBdjx-0005Z7-SJ
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 08:16:37 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:41044)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lBdjw-0005WO-Ed
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 08:16:37 -0500
Received: by mail-ej1-x630.google.com with SMTP id f14so11024820ejc.8
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 05:16:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UnObrrOSAPDzUf3sGkOTM2n/CMfEuxCbzh/iVrZ08VM=;
 b=TMqp6ViqrITuc+EnrlSTKvrbRdSqXYghaFxczUGUc6yOQk6YAeYQrjNgLl5z+TUasz
 SeOQ/odWHuuRhtZSelMOshpi3xiP1oXi2biGeVDTsG+baNrQL86ukDDAUnZgaSE7jU8D
 FlqHUbsxy9dWKXpCnrx7pkmMrOkGl2RD4MAiWrl54xGv1WbibsnlVJlh7lJ7Yw5Rf+lG
 oet+QLEnhrTW983MPEJTKo1/QBBPkPQ3+Yzi8rxFfWOO7GkJM9MoNMmstLpI2Nolx07S
 l59TpJ57Jql0TeRqMjMa/LdtSiG3Y8rGsWnmxG/x6sO/+HSaU/kzPBdhwWWkkwoZLND7
 R5Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=UnObrrOSAPDzUf3sGkOTM2n/CMfEuxCbzh/iVrZ08VM=;
 b=KNGDLHxnru6Jw9KO97rFnyfy8hbhxDQKoRLZ6wzI/Cp9LJKH6xlzu7Vfk+eTqBBoEW
 e97u816dtMkyb52ii0y1TwbDMt8mecFViI4QffngZLScfy5mJtZrL94VxUNndsUFiMap
 va0vNyAXv41qVGagJGSrGhmSuIE2xm2dDle72VHdn79/magVnRWY48aYEHI800kXmL9z
 603DegRTf2Zbt8hCazUT0a+QAIzNCTRpvlIS0BoupVC08kZBaPExr/klmNYolwo7+iM+
 ktp9uHS+iTkngeTwjdrxQ3E0DOUpn79EGrFtaMdn+y9VP1e94Ywj5Nz+ligS5y6GIWOT
 056g==
X-Gm-Message-State: AOAM530+ArExCVFOmiHsdEb4WOp8Gz7vthcMGHpYcJ0MhQDRieIii2ic
 kpbawwiiVntm+z7Wk+IFtmtN3ldKlh4=
X-Google-Smtp-Source: ABdhPJyFlJVbB02ryBNBpM03T9t5ESq9H0mWlfKPDFKTcbb8I1xzNzOsCAnqdt5aVI7JxsYjI9TMSQ==
X-Received: by 2002:a17:906:5e05:: with SMTP id
 n5mr8213359eju.349.1613394995190; 
 Mon, 15 Feb 2021 05:16:35 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id o4sm9950184edw.78.2021.02.15.05.16.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Feb 2021 05:16:34 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/19] libqos/qgraph_internal: add qos_printf() and
 qos_printf_literal()
Date: Mon, 15 Feb 2021 14:16:17 +0100
Message-Id: <20210215131626.65640-11-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210215131626.65640-1-pbonzini@redhat.com>
References: <20210215131626.65640-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x630.google.com
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
Cc: Thomas Huth <thuth@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: qemu_oss--- via <qemu-devel@nongnu.org>

These two are macros wrapping regular printf() call. They are intended
to be used instead of calling printf() directly in order to avoid
breaking TAP output format.

TAP output format is enabled by using --tap command line argument.
Starting with glib 2.62 it is enabled by default.

Unfortunately there is currently no public glib API available to check
whether TAP output format is enabled. For that reason qos_printf()
simply always prepends a '#' character for now.

Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <653a5ef61c5e7d160e4d6294e542c57ea324cee4.1611704181.git.qemu_oss@crudebyte.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/qtest/libqos/qgraph_internal.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/tests/qtest/libqos/qgraph_internal.h b/tests/qtest/libqos/qgraph_internal.h
index 974985dce9..c0025f5ab9 100644
--- a/tests/qtest/libqos/qgraph_internal.h
+++ b/tests/qtest/libqos/qgraph_internal.h
@@ -255,4 +255,15 @@ void qos_delete_cmd_line(const char *name);
  */
 void qos_graph_node_set_availability(const char *node, bool av);
 
+/*
+ * Prepends a '#' character in front for not breaking TAP output format.
+ */
+#define qos_printf(...) printf("# " __VA_ARGS__)
+
+/*
+ * Intended for printing something literally, i.e. for appending text as is
+ * to a line already been started by qos_printf() before.
+ */
+#define qos_printf_literal printf
+
 #endif
-- 
2.29.2



