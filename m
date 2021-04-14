Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3923635FB16
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 20:53:44 +0200 (CEST)
Received: from localhost ([::1]:43844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWkdz-0008JD-6K
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 14:53:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lWkbr-0007Q0-Ne
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 14:51:31 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:34553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lWkbp-0004Wt-PF
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 14:51:31 -0400
Received: by mail-ej1-x633.google.com with SMTP id x12so12201227ejc.1
 for <qemu-devel@nongnu.org>; Wed, 14 Apr 2021 11:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=2Atm2nZH3hggGS/aUQTXYHgvJ4q7G3h2PO+p/OmJeCs=;
 b=v0+ZspRmXpKWc4xJviOIE7zvQ5TCyacZiR4uw7epIncWpgGFuiXsD4etJk3SDuMrbO
 9tK6VKZ2Waje09/rukoyp8Mxziu1njGfjXx1/WXIUPlvPCgC7nNQR4eJYVkk2tw+Jv6A
 Ei7AJMrCn9oSNUKYn00/vPqWDFSPF34vu5L1vg5CAZQBqc/ssHinE4hy1+iTd6DR+jp+
 O2UDaQtj3azuDX2tUkvngogWpLgVMJZW4QufsInwtmn6ObLUMpXy9WXhVG5hsBCtWClk
 ti52YTc34v5jJD41ZjiOFqcd46ijZhlXLE68UTb3mWuRnW4SxwipjaR37G7SU3k+ryYp
 w1Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2Atm2nZH3hggGS/aUQTXYHgvJ4q7G3h2PO+p/OmJeCs=;
 b=unsDfRcRV4jNvjfvlhDFiV15I7lOca9vimohq3ydqQ2alt69GGmVWTjZ754QvEWDgo
 zUfP5dOnKMhmQIAJ7INHt16+A4Jcm/WIsaJa851kOx1GtN4YDGBQoFp7vleXXZS4344B
 bHnVJDLgrI/UTKFHIWQN2mNr368Z8A9OFUVGURMld2kHq2dfRf3QV9vcjDAAFhkBxhIb
 oTE5afmlQl2t5CtXsqUfO5x17R90T1TThfIqtT/NY9sz2tJ8QuTwJWtXnsQXWvkNHQaq
 VSL+DD/Gsdz7PsaP2/kkVtRAQSPMqQ+rgiK1uUP7JGRVoFWM09ec6j6i0e+rjj5UixGI
 h5EQ==
X-Gm-Message-State: AOAM5321DxBU3L65ABCnviAO84DB7W3RDzGPZ/gmd1DhOCdZyNE8QNNx
 wvqUJcPgIZEkOPbMAqkhUd9nb91M+ZPlaN3vfxXE/w==
X-Google-Smtp-Source: ABdhPJxWaduT8T4/W3rq4RNsWkSDdiqkAVvkvIXvuhjAb+N1BE1IABrQY4NWzsS22EuTaO2NxvM6Kadi9pPguthaG7E=
X-Received: by 2002:a17:906:953:: with SMTP id j19mr339234ejd.56.1618426288154; 
 Wed, 14 Apr 2021 11:51:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210413160850.240064-1-pbonzini@redhat.com>
 <20210413160850.240064-3-pbonzini@redhat.com>
 <YHchNfXnhyzZBTg5@redhat.com>
In-Reply-To: <YHchNfXnhyzZBTg5@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 14 Apr 2021 19:50:41 +0100
Message-ID: <CAFEAcA-Wu8c=TyNd0T4mocvy4=Fh=xqoAAuOtg7NcF2i38YiqA@mail.gmail.com>
Subject: Re: [PULL v2 2/3] osdep: protect qemu/osdep.h with extern "C"
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x633.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 14 Apr 2021 at 18:26, Daniel P. Berrang=C3=A9 <berrange@redhat.com>=
 wrote:
>
> On Tue, Apr 13, 2021 at 06:08:49PM +0200, Paolo Bonzini wrote:
> >  #ifdef _WIN32
> >  #include "sysemu/os-win32.h"
>
> This and os-posix.h both include other system headers. We don't currently
> have problem, so this is ok as the minimal fix for 6.0, but long term we
> need more work on this header to further narrow the extern {} block.

Maybe we should just move all the system header includes out of
both os-posix.h and os-win32.h ? We already have one header file
we've treated that way (sys/wait.h).

Alternatively we could leave os-win32.h and os-posix.h outside
osdep.h's extern block, and require that they both use an
extern block themselves for their declarations.

thanks
-- PMM

