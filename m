Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C5939F534
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 13:38:03 +0200 (CEST)
Received: from localhost ([::1]:47232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqa3W-0002nq-Kr
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 07:38:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lqZpL-0006lx-8a
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 07:23:23 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:51955)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lqZpI-00083q-VX
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 07:23:22 -0400
Received: by mail-wm1-x335.google.com with SMTP id l9so1610124wms.1
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 04:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FO5Bdi+1PC20U6f9IU1bMuvi0kdwjXBOHixBHmCvksI=;
 b=uVVvaIx/RcOXQgwBu/KNxG7mSoHJKFV1F93Q7uSlpHSZo42Rd7CIP0z0LUc9kPbjyb
 wj/X1PwrNl4hWOzTUa5cN5MdhQihqXxe86szYvwZA8iY+IHuPebhzvniCzx8ivLKnCks
 KMq6hWnBoPMjBY7VaPAielNa5nmX7NqhZ8Jnymggg2mcJgMmpLEY+8zwNJUDeAFnw5DC
 j3qNwblS4US8Q/ARMzixjgHGDXwEEx8aaX/exbOgZjYvZDZm55yibO7DC8EGMxkrtB5Y
 TPXJfkaYeGPzPfQlYetfMkmJsEpCKhh+oN8uCtz2L+SpMOtk9Ehk3SiOW05moO/pGNya
 Hf9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=FO5Bdi+1PC20U6f9IU1bMuvi0kdwjXBOHixBHmCvksI=;
 b=kY05Bh6AvI8jVrj09q9YnypVTgwWaR/bE2DU7AB5wUNA6JbNYElNez9VvcU/XPvvX8
 yvr3OmSZnO1EIN4PKOlRvpc05hY/+29TK8G0tmCfmt+8gHchBPs1szqAADnbGwHoEQEJ
 CQTO6R4SL0Tg8sgT+dqpotzg9ewGFUrFz6Piv01aBFajhubIP6/NyPs7fbyicoJNXS43
 t11IkvYSCyPLE3WFb3CfZlivihs8oodOCcQxh1xQpsGRj1FVbCUU7B6YWaXUBTrf1TnK
 usVOdfXML554QUePqXcESioEzCQOhXWKaP1VDKc1Gz68heZSRHvVyOYoC6hwtiKpWy67
 seAw==
X-Gm-Message-State: AOAM5322OMMh6PePxvKK7T6hXgGktG4kTGUZmf8B4w4UVSk3Ui72ur0E
 mIeg6y/ZXqCc8F+VQZan+OsWEogt4OVc2A==
X-Google-Smtp-Source: ABdhPJwXQHEGMyQAYrOkhkNiAEbzch+33LGKv0PubVzMPhompSHZOkvjtH8iQe73jPIfaNYhdDbgiQ==
X-Received: by 2002:a05:600c:1c0b:: with SMTP id
 j11mr21772881wms.139.1623151397572; 
 Tue, 08 Jun 2021 04:23:17 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id i9sm15388621wrn.54.2021.06.08.04.23.16
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 04:23:17 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 16/26] meson: remove preadv from summary
Date: Tue,  8 Jun 2021 13:22:51 +0200
Message-Id: <20210608112301.402434-17-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210608112301.402434-1-pbonzini@redhat.com>
References: <20210608112301.402434-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x335.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Meson is more verbose than the configure script; the outcome of the preadv test
can be found in its output and it is not worth including it again in the summary.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meson.build b/meson.build
index 5fdb757751..38f6f193f5 100644
--- a/meson.build
+++ b/meson.build
@@ -2657,7 +2657,6 @@ summary_info += {'PIE':               get_option('b_pie')}
 summary_info += {'static build':      config_host.has_key('CONFIG_STATIC')}
 summary_info += {'malloc trim support': has_malloc_trim}
 summary_info += {'membarrier':        config_host.has_key('CONFIG_MEMBARRIER')}
-summary_info += {'preadv support':    config_host_data.get('CONFIG_PREADV')}
 summary_info += {'fdatasync':         config_host.has_key('CONFIG_FDATASYNC')}
 summary_info += {'madvise':           config_host.has_key('CONFIG_MADVISE')}
 summary_info += {'posix_madvise':     config_host.has_key('CONFIG_POSIX_MADVISE')}
-- 
2.31.1



