Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ACD94DDAC9
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 14:45:54 +0100 (CET)
Received: from localhost ([::1]:46800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVCvR-0001VH-2n
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 09:45:53 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nVCZo-00076N-To
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 09:23:32 -0400
Received: from [2a00:1450:4864:20::32d] (port=46773
 helo=mail-wm1-x32d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nVCZn-0002Dz-CK
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 09:23:32 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 p184-20020a1c29c1000000b0037f76d8b484so4779298wmp.5
 for <qemu-devel@nongnu.org>; Fri, 18 Mar 2022 06:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Jsr4pB71msnavT45jlstw0IyWfAWo6VMkQJ10uKrMqk=;
 b=B79wn6m9zaYbL1+0JNG/81wD/MwzO3e8jYktSDs6AkxmhT1CRJp0N1CvSlItKjJVIj
 9gQnkt7FQe914ogI1/EzfLkfTcptkFZ+zWeDpyOLGTINF26/XVrCYci92ZCAHky8g+HQ
 2i9nDQI21lk2IcXb4oKnq72ibde6/F52+wtfgMdKOUlsq3MQo19cBZitgIO5PraYoLzx
 b+qsE5occRsDff4iFLbet14lfJMxNCkufsl7yrDMfSKqaCNNA1d6nG/a/nRzyz6BQdZQ
 Ma9rm5/vUIqFIlr0hSeSj3j3FXj1JrWDCFgtDJLM0DKBQ8Tin7ce5eh0vgdZ0F2o+BAj
 CgtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Jsr4pB71msnavT45jlstw0IyWfAWo6VMkQJ10uKrMqk=;
 b=jagiLFgpJitZFbKmNgqE2enk4krjkKnY7Fztgxn/J0efyI2YQOVnIxPck2/Ys0gcoH
 KfTNRzc40oxu8fLmXhCc2zH5qbLlb6ZPShYTwhRFWFvRF/liyXcbuOCX9C2T/PGRWUlN
 UOov+5YYlV2rWLArCErTf4ea0MAApzRKQDYbeaS8AHgAV6XV1ecGeWHAMc5+gir9Tm0m
 qUJV1I0MFqthAMDx22YjussZBXGwpNjQaMVBcN1wXcvj3wQdO+AUnSBxGSEwEWBBfEAT
 fza/VBd15uCBJ5wswzIh/QdtHkFP2rgTyFES340BU5C1EVDVoesS7Yk/pnPFXxJgj+4z
 9a2A==
X-Gm-Message-State: AOAM532muUZojFEeov6XNGL/Nj5YznWPgf/eCeoWLJDHcSK6JPFH+I+n
 TUJXTyLrsAFoSaSRCQZK4bo/Gf6GuHzEpw==
X-Google-Smtp-Source: ABdhPJxVdyVDN8jBNMNUAsLz7dsHyeP9JlLKPuj2JCjSrWhU3uQ+8o4Yu7cqlN+cmTfcYKti3awcKg==
X-Received: by 2002:a1c:7418:0:b0:38a:c643:b10d with SMTP id
 p24-20020a1c7418000000b0038ac643b10dmr16126262wmc.50.1647609809945; 
 Fri, 18 Mar 2022 06:23:29 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 y15-20020a05600015cf00b00203e324347bsm6316599wry.102.2022.03.18.06.23.29
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Mar 2022 06:23:29 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 21/21] util/osdep: Remove some early cruft
Date: Fri, 18 Mar 2022 13:23:06 +0000
Message-Id: <20220318132306.3254960-22-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220318132306.3254960-1-peter.maydell@linaro.org>
References: <20220318132306.3254960-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Andrew Deason <adeason@sinenomine.net>

The include for statvfs.h has not been needed since all statvfs calls
were removed in commit 4a1418e07bdc ("Unbreak large mem support by
removing kqemu").

The comment mentioning CONFIG_BSD hasn't made sense since an include
for config-host.h was removed in commit aafd75841001 ("util: Clean up
includes").

Remove this cruft.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Andrew Deason <adeason@sinenomine.net>
Message-id: 20220316035227.3702-4-adeason@sinenomine.net
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 util/osdep.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/util/osdep.c b/util/osdep.c
index 1825399bcf5..394804d32e1 100644
--- a/util/osdep.c
+++ b/util/osdep.c
@@ -23,13 +23,6 @@
  */
 #include "qemu/osdep.h"
 #include "qapi/error.h"
-
-/* Needed early for CONFIG_BSD etc. */
-
-#ifdef CONFIG_SOLARIS
-#include <sys/statvfs.h>
-#endif
-
 #include "qemu-common.h"
 #include "qemu/cutils.h"
 #include "qemu/sockets.h"
-- 
2.25.1


