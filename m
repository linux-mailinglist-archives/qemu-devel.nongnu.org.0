Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82AF442A359
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 13:32:39 +0200 (CEST)
Received: from localhost ([::1]:43748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maG1O-00085R-3K
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 07:32:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1maFil-0000uh-Fe
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 07:13:23 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:41717)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1maFik-0007aL-1n
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 07:13:23 -0400
Received: by mail-ed1-x52f.google.com with SMTP id a25so63797251edx.8
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 04:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Z6UgxE/8tlX9AdbKXPGLp6eGWQ6K18vN2+aOdIn9xwc=;
 b=GKWE/kVlIvUy0UIu27gXt4BMIpaP34YYWklnEI9tZ1pDTLSrLbG9puKeSiG+x2/JwF
 AS0na46Rxfpdj2OTsP3dpKoFQ+3GvoUTAyYcIXqKg8aZimT7fwCj8zEUVW42GU7TZMK+
 edxTOsCy+BnDqtRojLc71zO03GVUEY7u+hCq/uF43X5zdYlykwKRCMPAoHWxd/S86QC3
 9Y189OglzbrTva/g7OiWx22evka7wZGGnnepVygiw6xQ4gvpCMPNNuSCMjJZ7OeVqF1m
 ajIz70rDc6XzuFyceENTQZjLiBpibNEedD8uiKiWnsZ0X2876Wgf3Ht31DE2x8oSny08
 +7yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Z6UgxE/8tlX9AdbKXPGLp6eGWQ6K18vN2+aOdIn9xwc=;
 b=2ChPehu//kJCXdDREUFCtrVVQrEGHCuaF8dNL2idIV1eUKsq6Za4eZCXx5L96chFZj
 95mGBR1NX0PQPbX5GRypa0HLdjfJ8CoU5GlmNL9/EVqU0BYa2CZAqcmQs4HJspRdAqvN
 nPPgB5GCmaA87f14z2gGNqDhMZn6Lhvcvh5xnTApCp4Yg40sYxWhRlw+1HH8Uflth7ki
 q8nno4JCaIYm8TO0ghzWy5L2eWk69Lber5w4VAmU+m6Vf9dxclBf6ZZyotUslScGxX5A
 f02y57MC1v2Jmwv76ez8CVEdsLXGvEhDUtcg4tf5F7H4sNe4SVGTF4SYFfH10c6CTJkI
 Qp3w==
X-Gm-Message-State: AOAM531lwNR4KJbP38KixWHzvVeZ4kb3iA+kw8n49jjysjjtrD2oXqZQ
 w4JGxvoy3YJzlBD2LRlccIC7GvMNnZI=
X-Google-Smtp-Source: ABdhPJyDi+xAUxFl2X2U3kX4Dqy+EnGYGdOlCIjap5c/hI9MGgcfJ8SWYm7BuXqQ114qCK1F+CuUnQ==
X-Received: by 2002:aa7:db85:: with SMTP id u5mr49615494edt.234.1634037200742; 
 Tue, 12 Oct 2021 04:13:20 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id m23sm4742802eja.6.2021.10.12.04.13.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 04:13:20 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 21/24] configure: remove deprecated --{enable,
 disable}-git-update
Date: Tue, 12 Oct 2021 13:12:59 +0200
Message-Id: <20211012111302.246627-22-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211012111302.246627-1-pbonzini@redhat.com>
References: <20211012111302.246627-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52f.google.com
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
Cc: marcandre.lureau@redhat.com, thuth@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The options were deprecated in 6.0.  That said, we do not really have a
formal deprecation cycle for build-time changes, since they do not affect
users.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20211007130829.632254-16-pbonzini@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/configure b/configure
index 33d330dcc9..d00ba0cbd2 100755
--- a/configure
+++ b/configure
@@ -1483,14 +1483,6 @@ for opt do
   ;;
   --with-git=*) git="$optarg"
   ;;
-  --enable-git-update)
-      git_submodules_action="update"
-      echo "--enable-git-update deprecated, use --with-git-submodules=update"
-  ;;
-  --disable-git-update)
-      git_submodules_action="validate"
-      echo "--disable-git-update deprecated, use --with-git-submodules=validate"
-  ;;
   --with-git-submodules=*)
       git_submodules_action="$optarg"
   ;;
-- 
2.31.1



