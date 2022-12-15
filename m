Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91B9264DFED
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Dec 2022 18:45:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5sHM-0002Rq-9I; Thu, 15 Dec 2022 12:44:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p5sHK-0002RC-3Q
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 12:44:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p5sHF-0001DY-7s
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 12:44:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671126252;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=rbXS3iuMq0J66YHtFjT2PESAlKh2d4uQ3IsMqRls/6Q=;
 b=VMI/bwnLO5F93hDcZ8QWFbn624wfN8UBFBtP32vj2Q07Gt+f5719R7clo9P3TN7WBeJmNG
 zTSpPuHFIlJfr5vXaIl4gbcO1YFDhna45ZiNzUoGW8Jl48RAs5wkAhRAa5+l3Gj7SS4GjI
 wgb9l4nMOcvO264Wr0gT5RhopmWP0II=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-76-alG5XEvUPLC7UHJ68grZSw-1; Thu, 15 Dec 2022 12:44:11 -0500
X-MC-Unique: alG5XEvUPLC7UHJ68grZSw-1
Received: by mail-wr1-f69.google.com with SMTP id
 o8-20020adfba08000000b00241e80f08e0so874294wrg.12
 for <qemu-devel@nongnu.org>; Thu, 15 Dec 2022 09:44:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rbXS3iuMq0J66YHtFjT2PESAlKh2d4uQ3IsMqRls/6Q=;
 b=TrBsB1DprEqwtYmvPGlskgAIT9q5zz4GLn03sO3rZfIksCcqalAQOVyA3YRjScLG12
 vcns7pC276lWHHgLyEL7VaPDNphR3uhXshfG44av0WTZNyOGv12uZ9KtIji3/Aha1OMG
 IKNoy0X+KhLT8+zz8AazEpMWEDfoZtLPsYU+bHQQQ/b/ka6wIcKUzWFs/g4HEFhVNv6R
 mWd82tpYNCXnQ8aux0olXlqoYWE8YMkoLP+GwAewnUhEPu6RA38f9R/CAS16IH3R7V2r
 qCWtxH7X9OoOynNIfm8JKc8xWii0rD1asxUwjzr3oPTs7Lbban6coxJYYmCRjVeUYjF+
 +lNA==
X-Gm-Message-State: ANoB5pl5AECpF9VNpYV9uq28jSAo+ceRsrNEvyhdXpmxPYIaidD54J0c
 gB88T2aBEQEfkxCHTQ2QA7mE/rO9FKEi22EqrI1VdEzLT2Dfr6mKOct7SOJxoB39Ben2ya+aYNB
 /aNZp8Q4E5PH7tnLuodXqVGI9TGwd+njAH3Uf1aReWANyHKSfSGt/7+0mHnJDXGLF4Yw=
X-Received: by 2002:adf:fcc6:0:b0:242:39bc:4ac with SMTP id
 f6-20020adffcc6000000b0024239bc04acmr15404659wrs.51.1671126250016; 
 Thu, 15 Dec 2022 09:44:10 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6+93SKXk0unt+eH4VmAQh8DqaxRmABW7WZMDm7WUicXZGGcKeBWhi3uPTBgvrtsi+rNOFTLQ==
X-Received: by 2002:adf:fcc6:0:b0:242:39bc:4ac with SMTP id
 f6-20020adffcc6000000b0024239bc04acmr15404642wrs.51.1671126249690; 
 Thu, 15 Dec 2022 09:44:09 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:e3ec:5559:7c5c:1928])
 by smtp.gmail.com with ESMTPSA id
 w2-20020a5d4042000000b002421db5f279sm6793661wrp.78.2022.12.15.09.44.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Dec 2022 09:44:09 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: afaria@redhat.com,
	qemu-block@nongnu.org,
	kwolf@redhat.com
Subject: [PATCH 0/2] Make coroutine annotations ready for static analysis
Date: Thu, 15 Dec 2022 18:44:05 +0100
Message-Id: <20221215174407.500414-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
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

Clang has a generic __annotate__ attribute that can be used by
static analyzers to understand properties of functions and
analyze the control flow.

Unlike TSA annotations, the __annotate__ attribute applies to function
pointers as well, which is very fortunate because many BlockDriver
function driver run in coroutines.

Paolo

Alberto Faria (2):
  coroutine: annotate coroutine_fn for libclang
  block: Add no_coroutine_fn and coroutine_mixed_fn marker

 include/block/block-common.h | 11 +++++++----
 include/qemu/coroutine.h     | 37 ++++++++++++++++++++++++++++++++++++
 2 files changed, 44 insertions(+), 4 deletions(-)

-- 
2.38.1


