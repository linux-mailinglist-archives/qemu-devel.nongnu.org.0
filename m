Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D922F2B4B
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 10:33:15 +0100 (CET)
Received: from localhost ([::1]:60368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzG38-0007da-3O
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 04:33:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kzG01-0006N4-26
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 04:30:01 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:54042)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kzFzz-0003QP-6c
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 04:30:00 -0500
Received: by mail-wm1-x32d.google.com with SMTP id k10so1265426wmi.3
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 01:29:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=OJOAfnKrHg3js2dJ9qA3jYChnGvLNU3hneZGOnmdq7g=;
 b=x8PtDQa54T1urH4bCnuK8dYEIQylSA6HiSOSETwRVo7CJ9JcCjR000ifPu1tF+yQIt
 xns5NoEyO4jpgv7tz/VHHjei9j4Ea+Tw9pLXwSXK1ofknkIqF866Qn9OfQ/krV+eFg4E
 NyIOCURUwMIMQnvA7/z7+ECJzSYYyXDF8sOzGUJffpaEUH9PV2B/Vb0wDgeWxhg7jB8k
 7KVaMa5NIbfWBO0PXus1EWePPZTtsHM6b0WdWB1Kc6ahcTNGMlx4e0u5IMLyXhWCUQuQ
 lAFE1MtQCP/GBAqmg0zK9yFPCU0PzXc7+6vB9iV34t5D3Bbjv8+9OXaVoVEgHvysU5BY
 3BbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=OJOAfnKrHg3js2dJ9qA3jYChnGvLNU3hneZGOnmdq7g=;
 b=odMu60DprT46uwbzVeeyfIj02s+2ehNmLTpp6Sr00DUCL6kHLcDWaeF0dn1TU+46Hg
 tJlYnpvVx+C089pHhNUz8vPvMzNS5dkX+AaneGbrOTXjuzD5yahhnV+/K3MjRXgzfGc6
 J8Ws6NWBr/PG6vidnxcydKBsU8ANomHf+P96grQuC4bbTIFwAmqC+2waLKXZt/WjYReq
 nKDMHyNJ/pJ82u5SikU012Uuk+y/liCiRA6DAwSDW5g5xjkLcBotnAChJSCbmmqDtUpH
 mRglISpFeZ8SjmVWUcbfn3NA6xHyMUnhJF5ccEavWZ3APqNnjIajkj58h/+JuwyICp6+
 1iiQ==
X-Gm-Message-State: AOAM532/uGDfcoLOQLWSNZ8M8Kbj5PgI+xk1GDtCyjF2m0NpHPB/4AUa
 HmF/Zsn0h/GFPHHSz8V0OfkYS4xSNDBUqg==
X-Google-Smtp-Source: ABdhPJxaOrtC0JgVLEuVE9cr0T5/Am75w5PLb86HJnQ/YUcWlNkVepqSM0fqFqxR7qL/4e9YyJFPng==
X-Received: by 2002:a7b:cf30:: with SMTP id m16mr2569357wmg.145.1610443797427; 
 Tue, 12 Jan 2021 01:29:57 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id i5sm1375037wmq.27.2021.01.12.01.29.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 01:29:56 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 983F11FF7E;
 Tue, 12 Jan 2021 09:29:55 +0000 (GMT)
References: <20210108121935.640-1-alex.bennee@linaro.org>
 <20210108175431.tbf2bqizx4dx6vda@mail.bwidawsk.net>
 <87wnwnysaq.fsf@linaro.org>
 <20210108224231.qyrnl5ku7ht7s3w3@mail.bwidawsk.net>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Ben Widawsky <ben@bwidawsk.net>
Subject: Re: [RFC PATCH] Makefile: add GNU global tags support
Date: Tue, 12 Jan 2021 09:27:39 +0000
In-reply-to: <20210108224231.qyrnl5ku7ht7s3w3@mail.bwidawsk.net>
Message-ID: <87czyao63w.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Ben Widawsky <ben@bwidawsk.net> writes:

