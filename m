Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D283DFCA3
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 10:18:27 +0200 (CEST)
Received: from localhost ([::1]:51582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBC6c-0001dh-U1
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 04:18:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mBC5b-0000v1-IW
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 04:17:23 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:36644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mBC5Z-0006bm-MD
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 04:17:23 -0400
Received: by mail-wr1-x42a.google.com with SMTP id b13so1250372wrs.3
 for <qemu-devel@nongnu.org>; Wed, 04 Aug 2021 01:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=sL11D2KOy7MXGxPdfDMu+r6PLLItgj+Ty96PO6l89Ik=;
 b=SEwOCIEBlotIMRpXmYXcFUlTrWArEvpg4HBO6rnVdfoGXOFonYw7hVFZwBPF3u7rU+
 UY7fKhVdY2PVRV/VByb2lyzL4tF6BDcjZNn3nqga7BjXTCysagG8G8fqkcL0kOPuX5AK
 H6Eg3vo3UjCSdby//sa6DCQsigkstycFEoVv7EAB24VhpQoKfvL9StrO9WKMFQaBuFh0
 wV3V/7Wf0Qi3RxxM29fatnZ6QzueNuh/E7hjFSC61v26r6oFTxATkSDyjcmFIvrldc/b
 RAvfsa4gJ6M8T2+aNFJxApOZVHdA/KJrE49ni8SEpGr+W+Yq/6fopgF5KEs5XSNnNbWR
 QgNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=sL11D2KOy7MXGxPdfDMu+r6PLLItgj+Ty96PO6l89Ik=;
 b=pgfBdPH/R8h4fET5kw6PdgGilRaTxJPwvV3TnDLNIhRVs09+AqFFcMa4dEXiKfWqvF
 0SjUcfyJ2CS/NSzXXRsGQIC/4rWgMjIg0s3Phb3HF8mWX4/ofgOyrE/pxXvwfpc5rj4A
 d0IO8hq0MWuz6DDCJyrW5K1tjY2+9sV5zJPSOxgtPxghLLngWuFKFbNP2L0v4Kzm90vj
 O/jkQvMit8oQHqcLmE7Oif88eAJ2FLs9BbRT+mtjl7MwSj+sNZxpxVvxRr0MtgLoPare
 QQfmoLVnYSFvYAEiIwycKAfVv6+6CRw4fzsYhMuIxDX/TEYg1E8c953JQUvK7CTR6MjL
 ZW5g==
X-Gm-Message-State: AOAM531gOphQd5w8LONzfHnyDtdyr2ySxdplrqcmqIIs21vOEH/niIax
 1QDng1rmCwR7iV/qDyWrntO3+BzPjTf94O1V
X-Google-Smtp-Source: ABdhPJyRRfYjCv0UaEdSP71XYyNTL+bUbrmAVW551JfevWlQoWsSAuLvavVa7qFHZftv9sDjBn3NoQ==
X-Received: by 2002:a5d:4688:: with SMTP id u8mr27484343wrq.65.1628065039177; 
 Wed, 04 Aug 2021 01:17:19 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a9sm1582107wrv.37.2021.08.04.01.17.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 01:17:18 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4EBBD1FF96;
 Wed,  4 Aug 2021 09:17:17 +0100 (BST)
References: <20210801171144.60412-1-peterx@redhat.com>
 <87a6lyf9ux.fsf@linaro.org> <YQnbR0DR3W+pXJ+r@t490s>
User-agent: mu4e 1.6.1; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH] Makefile: Fix cscope issues on MacOS and soft links
Date: Wed, 04 Aug 2021 09:14:45 +0100
In-reply-to: <YQnbR0DR3W+pXJ+r@t490s>
Message-ID: <877dh1fwtu.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
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
Cc: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Xu <peterx@redhat.com> writes:

> Hi, Alex,
>
> On Tue, Aug 03, 2021 at 11:18:36PM +0100, Alex Benn=C3=A9e wrote:
>>=20
>> Peter Xu <peterx@redhat.com> writes:
>>=20
>> > This patch fixes actually two issues with 'make cscope'.
>> >
>> > Firstly, it fixes the command for MacOS "find" command as MacOS will a=
ppend the
>> > full path of "$(SRC_PATH)/" before each found entry, then after the fi=
nal "./"
>> > replacement trick it'll look like (e.g., "qapi/qmp-dispatch.c"):
>> >
>> >   /qapi/qmp-dispatch.c
>> >
>> > Which will point to the root directory instead.
>> >
>> > Fix it by simply remove the "/" in "$(SRC_PATH)/" of "find-src-path", =
then
>> > it'll work for at least both Linux and MacOS.
>> >
>> > The other OS-independent issue is to start proactively ignoring soft l=
inks when
>> > generating tags, otherwise by default on master branch we'll see this =
error
>> > when "make cscope":
>> >
>> > cscope: cannot find file subprojects/libvhost-user/include/atomic.h
>> >
>> > This patch should fix the two issues altogether.
>> >
>> > Signed-off-by: Peter Xu <peterx@redhat.com>
>> > ---
>> >  Makefile | 3 ++-
>> >  1 file changed, 2 insertions(+), 1 deletion(-)
>> >
>> > diff --git a/Makefile b/Makefile
>> > index 401c623a65..5562a9b464 100644
>> > --- a/Makefile
>> > +++ b/Makefile
>> > @@ -229,7 +229,8 @@ distclean: clean
>> >  	rm -f linux-headers/asm
>> >  	rm -Rf .sdk
>> >=20=20
>> > -find-src-path =3D find "$(SRC_PATH)/" -path "$(SRC_PATH)/meson" -prun=
e -o \( -name "*.[chsS]" -o -name "*.[ch].inc" \)
>> > +find-src-path =3D find "$(SRC_PATH)" -path "$(SRC_PATH)/meson" -prune=
 -o \
>> > +	-type l -prune -o \( -name "*.[chsS]" -o -name "*.[ch].inc" \)
>>=20
>> The second half of the change causes my "make gtags" to descend down
>> build directories and complain about unindexed files.
>
> Would this help?
>
> ---8<---
> diff --git a/Makefile b/Makefile
> index 5562a9b464..eeb21f0e6a 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -251,7 +251,7 @@ gtags:
>                 "GTAGS", "Remove old $@ files")
>         $(call quiet-command,                           \
>                 (cd $(SRC_PATH) &&                      \
> -                $(find-src-path) | gtags -f -),        \
> +                $(find-src-path) -print | gtags -f -), \
>                 "GTAGS", "Re-index $(SRC_PATH)")
>=20=20
>  .PHONY: TAGS
> ---8<---
>
> For some reason, "make gtags" didn't use "-print" as the last expression.=
  My
> understanding is when expression is not specified, then it's default will=
 be
> "-print".  However for some reason it acts like that when "-print" is not=
 there
> all the "-prone" expressions are not really behaving.  Above does work fo=
r me,
> but frankly I don't really know enough on how "find" works here.
>
> If you agree, I can repost a v2 with that squashed.

That seems to fix it. I think it's down to the interaction of the
expressions but I agree find can be a bit inscrutable at times.

>
> Thanks,


--=20
Alex Benn=C3=A9e

