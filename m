Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E6724E6EB8
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 08:17:10 +0100 (CET)
Received: from localhost ([::1]:48118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXeC5-0008OQ-7m
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 03:17:09 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nXe2U-000806-2q
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 03:07:14 -0400
Received: from [2a00:1450:4864:20::52c] (port=35775
 helo=mail-ed1-x52c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nXe2S-0000Xl-KP
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 03:07:13 -0400
Received: by mail-ed1-x52c.google.com with SMTP id k10so8185484edj.2
 for <qemu-devel@nongnu.org>; Fri, 25 Mar 2022 00:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bERp2p0Xrlr6QnzpMTfcSdabbsR9hkmx0eBPG3U9Xy8=;
 b=T0JeGXOWT95PzgjZvKCKflgt8qiwRKwydhtTnhTtWFnCETaImlYyTzg5xFGEgb3ERi
 KiRM7+0Bclv0DFg7bGSFoxu0oG1nD6YQesCCfzEkbLzmSnQcgQcbAheuYWgcYS+wepV5
 ZjKsJr8cVHcB67pb3K+gKryz2y8parNXZfd9GQ47hhDUIiow3Ad5z+5+hl8wXGQaupot
 oQmlM7FocbRqT/06dc5AWQyyKoLFOpVKX5AoIpJOK/zpkgMKZD2RlFXfrjjZWgOk3c9E
 U/ekCS9xStTG9BuNPu3BhlE5M3M9GJl/9CxG6Nr8B5tOJ5Q8KiIuje0wbHbNfYOjQPKl
 gO+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=bERp2p0Xrlr6QnzpMTfcSdabbsR9hkmx0eBPG3U9Xy8=;
 b=tWLkylR+a6/ZlFf5TQllvjEGB/DxFWLBJHNtmMdfcTTNuHhhjD23EutHSSHNakczCe
 lUyHifoe1IKpskie/9MZXoaMiL5L+WqOVMwTrB5zi/YNRgKDX/6nXIDmNYDXT8k/e2qk
 F6oWgQ0TK9VJ4J/WSf1v0lS7peoPz0/E83hRb8cXOr2PYr0aGKPxzi7/Wbq338/vgU++
 sEmfmGrR9RKuhzAszrq0YgxD3URB2xXur7Tt7o1EDwpk7Y4EqEn82q4MddKyB8OpGtzP
 rt3nq/OwFl6pL69rQFKXX3SV/8/1OpoE/NWkk5CI7Izi5GeQfhYxQsRz4ioSl0G5tbef
 BK6g==
X-Gm-Message-State: AOAM531L/Iuw3MWn/wncrlOpl+rG5VFj6lukWUTUAp9u+OSMoH8lIi9m
 8XX28/Js2zUdIpyyfGbp+umFNo1txMs=
X-Google-Smtp-Source: ABdhPJzja8QOG13eXPXxVfm7BCejkqqGz82rh7zjSoANr/oOYhUOSWk1/3MxEGEqZJ6QmBzvXjeIyg==
X-Received: by 2002:a05:6402:254e:b0:418:e716:f987 with SMTP id
 l14-20020a056402254e00b00418e716f987mr11208743edb.74.1648192031256; 
 Fri, 25 Mar 2022 00:07:11 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 ka6-20020a170907990600b006ce54c95e3csm2011497ejc.161.2022.03.25.00.07.10
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Mar 2022 00:07:10 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 4/7] configure: remove dead int128 test
Date: Fri, 25 Mar 2022 08:07:03 +0100
Message-Id: <20220325070706.271291-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220325070706.271291-1-pbonzini@redhat.com>
References: <20220325070706.271291-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52c.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/configure b/configure
index 6d9cb23ac5..7c08c18358 100755
--- a/configure
+++ b/configure
@@ -2463,24 +2463,6 @@ else # "$safe_stack" = ""
 fi
 fi
 
-########################################
-# check if __[u]int128_t is usable.
-
-int128=no
-cat > $TMPC << EOF
-__int128_t a;
-__uint128_t b;
-int main (void) {
-  a = a + b;
-  b = a * b;
-  a = a * a;
-  return 0;
-}
-EOF
-if compile_prog "" "" ; then
-    int128=yes
-fi
-
 ########################################
 # check if ccache is interfering with
 # semantic analysis of macros
-- 
2.35.1



