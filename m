Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ABAC6F3F7F
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 10:45:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptlcp-0006vU-73; Tue, 02 May 2023 04:44:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ptlcn-0006vC-2j
 for qemu-devel@nongnu.org; Tue, 02 May 2023 04:44:41 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ptlcX-0005Ap-Dq
 for qemu-devel@nongnu.org; Tue, 02 May 2023 04:44:40 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3f18dacd392so20195945e9.0
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 01:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683017058; x=1685609058;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6yBT+jk0zF02dFSjk6ZPky87zfpiIZyKiTNsuhMTZAg=;
 b=m0I4FdUKebdGiixxKuRDc11M0a8hLt++xF4mUPdy8RaiEzSupIdRyf327wr6xhcN5x
 zupIBUksLQtww5Ro+tsR7lO4zUly4FvbS68MhZ77NfkV2cLPnWHnN67XCUDiRrcaRJR1
 8RkOZlnTnHJuoRnspQPM+xhko7l7qxxPKC8C59og0+NeE1NCtHdJ3O5wPHJGvjGEq3n8
 tMG8hSRSwPuOxe5t8E6VM224CvXTux2wy0DG3HkVV/3CUJ9Wtb6ZghF0nMNkyDlSUzO3
 5nPE5m9Edbs99mqn0/6YDKkCmcKMl99J3x3exiDqJnGzAXea0PU5Y/jot7sQoxK8I+p5
 JVnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683017058; x=1685609058;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=6yBT+jk0zF02dFSjk6ZPky87zfpiIZyKiTNsuhMTZAg=;
 b=GtmzynOy0DDUE+CK6mvxkwIL98n9j+h0Cm6N5NHM6e+2VcPNcqFz10qPV0Hs65uHrV
 nSJLDDhbA0Z049VxdkQEWw1C/iGqj9ZLNTr9GdgX02f2Il91Owi863RZaY5K3cFokvox
 S1NrMp1g0mhmJtOn9zOeOeKHuczyFPwyy+EZ0h2E3m6xXCRgBrgWLwrkEFb6dgdDlj4j
 HzBCr7GfB2q7aWLNy/BNPnbYyaTaagH8SZP79ZA3Lf7lfyvCS2pg8yGeIpLFvwK0lu8g
 1Ri96X6xM2NZekJjp0SgPwJM5aB9lWpiT+pkI8OZj10yjxTA+nmNr3KmeK1v8aATe5Y+
 7oNw==
X-Gm-Message-State: AC+VfDyvzi1PxmDXgCiXIagJnMllQTPHGpv3Q8FGJELVF3KSVQ9XEkH6
 1OiDy7T70yhujNJcZLK4NMPSfSSpvFPl2rxZd0nFow==
X-Google-Smtp-Source: ACHHUZ7gL8r3Arjw3zNdICq1ZIfWwe5HdC+06QGcTuUQVWadtcVjBrnYo3tzOY7QWwdpqQHTXcwBEw==
X-Received: by 2002:a7b:cc05:0:b0:3f0:683d:224d with SMTP id
 f5-20020a7bcc05000000b003f0683d224dmr11236391wmh.9.1683017058554; 
 Tue, 02 May 2023 01:44:18 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 v9-20020a05600c444900b003f173be2ccfsm50460748wmn.2.2023.05.02.01.44.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 01:44:18 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6B4D41FFBA;
 Tue,  2 May 2023 09:44:17 +0100 (BST)
References: <20230501204625.277361-1-richard.henderson@linaro.org>
User-agent: mu4e 1.11.4; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH] qemu/int128: Re-shuffle Int128Alias members
Date: Tue, 02 May 2023 09:44:11 +0100
In-reply-to: <20230501204625.277361-1-richard.henderson@linaro.org>
Message-ID: <87h6svt95r.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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


Richard Henderson <richard.henderson@linaro.org> writes:

> Clang 14, with --enable-tcg-interpreter errors with
>
> include/qemu/int128.h:487:16: error: alignment of field 'i' (128 bits)
>   does not match the alignment of the first field in transparent union;
>   transparent_union attribute ignored [-Werror,-Wignored-attributes]
>     __int128_t i;
>                ^
> include/qemu/int128.h:486:12: note: alignment of first field is 64 bits
>     Int128 s;
>            ^
> 1 error generated.
>
> By placing the __uint128_t member first, this is avoided.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

