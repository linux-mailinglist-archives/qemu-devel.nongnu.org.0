Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E74A139A5B0
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 18:26:02 +0200 (CEST)
Received: from localhost ([::1]:48502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loqAT-0001J9-MT
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 12:26:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1loplC-0002Eo-1C
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 11:59:54 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:36691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lopl8-0007M2-QE
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 11:59:53 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 n17-20020a7bc5d10000b0290169edfadac9so6224863wmk.1
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 08:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=m1JvP1lXOK3zZvLip3asXuEZCo/dk9yce1L53z04jlM=;
 b=go2SwTodvQ5Oo6JbHtc0qYeIhtGrgVPDwsJlQyQew/mOFwzt3tm2DeRNpY20V7CTXC
 +5aul4Xq+x2Z9N/2mVralhIJCJC3w6SnBHl7aNSPN/rOsYwzp6qwdll4wJkMccnav9Hx
 M+6kL4BCsH6CkLfuyu8aAfa8Sg3/4KPciSosP0pOU7JZ/bNXVt8BL4/JEeKKIeRrqDZ2
 Yv2+n0AbCo1Xmcl5HlvXSuHeS/s54F4SWz7EQVQ6kZmWj0e+6T6c5t66EisuqEKJOY5e
 R0qrDMIw3qb1bXFoFYlxbc6haQmmt6bkgVZRmbftPqAuz2G9gA028edBuS4fup60+BtM
 8KvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m1JvP1lXOK3zZvLip3asXuEZCo/dk9yce1L53z04jlM=;
 b=n/NJxZr2uFEurMRu1Ll7VnAX+iISPmsID53APPcADV4hIo2d7V73W1/GHBGZM7VMXQ
 LdqnJ4v0Z594QlDUI/BnEhYYmmHjCGig+qxgeFz7HlD0eesn1zj442AV3CjLhT0La19a
 I0dP+GB4Y4tgqlQKvqCZtzZA9VGB/ojorvmmSp795axsDJSKxs0/5qJHQFk64lZB1LpM
 ZcIJwZDolL6RRtBU6tpMmWjjMvr0bYhZf6AbuMjdWUHcMXYBte/ncpP2m2pMLm3NjJY8
 5J6gH08UI9oFnA/7BV2Th64RpBJCuNxODd1ZiBnBvxJny+jjw/0QsMON9WexVC1TVefk
 qOjQ==
X-Gm-Message-State: AOAM531jd8W3M1EB9kwQrR3wC7+89uuSAgjpAMMh20eUo9odsItiJYTl
 Q7eCPxhYftLIePP21OhYsHOcwT09GWV1IbB9
X-Google-Smtp-Source: ABdhPJw5f0UxO8qJGSoq5UlzIGnQT7KBZ3QvIuNl7Dz6Sc1RHQKIDEXKpSTsuopul+O3b1IEsZHWiA==
X-Received: by 2002:a7b:c095:: with SMTP id r21mr10546895wmh.86.1622735989550; 
 Thu, 03 Jun 2021 08:59:49 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m7sm3856470wrv.35.2021.06.03.08.59.49
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 08:59:49 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 45/45] tests/unit/test-vmstate: Assert that dup() and mkstemp()
 succeed
Date: Thu,  3 Jun 2021 16:59:04 +0100
Message-Id: <20210603155904.26021-46-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210603155904.26021-1-peter.maydell@linaro.org>
References: <20210603155904.26021-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Coverity complains that we don't check for failures from dup()
and mkstemp(); add asserts that these syscalls succeeded.

Fixes: Coverity CID 1432516, 1432574
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-id: 20210525134458.6675-7-peter.maydell@linaro.org
---
 tests/unit/test-vmstate.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tests/unit/test-vmstate.c b/tests/unit/test-vmstate.c
index a001879585e..4688c03ea72 100644
--- a/tests/unit/test-vmstate.c
+++ b/tests/unit/test-vmstate.c
@@ -40,10 +40,12 @@ static int temp_fd;
 /* Duplicate temp_fd and seek to the beginning of the file */
 static QEMUFile *open_test_file(bool write)
 {
-    int fd = dup(temp_fd);
+    int fd;
     QIOChannel *ioc;
     QEMUFile *f;
 
+    fd = dup(temp_fd);
+    g_assert(fd >= 0);
     lseek(fd, 0, SEEK_SET);
     if (write) {
         g_assert_cmpint(ftruncate(fd, 0), ==, 0);
@@ -1486,6 +1488,7 @@ int main(int argc, char **argv)
     g_autofree char *temp_file = g_strdup_printf("%s/vmst.test.XXXXXX",
                                                  g_get_tmp_dir());
     temp_fd = mkstemp(temp_file);
+    g_assert(temp_fd >= 0);
 
     module_call_init(MODULE_INIT_QOM);
 
-- 
2.20.1


