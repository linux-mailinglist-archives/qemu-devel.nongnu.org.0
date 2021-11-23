Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE5D45AE6C
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 22:23:21 +0100 (CET)
Received: from localhost ([::1]:57522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpdG4-0003Dr-S8
	for lists+qemu-devel@lfdr.de; Tue, 23 Nov 2021 16:23:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mpdCm-0007bI-3j; Tue, 23 Nov 2021 16:19:56 -0500
Received: from [2607:f8b0:4864:20::936] (port=34717
 helo=mail-ua1-x936.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mpdCk-0000sV-L0; Tue, 23 Nov 2021 16:19:55 -0500
Received: by mail-ua1-x936.google.com with SMTP id n6so718662uak.1;
 Tue, 23 Nov 2021 13:19:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=budw8rwTucK71mveKmK+tJzUcdX2R7X6bC6D+k0TqKo=;
 b=S75xhv3E8EVr7qTkdhLPwMNrqKlAX81iVE7gGOAryBZSkVZ9MK19LU+HHdNnLwAr/D
 KkI6ZTK8GftJ+ydr0Bl5Y8Mln/S1imrLiq4a6Dy6ivrU0n/4YevVOL2WFfkHI9FyVLnC
 jAjhm/IPotBVtuSFOo76Cez1T7TBKM4tXo4+o2B1c3J4urpQ68E4zdvqyxlIwkdGKWeB
 PDQuio6SFwZUlqCSuMJzA37P6XqCnzYvyX/P8Ne2xcbi0ZAIB6SnfT4hSpEwQt0lEnQw
 Ro3hVg3cw4KJrBeSTp2pf9xildswW/fvYGT7snOtM/59BztJzxo8u0QmVOC1JOvdmGXg
 8Sug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=budw8rwTucK71mveKmK+tJzUcdX2R7X6bC6D+k0TqKo=;
 b=2ZKyoAS1mv+eMGew4NiWr2OejdwpQUCnJTZv4CFsHANbjZY/3z3Z8fkBlbMOticxYB
 iEt5iBa4Fau6y1ilKckFBPfgliUZ4lcKErT7Ky/VAWcAFq/l8S8DrQ32KqzfYa62w8eX
 //qa/WPfCwd8gcd1+pedVPjJc9NJaEKQ4zRDbk1DkpTTdB9owPMeauWrg4NOs1SII3pI
 Tw2GReIWXJO7HLRkDqEWyfwHk+R85HA8geRfoXq4r+Nq21IL3ww9v+HYb76zovDbC/ag
 939PPubDrukIHLsz0drCSGuzELofXZEIW1xiJmjmrqpp4/ufyHSxB+rIs08WePxB5T8v
 FgBQ==
X-Gm-Message-State: AOAM532f39sXuVlMtqRyTQIjfjO7DhnByROXhOPi99fJKjSwWguzR+l7
 bWVAePSMoCzisOBZ0nboqhIt6OdW8bY=
X-Google-Smtp-Source: ABdhPJxbgAt4pwCcfxVwBEuPu9N8YGK0uDiPxKALDA7ORqZac/LVywfdSrET/FripGSfQXdM5/j4AQ==
X-Received: by 2002:a05:6102:5109:: with SMTP id
 bm9mr13640422vsb.10.1637702393398; 
 Tue, 23 Nov 2021 13:19:53 -0800 (PST)
Received: from rekt.ibmuc.com ([191.19.215.188])
 by smtp.gmail.com with ESMTPSA id h7sm6807958vkk.2.2021.11.23.13.19.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 13:19:53 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] ivshmem-test.c: enable test_ivshmem_server for ppc64 arch
Date: Tue, 23 Nov 2021 18:19:32 -0300
Message-Id: <20211123211932.284043-3-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211123211932.284043-1-danielhb413@gmail.com>
References: <20211123211932.284043-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::936
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::936;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x936.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This test, if enabled by hand, was failing when the ivhsmem device was
being declared as DEVICE_NATIVE_ENDIAN with the following error:

/ppc64/ivshmem/pair: OK
/ppc64/ivshmem/server:
**
ERROR:/home/danielhb/qemu/tests/qtest/ivshmem-test.c:367:test_ivshmem_server:
assertion failed (ret != 0): (0 != 0)
Aborted

After the endianess change done in the previous patch, we can verify in
both a a Power 9 little-endian host and in a Power 8 big-endian host
that this test is now passing:

$ QTEST_QEMU_BINARY=./ppc64-softmmu/qemu-system-ppc64 ./tests/qtest/ivshmem-test -m slow
/ppc64/ivshmem/single: OK
/ppc64/ivshmem/hotplug: OK
/ppc64/ivshmem/memdev: OK
/ppc64/ivshmem/pair: OK
/ppc64/ivshmem/server: OK

Let's keep it that way by officialy enabling it for ppc64.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 tests/qtest/ivshmem-test.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/tests/qtest/ivshmem-test.c b/tests/qtest/ivshmem-test.c
index dfa69424ed..fe94dd3b96 100644
--- a/tests/qtest/ivshmem-test.c
+++ b/tests/qtest/ivshmem-test.c
@@ -463,7 +463,6 @@ static gchar *mktempshm(int size, int *fd)
 int main(int argc, char **argv)
 {
     int ret, fd;
-    const char *arch = qtest_get_arch();
     gchar dir[] = "/tmp/ivshmem-test.XXXXXX";
 
     g_test_init(&argc, &argv, NULL);
@@ -488,9 +487,7 @@ int main(int argc, char **argv)
     qtest_add_func("/ivshmem/memdev", test_ivshmem_memdev);
     if (g_test_slow()) {
         qtest_add_func("/ivshmem/pair", test_ivshmem_pair);
-        if (strcmp(arch, "ppc64") != 0) {
-            qtest_add_func("/ivshmem/server", test_ivshmem_server);
-        }
+        qtest_add_func("/ivshmem/server", test_ivshmem_server);
     }
 
 out:
-- 
2.31.1


