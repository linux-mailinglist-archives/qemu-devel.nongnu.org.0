Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB6792FB51A
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 11:04:30 +0100 (CET)
Received: from localhost ([::1]:60564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1nsD-0007CE-Ou
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 05:04:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l1npq-0005w6-R3
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 05:02:02 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:35326)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l1npk-0002DF-MO
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 05:02:02 -0500
Received: by mail-wr1-x42f.google.com with SMTP id l12so13858749wry.2
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 02:01:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=tibif+kP+PU2u8PEKd4eHHKWgik7PIPMkC2WWgaL7xA=;
 b=ZDVkmIGXILbzjfkDqNxaH7LTa9N7JmKTxsrloJ4OGBweGo2twuud92hdnuDLQRpIED
 8f5nTHEarAMVdQg+vGxdQsdlELsOpOwVbX4lgxWrOD0yIvYQ99PAxml+9FjxLVgO4R7y
 b9019SMggXphSgvs8ipb79ry7ldUlrVMraeS6SdugOaw9mo34a7DF19sYayQJ9iDX58h
 0SJr8e3Tr06fONKNvD2QNIVpXLAJBjRHMaI6ctC73XLqTUrXseTgVc5+Zzq+uQYqVV4r
 kBfrpEZZdwk4jGAKQzZpIi8lwjaNUdG2hOEkYgw4CtF/EuZmk8GbmKQ8T085fkpJE9Mg
 JLgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=tibif+kP+PU2u8PEKd4eHHKWgik7PIPMkC2WWgaL7xA=;
 b=meSDH2JFf4YVUV6rpS6ZXcY95RRCWcntBDFMMGL2BYHPRycDZ4ewQ6cbt2oD+gE4Rg
 yGFy/OAEvlqvmhHg1aOQ2Z4kws6TWUQ+f4dQKJQGPDgWEdzYojJoYRdN3uzFAK6U203Y
 n3JjgVb7Y1Fqwc0RV05lkFbl3HvWpYjT6O95Hn7F7TPX6F7viGKUmmIFaaQOOFVTE+bD
 xTAUsi66W44RmnkKVLm4dAMZaJKADE/IeCpSc3dBfgXsC1OtqQIZlODEtTqR5nG/BdCD
 zBNf4GCcxgTrIe+Ygh4g7nhJg6E93tFF8xlyF+C7fiNW1xt4qgP6fJQeQOOHvolo5icd
 xl4A==
X-Gm-Message-State: AOAM533fWvV4hSfG5BFQTVVMZdJjKXFtllydJDlPKiXEBOuUURN6Dh5R
 wOprkEtdbtqCQIaZWzn8UKEDiA==
X-Google-Smtp-Source: ABdhPJz7NGVRZz/1x6KV8XgLwXVsXF5/gIT+D27AoQUyukcbdPW0uyF2tanxAp8MVthtxMP9s2fviw==
X-Received: by 2002:a5d:4587:: with SMTP id p7mr3420171wrq.178.1611050512266; 
 Tue, 19 Jan 2021 02:01:52 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a130sm3515486wmf.4.2021.01.19.02.01.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 02:01:51 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 568D11FF7E;
 Tue, 19 Jan 2021 10:01:50 +0000 (GMT)
References: <20210115130828.23968-1-alex.bennee@linaro.org>
 <20210115130828.23968-6-alex.bennee@linaro.org>
 <CAP+75-XSyx2yCpz5uvx2ZofCGY=9pQ88ffSDRSXVjJk48qXNFw@mail.gmail.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PULL 05/30] Makefile: wrap ctags in quiet-command calls
Date: Tue, 19 Jan 2021 10:00:16 +0000
In-reply-to: <CAP+75-XSyx2yCpz5uvx2ZofCGY=9pQ88ffSDRSXVjJk48qXNFw@mail.gmail.com>
Message-ID: <87h7ndutwx.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
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
Cc: Willian Rampazzo <willianr@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> Hi Alex,
>
> On Fri, Jan 15, 2021 at 2:08 PM Alex Benn=C3=A9e <alex.bennee@linaro.org>=
 wrote:
>>
>> For prettier output.
>>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Reviewed-by: Willian Rampazzo <willianr@redhat.com>
>> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>> Message-Id: <20210114165730.31607-6-alex.bennee@linaro.org>
>>
>> diff --git a/Makefile b/Makefile
>> index 0c509a7704..bbab640b31 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -250,8 +250,13 @@ find-src-path =3D find "$(SRC_PATH)/" -path "$(SRC_=
PATH)/meson" -prune -o \( -name
>>
>>  .PHONY: ctags
>>  ctags:
>> -       rm -f "$(SRC_PATH)/"tags
>> -       $(find-src-path) -exec ctags -f "$(SRC_PATH)/"tags --append {} +
>> +       $(call quiet-command,                   \
>> +               rm -f "$(SRC_PATH)/"tags,       \
>> +               "CTAGS", "Remove old tags")
>> +       $(call quiet-command, \
>> +               $(find-src-path) -exec ctags            \
>> +               -f "$(SRC_PATH)/"tags --append {} +,    \
>> +               "CTAGS", "Re-index $(SRC_PATH)")
>>
>>  .PHONY: gtags
>>  gtags:
>> --
>> 2.20.1
>>
>
> Build now fails if ctags is not installed:
>
> $ if test -n "$MAKE_CHECK_ARGS"; then make -j"$JOBS" $MAKE_CHECK_ARGS ; fi
> CTAGS Remove old tags
> CTAGS Re-index /builds/philmd/qemu
> find: 'ctags': No such file or directory
> find: 'ctags': No such file or directory
> find: 'ctags': No such file or directory
> make: *** [Makefile:254: ctags] Error 1
> make: *** Waiting for unfinished jobs....

Wait what, how? Have you got ctags in your MAKE_CHECK_ARGS? How did it
not fail before?

I suppose we could add checks for all the tooling in meson but it seems
a little overkill for a developer convenience.=20=20

--=20
Alex Benn=C3=A9e

