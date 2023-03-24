Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (unknown [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A176C821B
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Mar 2023 17:05:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pferx-0001h5-FH; Fri, 24 Mar 2023 06:42:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pferj-0001f5-DM
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 06:41:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pferV-0006jU-SG
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 06:41:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679654478;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Ao7+HEA2VKaHdewpAHSoKHotMBUMTTDujLvqZuHfVZ0=;
 b=cLPHdH2n7ZSHhRhhbYjli1h5GsHa5fdvp+o/X5g8QBiVmuILlRo9ZhGiQ8Xu6PiBB1aqEy
 XaT4b+CoGQFt62D5dkyrnNcig3efKUSuhVoUqXnjQlQH1KMWBuv4O5M66rmz7zU1V+rAtl
 VH23Yt7a6E/XI8Q7wsnhkissaNEvB/M=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-664-KP6REIHiMraCxy2BGfSq1w-1; Fri, 24 Mar 2023 06:40:09 -0400
X-MC-Unique: KP6REIHiMraCxy2BGfSq1w-1
Received: by mail-ed1-f71.google.com with SMTP id
 h11-20020a0564020e8b00b004e59d4722a3so2606923eda.6
 for <qemu-devel@nongnu.org>; Fri, 24 Mar 2023 03:40:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679654408;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ao7+HEA2VKaHdewpAHSoKHotMBUMTTDujLvqZuHfVZ0=;
 b=OOw9xVJgOdC+Q02EG37NVGqaPCz4+PzEPtsfv1pko6+ZkF7G2nXAVt/y3q66EY4PaR
 ooDUu5lIhz/wTJp5CkC9ilxsmzLZbgkqz79McgOGQZCtWpVLKxgOGZhYJ8lA6gmfoEnK
 sFx12jNoUKY5BqQRM6atnpPIjsUFl/7aycAzBeX6leQipLVY9Dbejel03lTSFIjV9jJB
 27UzxPc8XkOSfJfwLA6C62WJHfUKRgzl29HHghEFtM76cAl9SDB4vAgptguaR4nu/tot
 XLU9mgrIaNDNVUxPvV7rLTwAD7nPj77HVKgm9zEmKTSUu55Z9WAUIzz13d6PkSLYzZKc
 lEHQ==
X-Gm-Message-State: AAQBX9d4NhAjhbVasSpT2sWjOm8lWuybGCa0E9YdvZYtSFhSi4WXidqP
 2Gy0keyW6ZNQ1Ag2pGRLEVzbQofprhnaCRd+Z2YdSS0RZyCR6a2RxhLBVIl3jTPyBYn5627lL5a
 UgieMkmF9KPNygp8rwgR/TfhyWy4Ks+fs7isTLNiT92XQ+h8clVc/nmLflqqsz0bfg+ZajxmiQR
 DgGg==
X-Received: by 2002:aa7:c7d4:0:b0:500:40b5:193a with SMTP id
 o20-20020aa7c7d4000000b0050040b5193amr2766386eds.17.1679654408186; 
 Fri, 24 Mar 2023 03:40:08 -0700 (PDT)
X-Google-Smtp-Source: AKy350aklI44jAJIkdSpCPDFkz+qeXUz4FPMPC56D4mvQWtoIGrYZ1h2yiVjUmVV/U3GhfMnlP1riA==
X-Received: by 2002:aa7:c7d4:0:b0:500:40b5:193a with SMTP id
 o20-20020aa7c7d4000000b0050040b5193amr2766364eds.17.1679654407684; 
 Fri, 24 Mar 2023 03:40:07 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id
 a13-20020a509e8d000000b00501d73cfc86sm5443162edf.9.2023.03.24.03.40.06
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Mar 2023 03:40:07 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [qemu-web PATCH] fix cases where the left column becomes too large
Date: Fri, 24 Mar 2023 11:40:05 +0100
Message-Id: <20230324104005.1215674-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.2
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

On the blogs page, long lines under a <pre> tag will make the left column
overlap the sidebar.  Fix it in the CSS.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 _includes/assets.html        | 2 +-
 assets/css/skel-noscript.css | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/_includes/assets.html b/_includes/assets.html
index 411a1ac..aba3f3c 100644
--- a/_includes/assets.html
+++ b/_includes/assets.html
@@ -14,7 +14,7 @@
 
 	<link rel="stylesheet" href="{{ relative_root }}/assets/css/normalize.css" />
 	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" />
-	<link rel="stylesheet" href="{{ relative_root }}/assets/css/skel-noscript.css" />
+	<link rel="stylesheet" href="{{ relative_root }}/assets/css/skel-noscript.css?v=2" />
 	<link rel="stylesheet" href="{{ relative_root }}/assets/css/style.css" />
 	<link rel="stylesheet" href="{{ relative_root }}/assets/css/style-mobile.css" media="(max-width:699px)"/>
 	<link rel="stylesheet" href="{{ relative_root }}/assets/css/style-desktop.css" media="(min-width:700px)" />
diff --git a/assets/css/skel-noscript.css b/assets/css/skel-noscript.css
index e0a141e..98c50b7 100644
--- a/assets/css/skel-noscript.css
+++ b/assets/css/skel-noscript.css
@@ -27,6 +27,7 @@
 			-o-box-sizing: border-box;
 			-ms-box-sizing: border-box;
 			box-sizing: border-box;
+			max-width: 100%;
 		}
 
 	/* Rows */
-- 
2.39.2


