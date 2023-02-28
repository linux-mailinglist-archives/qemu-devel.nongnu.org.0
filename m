Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 768B66A5C23
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 16:39:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX22e-0002Rj-UF; Tue, 28 Feb 2023 10:37:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pX22c-0002QX-Iq
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 10:37:22 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pX22a-0001xs-Vu
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 10:37:22 -0500
Received: by mail-wr1-x432.google.com with SMTP id q16so10230465wrw.2
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 07:37:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yjWNHklG9arox4h/VhJgA14/k0jGYzRWk+vxaHKyP5s=;
 b=sJKzdbxct00OC60YX93cn9gX7RNyJa7LKJpjD39ad7SS+wWSyhiAVyxget+weVUS1F
 izgKeb8ORttVFltqEvusOgiB8QHNIdji+X4SloDRh06jzu1Dbqcrvk7yw0wTxTwLZ5SZ
 m+zg7q3iWTaxWZxLsqfNtEtibofdugNGbpkWu6gR6up1BNgWBBuLg+SkVY+wwbi/n8nL
 GHmbRg5hJPUhUNKZfdiUxg34Rht4QXYdhubtobSktCmV88uNR+z4i2vlNPxH3rP55mbd
 e6pH4K/UPEkjpPZLlgiuJ8LoW8E91dGUXwxkkq6zAziDtaD4WCuiMJEQRPbnhDTfIM5/
 SZdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=yjWNHklG9arox4h/VhJgA14/k0jGYzRWk+vxaHKyP5s=;
 b=G0ocjk0DvzFM9dfIGLJBjrb8XR1+XCiGUDKsNiMHqJjgGUAqwcrCdxVRNR2ar62JqJ
 ZMMoojF5E+IXK1jNegCEGU/WgatKgOSSfgRIDqbH12+yu4+e96hkjNtl/DFn4VKG/O9B
 AFrRoyZrNBFyCO6HcPkzT1e6QpSXMEJMZLw52ikqQ++2KL8UlcKbZvtva9DxV5o5/sNW
 CHRx0ZfKTpwlj5XRbxS4+KeGsWv/MqSDa6waRVorGp3pGbdWXx1MjWU7rYMUNkaTU34B
 o9pDo2K2qwhnTpeXYfJM77WwVP7ZI4NmGbleWPFwu1pQ7T9egCmMzTIRcnqdxPInI4Rr
 HauQ==
X-Gm-Message-State: AO0yUKUzlS/74Ksz8u5WnZA5srpbVGbTyv762V2bZkua45tdj8Nns90i
 jHMPOE4nvRQ7Ll9cMH7SFGzLtA==
X-Google-Smtp-Source: AK7set/e+PO4NRrXE9pra5AI4R3e21PixR02JZzgBVip0glSrFrEKx7e5HR4jx8vNCJSC8lbdbDPgQ==
X-Received: by 2002:a5d:4752:0:b0:2cb:3deb:c014 with SMTP id
 o18-20020a5d4752000000b002cb3debc014mr2463383wrs.28.1677598634414; 
 Tue, 28 Feb 2023 07:37:14 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 u4-20020adff884000000b002c70851bfcasm10073499wrp.28.2023.02.28.07.37.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 07:37:14 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A42921FFB7;
 Tue, 28 Feb 2023 15:37:13 +0000 (GMT)
References: <20230227174019.1164205-1-rjones@redhat.com>
User-agent: mu4e 1.9.21; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: "Richard W.M. Jones" <rjones@redhat.com>
Cc: alxndr@bu.edu, pbonzini@redhat.com, bsd@redhat.com, stefanha@redhat.com,
 thuth@redhat.com, darren.kenny@oracle.com, Qiuhao.Li@outlook.com,
 fam@euphon.net, lvivier@redhat.com, berrange@redhat.com,
 qemu-devel@nongnu.org
Subject: Re: [PATCH] tests: Ensure TAP version is printed before other messages
Date: Tue, 28 Feb 2023 15:37:07 +0000
In-reply-to: <20230227174019.1164205-1-rjones@redhat.com>
Message-ID: <878rghg5sm.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
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


"Richard W.M. Jones" <rjones@redhat.com> writes:

> These two tests were failing with this error:
>
>   stderr:
>   TAP parsing error: version number must be on the first line
>   [...]
>   Unknown TAP version. The first line MUST be `TAP version <int>`. Assumi=
ng version 12.
>
> This can be fixed by ensuring we always call g_test_init first in the
> body of main.
>
> Thanks: Daniel Berrange, for diagnosing the problem
> Signed-off-by: Richard W.M. Jones <rjones@redhat.com>

Queued to testing/next, thanks.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

