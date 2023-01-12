Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C165B6673B1
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 14:56:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFy0N-0003XY-Dl; Thu, 12 Jan 2023 08:52:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pFxzY-0002t4-KU
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 08:51:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pFxzT-0003kM-0z
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 08:51:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673531494;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1kd6neTRgQmgMh6DNG6DwXYTgAy1+iQonnVyEcqozWM=;
 b=OWOZ4v/NJozTdDHwOA7FXo0Ukkx+szP4STGsTKikEOtYBoeFucZ5Nlmtnb7xWzcsJy3jXt
 Pg5p882QyOYpXuxSdaEE8eKRZ3iMDiD0HtXtHPbU6+R1XPIU2Hlnl9Ng66sTcJ6P69Lr0v
 LxvSgVdB8lR7byokZOotTYFccpkC/NM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-647-2A5tIXHlPwW8Py2oLxFuzg-1; Thu, 12 Jan 2023 08:51:33 -0500
X-MC-Unique: 2A5tIXHlPwW8Py2oLxFuzg-1
Received: by mail-wm1-f69.google.com with SMTP id
 e19-20020a05600c219300b003da1215cf31so607904wme.1
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 05:51:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1kd6neTRgQmgMh6DNG6DwXYTgAy1+iQonnVyEcqozWM=;
 b=QFz494S7k9JMOK3cPG/fQuNZlZ7V+Gv3UC3X+YwCBj7IvlORyVfj84jgQwZfFFjxhF
 HiolSpi6CUReo2HuUekYkg+IpQ2HgkiQj/qdNfddLL0i2Tz9tguZOW+m5c5E35okLrPf
 M97iCBPH65Su1izfkHgdPUoZ61xztzKQFlrPkfaufJrPZKmwA4XByuZ5uI5QTQRkszjT
 fVbxvE8InP7QdvmXQJes2tt4Lhhh5sJbKVV9Bf/qefcEpJC6Sp7bHGpPdREvnpck+irR
 rpI7U2vG12DZLvAgONG+0NalztWoog/SgdtmTN2C/1Pbo6jc2XnfzjoCxyjURy3zUKWw
 qwrw==
X-Gm-Message-State: AFqh2ko6QDt7KPRYPbMf2+A46AHzjjUdYh/amkXP5GuB9GMbIH4UAqUA
 24pXcFhl6JqdLaI3SCTClb6zidKYCboSmcX/BjOI5YJ+MD7lFDSIW+BsNFM+J6rWuMHLRBNrAGg
 UL1ij0PvYMJOvs2g=
X-Received: by 2002:a5d:6443:0:b0:2ba:ecb4:5e19 with SMTP id
 d3-20020a5d6443000000b002baecb45e19mr14872449wrw.11.1673531491866; 
 Thu, 12 Jan 2023 05:51:31 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuCDWMX0+MZ6xrmfjPzxy6tksZkIeYbgnZCPZJmOxg8ZdZz+JvkCWpNGGEsq87he7gMEfFuPQ==
X-Received: by 2002:a5d:6443:0:b0:2ba:ecb4:5e19 with SMTP id
 d3-20020a5d6443000000b002baecb45e19mr14872431wrw.11.1673531491584; 
 Thu, 12 Jan 2023 05:51:31 -0800 (PST)
Received: from redhat.com ([2.52.157.155]) by smtp.gmail.com with ESMTPSA id
 z9-20020a7bc7c9000000b003d9ef37ec1bsm17340547wmk.5.2023.01.12.05.51.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Jan 2023 05:51:30 -0800 (PST)
Date: Thu, 12 Jan 2023 08:51:26 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, imp@bsdimp.com, kevans@freebsd.org,
 berrange@redhat.com, ben.widawsky@intel.com,
 jonathan.cameron@huawei.com, kbastian@mail.uni-paderborn.de,
 jasowang@redhat.com, michael.roth@amd.com, kkostiuk@redhat.com,
 tsimpson@quicinc.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, qemu-riscv@nongnu.org, philmd@linaro.org,
 Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [PATCH v3 1/1] include: Don't include qemu/osdep.h
Message-ID: <20230112082537-mutt-send-email-mst@kernel.org>
References: <20230112115005.1504812-1-armbru@redhat.com>
 <20230112115005.1504812-2-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230112115005.1504812-2-armbru@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Jan 12, 2023 at 12:50:05PM +0100, Markus Armbruster wrote:
> docs/devel/style.rst mandates:
> 
>     The "qemu/osdep.h" header contains preprocessor macros that affect
>     the behavior of core system headers like <stdint.h>.  It must be
>     the first include so that core system headers included by external
>     libraries get the preprocessor macros that QEMU depends on.
> 
>     Do not include "qemu/osdep.h" from header files since the .c file
>     will have already included it.
> 
> A few violations have crept in.  Fix them.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

With my awesome grep skillz I found one more:
$ grep -r --include='*.h' qemu/osdep.h
include/block/graph-lock.h:#include "qemu/osdep.h"

Looks like all C files must include qemu/osdep.h, no?
How about

1- add -include qemu/osdep.h on compile command line
   drop #include "qemu/osdep.h" from C files
2- drop double include guards, replace with a warning.

following patch implements part 2:


qemu/osdep: don't include it from headers

doing so will lead to trouble eventually - instead of
working around such cases make it more likely it will fail.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

---

diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index 7d059ad526..e4a60f911c 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -24,7 +24,12 @@
  * This work is licensed under the terms of the GNU GPL, version 2 or later.
  * See the COPYING file in the top-level directory.
  */
-#ifndef QEMU_OSDEP_H
+#ifdef QEMU_OSDEP_H
+#warning "Never include qemu/osdep.h from a header!"
+#endif
+
+static inline void qemu_osdep_never_include_from_header(void) {}
+
 #define QEMU_OSDEP_H
 
 #include "config-host.h"
@@ -714,5 +719,3 @@ static inline int platform_does_not_support_system(const char *command)
 #ifdef __cplusplus
 }
 #endif
-
-#endif


