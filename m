Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A98D92D3277
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 19:58:45 +0100 (CET)
Received: from localhost ([::1]:60416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmiCC-0006RZ-La
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 13:58:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kmhpS-0003Eu-L0
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 13:35:14 -0500
Received: from mail-oi1-f180.google.com ([209.85.167.180]:35267)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kmhpQ-0001WW-DZ
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 13:35:14 -0500
Received: by mail-oi1-f180.google.com with SMTP id s2so10964714oij.2
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 10:35:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ECYhv0HdEqAA4hvDfOlc1eUdDVUikLV2SPOarY0ohHc=;
 b=tz+ul+MgWQHkBFnb6RwvxHPcc8qIfZKdtJ9hc46P0jefQO+Ol3yzRMmoJOznjpxwDp
 HD48SLrGBXxHSzrnGs9obEfRmjqXTCIHmM8ZsvRQD80DevzkgbdKjvlsaq1oSVAFpVBU
 R7lEZD4nJzDM3VBV3E+vewecfrqEWvrVXq4uDxyhS4gnfNkKTxpMd5fce1KFM/P8301O
 afoMBZPcuAwdms4nd0hkgVcP4V/wLunaWq3IOhYeHHUonU7J1XI7QmqSP3FP7Pl/OgeJ
 OcDcyd8MIcf7EsRc7PLplEslII1zbBhYyd7mYQvXgNKQoYuV59jSbeSyTF9DgNExfe4e
 PuRQ==
X-Gm-Message-State: AOAM530VSRDE6hQvusE9xoG0Uw+6hrcxj9tN3ireIkanBkfBarVhT9xa
 TQJEa1cmWPS+eXhgMjKJ4qG2QhDEeJtmEjXDZ5E=
X-Google-Smtp-Source: ABdhPJywG/e9nv3r9kjEPP6LFWk7bybRWZz3kIweUvpqnToJFbITBvVVTF0rFPW1ALLhCcPlrx8tnaZnscNtlgGiz6U=
X-Received: by 2002:aca:5cc1:: with SMTP id q184mr3845094oib.46.1607452511251; 
 Tue, 08 Dec 2020 10:35:11 -0800 (PST)
MIME-Version: 1.0
References: <20201124134557.569388-1-f4bug@amsat.org>
 <5bcade19-de8c-8521-f77c-599e3c9d40a0@linaro.org>
 <e983c95c-5713-3b5b-0c3c-e0d6bf8244c6@amsat.org>
In-Reply-To: <e983c95c-5713-3b5b-0c3c-e0d6bf8244c6@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Tue, 8 Dec 2020 19:34:59 +0100
Message-ID: <CAAdtpL7zG6Ocbv0ChjQUArGkmTEegzC5AW5O3DjiDxFK7oEMWg@mail.gmail.com>
Subject: Re: [PATCH-for-5.2?] target/mips/translate: Check R6 reserved
 encoding for Load Linked Word
To: Richard Henderson <richard.henderson@linaro.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.167.180;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-oi1-f180.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 "Maciej W . Rozycki" <macro@linux-mips.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 24, 2020 at 5:15 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
> On 11/24/20 4:59 PM, Richard Henderson wrote:
> > On 11/24/20 5:45 AM, Philippe Mathieu-Daud=C3=A9 wrote:
> >> Release 6 recoded the 'Load Linked Word' using SPECIAL3 opcode,
> >> this opcode (0b110000) is now reserved.
> >>
> >> Ref: A.2 Instruction Bit Encoding Tables:
> >>
> >>   "6Rm instructions signal a Reserved Instruction exception
> >>    when executed by a Release 6 implementation."
> >>
> >> The check was added in commit 4368b29a26e ("target-mips: move
> >> LL and SC instructions") but got lost during latter refactor
> >> in commit d9224450208 ("target-mips: Tighten ISA level checks").
> >
> > I think git blame is confused here -- d9224450208 isn't the one that br=
oke
> > things.  The patch has:
> >
> >
> > +    case OPC_LL: /* Load and stores */
> > +        check_insn(ctx, ISA_MIPS2);
> > +        /* Fallthrough */
> > +    case OPC_LWL:
> >      case OPC_LWR:
> > -    case OPC_LL:
> >          check_insn_opc_removed(ctx, ISA_MIPS32R6);
> > +         /* Fallthrough */
>
> Sorry I have been confused by the /* Fallthrough */ ...
>
> The check is below.
>
> Self-NAck then.

Duh I hit that again, read the patch again, looks correct. I guess
I got confused myself reviewing the offending patch...
So I'm applying this patch to mips-next queue, using
Fixes: d9224450208 ("target-mips: Tighten ISA level checks")

Thanks,

Phil.

