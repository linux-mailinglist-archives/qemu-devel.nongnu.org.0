Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F10B02F3774
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 18:46:00 +0100 (CET)
Received: from localhost ([::1]:40772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzNjy-0005jd-68
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 12:46:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kzNcR-00056k-BH
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 12:38:11 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:42289)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kzNcP-0004Sv-1N
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 12:38:10 -0500
Received: by mail-wr1-x436.google.com with SMTP id m4so2016570wrx.9
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 09:38:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=9TBm/WNwLjHUdYtw7eBm0dTIHb4IOLFCbu2Rn4zc4u0=;
 b=hXGhp8bn6jSMY/uvV70acgEKsfLQfR9qt/UqpQxazNl5CnRt5BzvIG2Ko74m2BIFS3
 L4RYTC7cFNd8BiTIw7jAwLoQwYgvUQ0zuSfvTRf6YVGzQbdA/NWQUiCbOOHTBnIC05h+
 j320WpsbeOwNcHHfl+GK01ViuzhpjeymrqtdUwrjlmWjuSxASVl79hzAqL82of95phrV
 F1xwbTlpzUvIdsDmqCfhSHDP98sGoNwEjIYd5AeKS1PUxUN13l0BqSLXZVqrr13w5Wp8
 1IYtkK/3jLDOG5g271OibwCKQzuFthMc/ySYMI2vck6UQTNi6iFncoKC/11mKg9g+EtR
 deew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=9TBm/WNwLjHUdYtw7eBm0dTIHb4IOLFCbu2Rn4zc4u0=;
 b=ZrWAhjY/wqOFK3NXRkwmwyzVhyKTvVpAIekZO5HbvTG7ydtdjWqFOR8np1aP9crS9W
 S7THgV0c3t6szn/3luTr1ToBZ+BLrgE4vSNeQkwRx1hEZqKhHodpAyTSHf6OHDB24NVx
 iH4pIFznjR2Ehi8tp7zIlj7eL7kngKrDG+3OQtVU16r4g6kqqyD6S9rN4aB0rrVWQG7t
 0SeGXmaP7MCo9aDehEdqN7jFKHYh6DFDCr2gEEN9BYbZ+AMiamIwJav9WQk+aRk6VIez
 73TBh1ZO4xN3uXukUtpzXOGAZ1EfXqrgKsCWUClnty4HtIEMZjZ5eqQm4/CH1k1rwm8G
 c+Jg==
X-Gm-Message-State: AOAM531WL/34Y73WAsH50ayloku97c/uUWlMazM5tK/50szDT9+Iu9PT
 P584ZD+kIo4/X0giPOKTsXPtG1Yz5MadJQ==
X-Google-Smtp-Source: ABdhPJx50bz4/DPAg1V5BA5r2w7OwGkxA/+Awk/7R0a52O6jyceFPRmXgFwX8HpeojIqi+PVztMW4Q==
X-Received: by 2002:a5d:4ccb:: with SMTP id c11mr5264091wrt.324.1610473086624; 
 Tue, 12 Jan 2021 09:38:06 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id j15sm6078455wrr.85.2021.01.12.09.38.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 09:38:05 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D2D751FF7E;
 Tue, 12 Jan 2021 17:38:04 +0000 (GMT)
References: <20210108121935.640-1-alex.bennee@linaro.org>
 <20210108175431.tbf2bqizx4dx6vda@mail.bwidawsk.net>
 <87wnwnysaq.fsf@linaro.org>
 <20210108224231.qyrnl5ku7ht7s3w3@mail.bwidawsk.net>
 <87czyao63w.fsf@linaro.org>
 <20210112150031.rvdsatlcqa22k4a6@mail.bwidawsk.net>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Ben Widawsky <ben@bwidawsk.net>
Subject: Re: [RFC PATCH] Makefile: add GNU global tags support
Date: Tue, 12 Jan 2021 16:58:40 +0000
In-reply-to: <20210112150031.rvdsatlcqa22k4a6@mail.bwidawsk.net>
Message-ID: <87k0sim4xv.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
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

