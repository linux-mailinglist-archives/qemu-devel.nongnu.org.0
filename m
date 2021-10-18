Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F02B3431372
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 11:26:26 +0200 (CEST)
Received: from localhost ([::1]:51964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcOuW-0001nV-EX
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 05:26:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mcOsG-0000MX-Kr
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 05:24:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42545)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mcOsF-00026L-8y
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 05:24:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634549042;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rAmhMZZnEkb9CvDZ6qBB6my6BWS50uf0OXuFQh5HKPA=;
 b=SmWlq3/KQQLlOsyn05Nwyo7hcG6eBg3R8cZUkriWPijRckq7tywm4SbZOrk1arzZV9y2T0
 J6gt/5Fad2QCSBHGExFi7Idj2eH3v41+nY3AMhavtSJdWvRWfGj8l+ZAI4Su34DOyJlFRl
 IXYWZaB1IZKNVF1wDsDQXJ5tpRUCqko=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-449-j_OcmRK0MwqxeCLlVPmGHA-1; Mon, 18 Oct 2021 05:24:01 -0400
X-MC-Unique: j_OcmRK0MwqxeCLlVPmGHA-1
Received: by mail-wm1-f71.google.com with SMTP id
 c69-20020a1c9a48000000b0030d95485d90so2964707wme.2
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 02:24:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rAmhMZZnEkb9CvDZ6qBB6my6BWS50uf0OXuFQh5HKPA=;
 b=iYu0fR6mh3oreYuDQnpFHuRJpDFbt13cwNB/6747TregbzE5GWl0Hu3AzCmhqfvmmX
 +HViCEdv1aaTwFpkm8HgzGF7bbG3qvGQ8bnJJbfIF3SbID2iob9MmxfMnre0XFEkX8VJ
 fDpH9yAnpgtW+F7YsYSOvTisSWm4TEKit0WqHvKwpg6YTMR0m3DiwXnYeTuuEho5p2JQ
 EnK+yK9zhmPEc/5E3DWjO+VZe2uPA0w65nYPPFgcCzo1smSCHOIs4wjuKUpa0OFfdExh
 9juYOpOo/XCA/6Ip7rGluQpsbG83Op7/6cIeLV8IIa0WPnP5Cb1iqwF7TkWVbkLgV9e8
 Bqhw==
X-Gm-Message-State: AOAM533Imive005F0cJkSw+gWKMOINmGy15iGcGwTWkmWJw1btf9gkrw
 ZMMuLVTLMDHP71tQ8PWYsvOGw317/nzzOzBRu+7DH6EkwxVBvU2z6sPlTmBLPCssT9FNO5hnOwc
 0pwzl1KYDbYt4YPCWMGAT3DA5TPradoVB7B7vpgUUJLfBWU9loRPPHtL+QfDKjX8H
X-Received: by 2002:a05:600c:4fd3:: with SMTP id
 o19mr28745729wmq.147.1634549040340; 
 Mon, 18 Oct 2021 02:24:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwp+1mNA+YV0HImBYZPVH2Lz/78uatNE812w0w3DMWrtQs4jrN/v8pu3eZx5zUbpzU0lWKSvw==
X-Received: by 2002:a05:600c:4fd3:: with SMTP id
 o19mr28745703wmq.147.1634549040063; 
 Mon, 18 Oct 2021 02:24:00 -0700 (PDT)
Received: from x1w.. (213.red-81-36-146.dynamicip.rima-tde.net.
 [81.36.146.213])
 by smtp.gmail.com with ESMTPSA id s3sm11938884wrm.40.2021.10.18.02.23.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 02:23:59 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] roms/edk2: Only init brotli submodule to build BaseTools
Date: Mon, 18 Oct 2021 11:23:53 +0200
Message-Id: <20211018092354.2637731-2-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211018092354.2637731-1-philmd@redhat.com>
References: <20211018092354.2637731-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since EDK2 BaseTools only require the brotli submodule,
we don't need to initialize other submodules at to build it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 roms/Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/roms/Makefile b/roms/Makefile
index eeb5970348c..b967b53bb76 100644
--- a/roms/Makefile
+++ b/roms/Makefile
@@ -143,7 +143,8 @@ build-efi-roms: build-pxe-roms
 #    efirom
 #
 edk2-basetools:
-	cd edk2/BaseTools && git submodule update --init --force
+	cd edk2/BaseTools && git submodule update --init --force \
+		Source/C/BrotliCompress/brotli
 	$(MAKE) -C edk2/BaseTools \
 		PYTHON_COMMAND=$${EDK2_PYTHON_COMMAND:-python3} \
 		EXTRA_OPTFLAGS='$(EDK2_BASETOOLS_OPTFLAGS)' \
-- 
2.31.1


