Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E2481F6C56
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Jun 2020 18:48:00 +0200 (CEST)
Received: from localhost ([::1]:55958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jjQMx-0002pL-3u
	for lists+qemu-devel@lfdr.de; Thu, 11 Jun 2020 12:47:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jjQKB-0000Om-HS
 for qemu-devel@nongnu.org; Thu, 11 Jun 2020 12:45:07 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:37136)
 by eggs.gnu.org with esmtps (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jjQK9-0002uC-Mf
 for qemu-devel@nongnu.org; Thu, 11 Jun 2020 12:45:07 -0400
Received: by mail-wr1-x441.google.com with SMTP id x13so6884902wrv.4
 for <qemu-devel@nongnu.org>; Thu, 11 Jun 2020 09:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=Igy9T1pDgIFL902i3w5kmVN1kTaLG7z8EZW08E5zO/M=;
 b=LplhrbL+deSxKcD+2kuWTD+4sbSXOliVbo0WyV3YOogVtbQwH9wy/9HRh16/X6lAAz
 6XYmqu+KarNIAa2Hseq6uOw7Znu4SmzK9CV30Hc4MVpLFr6oGXtZoo0OEyq2R1ywGirT
 vzlPCS6b6bkqU8rujqz4b4/h/lfy6bptptfKwZsbeQIcNnSUcQCxGy5PopJLSd/QP1f0
 LKeVNbJXCBbC9gKl7QEH2ICsGhxPkySqyOeD9GQnz7ZVWJ1iTlpfioX+6J9mmX+s+avZ
 H6MfqYBQuRr6nRBJu5F6r0RRqJpo1zIsQVi67Bgwg+tmr/mFuXU1vkkG6MQ2HGnJNp0u
 Mw9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=Igy9T1pDgIFL902i3w5kmVN1kTaLG7z8EZW08E5zO/M=;
 b=iwhFaBqk9t/rj8zx9q2MfT8KMW3BLEmlUQK2JdyNgL4BKrOjZD3eGfqBDsX+MLrVJs
 KiXn3U9hV6LkuIS/sGnZ6pwTBqiFI4Dp18fgGCTyBEyXAUPI7oi9eOcp7y5kvUEL/abo
 KcH6ijKS8c3Mgxo4R6QNsWKpy1BQ3jmmvf2oJTkLn7qkW59sNsapUsubstdTiChIvlx3
 UKzNn2XZBg4UoI7xOHOaMJ/rJ4Hkta9QEDz8mqlpfddZkyzsHJQaMW1FOVON9REhH/jC
 csNAWmlNfpMiBYFp40ROpFuMgGXiwXf24ifKN+oKKN/T6RCSgY7SZKwOpyCR3nmoWNWz
 dkJQ==
X-Gm-Message-State: AOAM533EucdQmYFgbN/miNSM+ThxOCJO2d5rVZcf2oxBKSuckcDEY2j8
 dL6DLyjQkmzr46jWsE2X52PN1w==
X-Google-Smtp-Source: ABdhPJz2BIuyd3CTz2auTzGhbKw1y3TSRuNsABK0QvHdADH00uIoZme5PEBHagoBmrPz1cww1CX6mQ==
X-Received: by 2002:a5d:6b86:: with SMTP id n6mr10181689wrx.167.1591893892927; 
 Thu, 11 Jun 2020 09:44:52 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o15sm5755659wrv.48.2020.06.11.09.44.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jun 2020 09:44:51 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DA1BB1FF7E;
 Thu, 11 Jun 2020 17:44:50 +0100 (BST)
References: <20200610203942.887374-1-richard.henderson@linaro.org>
 <20200610203942.887374-6-richard.henderson@linaro.org>
User-agent: mu4e 1.5.2; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 5/5] configure: Add -Wno-psabi
In-reply-to: <20200610203942.887374-6-richard.henderson@linaro.org>
Date: Thu, 11 Jun 2020 17:44:50 +0100
Message-ID: <87bllp4kn1.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> On aarch64, gcc 9.3 is generating
>
> qemu/exec.c: In function =E2=80=98address_space_translate_iommu=E2=80=99:
> qemu/exec.c:431:28: note: parameter passing for argument of type \
>   =E2=80=98MemTxAttrs=E2=80=99 {aka =E2=80=98struct MemTxAttrs=E2=80=99} =
changed in GCC 9.1
>
> and many other reptitions.  This structure, and the functions
> amongst which it is passed, are not part of a QEMU public API.
> Therefore we do not care how the compiler passes the argument,
> so long as the compiler is self-consistent.
>
> Cc: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> TODO: The only portion of QEMU which does have a public api,
> and so must have a stable abi, is "qemu/plugin.h".  We could
> test this by forcing -Wpsabi or -Werror=3Dpsabi in tests/plugin.
> I can't seem to make that work -- Alex?

modified   plugins/Makefile.objs
@@ -5,6 +5,7 @@
 obj-y +=3D loader.o
 obj-y +=3D core.o
 obj-y +=3D api.o
+api.o-cflags :=3D -Wpsabi
=20
 # Abuse -libs suffix to only link with --dynamic-list/-exported_symbols_li=
st
 # when the final binary includes the plugin object.

Seems to work for me.

--=20
Alex Benn=C3=A9e

