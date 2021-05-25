Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C09A839032C
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 15:56:11 +0200 (CEST)
Received: from localhost ([::1]:51736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llXXW-0000fe-SV
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 09:56:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llXMs-0008Up-Tt
 for qemu-devel@nongnu.org; Tue, 25 May 2021 09:45:10 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:40656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llXMo-0005r2-Ts
 for qemu-devel@nongnu.org; Tue, 25 May 2021 09:45:10 -0400
Received: by mail-wr1-x42d.google.com with SMTP id z17so32310423wrq.7
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 06:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vGm5M8/051WSMHPDUP6YHZvPe3ukIqpIQI0jdiMr5yQ=;
 b=cdl7hZwPvjjiRSQeJ9ZnGVVj+HAjd31EpkvgvommR9EOj2R9LALSbavSpmZhC7NUZR
 WeM/MrWS7qpzph84FJc0qTzQSIlyGXNiL7g3N07u6BW+Jd2fm20UZYzm6RjjdO9CLiqe
 WnHGmfG+KBp0jBWVwiIZ58rEGy12Joz0uxR+y4ok+TMdm0edQfIvl1CcdmgVbl5ecCs7
 n0aB2kRVLvRp9aoH6E8iufNzndwXKMENBlLjqvrxSM4QJlR8onPlUKx/y0NxixFKJk7f
 ptpM3udpeFQM+DVhdMSA0eq2ZpXa0an57FF/uYBr2bivCyKow2UUOqA2prdZG78DHfh1
 op5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vGm5M8/051WSMHPDUP6YHZvPe3ukIqpIQI0jdiMr5yQ=;
 b=iJX711eRM1zKW/1mNGCKdP9NYRHLKZ0PLWxKLjymGIuGGHjBHEnHT+wqwCYyx+8oCZ
 fwKHx3wjVxIXhM91hLCvWGJItjYbKO0UAjRm2LnaJq+AluWIaHxHQoz8VuyF9iZW0BNS
 /2NbKwJWtU1hTVODLvjVI8kyZt3CDFCXnNQacLMmSKwXkasIuj5JWezXeMkOwbzgX+O/
 05d2bj9nffurvYoorQU0SjSnS8iNVq+WNOW0KfM0z6m8ZKi/it2O2r2ZYu0AcJHQUNV6
 5bP6xIu0Z/HAEnjsj7uIGxTuMZ6Ha5wWrAjKohTC3NzKq53PcnlqlChY7wETyvZ3t+Al
 KMMw==
X-Gm-Message-State: AOAM531lRYriPkGAL7L0J1KYrMJ4C/1DacsMMNVuTFQEM0JeaF0Aq2Ie
 P/tjYknRwQq81W/Z3WKojqmZFH8YZgEgju8l
X-Google-Smtp-Source: ABdhPJwjFQKOCmRWl+i5sKmmhVM+PLgQUUwqRc/bXnZHvIPAtZ2Psybner13CBuCtR6yuq7FThTrVg==
X-Received: by 2002:adf:e4c8:: with SMTP id v8mr27814421wrm.345.1621950305529; 
 Tue, 25 May 2021 06:45:05 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id t7sm15794460wrs.87.2021.05.25.06.45.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 06:45:05 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 6/6] tests/unit/test-vmstate: Assert that dup() and mkstemp()
 succeed
Date: Tue, 25 May 2021 14:44:58 +0100
Message-Id: <20210525134458.6675-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210525134458.6675-1-peter.maydell@linaro.org>
References: <20210525134458.6675-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Coverity complains that we don't check for failures from dup()
and mkstemp(); add asserts that these syscalls succeeded.

Fixes: Coverity CID 1432516, 1432574
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 tests/unit/test-vmstate.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/unit/test-vmstate.c b/tests/unit/test-vmstate.c
index a001879585e..8d46af61511 100644
--- a/tests/unit/test-vmstate.c
+++ b/tests/unit/test-vmstate.c
@@ -44,6 +44,7 @@ static QEMUFile *open_test_file(bool write)
     QIOChannel *ioc;
     QEMUFile *f;
 
+    g_assert(fd >= 0);
     lseek(fd, 0, SEEK_SET);
     if (write) {
         g_assert_cmpint(ftruncate(fd, 0), ==, 0);
@@ -1486,6 +1487,7 @@ int main(int argc, char **argv)
     g_autofree char *temp_file = g_strdup_printf("%s/vmst.test.XXXXXX",
                                                  g_get_tmp_dir());
     temp_fd = mkstemp(temp_file);
+    g_assert(temp_fd >= 0);
 
     module_call_init(MODULE_INIT_QOM);
 
-- 
2.20.1