> On 21-01-08 22:30:59, Alex Benn=C3=A9e wrote:
>>=20
>> Ben Widawsky <ben@bwidawsk.net> writes:
>>=20
>> > On 21-01-08 12:19:35, Alex Benn=C3=A9e wrote:
>> >> GNU Global is another tags engine which is more like cscope in being
>> >> able to support finding both references and definitions. You will be
>> >> un-surprised to know it also integrates well with Emacs.
>> >>=20
>> >> The main benefit of integrating it into find-src-path is it takes less
>> >> time to rebuild the database from scratch when you have a lot of build
>> >> directories under your source tree.
>> >>=20
>> >> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> >
>> > It might be worth mentioning that the Linux kernel has supported this =
for a long
>> > time now (10+ years).
>> >
>> > Having switched to gtags about 3 years ago, I think it's summarily bet=
ter and
>> > would really like this to get merged.
>>=20
>> So I take it that's a reviewed-by and a tested-by tag from you?
>>=20
>
> It doesn't actually work correctly for me, I just like the idea :-)
>
> make gtags 2>&1  | grep ignored | wc -l
> 6266
>
> Warning: '/home/bwidawsk/work/clk/qemu/accel/qtest/qtest.c' is out of
> source tree. ignored.

Did you run this in the build directory by any chance? I tested in the
source directory because that's generally where you want the tags.

I wonder what the best solution is to this? Always force ourselves to be
in the source dir? Or error out when we are not in the source tree?


>
>> >
>> >> ---
>> >>  Makefile   | 9 ++++++++-
>> >>  .gitignore | 3 +++
>> >>  2 files changed, 11 insertions(+), 1 deletion(-)
>> >>=20
>> >> diff --git a/Makefile b/Makefile
>> >> index fb9923ff22..66eec99685 100644
>> >> --- a/Makefile
>> >> +++ b/Makefile
>> >> @@ -253,6 +253,13 @@ ctags:
>> >>  	rm -f "$(SRC_PATH)/"tags
>> >>  	$(find-src-path) -exec ctags -f "$(SRC_PATH)/"tags --append {} +
>> >>=20=20
>> >> +.PHONY: gtags
>> >> +gtags:
>> >> +	rm -f "$(SRC_PATH)/"GTAGS
>> >> +	rm -f "$(SRC_PATH)/"GRTAGS
>> >> +	rm -f "$(SRC_PATH)/"GPATH
>> >> +	$(find-src-path) | gtags -f -
>> >> +
>> >>  .PHONY: TAGS
>> >>  TAGS:
>> >>  	rm -f "$(SRC_PATH)/"TAGS
>> >> @@ -279,7 +286,7 @@ help:
>> >>  	$(call print-help,all,Build all)
>> >>  	$(call print-help,dir/file.o,Build specified target only)
>> >>  	$(call print-help,install,Install QEMU, documentation and tools)
>> >> -	$(call print-help,ctags/TAGS,Generate tags file for editors)
>> >> +	$(call print-help,ctags/gtags/TAGS,Generate tags file for editors)
>> >>  	$(call print-help,cscope,Generate cscope index)
>> >>  	$(call print-help,sparse,Run sparse on the QEMU source)
>> >>  	@echo  ''
>> >> diff --git a/.gitignore b/.gitignore
>> >> index b32bca1315..75a4be0724 100644
>> >> --- a/.gitignore
>> >> +++ b/.gitignore
>> >> @@ -7,6 +7,9 @@
>> >>  cscope.*
>> >>  tags
>> >>  TAGS
>> >> +GPATH
>> >> +GRTAGS
>> >> +GTAGS
>> >>  *~
>> >>  *.ast_raw
>> >>  *.depend_raw
>> >> --=20
>> >> 2.20.1
>> >>=20
>> >>=20
>>=20
>>=20
>> --=20
>> Alex Benn=C3=A9e


--=20
Alex Benn=C3=A9e

