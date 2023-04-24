Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B62136EC892
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 11:18:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqsKy-0007ZP-PD; Mon, 24 Apr 2023 05:18:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pqsKj-00073u-Qq
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 05:18:08 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pqsKd-0003CZ-9Y
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 05:18:05 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3f1958d3a53so27449445e9.0
 for <qemu-devel@nongnu.org>; Mon, 24 Apr 2023 02:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682327868; x=1684919868;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DVktBb8QeggkKBIykACOSAkwwiHMPkq4qzFh96IKqzM=;
 b=ZnRfCyr/996O96qokik386yaDiPFDByXzHg7n2Cw/L+ghX58GNZeVv6i8zmw2//U8C
 yxlnaQW8Pfjd/GsNh45bx/TqeMvoaSy+v5vHenss44MhIWW68DzKR4n3hi37HZMNCSb1
 LQRwMmmhVKlHmkVpZ/AN4u+/hdqorDmYW214F7SCkSYtsoKFak951xQfS9YD1TT7v1gq
 Z1ykwMlFmJA4QtNziikACYQVh85PqU5cJUJE0vJ1iR0FgYFZ4ZflpqiZQtYgP5HgVMyf
 AqzPHRc3BFxJTltd7Y9e+yVaslqLNcOo8vtqxbstl4ip45iqi4Ogx9ahDTAecbuVvw84
 U5kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682327868; x=1684919868;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=DVktBb8QeggkKBIykACOSAkwwiHMPkq4qzFh96IKqzM=;
 b=g/WayB+gQ9boSURLurcTrqNNRHVChYPltRZyXf8I0VsmPOJzcVl0urmMIfAwcDi/AL
 ONDXhmqKY5I4v50HxmA8cby4hmRtARmk11svuU6gZPze/D1xzsO8L09jiV4oquWN2qfD
 mlgDjVnEzya5kGP4A45G0YAeK909H/byYSsQJufgvkLAkp6QJclIhZ+2+vTHDNz5TNJx
 cJScf/xbT5Gyw/Rv6av2sZbEIeXOVzrkFQEo/+g0LGJ1Xm/wXaHt0zMLSzF66eKZMEBv
 Yqas4aUSM+D8AP860sPM8iShSTQ7kw+Hh4ePOYMhXpfw2WXxfTbwMptqTY2hgIr0UX8x
 2KvQ==
X-Gm-Message-State: AAQBX9eH0u3QM4c894BWMn7sYl8CIMnDMwPyNevZK85M8OyrvCBCErSf
 e4jGYi/lGBrgixo1hgQSgJipAA==
X-Google-Smtp-Source: AKy350ayRkYUKB+DYieLr3x1wMWu6nbPiFUxNAMPs5Aj/9t3OsNKRzKurEC21XPbQSG3hAouTiNxZQ==
X-Received: by 2002:a7b:cb47:0:b0:3f0:967e:2cfb with SMTP id
 v7-20020a7bcb47000000b003f0967e2cfbmr7559655wmj.36.1682327868649; 
 Mon, 24 Apr 2023 02:17:48 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 q9-20020a1ce909000000b003f177c3672dsm14795271wmc.29.2023.04.24.02.17.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Apr 2023 02:17:48 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D6E881FFB7;
 Mon, 24 Apr 2023 10:17:47 +0100 (BST)
References: <20230421052255.5603-1-krm.taha@outlook.com>
 <20230421052255.5603-2-krm.taha@outlook.com> <ZEI4jQvHfU+JGFH9@redhat.com>
 <CAHNti2dQnbmAO5hTyb6krd8tSMCqXDp80BEcd0ZUHXmk0LZS-w@mail.gmail.com>
 <87sfct9mm6.fsf@linaro.org>
 <CAHNti2d5JH9EupsOLs0e2o-2ifeEumR5XUqPkbG1u2x6QtOCqg@mail.gmail.com>
 <CANCZdfr=32YFV0mHJxJn0F3aNUQT5YccQdRYdtq1au6BFF8WHw@mail.gmail.com>
 <CAHNti2d1ZEsop_YDJ40ymwayieK2vbkA5rPnX3VT_8a=6igksg@mail.gmail.com>
User-agent: mu4e 1.11.3; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Karim Taha <kariem.taha2.7@gmail.com>
Cc: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH 01/11] Signed-off-by: Karim Taha <kariem.taha2.7@gmail.com>
Date: Mon, 24 Apr 2023 10:14:11 +0100
In-reply-to: <CAHNti2d1ZEsop_YDJ40ymwayieK2vbkA5rPnX3VT_8a=6igksg@mail.gmail.com>
Message-ID: <87o7ndabb8.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Karim Taha <kariem.taha2.7@gmail.com> writes:

> I made a fork on gitlab and pushed a branch at
> https://gitlab.com/Kariiem/qemu/-/tree/gsoc23-task3/ .

OK so I can see the original commits are not following the correct form
so this wasn't introduced by the tool send the emails. As Daniel
mentioned previously the format of the commit message is:

  [subsystem ref]: short description of commit

  A few more lines of explanation about the commit that explain
  why it does what it does.

  Optional bug reference
  DCO tags (Signed-off-by, Reviewed-by, Acked-by etc)


>
> On Sat, Apr 22, 2023 at 1:18=E2=80=AFAM Warner Losh <imp@bsdimp.com> wrot=
e:
>
>  Usually this means pushing a branch off of mastar to a service like gith=
ub or gitlab, and then
>  posting a URL with where to get it.
>
>  Warner
>
>  On Fri, Apr 21, 2023 at 4:40=E2=80=AFPM Karim Taha <kariem.taha2.7@gmail=
.com> wrote:
>
>  It was sent with git-publish, what do you mean by pointing to a branch?
>
>  On Fri, Apr 21, 2023 at 7:22=E2=80=AFPM Alex Benn=C3=A9e <alex.bennee@li=
naro.org> wrote:
>
>  Karim Taha <kariem.taha2.7@gmail.com> writes:
>
>  > On Fri, Apr 21, 2023 at 9:17=E2=80=AFAM Daniel P. Berrang=C3=A9 <berra=
nge@redhat.com> wrote:
>  >
>  >  On Fri, Apr 21, 2023 at 07:22:45AM +0200, Karim Taha wrote:
>  >  > From: Warner Losh <imp@bsdimp.com>
>  >  >=20
>  >  > Allow guest_base to be initialized on 64-bit hosts, the initial val=
ue is used by g2h_untagged
>  function
>  >  defined in include/exec/cpu_ldst.h
>  >
>  >  This commit message is all incorrectly structured I'm afraid.
>  >
>  >  There needs to a short 1 line summary, then a blank line,
>  >  then the full commit description text, then a blank line,
>  >  then the Signed-off-by tag(s).
>  >
>  >  Also if you're sending work done by Warner (as the From
>  >  tag suggests), then we would expect to see Warner's own
>  >  Signed-off-by tag, in addition to your own Signed-off-by.
>  <snip>
>  >
>  > Alright, thanks for the commit formatting tips, I resent the patch ser=
ies, with my signed off by
>  tag and the
>  > author signed off by tags as well.
>
>  Hmm something has gone wrong. Was this sent with a plain git-send-email
>  or using a tool like git-publish?
>
>  Can you point to a branch?
>
>  >
>  > Best regards,
>  > Karim
>
>  --=20
>  Alex Benn=C3=A9e
>  Virtualisation Tech Lead @ Linaro


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

