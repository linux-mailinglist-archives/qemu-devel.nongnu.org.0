Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 199413E3749
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Aug 2021 23:58:49 +0200 (CEST)
Received: from localhost ([::1]:48642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mCULA-0004rZ-26
	for lists+qemu-devel@lfdr.de; Sat, 07 Aug 2021 17:58:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mCU6N-0008Id-Ah
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 17:43:31 -0400
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29]:34505)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mCU6K-0005GR-3J
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 17:43:31 -0400
Received: by mail-io1-xd29.google.com with SMTP id i7so13719978iow.1
 for <qemu-devel@nongnu.org>; Sat, 07 Aug 2021 14:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CXac4zaSVrqLe0EtJN2ruvSY7l2U8k34jVxG92h1/AU=;
 b=wANSdzZckf7Db+tFxKscYWjd6nVcXilsg6USU4eZCX2ihYscCxci8jgjPutGaetMUJ
 H+CIjyAr7lu07nNA9tT6FqbKqoFV8fWxos/q9R7uwzFO9nnSIWmHLrDEA0lNd5CKQzti
 Wch9yATDgjuKkoLmifPLV4duTOtKljs3XN39//WB3FSduBYTVHNaQslbs9GcEJJGnXco
 Sru9ZaIZAry7d5a2YhUoF54tvehoafirTzvzl16QMYCYFk9wZ6bgroI5QuBwL0FuY9DW
 5XTY/u8RqF9ex7TS3NBXF+o4fyI3lr854npkK+b+IGlSAqv3xlUyRiKHDUVX8Y9VeDSn
 zrKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CXac4zaSVrqLe0EtJN2ruvSY7l2U8k34jVxG92h1/AU=;
 b=X5qmTl2/qm9cviZHZKOo3uvdyK/187evi4AEeEoYX84+NOOtLmhR/XYfqiD4jrfXPD
 fV/7KjrK9Tp3eQuy+aemMMP5hMvP8XM2Hh9B9s+Je8hm7WTv4mrSJwSdiVerH+IQiM60
 7IkUuetHGXyJY/99F0ccIOvrelqszBinE5VIsVK9CXJ6SZd89ELZmm3cWkKMay2u4DVG
 Qx4surudjLBmYh5YaudbMcPDCMS9Qx8/R5xzUXJegaDj2GWxDuiZoRAdqxBnauOX1Cxs
 ms8YMVKjV3tsMzp5XJIbFW12xulZwBWw5IXcXX6bHQHMkXeswM66f707ezax4cXDkctU
 Uwrw==
X-Gm-Message-State: AOAM5336HXf6SWsPYDDlOTP3QXzY0VoIB6xqJhaYjtGgSOO9sk0SUzW0
 RDpIqU85MNuLfiBehoynx/rVbp15qlIXdkbK
X-Google-Smtp-Source: ABdhPJxUsOtbcYJaCok3bPuy1sjTBAmLRS0NeISbs3URvdMHKas76GL25/rHSHJddcuLVwVe7tgEgg==
X-Received: by 2002:a6b:b306:: with SMTP id c6mr190342iof.24.1628372606606;
 Sat, 07 Aug 2021 14:43:26 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a17sm8062827ios.36.2021.08.07.14.43.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Aug 2021 14:43:26 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for 6.2 35/49] bsd-user: remove error_init
Date: Sat,  7 Aug 2021 15:42:28 -0600
Message-Id: <20210807214242.82385-36-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210807214242.82385-1-imp@bsdimp.com>
References: <20210807214242.82385-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d29;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd29.google.com
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Error reporting isn't used, so gc it until it's used.

Signed-off-by: Warner Losh  <imp@bsdimp.com>
---
 bsd-user/main.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/bsd-user/main.c b/bsd-user/main.c
index b5527537b4..7e20430fb7 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -34,7 +34,6 @@
 #include "qapi/error.h"
 #include "qemu.h"
 #include "qemu/config-file.h"
-#include "qemu/error-report.h"
 #include "qemu/path.h"
 #include "qemu/help_option.h"
 #include "qemu/module.h"
@@ -223,7 +222,6 @@ int main(int argc, char **argv)
 
     save_proc_pathname(argv[0]);
 
-    error_init(argv[0]);
     module_call_init(MODULE_INIT_TRACE);
     qemu_init_cpu_list();
     module_call_init(MODULE_INIT_QOM);
-- 
2.32.0


