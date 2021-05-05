Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A293738D0
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 12:47:55 +0200 (CEST)
Received: from localhost ([::1]:59050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leF4M-00041B-G1
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 06:47:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1leEzx-0000Fl-RN
 for qemu-devel@nongnu.org; Wed, 05 May 2021 06:43:21 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:44795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1leEzw-0002J0-1t
 for qemu-devel@nongnu.org; Wed, 05 May 2021 06:43:21 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 82-20020a1c01550000b0290142562ff7c9so838757wmb.3
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 03:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=0eflMtRuxCefBsYt0bd6Qw6f3E6JKa+2RtytbyIHCpo=;
 b=ujy36aSg9xOP/cAAN0RAXYHZFf4gjqkeK8rsEJU2rnduz1tdoE2/W/F18eyyOZrwjc
 ZNz51D+EXu/YTNtTWZRDyWTO2ls+t1gmz2pJxH7N3LAQg4mb0RZ/9mZC+4SQOgWSknJm
 nXzi8eo2qrirxssyVplOEzsEFt4o5rp4UwfDuwDmHQx8kpifd2ikneNOOpmvMyiwnxS1
 8LlbLPowDW5RRujPXedhdGMPw/zN3Y2DxUrnPgfMPzg4pHSwcAcfzH3aBUh/R6he3La4
 4zGces1GgyxMa3NMmlaF8kZVvj2JxC8LVU22Jh7jJckP5L84T0ZH9hlnVqpe97pJn/fY
 kv2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=0eflMtRuxCefBsYt0bd6Qw6f3E6JKa+2RtytbyIHCpo=;
 b=rKLj8Ji853HtixQaBQqFr90MNZgkPp3mBTKPzFOOXZuFywiqF6zavxCsYUVCfhfuRd
 8SGyujE0f8SHnZVpL5wR/4vpOmtBRJoYl0nZHmV35cSNrabSwS7njL2qsgFslMOlUECX
 zp3trnxB0efFw5L5mbhUZPFHSq2QrOFJL7m1/0utCbHf+T10UVpH4aTpQ+bsMQEFuUps
 wiwvgKIxsjqv7xASFOvMZAM+PM+28fMahcgCKpdWcKViN6aZJVshvsBRxecnvUX3HVpx
 gtoU/EDXdOqKTeA9Frn5odd6OHeWXCEEwhe58YqC7v4d46V1zpCA03OuBvbwvWtgCsBa
 6dzA==
X-Gm-Message-State: AOAM531RjqkiQOe+2OIbZALj+oVt8eq9mnGFfM6CbYHmIm3h8QbG+fxr
 F6KpTqjmfrrJHVyUw7VuKCn9JA==
X-Google-Smtp-Source: ABdhPJyk0uKf0yeWUttbxpMIVkF9rZYFZfhs5Os6xlpTb0gIN02rJL/EEOmDK0WFpTY+m1URfLZzkw==
X-Received: by 2002:a05:600c:249:: with SMTP id
 9mr32287527wmj.175.1620211398067; 
 Wed, 05 May 2021 03:43:18 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id f22sm5376662wmj.42.2021.05.05.03.43.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 May 2021 03:43:17 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9A5FD1FF7E;
 Wed,  5 May 2021 11:43:16 +0100 (BST)
References: <20210505092259.8202-1-alex.bennee@linaro.org>
 <20210505092259.8202-6-alex.bennee@linaro.org>
 <YJJmYOWDl0UzziW7@redhat.com> <87lf8to49d.fsf@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH v1 5/7] docs: mark intention to deprecate TCG tracing
 functionality
Date: Wed, 05 May 2021 11:41:46 +0100
In-reply-to: <87lf8to49d.fsf@linaro.org>
Message-ID: <87im3xo3zv.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
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
Cc: "reviewer:Incompatible changes" <libvir-list@redhat.com>,
 qemu-devel@nongnu.org, robhenry@microsoft.com, aaron@os.amperecomputing.com,
 vilanova@imperial.ac.uk, mahmoudabdalghany@outlook.com, minyihh@uci.edu,
 cota@braap.org, stefanha@redhat.com, mohamad.gebai@gmail.com,
 kuhn.chenqun@huawei.com, matheus.ferst@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:
>
>> On Wed, May 05, 2021 at 10:22:57AM +0100, Alex Benn=C3=A9e wrote:
<snip>
>>> +TCG introspection features
>>> +--------------------------
>>> +
>>> +TCG trace-events (since 6.1)
>>> +''''''''''''''''''''''''''''
>>> +
>>> +The ability to add new TCG trace points has bit rotted and as the
>>
>> When you say this "has bit rotted", just how bad is the situation ?
>>
>> Is the TCG tracing still usable at all, or is is fully broken
>> already ?
>
> Well patches 6/7 got it working for generic TCG things. I haven't been
> able to get the architecture one working but I suspect that is some sort
> of interaction between the per-arch trace header generation that I
> haven't quite figured out yet.

Ahh it's since 7609ffb919 (trace: fix tcg tracing build breakage) which
limited tcg/vcpu events to the root trace-events file.

--=20
Alex Benn=C3=A9e

