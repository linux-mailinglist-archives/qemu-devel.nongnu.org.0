Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1894667CCB
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 18:41:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pG1X1-00070u-R3; Thu, 12 Jan 2023 12:38:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pG1Wn-0006vZ-Nn
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 12:38:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pG1WV-0001yd-53
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 12:37:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673545073;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ehN6IjRuqMASoeQcKCz8xA1U1hcQP2UwqR3kN7ENeDU=;
 b=KMoTFpFmqdT6xb4cutgRzvDLmfh6vc+qKyeimU58hjtJubh0BmImZaBOmimj7IFvv+nNvn
 cfMthFtkNG2ubPQe4OXfoFDySvZ1Lr6iJEdWd67+/d0oPRh4YsslxBA94RrqKcrVuYrJwl
 7j8xlXGAmTiCtgNpclJXcKGsGsEoBE0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-466-SSYGbWOeNHq02MteH6IyOQ-1; Thu, 12 Jan 2023 12:37:52 -0500
X-MC-Unique: SSYGbWOeNHq02MteH6IyOQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 bi18-20020a05600c3d9200b003d991844dbcso12809241wmb.4
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 09:37:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ehN6IjRuqMASoeQcKCz8xA1U1hcQP2UwqR3kN7ENeDU=;
 b=d+EdmlpJnZ3xLlNsw/6YORz06uwn+4m0pbJ9Bcb+vI49LOxdqbDs8gdeioz+NozA1b
 VC95GH7W43o5TlH9htLsJ91P8c2rUgv5Z653Jbc+KWgr+ZZL+DRYsIfQISy9kGj4ZSqV
 DnC2oXzEvzNa0zseBQI4wDfVLvI1uN0D0urn+15EqQYYRCwHjxpde+dWAfFn1YsrVpsN
 Nd8eniPtSMru67dvsdhN8JggbWJWriKPi8PuDSDc11pPBxg8yE1N/lI6eAxuUNyHXgPb
 Vm+KQfv8Gn+nQBrqPU4bKzRALg0966sMrx3gHhfsDubs6d6hOYihnA/qP3cNKWgXMGT5
 co6w==
X-Gm-Message-State: AFqh2kqjOCFVAYSMOO4l9O0K+1xQNCwAAyIvRN1vJxM7lHEbj0sDzOsl
 K3mglKa4SzBGXNsP1Ole4wrixBdM3xhfSkTnomUa8ZC3tMSMjYYuRcbxxnV1tcMGm3ZWB9Xe9dI
 Nhr4i6kbFU2cMb3w=
X-Received: by 2002:a05:600c:204c:b0:3d6:6a17:7015 with SMTP id
 p12-20020a05600c204c00b003d66a177015mr54958532wmg.15.1673545071147; 
 Thu, 12 Jan 2023 09:37:51 -0800 (PST)
X-Google-Smtp-Source: AMrXdXthTmqxDLV/7SyVlGEW4jDiFeJYlU3S/KdnwQEdBEg8B4JwWK4dBZ1LGxdh2NmFggQ8196Sbw==
X-Received: by 2002:a05:600c:204c:b0:3d6:6a17:7015 with SMTP id
 p12-20020a05600c204c00b003d66a177015mr54958508wmg.15.1673545070909; 
 Thu, 12 Jan 2023 09:37:50 -0800 (PST)
Received: from redhat.com ([2.52.157.155]) by smtp.gmail.com with ESMTPSA id
 n36-20020a05600c502400b003da0b75de94sm2670343wmr.8.2023.01.12.09.37.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Jan 2023 09:37:50 -0800 (PST)
Date: Thu, 12 Jan 2023 12:37:46 -0500
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
Message-ID: <20230112123434-mutt-send-email-mst@kernel.org>
References: <20230112115005.1504812-1-armbru@redhat.com>
 <20230112115005.1504812-2-armbru@redhat.com>
 <20230112082537-mutt-send-email-mst@kernel.org>
 <20230112085520-mutt-send-email-mst@kernel.org>
 <87zgan4xoo.fsf@pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87zgan4xoo.fsf@pond.sub.org>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Thu, Jan 12, 2023 at 03:47:19PM +0100, Markus Armbruster wrote:
