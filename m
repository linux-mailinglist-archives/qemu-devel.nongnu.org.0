Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE5A5F05CB
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 09:37:04 +0200 (CEST)
Received: from localhost ([::1]:52636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeAZy-00005C-S6
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 03:37:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oeAXw-0006re-Fe
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 03:34:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41173)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oeAXs-0006LM-P7
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 03:34:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664523289;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=e5i+RP1oXTW5El8F2n66OQk/9HLb+ha2teyCZLdgu3E=;
 b=b8+RWab0n1OdJNc409rrPdgoQu2V8aO6o9DSJDMen4JvZmwfywipJlrAoaNiMoyXydEm1D
 2GBb3gYoyoiZc4/HbG+OvM1drTzKHmhuM3uBh2zHxgTnI5YWpq34VQO8injfJiJdXRnWbF
 3PsJy7RHv7a27u2n0YOf3pjdJtvUvgE=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-215-FDQpH9usODOnREkhlH_CFw-1; Fri, 30 Sep 2022 03:34:48 -0400
X-MC-Unique: FDQpH9usODOnREkhlH_CFw-1
Received: by mail-ua1-f70.google.com with SMTP id
 h11-20020ab0470b000000b003bf1da44886so1254982uac.17
 for <qemu-devel@nongnu.org>; Fri, 30 Sep 2022 00:34:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=e5i+RP1oXTW5El8F2n66OQk/9HLb+ha2teyCZLdgu3E=;
 b=u3/kYjAU9eXjGIR/JuwnjJ42SKbPzlXE+H3f3duVDlVkH/9ROF+1T26wMACjxT1DUf
 U6IAIL4efKY4AzJ3OjBaEt3EjhrVe18ys/gej72IbnIwOBC2B0h0KO0+7GysgzBdpijD
 MIW2DP6Xdg/3N76EPr7l0VapQVP4xDFJ48aWMfvALH8SWmeyX9hSq8maqYeRPCCNPnId
 JwSGJ/weDN5eXTbmNvj3HOO9M1PuNZG9JYLGUe28mvKgEiuyIkeGnaqkI8QEF/iGkaf4
 gApYFUY0kY6WPbyd4/6j+9WZlVaxd4C+5t0EB4mAOnOsiYsv+LovPXxSDd5w4d6aL860
 IuYw==
X-Gm-Message-State: ACrzQf2bKDzD8D/vqzBn4enJ3kEgTSpEvP49sPmCxUir6sue6RUAIOp3
 7g+u9a0LE4qJ/bfM0HjRAwpdZe4ohx3K/5AfDYxgZqdd125/OBIXJ0E51SKZ8Cho/rPRhPOlntz
 yUqyG4NkMyDukvq3rf+pOtJXHTRi3bhg=
X-Received: by 2002:a05:6102:2826:b0:39b:d63:87bb with SMTP id
 ba6-20020a056102282600b0039b0d6387bbmr3646339vsb.62.1664523287361; 
 Fri, 30 Sep 2022 00:34:47 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM77dFPV9RXEHF2bqH0rGSuZmw/vCnuFYHfOBMBNclCKC/AJa3BOEoT0d3Pwr85FTfmkJT+EUd1fYg5C4MZqyY4=
X-Received: by 2002:a05:6102:2826:b0:39b:d63:87bb with SMTP id
 ba6-20020a056102282600b0039b0d6387bbmr3646334vsb.62.1664523287108; Fri, 30
 Sep 2022 00:34:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220927095921.261760-1-pbonzini@redhat.com>
 <20220927095921.261760-5-pbonzini@redhat.com>
 <afb177dc-ab07-5167-e559-5b5280150c46@linaro.org>
 <CABgObfbPcy63-nZBzZe1Dtinm-h0FmoHYukZQY6uxLMsn8fesA@mail.gmail.com>
 <d25bff61-646a-6ccf-0b43-20e6f1e8a85a@linaro.org>
In-Reply-To: <d25bff61-646a-6ccf-0b43-20e6f1e8a85a@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 30 Sep 2022 09:34:35 +0200
Message-ID: <CABgObfaaq1smkBwoP+4ZAmk0O3zYGDfRYaWSBG4R8UfBXEvvdQ@mail.gmail.com>
Subject: Re: [PATCH 4/5] configure,
 meson: move C++ compiler detection to meson.build
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel <qemu-devel@nongnu.org>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.08,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 28, 2022 at 11:08 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 9/28/22 12:21, Paolo Bonzini wrote:
> > Heh, I wanted to get it in for exactly that reason, so that a future revert would not
> > introduce the test in configure. But I guess having the patch out there on the archives
> > may also be enough.
>
> Heh.  I suppose that's fair, being wary of reversion.

There's also a bit of C++ in the guest agent:

have_qga_vss = get_option('qga_vss') \
  .require(targetos == 'windows',
           error_message: 'VSS support requires Windows') \
  .require(link_language == 'cpp',
           error_message: 'VSS support requires a C++ compiler') \
...

so I included the patch in the pull request.

Paolo


