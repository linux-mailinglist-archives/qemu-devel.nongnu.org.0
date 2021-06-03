Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E9739A81D
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 19:21:42 +0200 (CEST)
Received: from localhost ([::1]:58776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lor2L-0000Dk-RJ
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 13:21:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lor0R-0005Hy-Js
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 13:19:43 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:33428)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lor0P-0001MJ-6E
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 13:19:43 -0400
Received: by mail-wr1-x42f.google.com with SMTP id a20so6682464wrc.0
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 10:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=TkqT1+TowmW57sGfGTc3DlZxqsHTBTeS1AErxqenm9A=;
 b=U3XlwJnJgvnRjsy+aLmpcpF4Ktyq2JV+U+NQP6KPfPhxHuWWZ1esBm8SIqWdg5bYYv
 fSxdDWKAOwI6vwYtBo6XqEckqtHuVk6rAo7GLF9hZP0Wjufv5o/PbU0e1KNFTvEXJ7fD
 FBNF9HmRv53pvbqsDn5GStMi9Wpfdc2T8QwgSWQo8hYST70awfNXDuB4qbSxP+sQsTWO
 LlyFp3ejtYOWesKv+vgZcoyjIjGkoBUenZp0hVQMv7+3HWSgB6Hxhf+zopEbzcsjrX0i
 KnKxcdBzsKYS+TOXIym1glEJxmG8RN95F00sFTLyY3BdA+uvuWBOIKdTgOIIfEbMpQDw
 Y7Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=TkqT1+TowmW57sGfGTc3DlZxqsHTBTeS1AErxqenm9A=;
 b=amYQ0a9qdQjNnU3lA4FO7Ki1467cJbum6UXbefljaOqKDxSR9CJP6DUkYPMZYYMkow
 Y7Pk7RAB6NbrQ8QmjMdw+jOvSVLd3tHIHE1s3hmSIa1IiTvkjtiqAanFfoGwNJDziqWI
 D9fIFO0UEyYgdf8CzqdlYfuTN7TwY4eG14EgQXSg0X1gt4jcPf3tJKrNYXtAc0P/K+0z
 R4JsCz69cDFdqlTdR0DlHWhrPpxwDkEBIJeGg+3pjooiRIWO5z9hNKY6xEKg76hltIpE
 bLiGFtab7ISPmiRxeaHIN1jzVcD1j7YmBqrAoT9cd646VTdWvQcj28o48E2HhABoY/6R
 ZtMA==
X-Gm-Message-State: AOAM533GAhoyHE/7fT1d1d0sAR48EuVfLBU5ERGhjFj56FxZRZfrafOO
 PgKPYYdUMw9wbZ+QspBeKKWVvw==
X-Google-Smtp-Source: ABdhPJxKZ+TCBVWILSYRwkgYSWmdMMIcO6ceGovQN6hdgjbouLA4lTxtJGVzUtmIZWgnvEs3P/+eeA==
X-Received: by 2002:a5d:4b87:: with SMTP id b7mr46972wrt.129.1622740779689;
 Thu, 03 Jun 2021 10:19:39 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id p1sm3456350wmc.11.2021.06.03.10.19.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 10:19:38 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9D05C1FF7E;
 Thu,  3 Jun 2021 18:19:37 +0100 (BST)
References: <20210526170432.343588-1-philmd@redhat.com>
 <20210526170432.343588-3-philmd@redhat.com>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v8 02/12] accel: Introduce 'query-accels' QMP command
Date: Thu, 03 Jun 2021 18:19:15 +0100
In-reply-to: <20210526170432.343588-3-philmd@redhat.com>
Message-ID: <87r1hi7tna.fsf@linaro.org>
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
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, John Snow <jsnow@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> Introduce the 'query-accels' QMP command which returns a list
> of built-in accelerator names.
>
> - Accelerator is a QAPI enum of all existing accelerators,
>
> - AcceleratorInfo is a QAPI structure providing accelerator
>   specific information. Currently the common structure base
>   provides the name of the accelerator, while the specific
>   part is empty, but each accelerator can expand it.
>
> - 'query-accels' QMP command returns a list of @AcceleratorInfo
>
> For example on a KVM-only build we get:
>
>     { "execute": "query-accels" }
>     {
>         "return": [
>             {
>                 "name": "qtest"
>             },
>             {
>                 "name": "kvm"
>             }
>         ]
>     }
>
> Reviewed-by: Eric Blake <eblake@redhat.com>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
> v8:
> - Include code snippet from Markus adding to machine-target.json
>   to be able to use enum values or union branches conditional.
> - Use accel_find() on enum to be sure the accelerator is enabled
>   at runtime (chat with jsnow / eblake).

Hmm something broke because now I get:

 /usr/lib/x86_64-linux-gnu/libpixman-1.so -lgthread-2.0 -lglib-2.0 -lstdc++=
 -Wl,--end-group
/usr/bin/ld: libqemu-aarch64_be-linux-user.fa.p/accel_accel-qmp.c.o: in fun=
ction `qmp_query_accels':
/home/alex/lsrc/qemu.git/builds/arm.all/../../accel/accel-qmp.c:15: undefin=
ed reference to `Accelerator_lookup'
collect2: error: ld returned 1 exit status
[1327/1413] Linking target qemu-io

--=20
Alex Benn=C3=A9e