> "Michael S. Tsirkin" <mst@redhat.com> writes:
> 
> > On Thu, Jan 12, 2023 at 08:51:32AM -0500, Michael S. Tsirkin wrote:
> >> On Thu, Jan 12, 2023 at 12:50:05PM +0100, Markus Armbruster wrote:
> >> > docs/devel/style.rst mandates:
> >> > 
> >> >     The "qemu/osdep.h" header contains preprocessor macros that affect
> >> >     the behavior of core system headers like <stdint.h>.  It must be
> >> >     the first include so that core system headers included by external
> >> >     libraries get the preprocessor macros that QEMU depends on.
> >> > 
> >> >     Do not include "qemu/osdep.h" from header files since the .c file
> >> >     will have already included it.
> >> > 
> >> > A few violations have crept in.  Fix them.
> >> > 
> >> > Signed-off-by: Markus Armbruster <armbru@redhat.com>
> >> > Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> >> > Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> >> > Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>
> >> > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> >> 
> >> With my awesome grep skillz I found one more:
> >> $ grep -r --include='*.h' qemu/osdep.h
> >> include/block/graph-lock.h:#include "qemu/osdep.h"
> 
> Crept in after I prepared my v1.  I neglected to re-check.
> 
> > Also:
> > $ grep -r --include='*.inc' qemu/osdep.h
> > ui/vnc-enc-zrle.c.inc:#include "qemu/osdep.h"
> > crypto/akcipher-nettle.c.inc:#include "qemu/osdep.h"
> > crypto/akcipher-gcrypt.c.inc:#include "qemu/osdep.h"
> > crypto/rsakey-nettle.c.inc:#include "qemu/osdep.h"
> > crypto/cipher-gnutls.c.inc:#include "qemu/osdep.h"
> > target/xtensa/core-dc233c/xtensa-modules.c.inc:#include "qemu/osdep.h"
> > target/xtensa/core-sample_controller/xtensa-modules.c.inc:#include "qemu/osdep.h"
> > target/xtensa/core-de212/xtensa-modules.c.inc:#include "qemu/osdep.h"
> > target/xtensa/core-dc232b/xtensa-modules.c.inc:#include "qemu/osdep.h"
> > target/xtensa/core-fsf/xtensa-modules.c.inc:#include "qemu/osdep.h"
> > target/cris/translate_v10.c.inc:#include "qemu/osdep.h"
> 
> Good point.  Looks like I successfully supressed all memory of .inc.
> 
> >> Looks like all C files must include qemu/osdep.h, no?
> 
> I remember there are a few exceptions, but I don't remember which .c
> they are.  Hmm... see commit 4bd802b209cff612d1a99674a91895b735be8630.
> 
> >> How about
> >> 
> >> 1- add -include qemu/osdep.h on compile command line
> >>    drop #include "qemu/osdep.h" from C files
> 
> Then you need to encode the exceptions in the build system.  Which might
> not be a bad thing.
> 
> >> 2- drop double include guards, replace with a warning.
> >> 
> >> following patch implements part 2:
> >> 
> >> 
> >> qemu/osdep: don't include it from headers
> >> 
> >> doing so will lead to trouble eventually - instead of
> >> working around such cases make it more likely it will fail.
> >> 
> >> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> >> 
> >> ---
> >> 
> >> diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
> >> index 7d059ad526..e4a60f911c 100644
> >> --- a/include/qemu/osdep.h
> >> +++ b/include/qemu/osdep.h
> >> @@ -24,7 +24,12 @@
> >>   * This work is licensed under the terms of the GNU GPL, version 2 or later.
> >>   * See the COPYING file in the top-level directory.
> >>   */
> >> -#ifndef QEMU_OSDEP_H
> >> +#ifdef QEMU_OSDEP_H
> >> +#warning "Never include qemu/osdep.h from a header!"
> >> +#endif
> >> +
> >> +static inline void qemu_osdep_never_include_from_header(void) {}
> >> +
> 
> Why do you need the function, too?

This seems to give a bit more info if header does get included
twice: instead of just a warning on the second include compiler says
definition is duplicated and then shows where the first definition was.
OTOH first one was almost for sure from the proper first include so
maybe we don't care. Let me drop this.

> >>  #define QEMU_OSDEP_H
> >>  
> >>  #include "config-host.h"
> >> @@ -714,5 +719,3 @@ static inline int platform_does_not_support_system(const char *command)
> >>  #ifdef __cplusplus
> >>  }
> >>  #endif
> >> -
> >> -#endif


