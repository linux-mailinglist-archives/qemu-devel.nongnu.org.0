Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52AF629A945
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Oct 2020 11:13:16 +0100 (CET)
Received: from localhost ([::1]:35642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kXLyd-0004CA-Cc
	for lists+qemu-devel@lfdr.de; Tue, 27 Oct 2020 06:13:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kXLwu-0003G1-Ax
 for qemu-devel@nongnu.org; Tue, 27 Oct 2020 06:11:28 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:50699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kXLwr-0004WW-Tv
 for qemu-devel@nongnu.org; Tue, 27 Oct 2020 06:11:27 -0400
Received: by mail-wm1-x341.google.com with SMTP id 13so791889wmf.0
 for <qemu-devel@nongnu.org>; Tue, 27 Oct 2020 03:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=bChuqpm8371HXxABvjXwg677auScCJoJmhAUxg5huRA=;
 b=MwRfiitNjE6U9G3Lx8t19HjCyzrOmnAxH9/M7hwcPZx+iJzan4WpHL62UNFe2efpw0
 oBt/SbNybaBkUfgFJge+fOKkOtS9Am+LfR7d/w5PcT533hE2geFloKByYTabAM4cA9v1
 lx43Wd9L88i4c7dA2/Ao9yvUQeWoyskexxd4/cDr58WFEjaGGyVBH1SZVMnBi08oquH0
 B8esTsN+FCFvjmwIkNCITbOVWcQpEhGwNw5mNs3GvTd6xLBmuArfrxhPQtj7yeAwn1io
 ya9p3/vigNwXxSLgJqufIrrpdHHNoo9MXnVBSJLeWp1k1DhMyaPQ07/FNfuVAzxry/+N
 CsJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=bChuqpm8371HXxABvjXwg677auScCJoJmhAUxg5huRA=;
 b=mCktRGKajdVkkBzee/p0PxZUqBM+LbjfRO7/cjiwcKsYaOVc34NJtYjeZl+HupIfUK
 mTZ80qFdN+lsSCw89TPwRTiU4xYD7A6SdPu9odJfxcSEevAeTA5D4CJ1tHpq3GWrw6Mf
 Z1XLlY6Mq6wtGsF5dbnhfNkFloaSMqSco82jFajDt8U7X5PhAAN3+yjXV5cUWdHCje8i
 AUGqTWVNRGFcmn5RdfdprcDdNbCyrsnCk/iFALHEFJmYq0yZfeK5rnWf+nDc8e60Tn13
 Z1dRfdFsq8u1vX1FC5//M5jTj5wAYIj/aLNhwiQiy7KeQi0aL+tsw+mP4BeUtsVJ/5dx
 RzcA==
X-Gm-Message-State: AOAM532uNowwcHRVuVPJEA6VGMkF2HmANZw+gaL/YqSyIiNSvQYSdsS2
 5PPYrTKoKUx8qZE61H1vYLylkQ==
X-Google-Smtp-Source: ABdhPJwZkZRNQKZesqXTVhp1+NIrQxXwg0q1A83J0AbB7s22UiZQMqD31teD4fU+ns7l6+nqpo+XkA==
X-Received: by 2002:a1c:7f97:: with SMTP id a145mr1932892wmd.160.1603793481108; 
 Tue, 27 Oct 2020 03:11:21 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r3sm1364782wrm.51.2020.10.27.03.11.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2020 03:11:19 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DF13A1FF7E;
 Tue, 27 Oct 2020 10:11:18 +0000 (GMT)
References: <20201023200645.1055-1-dbuono@linux.vnet.ibm.com>
 <20201023200645.1055-5-dbuono@linux.vnet.ibm.com>
User-agent: mu4e 1.5.6; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Daniele Buono <dbuono@linux.vnet.ibm.com>
Subject: Re: [PATCH v2 4/6] cfi: Initial support for cfi-icall in QEMU
In-reply-to: <20201023200645.1055-5-dbuono@linux.vnet.ibm.com>
Date: Tue, 27 Oct 2020 10:11:18 +0000
Message-ID: <874kmgf06x.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?utf-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org,
 Alexander Bulekov <alxndr@bu.edu>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Daniele Buono <dbuono@linux.vnet.ibm.com> writes:

> LLVM/Clang, supports runtime checks for forward-edge Control-Flow
> Integrity (CFI).
>
> CFI on indirect function calls (cfi-icall) ensures that, in indirect
> function calls, the function called is of the right signature for the
> pointer type defined at compile time.
>
> For this check to work, the code must always respect the function
> signature when using function pointer, the function must be defined
> at compile time, and be compiled with link-time optimization.
>
> This rules out, for example, shared libraries that are dynamically loaded
> (given that functions are not known at compile time), and code that is
> dynamically generated at run-time.
>
> This patch:
>
> 1) Introduces the CONFIG_CFI flag to support cfi in QEMU
>
> 2) Introduces a decorator to allow the definition of "sensitive"
> functions, where a non-instrumented function may be called at runtime
> through a pointer. The decorator will take care of disabling cfi-icall
> checks on such functions, when cfi is enabled.
>
> 3) Marks functions currently in QEMU that exhibit such behavior,
> in particular:
> - The function in TCG that calls pre-compiled TBs
> - The function in TCI that interprets instructions
> - Functions in the plugin infrastructures that jump to callbacks
> - Functions in util that directly call a signal handler
>
> 4) Add a new section in MAINTAINERS with me as a maintainer for
> include/qemu/sanitizers.h, in case a maintainer is deemed
> necessary for this feature
>
> Signed-off-by: Daniele Buono <dbuono@linux.vnet.ibm.com>
> ---
>  MAINTAINERS               |  5 +++++
>  accel/tcg/cpu-exec.c      |  9 +++++++++
>  include/qemu/sanitizers.h | 22 ++++++++++++++++++++++
>  plugins/core.c            | 25 +++++++++++++++++++++++++
>  plugins/loader.c          |  5 +++++

With the changes Paolo suggested (QEMU_DISABLE_CFI and use compilers.h)
then for the plugin bits:

Acked-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

