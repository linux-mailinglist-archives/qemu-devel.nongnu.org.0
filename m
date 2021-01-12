Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 716FB2F376A
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 18:42:07 +0100 (CET)
Received: from localhost ([::1]:57306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzNgE-0000eF-GP
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 12:42:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kzNGB-0003lC-Ty
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 12:15:12 -0500
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:37440)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kzNGA-0004ww-FE
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 12:15:11 -0500
Received: by mail-ej1-x62d.google.com with SMTP id ga15so4607055ejb.4
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 09:15:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qzI+YT1N4z/CWdZkjoYjj2Jud//oxEZLpdvDoB26JbM=;
 b=j6JwPF5L21TX3AJee8EbpqqB1yJG6gTXc/HpcZteSpP65uf2P2pya/PKqgsUTCq1W/
 fvSAbuy5SsHIoWYiI3cMFn4Oti20B1U4Au7sXzUMnTTBB0i4Q7L8BDwonDJ4T4QO29S8
 7LbZ+rrsVTxI0xdK0zKhWPNzeBQb8a6ZG+NDqe+dm+K651KCgNFqlP9TchwQtSHsKX8F
 N905PaeHXFRaiyOg1VXOXxN7iXqfwByyee2GVRCDCiBXHJYwfr2ivxkeU0zVstNUDtov
 AYqlXNHR24TENWx3vwacyAZY+doys1CepnRbJiPIGO7xypYDVdbl+LkgeZ95h8uMpm4U
 Aqew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=qzI+YT1N4z/CWdZkjoYjj2Jud//oxEZLpdvDoB26JbM=;
 b=EqhVeXy51vmcC+gD5vmfQnslNR/Kdlup8ITf0mWpX6zf3mTsATVr9isAX6zeNWMiQq
 RtmqZwW9Sc1Cm3Rnk2HR9hdx56OcqywFSzPxeb+02xS22EXGQBZ35xDHaMBqznC/e96I
 qfciYXKlbHc03vohVrKFs5bcfKqyEm2YzSPw3E/N171sNXibE8AjxUO6NXmbx0fd06lc
 cZPNBzslzkyVV6fZJCsZfNbOfKljw9XJBlOM3KSMxpKx8moRQ3hHMWkuZQQyTkemkJxP
 4jGEA23tEUMfG4G5nj4dPNaTpFXXKRsRjmy1ZyEG48Jw6A2terXNPt8JO7PgwDlTCOiW
 4gGg==
X-Gm-Message-State: AOAM531PYbXzOssoXYzHPRH7jzoOQ9WgnGitm1xfleLSI/CA0a3shazh
 +a4UTXVmcJx4UTwIaTqHJMK/a4VmuXqUPw==
X-Google-Smtp-Source: ABdhPJxQ+V79iMo4xxED9N4N/STp7iKCe6xJpuudCyxGPUAFlmmzqpz4TRmzvn00vbvTFVshVcEK7g==
X-Received: by 2002:a17:906:9452:: with SMTP id
 z18mr3961608ejx.389.1610471709197; 
 Tue, 12 Jan 2021 09:15:09 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id k22sm397302edv.33.2021.01.12.09.15.08
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 09:15:08 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 19/20] configure: quote command line arguments in config.status
Date: Tue, 12 Jan 2021 18:14:49 +0100
Message-Id: <20210112171450.791427-20-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210112171450.791427-1-pbonzini@redhat.com>
References: <20210112171450.791427-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62d.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Make config.status generation a bit more robust.  (The quote_sh
function will also be reused to parse configure's command line
arguments in an external script driven by Meson build option
introspection).

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/configure b/configure
index 17aa595343..155dda124c 100755
--- a/configure
+++ b/configure
@@ -89,6 +89,10 @@ printf " '%s'" "$0" "$@" >> config.log
 echo >> config.log
 echo "#" >> config.log
 
+quote_sh() {
+    printf "%s" "$1" | sed "s,','\\\\'',g; s,.*,'&',"
+}
+
 print_error() {
     (echo
     echo "ERROR: $1"
@@ -6519,7 +6523,7 @@ preserve_env WINDRES
 
 printf "exec" >>config.status
 for i in "$0" "$@"; do
-  test "$i" = --skip-meson || printf " '%s'" "$i" >>config.status
+  test "$i" = --skip-meson || printf " %s" "$(quote_sh "$i")" >>config.status
 done
 echo ' "$@"' >>config.status
 chmod +x config.status
-- 
2.29.2



