Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDDD63A7AF7
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 11:41:23 +0200 (CEST)
Received: from localhost ([::1]:39332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lt5ZT-0007WL-1X
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 05:41:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lt5Xu-0006Wv-PC
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 05:39:46 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:45702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lt5Xs-0007oj-Nq
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 05:39:46 -0400
Received: by mail-ed1-x52f.google.com with SMTP id r7so35776273edv.12
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 02:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=pulNoykRMx+z3icLctvOAVQt/tn9x/G9PH4lXKSPJ4w=;
 b=QSAlwC3RKE+NEaMuvht6sStMRShZQOLJivqB/E3LrR96AhJjTg0SSawzJTti9sVCcK
 mUAgyqDhkGaYfZ+PvJJYFvQzRaYI28A9AeOHgCxVmYzywqKu2mK7Scl3RxxJzWb+oflL
 N72B3n1jTaCq/xLQuIYNj6IBkXTWCLEzxNuykR7LVxaUsSHQKyOFVkHRpbYvd1+SwTht
 HNPgDGTSSRaEw5j+lWWd7WHPP8oF+XDmBVIxtYQWWDTRCldRjTizvWs2HjIgYTQZsZom
 MDJRQb5IsRoIBDLafcwqpwQMSrEMAfgtZECxwQQqaDj28tSeTw0P+9qDhO0EtGy+Sbjz
 9ziQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=pulNoykRMx+z3icLctvOAVQt/tn9x/G9PH4lXKSPJ4w=;
 b=Qr2Y2fBK2wq5JrnUi+w+aeuYP8RMGt6br9HeLJCoprT9ZzkPIYSzKKUfy2UAiPcXiG
 37VbRejrkM0MRhxQ/n5625ELZKdhF8FMG5w64tqbr5s3Yful4pcegNnauyXHVyihZUsM
 1hMYNs4ugeCBPikXCKQ0C/6z/xJnkR6EmIBwr06C8A/xHBPZJRcCURlIBNmAhJyqf2fC
 uzD7VHwzwdrtlBX5+3ydD0Z+o1ZunI2sFaoVGgNQiX3/gmS3oA6AYnayEthYmL388C0q
 kz34LEc9yYOb2D9oeenZOCAOzs8SGQFGLqoeY+jzGoOYt2k45E+8xyFRCpFh4E9V93Sr
 TcAw==
X-Gm-Message-State: AOAM532R1gFi4XHPAvcMOEA/C/k1W7QlaMa6e+5edynHhy5wCs7O5YD2
 9NpaszAw8OHoAaptg1arxgLImDsy+FJ32+lbQKDX3Q==
X-Google-Smtp-Source: ABdhPJw4BtgHZRPaJkPaAK0URY5kK0+LgXahi8e9eo52CNWKnHCq7NO1dRKCMJGnbqdpoZ3FqyCd4j1/1/j87f+H1Fw=
X-Received: by 2002:aa7:c857:: with SMTP id g23mr21847236edt.100.1623749982990; 
 Tue, 15 Jun 2021 02:39:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210614052623.1657103-1-f4bug@amsat.org>
In-Reply-To: <20210614052623.1657103-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Jun 2021 10:39:08 +0100
Message-ID: <CAFEAcA9HCGizgTFNMZ3N2xECYgGmwxFhg=T_oGTdC=xULcwFZQ@mail.gmail.com>
Subject: Re: [RFC PATCH] migration: Add missing dependency on GNUTLS
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
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
Cc: Leonardo Bras <leobras.c@gmail.com>, Lukas Straub <lukasstraub2@web.de>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, QEMU Trivial <qemu-trivial@nongnu.org>,
 Stefan Weil <sw@weilnetz.de>, QEMU Developers <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 14 Jun 2021 at 06:28, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> Commit 7de2e856533 made migration/qemu-file-channel.c include
> "io/channel-tls.h" but forgot to add the new GNUTLS dependency
> on Meson, leading to build failure on OSX:
>
>   [2/35] Compiling C object libmigration.fa.p/migration_qemu-file-channel=
.c.o
>   FAILED: libmigration.fa.p/migration_qemu-file-channel.c.o
>   cc -Ilibmigration.fa.p -I. -I.. -Iqapi [ ... ] -o libmigration.fa.p/mig=
ration_qemu-file-channel.c.o -c ../migration/qemu-file-channel.c
>   In file included from ../migration/qemu-file-channel.c:29:
>   In file included from include/io/channel-tls.h:26:
>   In file included from include/crypto/tlssession.h:24:
>   include/crypto/tlscreds.h:28:10: fatal error: 'gnutls/gnutls.h' file no=
t found
>   #include <gnutls/gnutls.h>
>            ^~~~~~~~~~~~~~~~~
>   1 error generated.
>
> Reported-by: Stefan Weil <sw@weilnetz.de>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/407
> Fixes: 7de2e856533 ("yank: Unregister function when using TLS migration")
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Is there really no way to get Meson to handle this kind
of thing properly (ie "just put all the include paths in the CFLAGS
for every compilation") rather than requiring us to add dependency
markers all over the meson.build files every time we add some
extra #include somewhere ? This is demonstrably horribly fragile
the way we have it at the moment :-(

-- PMM

