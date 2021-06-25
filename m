Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC7C43B4581
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 16:26:52 +0200 (CEST)
Received: from localhost ([::1]:46106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwmnD-0000Lk-SJ
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 10:26:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lwmf9-0002s2-PH
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 10:18:31 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:46733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lwmf6-00038c-ME
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 10:18:30 -0400
Received: by mail-ej1-x633.google.com with SMTP id he7so15317949ejc.13
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 07:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=89nOTmh6DcrB7ef5TmzMI2kJ0TGNno4c7shX8+Dmj50=;
 b=vYntWh1j93IORr3iaAp1bldEJ8F3jqVwzLF5kCdiqp800CPnBTZjeUGw8I/TRLmb/r
 gdkOLLsejp6L0M3aJY6UwjvtzkPbVx9QivgJcJiteznMA+SYshUlB5EpqVEVLHpLszAP
 +EnpUWEfc9wnvblm3SDwmt6BDKm8OyyEWY2nAhSeD77hTJ03YwznD5RzAhwSX938Nr0Y
 aDGv9TzzQb/fN1UM5FCP9seCUpoPBxeyIUEmqXPbUP7CTifPcDOvD4IrAXaJpSMzxkdD
 eQzXGbxI1Vulwks+sQwMIhUxPKfFMEukL/a3D+oIHhPtV3Z7Le4X2kik4DI2Y1vwByjA
 ZD3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=89nOTmh6DcrB7ef5TmzMI2kJ0TGNno4c7shX8+Dmj50=;
 b=IWK3t0YFinL3nZihRDbDpStdgtRJ+H6eCfFsLcUm9cAprQ+CW2zOAa7F5v6qdywlVs
 tCrDQLnvbM2mq4RDK5DF6taIK45tXU1z77aryfKoN5MziLHJt+inrc370o3eYKljcHMs
 AzNWUeQXBBiN6Nnnfimjgk5wmikYBTTcW3WgzfP0T4DmcI50sMGwhWfdYSAmYkiqHSN9
 YnaCSBqVyxPQlD0C9ATz92u7aWFceZAbDCyPmIGJcWpqh870s2nSTxFlhIRrnfGHGOdp
 VUSywI2FzNzMr/UlOO09C8SH42Lh7r6LHHe8NlF7dFEDYSQwpHG4i8YdVR76I4QBQ1/z
 4elQ==
X-Gm-Message-State: AOAM530D1M6+Rs55yoSKxe4gzoY9nj7jkJTPRHZFzQqANj0q90cmu19r
 4eGF+XnLwWv97LjstvOivENeXu3ytvI=
X-Google-Smtp-Source: ABdhPJwOxRL93nkkG0sk0CsQ6nAK36hMpOotwWjU0uBoyZiTUMEYw19u3ajDBm1hWsZPtAsxDoQ5Vg==
X-Received: by 2002:a17:906:31c6:: with SMTP id
 f6mr2306816ejf.386.1624630707350; 
 Fri, 25 Jun 2021 07:18:27 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id c28sm326579ejc.102.2021.06.25.07.18.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jun 2021 07:18:26 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 04/28] meson: remove preadv from summary
Date: Fri, 25 Jun 2021 16:17:58 +0200
Message-Id: <20210625141822.1368639-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210625141822.1368639-1-pbonzini@redhat.com>
References: <20210625141822.1368639-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x633.google.com
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
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Meson is more verbose than the configure script; the outcome of the preadv test
can be found in its output and it is not worth including it again in the summary.

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meson.build b/meson.build
index 87147a5f3f..3809f51f7f 100644
--- a/meson.build
+++ b/meson.build
@@ -2565,7 +2565,6 @@ summary_info += {'PIE':               get_option('b_pie')}
 summary_info += {'static build':      config_host.has_key('CONFIG_STATIC')}
 summary_info += {'malloc trim support': has_malloc_trim}
 summary_info += {'membarrier':        config_host.has_key('CONFIG_MEMBARRIER')}
-summary_info += {'preadv support':    config_host_data.get('CONFIG_PREADV')}
 summary_info += {'fdatasync':         config_host.has_key('CONFIG_FDATASYNC')}
 summary_info += {'madvise':           config_host.has_key('CONFIG_MADVISE')}
 summary_info += {'posix_madvise':     config_host.has_key('CONFIG_POSIX_MADVISE')}
-- 
2.31.1



