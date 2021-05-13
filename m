Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F4337F989
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 16:18:34 +0200 (CEST)
Received: from localhost ([::1]:42608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhCAb-00066R-A3
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 10:18:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lhC5O-0000N1-Vo
 for qemu-devel@nongnu.org; Thu, 13 May 2021 10:13:11 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:33409)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lhC5L-0000Ys-CQ
 for qemu-devel@nongnu.org; Thu, 13 May 2021 10:13:10 -0400
Received: by mail-wr1-x42f.google.com with SMTP id n2so27106237wrm.0
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 07:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=TJOKrUBaQIY9pH+BaNB+PHwTHDxHNYwmG1XpjVV0dFc=;
 b=JnNCkJhJfR33/FRVzK9lbRHMnZOKlP8rUnphOaMvHVPg/EGt5QHpjn/AQm9OmgfrQ7
 orsxp5C7CkMpKVdp1xXA+/Pwdyl6SdQbwit9Jjqzr7vy+Y6mjIZe0AfhMhINSWbuJjPo
 ga2Q2mQYnQ+1i3YjYVW6VZhW6xN0BPsNCkB4kYGk7UvZfJFv2QDH44nVcfyJnJ5u5z34
 c+ao/xdawH5Hds1byPLb+PG3VAfiN7DA8288mCyx6dOufTv+rNSbspDvB5WyNU08VMRc
 /gy0EJfAlZzCL4VkZEY8iL9QDuu2hAyLv7ZuuEBl4FJljaRvXAa2kJTIK+ssyoG4v/Zr
 LkuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=TJOKrUBaQIY9pH+BaNB+PHwTHDxHNYwmG1XpjVV0dFc=;
 b=qwn5Y7Rt7paDXGnFo53Yvc+cq/Lej2iLxN/Nrh1pY2hgVe5/bwbOoFX73tBIegSh1X
 IwHL9wBePM/Qn8hDaTUYUlGjyGv59QhlndLBEkTetYAPnH3DUpx4qQC2k+SljRULfDkt
 pgu+QnOrgLADtiNOcVXC7TKXMu6L7Nd9rH/DCmjW/nUPPfSVa3UX/+gUi0d/dENMniy7
 FOvPINAb64aVICn50LIoCC2nCYhkgG68VJAukM/70X5Blu5BN/+N97GGlyn3zZQ/ekCi
 8pjCWi89xWnwbhGgMlsqvFD12FkdCZPG3XVYHBDtmmypJeN4vhNFXHrxDQszdOKApmxP
 VhWg==
X-Gm-Message-State: AOAM531eMrepc2oFzOXkigLvtDAU/5rOzmVA26GsHEd1aRLM1+mSEQSi
 YyKWLP/1m9GZT49/AmgVjRzpyBaaXztMqw==
X-Google-Smtp-Source: ABdhPJwXEKSczLoWw/OTCs7gIWdBbxN71SVVINLDqi360Px9TmXjtxCeXopIPAtwRsfaxjZEnV8BWg==
X-Received: by 2002:a5d:5254:: with SMTP id k20mr54029062wrc.62.1620915185836; 
 Thu, 13 May 2021 07:13:05 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id y21sm9024059wmi.15.2021.05.13.07.13.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 May 2021 07:13:05 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8C5381FF7E;
 Thu, 13 May 2021 15:13:04 +0100 (BST)
References: <20210508014802.892561-1-richard.henderson@linaro.org>
 <20210508014802.892561-59-richard.henderson@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 58/72] tests/fp/fp-test: Reverse order of floatx80
 precision tests
Date: Thu, 13 May 2021 15:12:59 +0100
In-reply-to: <20210508014802.892561-59-richard.henderson@linaro.org>
Message-ID: <87fsyqlo27.fsf@linaro.org>
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
Cc: qemu-devel@nongnu.org, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Many qemu softfloat will check floatx80_rounding_precision
> even when berkeley testfloat will not.  So begin with
> floatx80_precision_x, so that's the one we use
> when !FUNC_EFF_ROUNDINGPRECISION.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

