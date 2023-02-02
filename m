Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5715768852C
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 18:14:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNd9L-0007HC-44; Thu, 02 Feb 2023 12:13:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pNd9G-00078U-TI
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 12:13:24 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pNd9E-0006lj-Fe
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 12:13:22 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 c4-20020a1c3504000000b003d9e2f72093so4234694wma.1
 for <qemu-devel@nongnu.org>; Thu, 02 Feb 2023 09:13:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bOAUJjmKeQNLjKQRMTa5Ijc1PR1bnBeSgRlcQe8k7Xo=;
 b=jC50paXWykdLBrzd7wqstwvQTiwFAPo6Z3k/tf/VzwBN40CnVIiyChe5ynBkk/CZYu
 cWgZ44J+ZHBdU6C0tZa+DLIMbb18Vu6IFsFm8uLq85VNirDPM3bnBA3dvqKAegwXBWwb
 cM1Th9BPzm15upaBHvUzyk3cmEU6pfK1pLEJEq3wa9Zfce7QMbkwwIBiLKpLZH7lcKZi
 OUoTFbSVjmPVgxPLw1Vdim/C6e7RfRC7Ux2ENThyVSwlcgy/zI8xrzG5suMrzl0nl0ya
 0yV37aVZdiCDFx/2icKAlODaGQa5VSuhT12hF8BWALpAUZmOJd8tbzGX8us4FlnWGq8Z
 AUEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=bOAUJjmKeQNLjKQRMTa5Ijc1PR1bnBeSgRlcQe8k7Xo=;
 b=Eee/df5m9eB/UsyuLpKKOWsFdQM37Dn+1CSnXQy8o/EqDI+pRciZcl03aSCy2RZQPc
 jwVWYtqVvV9MyiKfYxTorlWSIFFCkGbWANbeDZ4oFEIb5kICwCQUkJImm/oCatOiPGlE
 dmHUWU7tl88hSQ896QbzWdAS+lzQvRr4QI85axSHrj9EvGM4GUhnCd6UXmshg3VEak01
 KJ5KDB6miO4uCbsTf33yK94oWvfWiMbgOYxO792rbLCgK6X8kcHUV4d9nEWXcznv0Ms/
 rLVorKV7BSPewudTceS7owEt/ytWL6c5se4iJ2WsD30XA9PGzhlo9ljdVvYMnaOGs6lb
 xWAA==
X-Gm-Message-State: AO0yUKWffnM01/0kr9a7HqbgFDpbNiImOhDaperPGQ9ByUsC/98QiwrV
 bwbkSTvgsV5dnb/gZ8uJtiKviw==
X-Google-Smtp-Source: AK7set9RKMdJCy6v1BDs40kewFfJU3MGTb1Q/wqpIJjRo83+mV/hPyrffGuVkmNAXGOjuqlNU5qQ5g==
X-Received: by 2002:a05:600c:3d06:b0:3df:dc0d:f0b3 with SMTP id
 bh6-20020a05600c3d0600b003dfdc0df0b3mr2711200wmb.9.1675357998640; 
 Thu, 02 Feb 2023 09:13:18 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 w10-20020a5d608a000000b002bfd8ad20a0sm16306wrt.44.2023.02.02.09.13.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Feb 2023 09:13:18 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 92DED1FFB7;
 Thu,  2 Feb 2023 17:13:17 +0000 (GMT)
References: <20230126112250.2584701-1-alex.bennee@linaro.org>
 <CAFEAcA_TCHw2b=zOWOX7COLa-iqC1P8Bm1wiACKhmx32cuS8SA@mail.gmail.com>
 <877cx11cpq.fsf@linaro.org>
 <CAFEAcA_beYVNurYS3CE9x=H5mn1F3jwCiZo-CmEPsN7syB0Sjw@mail.gmail.com>
User-agent: mu4e 1.9.19; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: Re: [PULL 00/35] Testing, docs, semihosting and plugin updates
Date: Thu, 02 Feb 2023 17:12:43 +0000
In-reply-to: <CAFEAcA_beYVNurYS3CE9x=H5mn1F3jwCiZo-CmEPsN7syB0Sjw@mail.gmail.com>
Message-ID: <87a61wkn2q.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


Peter Maydell <peter.maydell@linaro.org> writes:

> On Wed, 1 Feb 2023 at 18:07, Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:
>> Peter Maydell <peter.maydell@linaro.org> writes:
>> > I think this is "you can't put labels in qemu-options.hx,
>> > because it gets included in two .rst files (invocation.rst
>> > and qemu-manpage.rst), and Sphinx complains about the
>> > duplicate labels, even though one of the two files is
>> > only used in the HTML and one is only used in the manpages".
>>
>> Oh boo - anyway to work around that because they are helpful links?
>
> Nothing easy. The problem is that Sphinx looks at every .rst
> file in the source directory, regardless of whether it's
> reachable from the document you specify as the root of the
> manual or not. So both lots of .rst files get processed
> for both the HTML manual set and the manpages, even though
> they don't need to be[*]. This is a long-standing design
> deficiency in Sphinx. The only thing I could think of was
> splitting the manpages and html docs entirely into separate
> subdirectories, and having meson symlink the files which are
> actually shared between them. But that seems like quite a lot
> of extra machinery.

OK I've scrubbed the back links and sent v2 (which also reduces the
buildtime of cross-win64-system which kept tripping).

>
> [*] This shows up for instance in the HTML docs getting a
> not-linked-to-from-anywhere HTML version of the qemu(1) manpage:
> https://www.qemu.org/docs/master/system/qemu-manpage.html
>
> -- PMM


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

