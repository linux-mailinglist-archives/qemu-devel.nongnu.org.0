Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54FFD696371
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 13:25:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRuN4-0006tJ-6K; Tue, 14 Feb 2023 07:25:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pRuN2-0006t3-IN
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 07:25:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pRuN1-0007MU-48
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 07:25:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676377514;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=XZkdQp6y6erc2hgtNLqLFPrMe+wzgOigG9/iABkcxCo=;
 b=EZyq4UHNv5ZPE0jeFZ/HrxttT+rsvKvyQQ+KwrP4zy+bWlVH/m/BwX8lcUNK/LrErERFGX
 MblhKz4rIjSxOq+lNudCbosAYmKjqDV/S0EbGUtu7QrDrxqFKUSdQEHITEuJQft2wGybpj
 ielbUFVGpeV/0pvXZt+KbpLxEdxLLLM=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-533-cUpSj2eUMMmBR_QQLkTsXQ-1; Tue, 14 Feb 2023 07:25:13 -0500
X-MC-Unique: cUpSj2eUMMmBR_QQLkTsXQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 z19-20020a05640235d300b004aaca83cd87so9935294edc.20
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 04:25:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XZkdQp6y6erc2hgtNLqLFPrMe+wzgOigG9/iABkcxCo=;
 b=rNYWJMezWh5TJhsvggZLkkNPJx3MqTP6hiSmBQHCPgz5ZUtLtlxeYCwFL+CPM8pcrB
 Zy7GSPRNiNFiaLEDg2UMxjxHdxHKg9P7vAHxBUHSEy2joi8rxxNB730NKnNM7Bw5e32e
 PULlAq8K94cWh5nAmS+xiu7Jnrst7ftTtxZyjIeHy09ePTh/f61HQncgZWhPeNQ5n+y4
 KmhBQ6bKshdy6tLp0cp/GrvWMMeIUQdo5pi/5R1QeBQ82LQzSdZ1uCIV/k163IQ+6pzx
 GPvguB3dBul3nH9IrBngTwB+2eiwFiOoRY3rK9YxR6lwuvT8jtBh7QhahX4KP217SGaG
 Tn1w==
X-Gm-Message-State: AO0yUKUROuyEExyeCelVWgLO2ZiB+VLExst2g188NV4VzKE1jbuRlq6p
 VI84e4zLcDwh2/cFvPetYpzkkWreJf2Bmn7UWLW6o+WRCm1j1j9DXFWvJhKZgxUkLG59SdX5oLN
 MJmzagYj6Jh9/Hn6boXZ70qd9RNEJ8ugUDyL22IEGITFhr/MBjnhlHT3OPqouQzgKi4ErNOCT
X-Received: by 2002:a50:9b41:0:b0:4ab:2504:c7ff with SMTP id
 a1-20020a509b41000000b004ab2504c7ffmr2273686edj.23.1676377511733; 
 Tue, 14 Feb 2023 04:25:11 -0800 (PST)
X-Google-Smtp-Source: AK7set/6obomlqLWEvjnRuTCal1LDv82H+O74/HuSNHPjc/kfa7OlN8AKVVerXqq52fICdjrtGobZw==
X-Received: by 2002:a50:9b41:0:b0:4ab:2504:c7ff with SMTP id
 a1-20020a509b41000000b004ab2504c7ffmr2273675edj.23.1676377511547; 
 Tue, 14 Feb 2023 04:25:11 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 p15-20020a50cd8f000000b0049e19136c22sm8018792edi.95.2023.02.14.04.25.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Feb 2023 04:25:11 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: thuth@redhat.com
Subject: [qemu-web PATCH] add language to <html> tag
Date: Tue, 14 Feb 2023 13:25:09 +0100
Message-Id: <20230214122509.30234-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.1
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
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 _layouts/blog.html          | 2 +-
 _layouts/home.html          | 2 +-
 _layouts/page.html          | 2 +-
 _plugins/alias_generator.rb | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/_layouts/blog.html b/_layouts/blog.html
index b7fcdbf..89adb90 100644
--- a/_layouts/blog.html
+++ b/_layouts/blog.html
@@ -5,7 +5,7 @@ templated.co @templatedco
 Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
   -->
 {% include relative_root.html %}
-<html>
+<html lang="en">
 <head>
 	<title>{{ page.title }} - {{ site.title }}</title>
 	{% include assets.html %}
diff --git a/_layouts/home.html b/_layouts/home.html
index f7b6931..b34e6f6 100644
--- a/_layouts/home.html
+++ b/_layouts/home.html
@@ -5,7 +5,7 @@ templated.co @templatedco
 Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
 -->
 {% include relative_root.html %}
-<html>
+<html lang="en">
 <head>
 	<title>{{ site.title }}</title>
 	{% include assets.html %}
diff --git a/_layouts/page.html b/_layouts/page.html
index 765d204..c0d2778 100644
--- a/_layouts/page.html
+++ b/_layouts/page.html
@@ -5,7 +5,7 @@ templated.co @templatedco
 Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
 -->
 {% include relative_root.html %}
-<html>
+<html lang="en">
 <head>
 	<title>{{ page.title }} - {{ site.title }}</title>
 	{% include assets.html %}
diff --git a/_plugins/alias_generator.rb b/_plugins/alias_generator.rb
index b4b86ec..f69d90e 100644
--- a/_plugins/alias_generator.rb
+++ b/_plugins/alias_generator.rb
@@ -80,7 +80,7 @@ module Jekyll
     def alias_template(destination_path)
       <<-EOF
       <!DOCTYPE html>
-      <html>
+      <html lang="en">
       <head>
       <link rel="canonical" href="#{destination_path}"/>
       <meta http-equiv="content-type" content="text/html; charset=utf-8" />
-- 
2.39.1


