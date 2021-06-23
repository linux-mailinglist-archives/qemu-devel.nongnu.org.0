Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5085C3B19D7
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 14:24:04 +0200 (CEST)
Received: from localhost ([::1]:45086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lw1vF-0002PM-TE
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 08:24:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lw1m4-0003rS-0m
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 08:14:32 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:42507)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lw1m1-0001zb-IX
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 08:14:31 -0400
Received: by mail-ed1-x529.google.com with SMTP id m14so3135116edp.9
 for <qemu-devel@nongnu.org>; Wed, 23 Jun 2021 05:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=89nOTmh6DcrB7ef5TmzMI2kJ0TGNno4c7shX8+Dmj50=;
 b=lwA0Acxk7ggmkeLQmoQse+LYN9xsPIU99SPL1px7DJbpH+Me+ein9PHSrhUBZnEppr
 EsQpM8gzADa47DICVYXK+im16Hr5HlBiaUMTV2DrqHQ7JMxbXLPStp427Q9DxbfQVtay
 RIMnNQNh4H4qAnIoSnCvijnJnANtOGk3ixKmtRW38ucbfn+cVuaoKYy5nKj/t954h5iY
 RZnvtAx0lO0DLFLiBjHrrxB0eeA/XE2582eSMnfgIGvX9e6UWW7WBhKI4nDlwZPvqnSm
 pkboP4oPl1byZ3HOfmoI1o61g7eWX1qG9xfA1vKGEktQSunOmqVgKpmNgTaxRDLmxtWX
 S6cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=89nOTmh6DcrB7ef5TmzMI2kJ0TGNno4c7shX8+Dmj50=;
 b=X3IC5qsjHg9mNu/6gOp7nNMEnVWlEgXez6rCKwymVZpP2lHZHIBHt7DcIorkigOvq9
 KwbFM3Z6VkONMe2sWlIrFrxjduaGRyZwOd1LWjsWfuyrj8N04UQDM8EtLPbJYlbRp0AG
 OYskiDGLiXTEbyMxqlZ0SkmImnUUttA2bLRst12uLJ7fORtZmFz0Sh5GsZzZjvtrPeKW
 dMKGUud4boRaJrtZEbgnoSwsDEgtd5bBXmhsL9DooQBk5Gy+FLCLY9Cy8IzowcfmxuuL
 OWjc1wgWAdCQwUnMlObQR6oGiXDAuh2xRR04at8mFOZkBXGyTNQ0JbgtdWvnYKn/eGli
 AqGA==
X-Gm-Message-State: AOAM533EZFzOTrZ7IDj0Krxvue5NBVxXzSBpGlJyy7i5LAI/Xp3Bzozc
 sVZeEBkU0V3PJdsYu45A6LmDR3wX3Pw=
X-Google-Smtp-Source: ABdhPJy1O0pOXYALArKAKrAV8OCtHKwufuWVT9xoV1Z2Lg7hHZ7ZqfV8SS/TgxxBK7RKICEMHIGm3Q==
X-Received: by 2002:a05:6402:290b:: with SMTP id
 ee11mr11714444edb.325.1624450468331; 
 Wed, 23 Jun 2021 05:14:28 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id o5sm1680778edt.44.2021.06.23.05.14.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jun 2021 05:14:28 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 04/12] meson: remove preadv from summary
Date: Wed, 23 Jun 2021 14:14:16 +0200
Message-Id: <20210623121424.1259496-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210623121424.1259496-1-pbonzini@redhat.com>
References: <20210623121424.1259496-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x529.google.com
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



