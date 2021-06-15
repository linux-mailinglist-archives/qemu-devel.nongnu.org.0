Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 853413A8175
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 15:54:08 +0200 (CEST)
Received: from localhost ([::1]:50158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lt9W3-0000qn-5I
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 09:54:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lt9Hv-0006E4-VK
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 09:39:32 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:43877)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lt9Hs-0002sz-Gt
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 09:39:31 -0400
Received: by mail-ej1-x633.google.com with SMTP id nb6so2472295ejc.10
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 06:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xuAPUpX6Hhq84IfvJMkUkq8FBAkzzJSj3GQD8rT6J7c=;
 b=KvbrcFyhGsSVgKH5uFyA1a2XVLH5X2sHtIzbb9AzDQnuYDH0m35VxXaQC+Mgzt8ZbG
 uH9/Q+J66wq9nTlfSX6DLJwdGR6qtFH/Lwfpa378LpB6Zf0Ue5hLTxi2Vc+gJXt+hl1+
 jCFdPwbbCsQLsy0qV6w9s/L0bKukaAo4Mw+dkUtlaSeDmeKbfHFYHMhFW3PQqvR6B3Fk
 USSMsTq97Pq9tyXUzRPLTbBjVIlnyeYhccDY3F4onjCUOFzMWjRQEuMob3g21iqaFoH5
 NuQTuG4AxJzVDGXZpxLQSUaxKr87Y8pHBKWGYWekNNxkIb0QHXa719fIfBq04cpaGhAU
 4TDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=xuAPUpX6Hhq84IfvJMkUkq8FBAkzzJSj3GQD8rT6J7c=;
 b=JHGd4lc8m0hT1J8fYAL+D3IHznyoksrxbKJZRVDbqoEXeWTaPaVSLsh9tBg+g1x4KD
 e/biu1IFFsDe1dO1TjyNqx9vpuir4YQZ2E1ykgSlC3ivwsij1LFn6SobWMkWCUH0y2nL
 /LsQXCPBE/gY2s0IJv7MkDL1MsuVldJVKpjfoIopAQp0wHV/eltqv1+kSbuDx6f6SKlu
 8CnxLvFnw4D0l6kydYlWyE8RCAPmTNcJnHTt+rtTQGZ0PTUmGfBl9pjprgo+gx/aEgjU
 IOzcDGA7FnCGYQaiRpMdmez/xbCL0cmzZVst9wxkU/x5tAl3nFy7TWmCW31aq6bTa9yQ
 lwzg==
X-Gm-Message-State: AOAM533MdIjHV4Vb3MUvFk7xf0ON2kW4U3tnydCkIcXluDHnYo1sLVga
 9rFB+HoPlEfWhDvSvuflI6iN+FCtuVE=
X-Google-Smtp-Source: ABdhPJzBOJJF5irUwvvyr6alhCXJPUOk2YEd8+Q1gXKl7gNzuW3l9RzDRbDOg1oCD5FxfdfNrR2www==
X-Received: by 2002:a17:906:b307:: with SMTP id
 n7mr20699397ejz.261.1623764367297; 
 Tue, 15 Jun 2021 06:39:27 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id r17sm11843769edt.33.2021.06.15.06.39.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 06:39:26 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 33/33] configure: map x32 to cpu_family x86_64 for meson
Date: Tue, 15 Jun 2021 15:38:55 +0200
Message-Id: <20210615133855.775687-34-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210615133855.775687-1-pbonzini@redhat.com>
References: <20210615133855.775687-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x633.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: David Michael <fedora.dm0@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Michael <fedora.dm0@gmail.com>

The meson.build file defines supported_cpus which does not contain
x32, and x32 is not one of meson's stable built-in values:
https://mesonbuild.com/Reference-tables.html#cpu-families

Signed-off-by: David Michael <fedora.dm0@gmail.com>
Message-Id: <878s3jrzm0.fsf@gmail.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure b/configure
index 8dcb9965b2..4478f3889a 100755
--- a/configure
+++ b/configure
@@ -6384,7 +6384,7 @@ if test "$skip_meson" = no; then
         i386)
             echo "cpu_family = 'x86'" >> $cross
             ;;
-        x86_64)
+        x86_64|x32)
             echo "cpu_family = 'x86_64'" >> $cross
             ;;
         ppc64le)
-- 
2.31.1


