Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F16506A03
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 13:24:50 +0200 (CEST)
Received: from localhost ([::1]:58090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nglyT-00010y-DW
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 07:24:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nglrf-00013D-Db
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 07:17:47 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:42970)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nglre-0003PD-0a
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 07:17:47 -0400
Received: by mail-ed1-x532.google.com with SMTP id t25so20802925edt.9
 for <qemu-devel@nongnu.org>; Tue, 19 Apr 2022 04:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=iETGV5qo0z387bQOm7LnS+jma7C+qGtn2wufH4Q664w=;
 b=c3dRxGg5Z6DodIqZms7bZMX9qTRO+vbTgZeZtx163SU5guc7UjXZIaq9YAuFUl0MA7
 U28XTOp1iJKZwJHN+1UygN+QAl5Tng6nFweq/wJwlIVB9Hce9m9TfjOGT+NlH9Dkxl/3
 2h2b2b+DIzV2WplXO3XZPUQ5U/xZ8EhMkMnsTdUq8f3Lqh7XgbXfTy5KuA01AuTJ5EdW
 CBfLdNKwqPzBggNd9oeKAtcdKIeP7U5YwwqbpfnoGCQk8FyWLCqMmOcSFJpgRuLpULVL
 PnWGUk0gi7W5cPDAzBpXl1pEVBphB4S9lVUJ3JsnJSC9zewC6yHvKDuwm/cxTE1yjo1s
 Pifw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=iETGV5qo0z387bQOm7LnS+jma7C+qGtn2wufH4Q664w=;
 b=kHsuvZzMc5stMmdukBf+lIJXsM4/MCwHpujtdUtKwfNkyyr7y2H8QvXYuKO4lzLwAY
 aslZngy5H6sK/FtV9SPxRjscpxBcMfJYqnVeb1bszIKaNe9G9XIJa0/03Ig5wiL2RB0x
 HNE3R44rIRR3RS6fU4nSxew3+GBWw9kAbrt0nerindcj4MYjEXpVNsRHP34RCNlFv7Vd
 7g2saC7cisKAq+SGLP4xuxB1NuhM7nFIp0Iof1laz20Y1Iji+25uwRPha26uw2inVPqd
 EjIT0napxa4tK1gh+WnYsCImxBb2HxsJiw0P920PyJcjpNUyMftZcq3knNd/73+5fKU7
 96Ug==
X-Gm-Message-State: AOAM533AOjlhbrNlvFQUpxLW7mmF8UCI7TfNdH3WoyP1wamqJW1g98dP
 lxCkT71ZWgLDbIdsP7DwDKPa5A==
X-Google-Smtp-Source: ABdhPJwmhGjM05XVIXBeLzF4B2eI024CaCz2TBBPrrthlYRDJRfpemh06HOjFHV8a7tCtX1CILPEmg==
X-Received: by 2002:a05:6402:438c:b0:423:f57a:596f with SMTP id
 o12-20020a056402438c00b00423f57a596fmr5717449edc.367.1650367064567; 
 Tue, 19 Apr 2022 04:17:44 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 lo15-20020a170906fa0f00b006e8a81cb623sm5566573ejb.224.2022.04.19.04.17.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 04:17:43 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3AA481FFB7;
 Tue, 19 Apr 2022 12:17:43 +0100 (BST)
References: <20220417174426.711829-1-richard.henderson@linaro.org>
 <20220417174426.711829-7-richard.henderson@linaro.org>
User-agent: mu4e 1.7.13; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: 
Date: Tue, 19 Apr 2022 12:17:39 +0100
In-reply-to: <20220417174426.711829-7-richard.henderson@linaro.org>
Message-ID: <87lew1wcdk.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x532.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Bool is a more appropriate type for this value.
> Adjust the assignments to use true/false.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

