Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24BCE6FEF64
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 11:54:01 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px2xQ-00020i-By; Thu, 11 May 2023 05:51:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1px2xH-0001Or-If
 for qemu-devel@nongnu.org; Thu, 11 May 2023 05:51:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1px2xA-0006pH-9I
 for qemu-devel@nongnu.org; Thu, 11 May 2023 05:51:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683798675;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H4a/6bnjB3qYoMkNYCpzMMOpxNLUt/OjOo50sAbLeyo=;
 b=X00Jp90TlgHqAxNkUypi3DzT6fO1oND09qvu/AStGBhZuKpX4VnpzPdIJewe9K+P99RLue
 nVyi5n1yvXFsThC4Zl1VIKed9U7c1IUXcHHHymdkzm4MsHU8FWLQt3BhnCFfH0vqSqbkgY
 qr1G25RkyTSWLI0+igMOeUxUpTz+J9A=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-583-1FErNdABNiSyE1lq-86vIA-1; Thu, 11 May 2023 05:51:13 -0400
X-MC-Unique: 1FErNdABNiSyE1lq-86vIA-1
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-96a2ea9c409so190063566b.0
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 02:51:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683798672; x=1686390672;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=H4a/6bnjB3qYoMkNYCpzMMOpxNLUt/OjOo50sAbLeyo=;
 b=B6beFH6FR/0KaDoo/aTd6QDzoT5xj+M7Cs164dj2tqiwj7IWpksyU2mE0OFNfl720S
 ykaO9E3L4ek37V3JkE4+3+7d1oDtLISP0jpgIxYl8/bd2l80BS5VT6wv7UHUR7bZCevw
 qQG1IskkwDVdY1yxOJAQzNRA8q2ODMsGqsxZGzMS5u9yI1hkO1+u0PTJeJ+Pgt5A1zBG
 ABo2xQqRIqWHApYg5NeuRdYiYq1CzXVV2kG0/hthQTgkMf2IGjntSsNWp1FSUlCCWl7Z
 uHhsU+sccThBp7+3nhuczt+FUZWQOgbgmYxgIbw5dZqvtVuo3fAQx72XSTTw35eqYEtY
 ZNtg==
X-Gm-Message-State: AC+VfDwiWoZ0TCcT8Pl84qljsPRjXwWGS0IpsdYMZV1531HPNEWjnwUF
 +YQE59HSnwL2ishD5vPL0KDMHDiepsRbD+Ir6Ow2Zmhjc6xmJAdsrqxT2V/fApi8k+W6VrDFhHE
 QovSNsMnKjpJTYmdHU/oYYsYxQRH93wQuZJpqIq0FhW00qgW96PZapVn0f33TPMoACM3tM1Zdt0
 w=
X-Received: by 2002:a17:907:94d2:b0:94a:959f:6d58 with SMTP id
 dn18-20020a17090794d200b0094a959f6d58mr21501625ejc.18.1683798672298; 
 Thu, 11 May 2023 02:51:12 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ60x0x98kJAmo17mneDtm90td4uxxoN0hzHBumTxACG4Pifp3uOun3/KDQQyJWsSz8pA/lAjQ==
X-Received: by 2002:a17:907:94d2:b0:94a:959f:6d58 with SMTP id
 dn18-20020a17090794d200b0094a959f6d58mr21501619ejc.18.1683798672001; 
 Thu, 11 May 2023 02:51:12 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id
 w13-20020a170907270d00b0095fbb1b72c2sm3808377ejk.63.2023.05.11.02.51.11
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 02:51:11 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 23/24] configure: remove unnecessary check
Date: Thu, 11 May 2023 11:50:20 +0200
Message-Id: <20230511095021.1397802-24-pbonzini@redhat.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230511095021.1397802-1-pbonzini@redhat.com>
References: <20230511095021.1397802-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

All calls to probe_target_compiler are conditioned on
some "have_target" invocation, or inside a loop on target_list.
Therefore there is no issue with building unnecessary
firmware images and tests.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/configure b/configure
index 074c98e7641d..fd5d6788cbe8 100755
--- a/configure
+++ b/configure
@@ -1323,13 +1323,6 @@ probe_target_compiler() {
   container_cross_ranlib=
   container_cross_strip=
 
-  # We shall skip configuring the target compiler if the user didn't
-  # bother enabling an appropriate guest. This avoids building
-  # extraneous firmware images and tests.
-  if test "${target_list#*$1}" = "$1"; then
-      return 1
-  fi
-
   target_arch=${1%%-*}
   case $target_arch in
     aarch64) container_hosts="x86_64 aarch64" ;;
-- 
2.40.1


