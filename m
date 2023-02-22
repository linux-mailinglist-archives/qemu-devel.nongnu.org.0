Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB6F269F2B9
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 11:30:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUmNo-0000G5-Hb; Wed, 22 Feb 2023 05:29:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pUmNm-0000Ah-1N
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 05:29:54 -0500
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pUmNj-0003lD-Ut
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 05:29:53 -0500
Received: by mail-lj1-x231.google.com with SMTP id e9so7227143ljn.9
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 02:29:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p3o9MRBx2P5Mv8+nPSyvmjfcnSdEvtI0Jglr0f/wQOs=;
 b=W45cNhOzo9dnWYYhOPuia24OWsVRmOl+PiV0NEwyChLvSMZDMFa6oZRqLTZNppAsqF
 WOai+9vBP/BFC0hKf2nnSNt6VTR1u1KuMA/xnjSvYw30XMdmRy5R0SatvLqxP0398S/B
 rfoGh/1l5ulRYq8t8EnHu6pdyyqPVwPZph3yfrnUnuNKwDTPq5Oa0trCUmp0IubUu/uF
 zmbEIQJ1y3vnHCJW0QQl7XHmh8th367YoXBx97+deDe2skIo2jdvRDq8qicU5Bqc1RHb
 BzM+v1haUWA101ZvifAkH9Fxa4/GD3dMDFqJsbd52VBsn0WvSwpeGUZw5qnYY8yr2S9x
 X41Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=p3o9MRBx2P5Mv8+nPSyvmjfcnSdEvtI0Jglr0f/wQOs=;
 b=UfDm9KfQ+J2fC9N3xf80I+sKvm7/Ep8zwm0c7DUea5IKFv0nHHm0PDXPMHfcps4vQ+
 a/65uBM5UVy1oUQVCv4pDfWV88/N6UZRSNH5bNomiNMv4CEGZD443jLOgCeQlf4IrB8T
 cNpQ+rbgZ6Cbt2gdaQASE0LcK5oUoRak7OAloBdWMCFHVbhkCCmrvlzClJbyQZjvdSBq
 GRv7zm2apCZ4YOF/+oCuCnxl2KM8CBWBEAXFQtCWcC4KMVmV4xh97ubtYAED0/qIxIyx
 YQiHSyt0tFEENxmRWqUSNPwIqgVZza8Bgu8KMdyBATBa7FHVGMVM2jpzWXNT5U8owYBO
 vWMQ==
X-Gm-Message-State: AO0yUKW/VAjwqaAPI8hIiEuzXNQXwQkJSBbnhYrOVUdGGh7iJJVKMlMS
 HnvcLW55g6X1nXU3j2q1uQCEPIcAoAol6UsxKIo=
X-Google-Smtp-Source: AK7set+Fa1d8tQSqWYoIwuH9RQf+U+m399kvqTIXKZBJdWcZQRBQRyDyndBkalRMlgJoCIV5MvXYmf8R6n0Ho7/N7Us=
X-Received: by 2002:a05:651c:b9b:b0:295:945d:b382 with SMTP id
 bg27-20020a05651c0b9b00b00295945db382mr1072329ljb.4.1677061788816; Wed, 22
 Feb 2023 02:29:48 -0800 (PST)
MIME-Version: 1.0
References: <20230207142535.1153722-1-marcandre.lureau@redhat.com>
 <20230207142535.1153722-8-marcandre.lureau@redhat.com>
 <87fsb4k85h.fsf@pond.sub.org>
 <CAMxuvax6qPYQCzNX7vESJM9_f5k4C1Yat0sJcJjrHkh_1WGpQA@mail.gmail.com>
 <87a61821y3.fsf@pond.sub.org>
 <CAJ+F1CJNgmf+j36wutNMdPYBShoZUXJvzEBGEVwW-B-Z6Tc3ug@mail.gmail.com>
 <87356yq9rs.fsf@pond.sub.org>
In-Reply-To: <87356yq9rs.fsf@pond.sub.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 22 Feb 2023 14:29:37 +0400
Message-ID: <CAJ+F1CK-WExedoeNouJZPmaiCr9H4S_tCjVaO4WX-O7jo56C0Q@mail.gmail.com>
Subject: Re: [PATCH v3 07/10] qapi: implement conditional command arguments
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Beraldo Leal <bleal@redhat.com>,
 Eric Blake <eblake@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Michael Roth <michael.roth@amd.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::231;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x231.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Hi

On Wed, Feb 22, 2023 at 2:23 PM Markus Armbruster <armbru@redhat.com> wrote=
:
> > Another option is to always pass a dummy last argument? :)
> >
> > void command(first,
> > #ifdef A
> >     a,
> > #endif
> > #ifdef B
> >     b,
> > #endif
> >     dummy)
>
> Yet another option:
>
>   void command(first
>   #ifdef A
>       , a
>   #endif
>   #ifdef B
>       , b
>   #endif
>       )
>
> [...]
>

Since I think we always have a first argument, that might be indeed
the best solution. I'll try that. thanks

--=20
Marc-Andr=C3=A9 Lureau

