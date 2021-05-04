Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C003A372CB5
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 17:05:07 +0200 (CEST)
Received: from localhost ([::1]:50456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldwbh-0004OA-Uo
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 11:05:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ldwZt-0003fI-VZ
 for qemu-devel@nongnu.org; Tue, 04 May 2021 11:03:14 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:35672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ldwZr-0005J0-VB
 for qemu-devel@nongnu.org; Tue, 04 May 2021 11:03:13 -0400
Received: by mail-wr1-x431.google.com with SMTP id a4so9814283wrr.2
 for <qemu-devel@nongnu.org>; Tue, 04 May 2021 08:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=io9kBlu9j7tRwr8d8e0LlIbi29jLslin0izvyllv6Rg=;
 b=qeO4wkvw2cB9oTGAb4vg6hOiygwFcjWOS6XV7KNgef5OC13QOitQXwSxRUGvwhwKxK
 R+K9CwXKVPw/VgjhjmZleFLHh9O1rHpTBiYjtbHTw8X/NFvLr6R5tfIgwmJLlR2FAltH
 vCbyl6HJKQXcx5fz0JnEmwK1Wtpk/GtX+ZUvROEgHBwQRBaTL8jfcWc9J8u+OL9fTAYb
 3EOfJHvvqiXLG377/lQiiiYJMvemE2LkL7PW0Xo1Go5FZOVLzfFmt0BDoYvXiAmuSwcC
 SuimXDtDGnrVbcisYGHdQPfG68NyHSQhFuQD+GBD+TXgPjvMP8MRzox1Vded8GRxj2Yw
 wfGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=io9kBlu9j7tRwr8d8e0LlIbi29jLslin0izvyllv6Rg=;
 b=Fbs80GLHNUVOA1ALCK1ZZA/pYLeRabUygxv4WYIfDTKpiy38Nh21setAXcxYwjms2H
 hHtiNZNV2NZK8YZN0ruCoopH5b59ndxi9k/CECrAZ+N3AqP64R0NLI2gsdZ6SEvbjmwp
 FY9hJxPR/tqIOh/FPadMzlfQol+L531gKBbXrNbqEd/6yKuyUQoZQcnrjUxjRCmVIi0O
 H1mN4WeOY5HNpJVtmbxxnZe9b/jkDncfum4y33IJxd9w9ckopOV87Mozg3ul79lNjW6f
 MkTTqQM2TbXld3fJFfxYykiTM4wMB4aUUJFOPrJA8occpzDiUrTAR8pWP9uo0cEume3f
 RnKQ==
X-Gm-Message-State: AOAM530Y2hDIkIVKgrSY22T2yb6YCURG9BDeh5ovkPOalD2PQpKNVRgW
 cNwzLET8O7q9gPwxNySzDSAYxA==
X-Google-Smtp-Source: ABdhPJzBWYgvq3QRq/z2bB3OMx6vfOAXXYlDZggJD8JQM9lA633JYnVkM/YbaKudESDF5ljtjnwX2w==
X-Received: by 2002:a5d:424e:: with SMTP id s14mr32065827wrr.354.1620140589607; 
 Tue, 04 May 2021 08:03:09 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o13sm16335762wrf.91.2021.05.04.08.03.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 May 2021 08:03:07 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id F1ABB1FF7E;
 Tue,  4 May 2021 16:03:06 +0100 (BST)
References: <20210406165307.5993-1-alex.bennee@linaro.org>
 <YIbIS/qDUwuLvNco@stefanha-x1.localdomain>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [RFC PATCH] scripts/tracetool: don't barf validating TCG types
Date: Tue, 04 May 2021 16:02:25 +0100
In-reply-to: <YIbIS/qDUwuLvNco@stefanha-x1.localdomain>
Message-ID: <87r1imo82d.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
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
Cc: Matheus Ferst <matheus.ferst@eldorado.org.br>, berrange@redhat.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Stefan Hajnoczi <stefanha@redhat.com> writes:

> [[PGP Signed Part:Undecided]]
> On Tue, Apr 06, 2021 at 05:53:07PM +0100, Alex Benn=C3=A9e wrote:
>> TCG types will be transformed into the appropriate host types later on
>> in the tool. Try and work around this by detecting those cases and
>> pressing on.
>>=20
>> [AJB: this seems a bit too hacky - but the problem is validate_type is
>> buried a few layers deep. Maybe we should just drop TCGv from
>> ALLOWED_TYPES and manually do if bit.startswith("TCGv_") in validate_typ=
e?]
>
> Please include a line from a trace-events file that triggers the issue.
> It's unclear to me what the problem is although I guess it's related to
> TCGv_* types being rejected by validate_type. The
> bit.startswith("TCGv_") change you mentioned sounds fine or a slightly
> more general ALLOWED_TYPE_PREFIXES =3D ['TCGv_'].

I tried:

modified   tcg/tcg-op.c
@@ -2715,6 +2715,9 @@ void tcg_gen_lookup_and_goto_ptr(void)
         plugin_gen_disable_mem_helpers();
         ptr =3D tcg_temp_new_ptr();
         gen_helper_lookup_tb_ptr(ptr, cpu_env);
+
+        trace_goto_tb_tcg(0, ptr);
+
         tcg_gen_op1i(INDEX_op_goto_ptr, tcgv_ptr_arg(ptr));
         tcg_temp_free_ptr(ptr);
     } else {
modified   trace-events
@@ -136,6 +136,10 @@ vcpu guest_cpu_reset(void)
 # Targets: TCG(all)
 vcpu tcg guest_mem_before(TCGv vaddr, uint16_t info) "info=3D%d", "vaddr=
=3D0x%016"PRIx64" info=3D%d"
=20
+# Mode: user, softmmu
+# Targets: TCG(all)
+tcg goto_ptr(int ignore, TCGv_ptr ptr) "goto_ptr_trans=3D%d", "goto_ptr=3D=
%p (%d)"
+

Which fails with:

FAILED: trace/trace-root.c=20
/usr/bin/python3 ../../scripts/tracetool.py --backend=3Dlog --group=3Droot =
--format=3Dc /home/alex/lsrc/qemu.git/./trace-events trace/trace-root.c
Traceback (most recent call last):
  File "../../scripts/tracetool.py", line 154, in <module>
    main(sys.argv)
  File "../../scripts/tracetool.py", line 143, in main
    events.extend(tracetool.read_events(fh, arg))
  File "/home/alex/lsrc/qemu.git/scripts/tracetool/__init__.py", line 406, =
in read_events
    event =3D Event.build(line, lineno, fname)
  File "/home/alex/lsrc/qemu.git/scripts/tracetool/__init__.py", line 322, =
in build
    args =3D Arguments.build(groups["args"])
  File "/home/alex/lsrc/qemu.git/scripts/tracetool/__init__.py", line 154, =
in build
    validate_type(arg_type)
  File "/home/alex/lsrc/qemu.git/scripts/tracetool/__init__.py", line 107, =
in validate_type
    "declared as 'void *'" % name)