> On 21-01-12 09:27:39, Alex Benn=C3=A9e wrote:
>>=20
>> Ben Widawsky <ben@bwidawsk.net> writes:
>>=20
>> > On 21-01-08 22:30:59, Alex Benn=C3=A9e wrote:
>> >>=20
>> >> Ben Widawsky <ben@bwidawsk.net> writes:
>> >>=20
>> >> > On 21-01-08 12:19:35, Alex Benn=C3=A9e wrote:
>> >> >> GNU Global is another tags engine which is more like cscope in bei=
ng
>> >> >> able to support finding both references and definitions. You will =
be
>> >> >> un-surprised to know it also integrates well with Emacs.
>> >> >>=20
>> >> >> The main benefit of integrating it into find-src-path is it takes =
less
>> >> >> time to rebuild the database from scratch when you have a lot of b=
uild
>> >> >> directories under your source tree.
>> >> >>=20
>> >> >> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> >> >
>> >> > It might be worth mentioning that the Linux kernel has supported th=
is for a long
>> >> > time now (10+ years).
>> >> >
>> >> > Having switched to gtags about 3 years ago, I think it's summarily =
better and
>> >> > would really like this to get merged.
>> >>=20
>> >> So I take it that's a reviewed-by and a tested-by tag from you?
>> >>=20
>> >
>> > It doesn't actually work correctly for me, I just like the idea :-)
>> >
>> > make gtags 2>&1  | grep ignored | wc -l
>> > 6266
>> >
>> > Warning: '/home/bwidawsk/work/clk/qemu/accel/qtest/qtest.c' is out of
>> > source tree. ignored.
>>=20
>> Did you run this in the build directory by any chance? I tested in the
>> source directory because that's generally where you want the tags.
>>=20
>> I wonder what the best solution is to this? Always force ourselves to be
>> in the source dir? Or error out when we are not in the source tree?
>
> I was in the build directory. With ctags, that works for me in both sourc=
e and
> build directory.
>
> It does indeed work from the source directory.
>
> I'm wondering how gtags can't seem to do this (I wasn't able to figure it=
 out,
> at least).

The start of the manual states:

  Gtags recursively collects source files under the current directory,
  picks up symbols and writes the cross-reference data into the tag files
  (=C2=B4GTAGS=C2=B4, =C2=B4GRTAGS=C2=B4 and =C2=B4GPATH=C2=B4).

so I guess when it finds files outside of CWD it gets confused. While
all of my build trees are inside the source tree ("builds/foo|bar|baz")
they don't have to be.=20

> I'd be in favor of error.

The other tags targets always generate to source root so I'm going to go
for:

  .PHONY: gtags
  gtags:
          $(call quiet-command, \
                  rm -f "$(SRC_PATH)/"GTAGS \
                  rm -f "$(SRC_PATH)/"GRTAGS \
                  rm -f "$(SRC_PATH)/"GPATH, \
                  "GTAGS", "Remove old")
          $(call quiet-command, \
            (cd $(SRC_PATH) && $(find-src-path) | gtags -f -), \
            "GTAGS", "Re-index $(SRC_PATH)")

which also makes the output a bit nicer.
>
>
>>=20
>>=20
>> >
>> >> >
>> >> >> ---
>> >> >>  Makefile   | 9 ++++++++-
>> >> >>  .gitignore | 3 +++
>> >> >>  2 files changed, 11 insertions(+), 1 deletion(-)
>> >> >>=20
>> >> >> diff --git a/Makefile b/Makefile
>> >> >> index fb9923ff22..66eec99685 100644
>> >> >> --- a/Makefile
>> >> >> +++ b/Makefile
>> >> >> @@ -253,6 +253,13 @@ ctags:
>> >> >>  	rm -f "$(SRC_PATH)/"tags
>> >> >>  	$(find-src-path) -exec ctags -f "$(SRC_PATH)/"tags --append {} +
>> >> >>=20=20
>> >> >> +.PHONY: gtags
>> >> >> +gtags:
>> >> >> +	rm -f "$(SRC_PATH)/"GTAGS
>> >> >> +	rm -f "$(SRC_PATH)/"GRTAGS
>> >> >> +	rm -f "$(SRC_PATH)/"GPATH
>> >> >> +	$(find-src-path) | gtags -f -
>> >> >> +
>> >> >>  .PHONY: TAGS
>> >> >>  TAGS:
>> >> >>  	rm -f "$(SRC_PATH)/"TAGS
>> >> >> @@ -279,7 +286,7 @@ help:
>> >> >>  	$(call print-help,all,Build all)
>> >> >>  	$(call print-help,dir/file.o,Build specified target only)
>> >> >>  	$(call print-help,install,Install QEMU, documentation and tools)
>> >> >> -	$(call print-help,ctags/TAGS,Generate tags file for editors)
>> >> >> +	$(call print-help,ctags/gtags/TAGS,Generate tags file for editor=
s)
>> >> >>  	$(call print-help,cscope,Generate cscope index)
>> >> >>  	$(call print-help,sparse,Run sparse on the QEMU source)
>> >> >>  	@echo  ''
>> >> >> diff --git a/.gitignore b/.gitignore
>> >> >> index b32bca1315..75a4be0724 100644
>> >> >> --- a/.gitignore
>> >> >> +++ b/.gitignore
>> >> >> @@ -7,6 +7,9 @@
>> >> >>  cscope.*
>> >> >>  tags
>> >> >>  TAGS
>> >> >> +GPATH
>> >> >> +GRTAGS
>> >> >> +GTAGS
>> >> >>  *~
>> >> >>  *.ast_raw
>> >> >>  *.depend_raw
>> >> >> --=20
>> >> >> 2.20.1
>> >> >>=20
>> >> >>=20
>> >>=20
>> >>=20
>> >> --=20
>> >> Alex Benn=C3=A9e
>>=20
>>=20
>> --=20
>> Alex Benn=C3=A9e


--=20
Alex Benn=C3=A9e

