Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA56667429
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 15:03:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFy4b-0006oU-HM; Thu, 12 Jan 2023 08:56:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pFy4F-0006jX-4U
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 08:56:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pFy3v-0004YW-DT
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 08:56:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673531770;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VJ9f+embDPz9PYDeSIaeJDx8u76O2BFiQiTfKwfIaTk=;
 b=TJqOPnHRShB18mD6a0D4Z+T/V3tGjRIHCmZUM0HRk4YCKjA6b6xEQWlTmuHdSKldu4oAmB
 X5VgOL4si9ygoMHEoEa282AI67enX2N5Hww4vbDS5l8NXkgJWHSL1lB3lPi37DhcB1TT9+
 CVI5LGLKzF7T//dUevaNfYtRI5wu6iQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-620-UJPXx5c0NfKkb5wRc48Ojw-1; Thu, 12 Jan 2023 08:56:09 -0500
X-MC-Unique: UJPXx5c0NfKkb5wRc48Ojw-1
Received: by mail-wr1-f72.google.com with SMTP id
 j18-20020adfb312000000b00293def622d1so3500540wrd.17
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 05:56:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VJ9f+embDPz9PYDeSIaeJDx8u76O2BFiQiTfKwfIaTk=;
 b=Z8X+BQvbo34bqDy21Eb3CVDn+vLsezqv6tSg/BegDEK4YSdOYIfUG2QptiUxIp1rkO
 xbHNjl2RPtqp1wr2wcSFehxnbnk0GHQdHrans9v9I3A69+HxQxrwhwrlnTNIwfvD3WpC
 TzXqKwLC/f7oq+GKFUzZJm6IZtGcoLvKOW4OH6FCXZpaF+6ggKW2xCtXbPuBadQhFOJb
 YQ6BsmDyqUjUjcu7xm1iHWpx1G1pKhRRrz/tdVROtPbawX+KbvnNWiYC2bJAWv62h/vn
 N6KMJ4JJj7WybnqmxW6CY2c/r2Yxxnn1VKavPRj+Zpq4/8rb8xVtbU8OiMV7WJSzpocl
 Gzug==
X-Gm-Message-State: AFqh2koCSmxmV9Y8cL1uDbJQ6gNINKwCMhcs8UGkIEyQ46mNIu8YN1LQ
 m2O0UZt9ZkiYQCldBZ+t51mvgDawamubfcK+DtClagY8Bzn1MOMsU3I4iyoqwcMdaIeJgwBMR39
 GToE9htvY4SFZF6k=
X-Received: by 2002:a05:600c:358c:b0:3d9:fa37:e457 with SMTP id
 p12-20020a05600c358c00b003d9fa37e457mr7593939wmq.15.1673531768171; 
 Thu, 12 Jan 2023 05:56:08 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtocFfslYukPkoG1dmkAZXVRuJ02lZghNlYjRzexqYJR34IEREBRqOnPYjJHzDz4/JLfFKW2Q==
X-Received: by 2002:a05:600c:358c:b0:3d9:fa37:e457 with SMTP id
 p12-20020a05600c358c00b003d9fa37e457mr7593922wmq.15.1673531767913; 
 Thu, 12 Jan 2023 05:56:07 -0800 (PST)
Received: from redhat.com ([2.52.157.155]) by smtp.gmail.com with ESMTPSA id
 i14-20020a05600c354e00b003d1d5a83b2esm29300208wmq.35.2023.01.12.05.56.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Jan 2023 05:56:07 -0800 (PST)
Date: Thu, 12 Jan 2023 08:56:03 -0500
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
Message-ID: <20230112085520-mutt-send-email-mst@kernel.org>
References: <20230112115005.1504812-1-armbru@redhat.com>
 <20230112115005.1504812-2-armbru@redhat.com>
 <20230112082537-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230112082537-mutt-send-email-mst@kernel.org>
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

On Thu, Jan 12, 2023 at 08:51:32AM -0500, Michael S. Tsirkin wrote:
> On Thu, Jan 12, 2023 at 12:50:05PM +0100, Markus Armbruster wrote:
> > docs/devel/style.rst mandates:
> > 
> >     The "qemu/osdep.h" header contains preprocessor macros that affect
> >     the behavior of core system headers like <stdint.h>.  It must be
> >     the first include so that core system headers included by external
> >     libraries get the preprocessor macros that QEMU depends on.
> > 
> >     Do not include "qemu/osdep.h" from header files since the .c file
> >     will have already included it.
> > 
> > A few violations have crept in.  Fix them.
> > 
> > Signed-off-by: Markus Armbruster <armbru@redhat.com>
> > Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> > Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> > Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>
> > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> 
> With my awesome grep skillz I found one more:
> $ grep -r --include='*.h' qemu/osdep.h
> include/block/graph-lock.h:#include "qemu/osdep.h"

Also:
$ grep -r --include='*.inc' qemu/osdep.h
ui/vnc-enc-zrle.c.inc:#include "qemu/osdep.h"
crypto/akcipher-nettle.c.inc:#include "qemu/osdep.h"
crypto/akcipher-gcrypt.c.inc:#include "qemu/osdep.h"
crypto/rsakey-nettle.c.inc:#include "qemu/osdep.h"
crypto/cipher-gnutls.c.inc:#include "qemu/osdep.h"
target/xtensa/core-dc233c/xtensa-modules.c.inc:#include "qemu/osdep.h"
target/xtensa/core-sample_controller/xtensa-modules.c.inc:#include "qemu/osdep.h"
target/xtensa/core-de212/xtensa-modules.c.inc:#include "qemu/osdep.h"
target/xtensa/core-dc232b/xtensa-modules.c.inc:#include "qemu/osdep.h"
target/xtensa/core-fsf/xtensa-modules.c.inc:#include "qemu/osdep.h"
target/cris/translate_v10.c.inc:#include "qemu/osdep.h"



> Looks like all C files must include qemu/osdep.h, no?
> How about
> 
> 1- add -include qemu/osdep.h on compile command line
>    drop #include "qemu/osdep.h" from C files
> 2- drop double include guards, replace with a warning.
> 
> following patch implements part 2:
> 
> 
> qemu/osdep: don't include it from headers
> 
> doing so will lead to trouble eventually - instead of
> working around such cases make it more likely it will fail.
> 
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> 
> ---
> 
> diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
> index 7d059ad526..e4a60f911c 100644
> --- a/include/qemu/osdep.h
> +++ b/include/qemu/osdep.h
> @@ -24,7 +24,12 @@
>   * This work is licensed under the terms of the GNU GPL, version 2 or later.
>   * See the COPYING file in the top-level directory.
>   */
> -#ifndef QEMU_OSDEP_H
> +#ifdef QEMU_OSDEP_H
> +#warning "Never include qemu/osdep.h from a header!"
> +#endif
> +
> +static inline void qemu_osdep_never_include_from_header(void) {}
> +
>  #define QEMU_OSDEP_H
>  
>  #include "config-host.h"
> @@ -714,5 +719,3 @@ static inline int platform_does_not_support_system(const char *command)
>  #ifdef __cplusplus
>  }
>  #endif
> -
> -#endif


