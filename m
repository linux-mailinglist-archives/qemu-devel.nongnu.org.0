Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 941C530FC93
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 20:25:08 +0100 (CET)
Received: from localhost ([::1]:43204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7kFX-00031M-Fp
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 14:25:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l7jgm-0008Fz-DW
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 13:49:12 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:35014)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l7jgk-0001VG-Sy
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 13:49:12 -0500
Received: by mail-wr1-x42d.google.com with SMTP id l12so4821668wry.2
 for <qemu-devel@nongnu.org>; Thu, 04 Feb 2021 10:49:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=en74di+LzSO3pBdW4pcxaImxoU/XsOIyXRxnSBm7zT8=;
 b=alMWBF9+m7nt33RExNdH3QY1hYi7hC3rD0BTkhc6xA4I7IeXAwlkU1/0fEHkDXzNnQ
 pD3eg0EW6NP3jgr0bcNyQ++Zt6wahowaiLYP8bje244dbkAnhYTXDg8eL0ji0XwJhm/r
 1o/OqoJLjGS9pzIkyE8evD62+TQkVKK50BK5a3HZ22NKw9WwBNCQAxGPdlYkp8VtiO3X
 sntEAmtmGHohY3L0cg9pSXuzGwWxXj8nxV10l3mNzTqMKRKS5FBJvl+0GPR4J38tHqw2
 nZwg/fjEKKpYAPe3q0TKAVGe5ZZemrhlEctwH82/ajrzA698//y1eBB24zWKuCXT5iOI
 +Q6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=en74di+LzSO3pBdW4pcxaImxoU/XsOIyXRxnSBm7zT8=;
 b=ZZ5i57Fm/JSe6p5IEszzmcUQn+ornMcP1moaV09CAlSa5T2UYpp2EAAP8/R7DlRJeD
 +plHTjEagjIOkstYIHuiaFmqWyM/jxpV2OYvX65E4vmXXtA8HfWbJuzInljM6KDfkl/W
 l+woNrNz0Q+zoEX8E/yj28TdvU0HU3u1iBS91UAvp8INpb9YyUK+/C7Eymrw1uoTLyB0
 E7bcTCT71GqtiXr5GdpXK++r1SCfsGyqkbcAScXwFmHn+F/1OcrIhrBvjU6hL7CzjHZh
 awjvrr6rK3Jgu0UlctPtt5bStTADGVLEGvvwTEvaZvv51l4kwa77DaVzQdAlwLlXSGtp
 mCFg==
X-Gm-Message-State: AOAM533yIapahE+6wJT6xzuvphAMjRl4h9py/8ZO2tAP3afGW4shhOvm
 yijvGCpLFhvCFXx9ZlwEUgCwcQ==
X-Google-Smtp-Source: ABdhPJxQs/1iGz83IBWztuQ3tiGoBdzCpGst0b/D6/qj0oS6TcjGkuQP0YVOD6qWgmTsa8add9XgLQ==
X-Received: by 2002:adf:e48b:: with SMTP id i11mr826106wrm.406.1612464548313; 
 Thu, 04 Feb 2021 10:49:08 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 36sm9877177wrj.97.2021.02.04.10.49.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Feb 2021 10:49:07 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9FFB91FF7E;
 Thu,  4 Feb 2021 18:49:06 +0000 (GMT)
References: <20210204014509.882821-1-richard.henderson@linaro.org>
 <20210204014509.882821-30-richard.henderson@linaro.org>
 <87czxfq1t0.fsf@linaro.org>
 <a8651dd2-3cb5-30f2-d8fd-632717a764e3@linaro.org>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 29/93] tcg/tci: Remove TCG_CONST
Date: Thu, 04 Feb 2021 18:48:54 +0000
In-reply-to: <a8651dd2-3cb5-30f2-d8fd-632717a764e3@linaro.org>
Message-ID: <877dnnpt25.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
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
Cc: sw@weilnetz.de, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> On 2/4/21 5:39 AM, Alex Benn=C3=A9e wrote:
>>=20
>> Richard Henderson <richard.henderson@linaro.org> writes:
>>=20
>>> Only allow registers or constants, but not both, in any
>>> given position.
>>=20
>> Aren't we switching to all registers (there are no more _i functions
>> after this)? I guess you mean the registers can have constants in them?
>
> Ah, bad wording.  I think I was thinking of movi, which would be r,i if it
> actually existed in this list (which it doesn't).
>
> Better as
>
>   Restrict all operands to registers.  All constants will be
>   forced into registers by the middle-end.

better thanks..

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

>
> ?
>
>
> r~


--=20
Alex Benn=C3=A9e

