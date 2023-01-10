Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2FDA6645A6
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 17:10:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFH6W-0003JM-70; Tue, 10 Jan 2023 11:04:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pFH5y-0003Ai-1N
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 11:03:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pFH5w-00053C-ME
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 11:03:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673366604;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tgs6K9/4SfQyc51ntmqCZsH1HyOpi0CzHAt9QG1by7Y=;
 b=gRZ458WtFu2AYjSZBi0Y8g5imhi9gCujte3s9VhixkAJupV74FnKcegeGkcSX96KGqakTu
 fGRfGzSr63uL4zANUpdn6Pc1flEvLD44ZbA3DpAj7xsNZDZ6dXqWDwQsIfLV2KbJW+vPgl
 a061qkpkUB+c09geRgxmw+FeY9/VCks=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-474-Ztnay-jUPeScs4EJDHQzsA-1; Tue, 10 Jan 2023 11:03:17 -0500
X-MC-Unique: Ztnay-jUPeScs4EJDHQzsA-1
Received: by mail-wr1-f72.google.com with SMTP id
 s3-20020adf9783000000b002ab389f64c1so2151756wrb.22
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 08:03:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tgs6K9/4SfQyc51ntmqCZsH1HyOpi0CzHAt9QG1by7Y=;
 b=gogzbmNKfFYddRyPJQUR/2lEgckjlP3fSx2k68hGiwHBQrkW5yjuW+Nwqjp6t/9v80
 ektE42TQ/iqHoQZPAWDTBNpclntmtgXL+siAbUGxyd3gh74NFpsSm8Kfh85fpsMno+hR
 JmBTV/1Hym3w1A3S/3P+MQGKoeAY2/cAtI2rCr22u8qdWDaWhjybL9VTnA5wPZaoM6OR
 4cuAOHOFCwcjksRk8Z4S7i/8WWdLfHKn1HXYcEnX3AUeJu5vhcfernbXgvuO1doOGAzH
 6f3km/aRxQ36GQVSUZ0C7O1tS1M/5imUNhRQF4iEN8kCSd1fa2wBRCJf+NIJ9pNA61tJ
 3xpg==
X-Gm-Message-State: AFqh2kqS1W2uabKqxXWilR4uZdv9mWF0VxnogwFi2+tqjfujTgjirNgH
 XjBrUNSb6aHWZT5TWEr3rkvtHEqSB7rW2gdXPvaoUxwOb0CGpq8TMAbPHI3idZmdhWOKH1M1shi
 4b7q6RYMJLQgzg3IRuXm4lNo+WduGsestVEYdMs4LwDT3FSJIEn2vkfd3mbtTbxLKhnE=
X-Received: by 2002:a05:600c:54c2:b0:3d3:3c74:dbd0 with SMTP id
 iw2-20020a05600c54c200b003d33c74dbd0mr49296662wmb.13.1673366593263; 
 Tue, 10 Jan 2023 08:03:13 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtjZuVvQMDycC80SAy0kH5Ya4AfIxvDCmgcSA5IVGrZqGZjIvIPsNZ83wBtWrm0s9bONZwkkQ==
X-Received: by 2002:a05:600c:54c2:b0:3d3:3c74:dbd0 with SMTP id
 iw2-20020a05600c54c200b003d33c74dbd0mr49296628wmb.13.1673366592909; 
 Tue, 10 Jan 2023 08:03:12 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 g12-20020a05600c310c00b003c70191f267sm21621257wmo.39.2023.01.10.08.03.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jan 2023 08:03:12 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PULL 14/29] enforce use of G_GNUC_PRINTF attributes
Date: Tue, 10 Jan 2023 17:02:18 +0100
Message-Id: <20230110160233.339771-15-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230110160233.339771-1-pbonzini@redhat.com>
References: <20230110160233.339771-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PP_MIME_FAKE_ASCII_TEXT=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

From: Daniel P. Berrangé <berrange@redhat.com>

We've been very gradually adding G_GNUC_PRINTF annotations
to functions over years. This has been useful in detecting
certain malformed printf strings, or cases where we pass
user data as the printf format which is a potential security
flaw.

Given the inherant memory corruption danger in use of format
strings vs mis-matched variadic arguments, it is worth applying
G_GNUC_PRINTF to all functions using printf, even if we know
they are safe.

The compilers can reasonably reliably identify such places
with the -Wsuggest-attribute=format / -Wmissing-format-attribute
flags.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20221219130205.687815-7-berrange@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/configure b/configure
index 6f5e77a71361..203b957a045f 100755
--- a/configure
+++ b/configure
@@ -1183,6 +1183,8 @@ add_to warn_flags -Wnested-externs
 add_to warn_flags -Wendif-labels
 add_to warn_flags -Wexpansion-to-defined
 add_to warn_flags -Wimplicit-fallthrough=2
+add_to warn_flags -Wsuggest-attribute=format
+add_to warn_flags -Wmissing-format-attribute
 
 nowarn_flags=
 add_to nowarn_flags -Wno-initializer-overrides
-- 
2.38.1


