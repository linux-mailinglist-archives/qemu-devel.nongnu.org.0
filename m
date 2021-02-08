Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6433C313D67
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 19:26:09 +0100 (CET)
Received: from localhost ([::1]:46970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9BEe-0004Ic-G1
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 13:26:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l95AS-0008K7-K2
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 06:57:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22039)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l95AH-0004Bd-Rt
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 06:57:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612785431;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n0jG5tSEr7CjgGVuNBklNLdLDaBRlyfHAZSjQr5GaA8=;
 b=IkADLvCyP7KwC4Y0cNTIXXU9n6CpLV7CTlkDDnoPPK2TYybxMLaO2uRgb8+feBQQidqB0j
 ixbADayObXej+2o2VpYsnyTe3NdfX3rOozVfKKI9C4mZk6BliR/OAS7fRxfOhBxNN/xCcb
 o1IGm4fEQYzc0lJCSRRNMFlum2Dqzwc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-547-a7b6eHKtPg2IUq9CoHgKWg-1; Mon, 08 Feb 2021 06:57:07 -0500
X-MC-Unique: a7b6eHKtPg2IUq9CoHgKWg-1
Received: by mail-wr1-f72.google.com with SMTP id d7so12942953wri.23
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 03:57:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=n0jG5tSEr7CjgGVuNBklNLdLDaBRlyfHAZSjQr5GaA8=;
 b=qLVto0mAC7HjqgJNH3uP9hNquvvE73pyhZmx8m/da/esPv0gS9imj/Ax9Nmuyu0Jv/
 21K1O0ueM9DPRHD/yzuuq798kws9OlJHBC3I5aFISWgNtbW3J6IS5NP+NOc8Dij/jLBP
 Bv9x0zA9/sMIIl87yKVuykw0+OmGU8oOFI/cUoD7nepWQ1Qk5d+PIdkxBmyluBo6Ogx3
 iPqj0OSAtJrQ+JohUtGV4WQBsWAOg4WS7P1loZW2A0UOcdvnzF4JEQgG8RIUmp+7I8SB
 EFKL7lZg28VpY1VDBF9vJPIIebVLh0SI5o0cl5U34U3VbyGNeUVILAY1ZqYCnp/gEpnN
 bGkQ==
X-Gm-Message-State: AOAM5321J2pnbYUoiAix5cBcv7n2ojxfCtR1MVnUZpRnALzuqD67DlZi
 UmgwxJ4pZ3Kn7D5HNnFPUag30hcuCbkCUk/KWfFFH2yEHPUD4BCWCzAfBgabjRzFt/oEQMRhB7k
 ztRFVScmRpWCKlOA=
X-Received: by 2002:a05:6000:1a8c:: with SMTP id
 f12mr19208013wry.173.1612785426653; 
 Mon, 08 Feb 2021 03:57:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyg0mMtH9TZOMYnFe+7j+6H3UzRlmGs9PQypyXyLqOA5FKFAXCzwgrn+9T+8r6C/S6kcNqM+g==
X-Received: by 2002:a05:6000:1a8c:: with SMTP id
 f12mr19207992wry.173.1612785426487; 
 Mon, 08 Feb 2021 03:57:06 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id w12sm11735670wmi.4.2021.02.08.03.57.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Feb 2021 03:57:05 -0800 (PST)
Subject: Re: [PATCH 0/5] Drop float32/float64 accessors used by gdbstub code
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20210208113428.7181-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <865e5df2-e4d8-de39-30e7-2f77c0d85eed@redhat.com>
Date: Mon, 8 Feb 2021 12:57:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210208113428.7181-1-peter.maydell@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.265, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-ppc@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/8/21 12:34 PM, Peter Maydell wrote:
> We used to make a distinction between 'float64'/'float32' types and
> the 'uint64_t'/'uint32_t' types, requiring special conversion
> operations to go between them.  We've now dropped this distinction as
> unnecessary, and the 'float*' types remain primarily for
> documentation purposes when used in places like the function
> prototypes of TCG helper functions.
> 
> This means that there's no need for special gdb_get_float64() and
> gdb_get_float32() functions to write float64 or float32 values to the
> GDB protocol buffer; we can just use gdb_get_reg64() and
> gdb_get_reg32().
> 
> Similarly, for reading a value out of the GDB buffer into a float64
> or float32 we can use ldq_p() or ldl_p() and need not use ldfq_p()
> or ldfl_p().
> 
> This patchseries drops the use of the gdb_get_float* and ldf*
> functions from the three targets that were using them, and then
> removes the now-unused functions from gdbstub.h and bswap.h.
> 
> thanks
> -- PMM
> 
> Peter Maydell (5):
>   target/sh4: Drop use of gdb_get_float32() and ldfl_p()
>   target/m68k: Drop use of gdb_get_float64() and ldfq_p()
>   target/ppc: Drop use of gdb_get_float64() and ldfq_p()
>   gdbstub: Remove unused gdb_get_float32() and gdb_get_float64()
>   bswap.h: Remove unused float-access functions
> 
>  docs/devel/loads-stores.rst     | 14 +++-----
>  include/exec/cpu-all.h          |  8 -----
>  include/exec/gdbstub.h          | 20 -----------
>  include/qemu/bswap.h            | 60 ---------------------------------
>  target/m68k/helper.c            |  5 ++-
>  target/ppc/gdbstub.c            |  8 ++---
>  target/sh4/gdbstub.c            |  8 ++---
>  target/ppc/translate_init.c.inc |  4 +--
>  8 files changed, 17 insertions(+), 110 deletions(-)

Series:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

Thanks for the cleanup!


