Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F339E267F1C
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Sep 2020 12:07:16 +0200 (CEST)
Received: from localhost ([::1]:45036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kHOuh-0001si-H2
	for lists+qemu-devel@lfdr.de; Sun, 13 Sep 2020 06:07:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kHOtB-0000bX-1b
 for qemu-devel@nongnu.org; Sun, 13 Sep 2020 06:05:41 -0400
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642]:36263)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kHOt9-0002Ci-Ee
 for qemu-devel@nongnu.org; Sun, 13 Sep 2020 06:05:40 -0400
Received: by mail-ej1-x642.google.com with SMTP id e23so19196971eja.3
 for <qemu-devel@nongnu.org>; Sun, 13 Sep 2020 03:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8u7qVIji/P6iDBnP9RNpMszmujgXnbWqw7uGLeKpFr0=;
 b=vZ9RxewQQozeRyK+1qPtX7GHPu8JvZ6BJchCWSDvQagc/LIZM/CM080HlSOaFnLSU0
 vA0afcQX3OJVpnLYp2hU15F7AOzV2tICXmVlYGOk68zkWtZQk3ljBMiS2qjCfleYUUR+
 D5/OwKZzrotKGCkyAjI7s39v3KBhu5ONvps8TTTU8hjPQ89vJNT9FXbcOKYZhVJ45frj
 EQOC9U1Y4GqtUZbwhCj090mnsUKZXZTWqUH2h7hwdXXQHk+s5vtz5gDmKAtTKPyO61mx
 dTyST2moyw7log3up1QGJGqKuzgXykNDeWbT5LJgl9xaaaPFwQl+u7WYWyVOjnLOHdSG
 DgaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=8u7qVIji/P6iDBnP9RNpMszmujgXnbWqw7uGLeKpFr0=;
 b=T1fEC36VJd9Niiy5eKI5LHcn3sQWa6aDFnLo/XydZL2RRn5JpOhGdx6TlpCOy3x/gX
 IXCpri8t2IutybDfRx6ocDzZHILdYlh8MxZKfm7xwZfm6pBiaVUauVGVIEmkIH/ROtXl
 40ZKVG9jlpmFt2hN9PLkQ3D557YXJWCM42pjid6qP8Q9xvOhgpZVQaNCaxKXmzWldqPi
 o+4/wdPiM+vqFvMS39nXV1kaKXNjDB2FPBLLoBXjnUXgAHfjV9uaJPx1NpjSm7jqJcDF
 M7qwouoEz0p3pkx5gaSYcR0dwVQ7jbojdRhQwjwdopQvPjqjKlg7f/CfpskhsFjmJswI
 0kkA==
X-Gm-Message-State: AOAM5302/tWmsCW9TVkeLAkJARdBzQ6Bb8WLwoXOJaQOUiRD+Jcu7I2n
 8iI07m9BOHtEbfj8E+3UejeN60aWPhI=
X-Google-Smtp-Source: ABdhPJwVeCuyoyC2evhAHHUM8H+7jpiIujmNF2qN0wjIqJ8+24wC+SH+STZk4I9NnYXbVyY/cpqh1g==
X-Received: by 2002:a17:906:838f:: with SMTP id
 p15mr10039657ejx.315.1599991537996; 
 Sun, 13 Sep 2020 03:05:37 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6468:f312:9c8:f845:9041:a5ee])
 by smtp.gmail.com with ESMTPSA id
 g11sm6690286edj.85.2020.09.13.03.05.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Sep 2020 03:05:37 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] configure: quote command line arguments in config.status
Date: Sun, 13 Sep 2020 12:05:32 +0200
Message-Id: <20200913100534.22084-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200913100534.22084-1-pbonzini@redhat.com>
References: <20200913100534.22084-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::642;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x642.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: marcandre.lureau@redhat.com, berrange@redhat.com, peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/configure b/configure
index 53723ace57..beae010e39 100755
--- a/configure
+++ b/configure
@@ -89,6 +89,10 @@ printf " '%s'" "$0" "$@" >> config.log
 echo >> config.log
 echo "#" >> config.log
 
+quote_sh() {
+    printf "'%s'" "$(echo "$1" | sed "s,','\\',")"
+}
+
 print_error() {
     (echo
     echo "ERROR: $1"
@@ -8061,7 +8065,7 @@ preserve_env WINDRES
 
 printf "exec" >>config.status
 for i in "$0" "$@"; do
-  test "$i" = --skip-meson || printf " '%s'" "$i" >>config.status
+  test "$i" = --skip-meson || printf " %s" "$(quote_sh $i)" >>config.status
 done
 echo ' "$@"' >>config.status
 chmod +x config.status
-- 
2.26.2



