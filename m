Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FEE96D9453
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 12:45:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkN6i-0004sv-4o; Thu, 06 Apr 2023 06:44:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pkN6g-0004sn-2X
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 06:44:42 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pkN6e-0006yh-46
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 06:44:41 -0400
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-932277e003cso100352866b.3
 for <qemu-devel@nongnu.org>; Thu, 06 Apr 2023 03:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680777878; x=1683369878;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=PRz2COOF1xjEULS2PGus1YBCwsU/EWKiNR61R16U2I8=;
 b=j6IFFn5muPrNm8oT13j/TnEG5d3bKTJGk9BvfpnCI/5qIyjGSZJWeRsgaztwSPIkqt
 GOm2MdKXD/uz2wtZn/4m0RvaYJhYGlxwErZynIY0SRqYrX29y5Qu/3ssH+ceWK5acTPp
 hD/KMOv1nn7n2PiwgMYex6cozv5HEE6CoBPJUs2TPMdiJdNzoPEZvjigwNv2CRAMK5Fn
 K4SF6VXg/xzM1kCXtBVLu5ELJIUKkHFp77fJJQ4LeXV/FD8lx9mi3JgdcC9VdwWOrfLG
 rFsGrEWygteld0tR8z1DO2PBHtmmW9eyLtNzSRXsmgr+AM3/sEotBl8usrAg0PdIzBzH
 vLqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680777878; x=1683369878;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PRz2COOF1xjEULS2PGus1YBCwsU/EWKiNR61R16U2I8=;
 b=NHHujl5+pPl8M2bsS2S70B9bAEOzqnPJnc5BQBKAbBKZ8jlekYFe+VujI1hZa3XNqR
 hXFZ6bfvUTxIPSzHdVTFj5opW9LlUkRDzmZyya+75H8+kRKtA5ve82/f+sDOmDbGHGWw
 VgtBFXPRlX02ykMekTIb7xn38rbpKoMkqVBXKhGuyOfJVSeT109L3tr18lfJiy9S9Vw3
 mJlPD0sJQ1qV1li4JieaIGVwFLkcU0sD1szH3//obP8oJ1wllyWD/61hPcmK5i7LZbQz
 +ZuO3kBHPz+uUg3BCNrK34BnUHjr+xScFgQ6yWswF99ivfBDDiqHR8W2KtO9Yj2v8ViL
 kRug==
X-Gm-Message-State: AAQBX9cFjOrNJk5JamCWoEsz4IlsQ/NvPh+z9eOX8Fbm6ZZ1QvUSc+er
 VrNrk7Y6fVTTa6Y+7+2gSCYF/YVVnMV66zUFgOv99Q==
X-Google-Smtp-Source: AKy350aZZOqMF1MYFz9niUyBJOv7BEr34PryOargaEjIvbqpry2tJN7219Pps9QFhodTipxfjbq6kjDnf1rOiYdP8b4=
X-Received: by 2002:a50:c30b:0:b0:504:7027:e320 with SMTP id
 a11-20020a50c30b000000b005047027e320mr258381edb.6.1680777877793; Thu, 06 Apr
 2023 03:44:37 -0700 (PDT)
MIME-Version: 1.0
References: <CAFEAcA_7+5tK+rM6dBgozNJmMmL7fU3MHLuvzJtb7-zWK4rMTQ@mail.gmail.com>
 <4521ce29-1d11-f253-7a7d-342f6bd9e6b0@redhat.com>
 <CAFEAcA_HVpYajJ5yP7+eYKNhKggtNjgFyQ_V3WqSPf4dGL=zKQ@mail.gmail.com>
 <3b5cc225-50e8-e56d-3fa8-da052a515beb@linux.ibm.com>
In-Reply-To: <3b5cc225-50e8-e56d-3fa8-da052a515beb@linux.ibm.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 6 Apr 2023 11:44:27 +0100
Message-ID: <CAFEAcA_Uh+20w1gnCBXe6Go9WqkUu+SUeRtsrrbwEO4j48OjGQ@mail.gmail.com>
Subject: Re: s390 private runner CI job timing out
To: Christian Borntraeger <borntraeger@linux.ibm.com>
Cc: Thomas Huth <thuth@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
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

On Thu, 6 Apr 2023 at 11:40, Christian Borntraeger
<borntraeger@linux.ibm.com> wrote:
> Am 06.04.23 um 11:21 schrieb Peter Maydell:
> > Christian, does our S390X machine get a guaranteed amount of CPU,
> > or does it depend on what else is running on the hardware?
>
> I think its a shared system with shared CPUs. Can you check the steal
> time in top or proc? If this is far too high we could ask to give you
> more weight for that VM.

It's idle at the moment and steal time seems to be low (0.0 .. 0.3);
I'll try to remember to check next time it's running a job.

thanks
-- PMM