ValueError: Error at /home/alex/lsrc/qemu.git/./trace-events:141: Argument =
type 'TCGv_ptr' is not allowed. Only standard C types and fixed size intege=
r types should be used. struct, union, and other complex pointer types shou=
ld be declared as 'void *'

>
>> Fixes: 73ff061032 ("trace: only permit standard C types and fixed size i=
nteger types")
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Cc: Matheus Ferst <matheus.ferst@eldorado.org.br>
>> ---
>>  scripts/tracetool/__init__.py | 13 +++++++++----
>>  1 file changed, 9 insertions(+), 4 deletions(-)
>>=20
>> diff --git a/scripts/tracetool/__init__.py b/scripts/tracetool/__init__.=
py
>> index 5bc94d95cf..ea078e34b4 100644
>> --- a/scripts/tracetool/__init__.py
>> +++ b/scripts/tracetool/__init__.py
>> @@ -87,10 +87,11 @@ def out(*lines, **kwargs):
>>      "ssize_t",
>>      "uintptr_t",
>>      "ptrdiff_t",
>> -    # Magic substitution is done by tracetool
>> +    # Magic substitution is done by tracetool TCG_2_HOST
>
> This makes it clearer that "TCG_2_HOST" is a code reference:
>
>   # Magic substitution is done using tracetool.transform.TCG_2_HOST
>
> [[End of PGP Signed Part]]


--=20
Alex Benn=C3=A9e

