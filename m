Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5644625FC2B
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Sep 2020 16:37:28 +0200 (CEST)
Received: from localhost ([::1]:50124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kFIGt-0007Xc-FE
	for lists+qemu-devel@lfdr.de; Mon, 07 Sep 2020 10:37:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kFIGD-000760-Ol
 for qemu-devel@nongnu.org; Mon, 07 Sep 2020 10:36:45 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:37397)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kFIGB-0008Sc-Vc
 for qemu-devel@nongnu.org; Mon, 07 Sep 2020 10:36:45 -0400
Received: by mail-ej1-x633.google.com with SMTP id nw23so18486016ejb.4
 for <qemu-devel@nongnu.org>; Mon, 07 Sep 2020 07:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HOtiIPq2R/ncwiXIKXBxXb776AeQamoocil7WdTrdUE=;
 b=KKaddD+rOYQtkT8QX++hJkj5b73IHFipX5E3Nv+F3FbWPNoqDd7cKV/GmVkCChdCa6
 B5D9pEkzoek9wnpzZxi+7FEWOW+EbIIrc21IKFUPlg+3a5LUnz6j34zwUbwI8W92K7ur
 l03mazZ+VevEL6ZhQ3cmeCO6hVaK6setay4l5ye9NV3C93RQYHBCVHliJvYKekMu7/PS
 jj1/Mn/GX0zCAGxF2z/Ca0Cd3O0q5Aqwniu4iAbcraATtdfWNFg8cA2MHsYBZrpFLXqZ
 eyjvSN8cE/HbJ2NdocezvSXcrc1p1F63HdLrj1DTKcMsFhUNWP/B6sh9QCgZeB/OY+PZ
 WN7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HOtiIPq2R/ncwiXIKXBxXb776AeQamoocil7WdTrdUE=;
 b=jNkxEiBiKb73DUKKxZ2Oaxqp0iSUdw7e4h6nYDQzTtECCpIFRStaoIsRHfd6yMdv3H
 5sw9C/KwwQ5nKZy36l5zwZuIBpm4gN48xUbnGViVNTC0op2aXWhRULqV3SjaL1PP0Akh
 KdSzxtADH5daT/pTtxWJhYnBnWM6JrW+MfNKAJq9HvLXFroCMXaUr9K0R8We8HDzhQik
 E2nswuOuUMCz/jCtIHDSQDESyAaLsS/jWbhifAz3PLsLaoPXdPPS066rHRJN/Yh/WyvC
 amLSFc7IRrMdvz4Z7381AHxxFvSJ+hTZznnUOueGY9tvOv5jrjkY6oUWoktN4Fi22HBO
 9GMA==
X-Gm-Message-State: AOAM531BZe0+wXQ7gcee5INAtud5kHuZwSWnm8DV9Lgi5ljiGaCq6rU9
 QfS2AD90iULQKGI63ef2EIZjGpPur5STu3qtWGa3SQ==
X-Google-Smtp-Source: ABdhPJxwOpk7qk0Sl/nm3dIlGiyYPYxqinEg91wgLrl5WD3bYjp9tfUIA8oJOWKQbiarhHfiHXNJJKovg+fwi/sDzwg=
X-Received: by 2002:a17:906:2cc2:: with SMTP id
 r2mr20918852ejr.482.1599489402412; 
 Mon, 07 Sep 2020 07:36:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200715175835.27744-1-philmd@redhat.com>
 <20200715175835.27744-5-philmd@redhat.com>
 <87ft9rrfol.fsf@dusky.pond.sub.org> <87mu21mznm.fsf@dusky.pond.sub.org>
In-Reply-To: <87mu21mznm.fsf@dusky.pond.sub.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 7 Sep 2020 15:36:31 +0100
Message-ID: <CAFEAcA8VCRP5fVvvr6UDBtgipA4EVTS-XAXVNFQxepKyPL3GDQ@mail.gmail.com>
Subject: Re: [RFC PATCH-for-5.2 4/5] qom: Let ObjectPropertyGet functions
 return a boolean value
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x633.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 7 Sep 2020 at 15:26, Markus Armbruster <armbru@redhat.com> wrote:
> Making more functions taking Error ** return bool (commit
> b6d7e9b66f..a43770df5d) created a number of false positive
> CHECKED_RETURN Coverity issues.  Peter notified me back then.  This
> series could help (we'd have to double-check), but it covers only the
> getters, not the setters.
>
> Peter, are you still interested in reducing the false positives (as
> opposed to marking them)?

I don't have a strong view on whether we should make the change
in this series, though I do think overall we should have a
decision on whether we like (Error** + void) or (Error** + bool)
and try to aim to eventually converge on being consistent about it.

As far as the Coverity issues are concerned, I don't think we
should let them drive our technical decisions. We should
decide what we want to do with our APIs on other grounds,
and then either that causes the issues to go away or we
mark them as false-positives. I would ideally like us to
do one or the other relatively soon simply because there are
a lot of these issues currently piled up in the Coverity UI
and it makes it harder to see the interesting issues.

thanks
-- PMM

