Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08414667CD4
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 18:43:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pG1a9-0000Yt-JL; Thu, 12 Jan 2023 12:41:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pG1a7-0000YT-SP
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 12:41:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pG1a6-0002kK-7C
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 12:41:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673545297;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VRnRLfWYBmS7QFJ95fJ0/Y/8sdTtZKcRN8b0GCktwzg=;
 b=YXM9zrdeS4jfi/q2hsaLqjyud7wyYdoR9u0niOdkyfLTA+45a1IO5wK5KVShfhgoneBUho
 5s1R/WkfQCFBYJ76phSex7ceOjROM3NmiTf4MQwQbJacJEsthjgfr9KDG2xp71hXgQx19c
 lbl2DoN67QhOwWe2yOXoKpqkzkTwnhY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-30-LErUUaN9MrGhCUqNDSVjnw-1; Thu, 12 Jan 2023 12:41:35 -0500
X-MC-Unique: LErUUaN9MrGhCUqNDSVjnw-1
Received: by mail-wm1-f69.google.com with SMTP id
 n9-20020a05600c3b8900b003d9f14e904eso6837718wms.9
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 09:41:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VRnRLfWYBmS7QFJ95fJ0/Y/8sdTtZKcRN8b0GCktwzg=;
 b=dX3osVdgj4NJFOOhsEpwewtEu2sBgkaXoyogdqVCF1Syn30nRLtzXwUHr2fQEJInNK
 JZk3bpLDhb7Zt4JS9zYr4n5sH7iN8l6nDgByE48oo5vudvYILdQwYAearM+ygiJNLoYp
 h8CrVsrd0z0JRS7DEpZGrLWHEBW3qKnPZIELg0jszovRuUxAQym9W94M9ycVjecMDBES
 MKRB2X2xwrU6EpIsAciAStQLTDZ43DclZV0gnHtFrvnADbjsljtCCssqvMvkuPFnj1X1
 N1HWd9k9F/oWIaB36QS5V5+axWubmhfTdnWVjP1o9ctPaFxaQJZXLAA8rIkWxxEJiUBp
 FUNA==
X-Gm-Message-State: AFqh2koRYgLiTx1nodESFp7EcUceARtMzB7Mk8cDaBCnJp3cK7x+fqlN
 yagIwfCA7n7c/R1Og2P8bq5N9lfY3xjGfc81U2j00k9QiGTlBotbpHJjtFKGstB7S9qERDxAANn
 gBUIsUiyisxM3ZDY=
X-Received: by 2002:a7b:ca4f:0:b0:3c6:edc0:5170 with SMTP id
 m15-20020a7bca4f000000b003c6edc05170mr55535596wml.25.1673545294732; 
 Thu, 12 Jan 2023 09:41:34 -0800 (PST)
X-Google-Smtp-Source: AMrXdXv2Nfl2zhadh45vjFKuA0ruFaFWL/u9Me8rBybNq4JDbL2Atvy21u073sGdrWEYpGLxX/RH+w==
X-Received: by 2002:a7b:ca4f:0:b0:3c6:edc0:5170 with SMTP id
 m15-20020a7bca4f000000b003c6edc05170mr55535567wml.25.1673545294497; 
 Thu, 12 Jan 2023 09:41:34 -0800 (PST)
Received: from redhat.com ([2.52.157.155]) by smtp.gmail.com with ESMTPSA id
 e7-20020a056000120700b00241dd5de644sm17027607wrx.97.2023.01.12.09.41.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Jan 2023 09:41:33 -0800 (PST)
Date: Thu, 12 Jan 2023 12:41:29 -0500
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
Message-ID: <20230112124011-mutt-send-email-mst@kernel.org>
References: <20230112115005.1504812-1-armbru@redhat.com>
 <20230112115005.1504812-2-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230112115005.1504812-2-armbru@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

here's v2 - can be applied after you fix all instances of this.
Feel free to use.

--->

qemu/osdep: we don't include it from headers

doing so will lead to trouble eventually - instead of silently working
around such cases make it more likely it will fail.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

-- 

diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index 7d059ad526..3ddeb7fd41 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -24,7 +24,9 @@
  * This work is licensed under the terms of the GNU GPL, version 2 or later.
  * See the COPYING file in the top-level directory.
  */
-#ifndef QEMU_OSDEP_H
+#ifdef QEMU_OSDEP_H
+#warning "Never include qemu/osdep.h from a header!"
+#else
 #define QEMU_OSDEP_H
 
 #include "config-host.h"


