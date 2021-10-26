Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF12B43B77E
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 18:45:07 +0200 (CEST)
Received: from localhost ([::1]:56764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfPZS-0006ZO-Qp
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 12:45:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mfPQh-0000Lo-AA
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 12:36:03 -0400
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129]:34667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mfPQf-0004hD-5l
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 12:36:03 -0400
Received: by mail-lf1-x129.google.com with SMTP id u11so113679lfs.1
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 09:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=rcUCijUxxXPKY5tqtVj0KSadC+NjhCAFB5AGDeDPGBc=;
 b=T8ZbxmN7kNwQCkIACJY1yC5INaZnRjIep0IeI7evbX1JaZ+RWfLMlgH9to3xIMhj8/
 EcyvZmGnsTag6PJxKsWDdEsp+ZVXDUn1c7jCGzG4bXnBGZ1ZUm+y2fyCPot4MhzRCpw4
 1Z714UgsMjKoLd6Y/lSH1XWrtKctV/NPsGpOc2gNSDD4h4MzdNBr/YuJ1l/xT31qiO6h
 36kBy+9v2h/nq7ai/5iqd4t92jUvvvjbNXxzbtOAVVbzjWX+BmRFQKGWKIgy3KuxQ8vq
 a+Zf3ZzjmK13jPPLALYqA6aTPSLC8So2bdV3KdU4PTz3o0X4B98MvwKg93owHqNlYVFn
 IAZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=rcUCijUxxXPKY5tqtVj0KSadC+NjhCAFB5AGDeDPGBc=;
 b=NV+AFjH6j2ur9oN93jGRksnV4uT8fQuwhw8wSmZ06DLN/EiHm+Uy7r1tdmCKAcP5dg
 HWYII8yhk/QJdJTT6tJbKNNZ8eM4N5qGi2lUI3B3rGJkFsC9Do9jGabjq/sBfdLVzdd8
 /IuvZbUSMPMtCvI6HZd/wAau/AsYvsev46VBR3qva1s0URF1MpjWTtoYOArVcs4Y8nsR
 lasjyRe22TXIM4ihQUKk59WvMJ27kouujOXH2s15/sFsBb0R7MxyAUm8WOmksaPISrkq
 2X4Z4w19AJPWeK1WWa2CjKzoT63RsjUuwDU7I89gNRbzqTcs2SLEeHfT9PUZefy+28Nj
 bTxw==
X-Gm-Message-State: AOAM533wI1nVC/mKZ7JOwq+M0tVuj2O7eKXE0REzcQ6gqHp6gDa/6PH6
 YcWyVM4dyOoTzRcY4QiDz/4u7w==
X-Google-Smtp-Source: ABdhPJwvWO6DzrCesyJ33nHYK6z+EhR6Kc4pP4iZbNwbVWfCOvfxXGO+wofF6qPGhDcau8eNXsiLug==
X-Received: by 2002:a05:6512:22c7:: with SMTP id
 g7mr3706450lfu.142.1635266159530; 
 Tue, 26 Oct 2021 09:35:59 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id s19sm2050967ljp.115.2021.10.26.09.35.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 09:35:58 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BBF721FF96;
 Tue, 26 Oct 2021 17:35:57 +0100 (BST)
References: <20211021210539.825582-1-richard.henderson@linaro.org>
 <20211021210539.825582-46-richard.henderson@linaro.org>
User-agent: mu4e 1.7.4; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v3 45/48] tcg/optimize: Propagate sign info for logical
 operations
Date: Tue, 26 Oct 2021 17:35:53 +0100
In-reply-to: <20211021210539.825582-46-richard.henderson@linaro.org>
Message-ID: <87bl3bzqtu.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::129;
 envelope-from=alex.bennee@linaro.org; helo=mail-lf1-x129.google.com
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
Cc: luis.pires@eldorado.org.br, qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Sign repetitions are perforce all identical, whether they are 1 or 0.
> Bitwise operations preserve the relative quantity of the repetitions.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

