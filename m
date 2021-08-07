Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 105DD3E3757
	for <lists+qemu-devel@lfdr.de>; Sun,  8 Aug 2021 00:05:44 +0200 (CEST)
Received: from localhost ([::1]:43432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mCURq-0003SS-VS
	for lists+qemu-devel@lfdr.de; Sat, 07 Aug 2021 18:05:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mCU6M-0008EL-9K
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 17:43:30 -0400
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e]:39692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mCU6K-0005Hc-Ka
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 17:43:30 -0400
Received: by mail-io1-xd2e.google.com with SMTP id r72so5855988iod.6
 for <qemu-devel@nongnu.org>; Sat, 07 Aug 2021 14:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5A2mszKQ5aOSvpmfaS/1EtSnZ2WQixfIiVZgOA13t6U=;
 b=XoTqhoAPh76UHBMrvuHqJf+zxOnYQg+rr+AIe9jyFtnc2TnKyBjfwQgoVuuDKs0is3
 ZffyoZhGGKsQ1XtFMi15pG6Yu2Bt6PKwFHKQuGTre4zxapT6CmghREr8UtZxKq5kIYVg
 kW1bMUUu52WIjONiMGCOZma8j3Mb05i8rzZ8THQ9goQKmQYNNNe7Njw6/ugubXyNmhAi
 YlOlK3/GpY97OOLxtW7zb0YXW7YB/MXFH9X4RMSySAxxNBdoyre946BzLxyfRATYNv4c
 1aGKak4SVXRm1W1RRJxqfGeSd8bV9KPq2xBnJEeFoaJqN/lblRK3BtLXHQSUg8ARm02n
 K+/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5A2mszKQ5aOSvpmfaS/1EtSnZ2WQixfIiVZgOA13t6U=;
 b=hqURHhyhpq9sNBaPZTDbCZp1grOqRCDbznDhS3eKr7ROF4/U61/Lpi0kiyhshlgmvS
 iy0aeY0WkO7g9bRHi1HUEdLoyPwA9VYmVtIjARKQ2dwmaJdfFk2zNnVKh5ocEnmWw1dM
 dB7zwcouXtf8zGdx1xJflih9LMPjs35un51UskUxHMvk8qcQ9BCqOl+Cni7TKmPq6NqE
 mCkyWGhQKkFSIaww7cVvJdU2uqxvL+Dzx66N2UdCbAWwhsR7+OxsVkRmHdgunK8DRF0x
 cJRLcCXXhwQKHyZRf8vUyzJ+nadBmmObCMObczmOwjzQIk88HX2GQrKbNpi+PUciIc9/
 H11w==
X-Gm-Message-State: AOAM531vPdBgqe8s9FjN4eDbmtSiC49RP2RYConGZOCi3NY3/qzeYj88
 dY3DZMth75o0w0t03yiUwjaig0MX2wfisT92
X-Google-Smtp-Source: ABdhPJz0Jt0lVF7k6xKCGzCoIWhcWj4xCGPpbw5CK8N74IMdxsdRAU+wtZOueFt1u35X4MSqYgwVLg==
X-Received: by 2002:a05:6638:1356:: with SMTP id
 u22mr15955690jad.39.1628372607413; 
 Sat, 07 Aug 2021 14:43:27 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a17sm8062827ios.36.2021.08.07.14.43.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Aug 2021 14:43:27 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for 6.2 36/49] bsd-user: Make cpu_model and cpu_type visible
 to all of main.c
Date: Sat,  7 Aug 2021 15:42:29 -0600
Message-Id: <20210807214242.82385-37-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210807214242.82385-1-imp@bsdimp.com>
References: <20210807214242.82385-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2e;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: kevans@freebsd.org, Warner Losh <imp@FreeBSD.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <imp@FreeBSD.org>

cpu_model and cpu_type will be used future commits, so move them from
main() scoped to file scoped.

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/bsd-user/main.c b/bsd-user/main.c
index 7e20430fb7..93ef9298b8 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -51,6 +51,8 @@
 int singlestep;
 unsigned long mmap_min_addr;
 uintptr_t guest_base;
+static const char *cpu_model;
+static const char *cpu_type;
 bool have_guest_base;
 unsigned long reserved_va;
 
@@ -197,8 +199,6 @@ static void save_proc_pathname(char *argv0)
 int main(int argc, char **argv)
 {
     const char *filename;
-    const char *cpu_model;
-    const char *cpu_type;
     const char *log_file = NULL;
     const char *log_mask = NULL;
     struct target_pt_regs regs1, *regs = &regs1;
-- 
2.32.0


