Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3FD72ED164
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 15:08:16 +0100 (CET)
Received: from localhost ([::1]:34322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxVxX-0000VE-EW
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 09:08:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kxVqS-0003y2-GC
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 09:01:01 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:45102)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kxVqQ-0006wz-1Z
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 09:00:55 -0500
Received: by mail-ej1-x634.google.com with SMTP id qw4so9716274ejb.12
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 06:00:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Q0WxjNIuPF+6aWJPxAfV1RhO2xpwQzcsT3F2ChtwrVo=;
 b=bELg9N3BCHQXO/bKw0hubIfaADChs2zWdeQqFCsQ5kgd3uPjhnJKTFhmrKHlkA4utP
 Y3LkO5RiB/mSiFc6+T6gQ97bO1YTsM6DHPwdQt/XbRNd928DiM56h3WoVQDbdf4GKH6J
 GvnPXSqYUjq/MrbBcWLmDYcByH6zaWb9wUDO7CreEO5KYaVEp+JthpIIH/zEwF4xiQjb
 n/4q6XF6XuQLbxf3RbBXos0iByDcQUGEqcucDX1sQpI1749iZH/F1zxOlN9trfHy95ui
 P962ghY7tileUqe4viHAryHPFrcutac8XIq1xCRhmWUm/btmFPYm++hJ6pGD9e2+vdah
 5vnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Q0WxjNIuPF+6aWJPxAfV1RhO2xpwQzcsT3F2ChtwrVo=;
 b=k6j0I0ZqrOZSAi0YlsDVbI+Nhh0Cw+qIWl7iSwCltl+F72WnIeVJT0ES/K5jUTpdXt
 AxojIFTh6uESpBWVU3ls6wbK4xby5UrduC9TZHYeQDVE7YcabpUBqAERkS2XYRVYgQc9
 +H36NE65aS3WeS8YioFB8rlA72wahkknWkiThEt/cWJZ16K5nrk1ZMrh9040pRjUVQn3
 FnCfbJ+7K/wT6Lr8PPQ0uY5PZlYmQLBqpff369buYXoy/rReezkbpxbFfRwoez3nNd5N
 1BdbOX8AhzOo5xJmCww3g/zU3KmGkppewkjDRcn/Ce40bkZkefA3RwBrfcVxIzrWfWrR
 RyXA==
X-Gm-Message-State: AOAM532jsObPgIqqGnBm9Kc7RiDDaZuh83QVlUi4+UZsKpZRNCHwytO3
 tF0p4axD5nqMWh5bJX+OYs7umMs1D/ML7Q==
X-Google-Smtp-Source: ABdhPJxSGkeYJXzARQiz0+ceQUGHYaDR8J/4Ac/DQtPpBufkbiMuPAh+ULbo8BlJmYf3cf0V6nSfJA==
X-Received: by 2002:a17:906:447:: with SMTP id
 e7mr6375021eja.172.1610028048315; 
 Thu, 07 Jan 2021 06:00:48 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id oq27sm2438523ejb.108.2021.01.07.06.00.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 06:00:47 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 7/8] configure: quote command line arguments in config.status
Date: Thu,  7 Jan 2021 15:00:38 +0100
Message-Id: <20210107140039.467969-8-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210107140039.467969-1-pbonzini@redhat.com>
References: <20210107140039.467969-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x634.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: alex.bennee@linaro.org, marcandre.lureau@redhat.com, berrange@redhat.com,
 stefanha@redhat.com
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
index d573058b16..41866cc38e 100755
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
@@ -6509,7 +6513,7 @@ preserve_env WINDRES
 
 printf "exec" >>config.status
 for i in "$0" "$@"; do
-  test "$i" = --skip-meson || printf " '%s'" "$i" >>config.status
+  test "$i" = --skip-meson || printf " %s" "$(quote_sh "$i")" >>config.status
 done
 echo ' "$@"' >>config.status
 chmod +x config.status
-- 
2.29.2



