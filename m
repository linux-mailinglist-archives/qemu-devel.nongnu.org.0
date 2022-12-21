Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3794B6535F0
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 19:12:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p83Q3-0000dX-Kx; Wed, 21 Dec 2022 13:02:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p83Pw-0000TM-TJ
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 13:02:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p83Pu-0004Hg-KK
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 13:02:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671645729;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1DU2lyk4LUD+vcQqslLA9QT+Gbzjf3xmugA48H80Os8=;
 b=MLEpvNPpQnfbe5JNT9CCDJqP/SXA7ihdJkoSbugckrpatYOfGgOO0fhCsh/MwWsRJo+6gF
 PMhCHYs8vI90/ginHSjZCVeyTBHwLac9bPp2BqxiO6kbsHW7KwGSht2Oz86+Bz8v2bhFjR
 /vGO/ULGKxvSRXcMApjdcc0eLcRcFAU=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-674-NZO9H4ReOuq5iLgPIv3Ykg-1; Wed, 21 Dec 2022 13:02:08 -0500
X-MC-Unique: NZO9H4ReOuq5iLgPIv3Ykg-1
Received: by mail-ed1-f71.google.com with SMTP id
 r14-20020a05640251ce00b0047d67ab2019so2805713edd.12
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 10:02:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1DU2lyk4LUD+vcQqslLA9QT+Gbzjf3xmugA48H80Os8=;
 b=5r+j//UDalorGWbabZgSAE6P+vtPTQ8W7G+Y3F4opKUXZSpryj1m17xHtHY4Zvt0Zx
 l/fSaTtis6XqWKJzarP7FuEi5ALux5durB8LYPZywHdsDiu8d44kBrmOFS0LAl1isIQP
 8RGhr4E492LLUwSBAt9Ojvdz1xGIiw7J9aVFYePj30BGXZVP9Kx3jTHtiRIUq7/f+N1J
 yK5KIMppqcKoSn8bh6wZUYAibvuUn5Ep4xpKcyTe0wAckSQxAJqrVfwSam5lmFBTz0Hq
 GR52/JBe1hNf0ZNQLwu+aiYOSzUCqK/BUA2NmnqXJO+hYP0Cl7IkV8vLKT7yz9jmwCZt
 oV6w==
X-Gm-Message-State: AFqh2kqO3o2JCIGM4XI7OQEAWWbk2L5yE1EqQBYyDp6Bn6rK8/kmQwcy
 +B5U8By2gxjfAG8KsHfa9fl/RWQgzOvjohFbFv08KLZnbiOAxg50o9pWfe2elDgeadlnrjft5lA
 s+7T+gBFp2A16B5tTEiP3FlgZzCGCx5FtmSPH2eP45C0FQW/aASUO4ht00xwOPCVCXNo=
X-Received: by 2002:a17:906:6d97:b0:78d:f455:c386 with SMTP id
 h23-20020a1709066d9700b0078df455c386mr2299473ejt.44.1671645726631; 
 Wed, 21 Dec 2022 10:02:06 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvWLMTMBRRX8rBJcPFXvDBFxUeLZodhuFAq7+L7l4HGHdxPuLaR5e1itWcWQxl0mKkJbSI8zQ==
X-Received: by 2002:a17:906:6d97:b0:78d:f455:c386 with SMTP id
 h23-20020a1709066d9700b0078df455c386mr2299453ejt.44.1671645726462; 
 Wed, 21 Dec 2022 10:02:06 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 a22-20020a170906671600b007806c1474e1sm7279427ejp.127.2022.12.21.10.02.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 10:02:06 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 08/24] configure: remove dead function
Date: Wed, 21 Dec 2022 19:01:25 +0100
Message-Id: <20221221180141.839616-9-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221221180141.839616-1-pbonzini@redhat.com>
References: <20221221180141.839616-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/configure b/configure
index e31d4522ea63..543fd5a48bf0 100755
--- a/configure
+++ b/configure
@@ -210,10 +210,6 @@ version_ge () {
     done
 }
 
-glob() {
-    eval test -z '"${1#'"$2"'}"'
-}
-
 if printf %s\\n "$source_path" "$PWD" | grep -q "[[:space:]:]";
 then
   error_exit "main directory cannot contain spaces nor colons"
-- 
2.38.1


