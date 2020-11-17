Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 755352B6AFE
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 18:03:59 +0100 (CET)
Received: from localhost ([::1]:52230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf4Oc-0000go-IH
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 12:03:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kf4EW-0002IH-9T
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 11:53:32 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:46800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kf4ET-00076P-11
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 11:53:31 -0500
Received: by mail-ej1-x632.google.com with SMTP id w13so30379041eju.13
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 08:53:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ztc3Pu+lAjCUdGZER5PIFUAkxhZApbW0E7GC3IpMpXw=;
 b=cYe8BIGOv7uElwe4SETkIfo+UEgDbbBpES1f/0gT+rg6FHzQhUf4b1BxkQvZTit7CV
 tO2kdM+UbWe9eaW5BEuJ9lH+xozi95lmTe+txglw5fmYVvtgwgsJ7H/sPsGuKYrDd8N1
 17Q3rrUWKD2EyBLs9cQXaZrce3PF6wdh+EJR3SacVzUgNA/p/exbSl3UPBMgHap1R6rq
 FD56melD5dgw/AvdNYk5xSgZTaspcgqVSatVSnuQprhqhjBteopDA7KGqwZiWXiFwsg6
 LmaDfIWnmO4Q89xc+fBWJApB3Q6TcpmppRD4wilJdQ7QDXpFgFaZfluVuOcCgTpv1MA7
 dRhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ztc3Pu+lAjCUdGZER5PIFUAkxhZApbW0E7GC3IpMpXw=;
 b=r/bfWnSh+y1mRsXLp6aeBVK8SBhWkyqKS9prDvGFliXiC6KgZ2daYDvwzV+Rs/wAqk
 fojDcsS5NmkTbbCDoOqJ00oOJIi3YA8v39YbabVLXvnPtcyXkROKnPGT4/L05Wc79Wwm
 jCSrYai4cMh27xTHDXhT6zQlsYdhblnxQ5ZdBh5ONiBGM+21gt9zAV/3bHrKJTiuYYpg
 9ZWwE3/AxnbFUh56POw7SRaKfOgOfm4t/wWGfJmKKEuAy+44OspNzgB352DYBoX6PQKu
 hLEiLUkHCLNpB1aArSKdJqcjjQPa43s7B9UM9/7iAs+/Wd+hL6HZNlLVeZ3pNjTjQpBe
 HNkg==
X-Gm-Message-State: AOAM532Cgu2LxiraCkIs7iO6CkxEFH3zDttfSRcpoNZraFh1vYalaqsi
 rvng6/SWl//Au/Xn6stDZeUIwA4PnEs=
X-Google-Smtp-Source: ABdhPJyyFvDIRmJyL2P+TXgB9AOTnj6o0JtyR9BPJr5USDrnXSg/fJnrkkRiMz7bdbKjcmOnd+WYWg==
X-Received: by 2002:a17:906:adcd:: with SMTP id
 lb13mr19233612ejb.362.1605632007287; 
 Tue, 17 Nov 2020 08:53:27 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id u7sm639067ejf.83.2020.11.17.08.53.26
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 08:53:26 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 11/29] kernel-doc: include line numbers for function prototypes
Date: Tue, 17 Nov 2020 17:52:54 +0100
Message-Id: <20201117165312.118257-12-pbonzini@redhat.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201117165312.118257-1-pbonzini@redhat.com>
References: <20201117165312.118257-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x632.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

This should solve bad error reports like this one:

	./include/linux/iio/iio.h:0: WARNING: Unknown target name: "devm".

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Link: https://lore.kernel.org/r/56eed0ba50cd726236acd12b11b55ce54854c5ea.1599660067.git.mchehab+huawei@kernel.org
Signed-off-by: Jonathan Corbet <corbet@lwn.net>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/kernel-doc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/kernel-doc b/scripts/kernel-doc
index eb635eb94c..3fd6f3925e 100755
--- a/scripts/kernel-doc
+++ b/scripts/kernel-doc
@@ -1624,6 +1624,8 @@ sub dump_function($$) {
     my $file = shift;
     my $noret = 0;
 
+    print_lineno($.);
+
     $prototype =~ s/^static +//;
     $prototype =~ s/^extern +//;
     $prototype =~ s/^asmlinkage +//;
-- 
2.28.0



