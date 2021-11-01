Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB6C442083
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 20:08:19 +0100 (CET)
Received: from localhost ([::1]:55684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhcfK-0001Wo-Po
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 15:08:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mhbWg-0000aY-L3
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:55:18 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:38722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mhbWf-0000On-4o
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:55:18 -0400
Received: by mail-wr1-x434.google.com with SMTP id u18so29298462wrg.5
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 10:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7Q0OTkEmfhfvY19G9JtGGiHY2zzVK/M4993ZgGTue/o=;
 b=uj/31GrGZLaSaT5MzHPrzowpUPaKHYvpM4P0mQYTnpG/QKIn56Nw/HoqOfgWkCPQUg
 FbyVIxgjG3z7UVNMJ1Jn1G+pfT90RmVlobZW22OLxiSZ/AhOpv7BAc6Jd/U7uHfXEBv4
 LGptG9MxFxwwpcSGdWSwmYV+V4pDtJjCa0Yu4d5GAcZi03eJATRb0c59kI+HwYvGG3IK
 OI5dhiPXkvP/5IBBdsvvXS3c/vcGrAc2q13zJkWnKy2sLKujT5/hZchhHOR8dTiNzS9m
 SF6DZfU7y56JSHdLGsPYnrHtX2+xaoYnPSHYolrJfQz4PDm86R8G9/bEPRoWHejO+LC4
 U/Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7Q0OTkEmfhfvY19G9JtGGiHY2zzVK/M4993ZgGTue/o=;
 b=E70piwhiOdPRkjtJJpgoO0NTBsYXljN5p8FvxDAuRdW9vhNWXhUOBNLlKbijYpUgyW
 zNpF1c00WN0Djb110Zx0ZG286WcXjY1tDkChEOMOYFjaAiOY1Z/l5fzJj7USg1Kesdr6
 D9PtS6B927IqMjmhzzdhDoFUq7J0tuOdgOOiYsXCnqvjhKt0PYC9xEp9GgX+nIrqSKnE
 mypiKHgplKEsZaMvit0kHkhQVrwXbfu4Hhw0PZAI3ce3ub+l4p/M3fJpWo2czBLauz1O
 QU/o0KmAcGX4IJh83UpQ5uRFY3CTO9khw9PBU8WmmiGGJLbvecsD7AfFofBiCxB8rD9P
 OTFw==
X-Gm-Message-State: AOAM532aE0ocSicYcqTY3yZOcJLo683PbRF4Gfy5Nvlr1SgAFTT+i8VQ
 g1lqbbCzX1WMmER+h5JP6DjNOqWOfvidEFrDstkopw==
X-Google-Smtp-Source: ABdhPJwbbUk0TDHzH1e2WGZFARLwHXaPqMr6Z+8Owisk54o4LjW5Hd7kS446dzqRZ8Hy6giz+xKBYmal7ilUSGVPfs4=
X-Received: by 2002:a5d:64ee:: with SMTP id g14mr39876359wri.376.1635789315592; 
 Mon, 01 Nov 2021 10:55:15 -0700 (PDT)
MIME-Version: 1.0
References: <20211026071241.74889-1-agraf@csgraf.de>
 <13a13852-4fb4-a0f8-6740-354c8054aed1@linaro.org>
In-Reply-To: <13a13852-4fb4-a0f8-6740-354c8054aed1@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 1 Nov 2021 17:55:04 +0000
Message-ID: <CAFEAcA857EzUCNRkZ-iRJFd26c7HZnVpw5hyyVOgUiwT788qBw@mail.gmail.com>
Subject: Re: [PATCH v2] hvf: arm: Ignore cache operations on MMIO
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
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
Cc: kettenis@openbsd.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Cameron Esfahani <dirty@apple.com>, qemu-devel@nongnu.org,
 Roman Bolshakov <r.bolshakov@yadro.com>, Alexander Graf <agraf@csgraf.de>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 26 Oct 2021 at 17:22, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 10/26/21 12:12 AM, Alexander Graf wrote:
> > +        if (cm) {
> > +            /* We don't cache MMIO regions */
> > +            advance_pc = true;
> > +            break;
> > +        }
> > +
> >           assert(isv);
>
> The assert should come first.  If the "iss valid" bit is not set, then nothing else in the
> word is defined.

No, ISV only indicates that ISS[23:14] is valid; ISS[13:0] (including CM)
are valid regardless. (The distinction is that the bits which might or
might not be valid are the ones which encode information about the insn
necessary to possibly emulate it, like the data access size and the
source/destination register; the always-present ones are the ones that
have always been reported for data aborts -- AArch32 DFSR has a CM bit,
for instance.)

-- PMM

