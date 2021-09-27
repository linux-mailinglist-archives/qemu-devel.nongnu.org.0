Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E17419282
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 12:49:36 +0200 (CEST)
Received: from localhost ([::1]:54286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUoCV-0005yg-9Y
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 06:49:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mUo9X-0004wr-Gt
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 06:46:32 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:44756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mUo9U-0006Cd-JC
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 06:46:31 -0400
Received: by mail-wr1-x429.google.com with SMTP id d6so50937858wrc.11
 for <qemu-devel@nongnu.org>; Mon, 27 Sep 2021 03:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=okFMjxgF1IEAAUPNxNlqlGmrmBOLL8+5IjowtiWG/1c=;
 b=EIISiw9xwfqUdvGQDu3t3gV718p9FGYhjfkXNbAt+JypTpDFAMcm0aZ7o236420xnu
 4AD3HZvscTVxn4boKR0b8MV3TRl78dhOYpl7+jZA+1vr6N6fWA+uVw8iIv10Tu6oy0pT
 mrX39m8bkgNO4HwFuswTjNpP2vlFWLv5DPSI+OonrdG6IAaWLcjIIV3qtb5Z3aZlWU8P
 TQI87TUxSV3T+XO/6HT+A6fZgEsTjiIgRRr2uDTJNDh9DSeu2VjtQJWF6Q3a3hmlj3KB
 iqiKn+MUHMATE1tcd6RDFWPVzH0XOG95iXbP9YKwH2E0PrkZUMv8Ju1YI36WrUDStcr5
 7GOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=okFMjxgF1IEAAUPNxNlqlGmrmBOLL8+5IjowtiWG/1c=;
 b=Y+frzja7f9nvUsbWj0M93/anMX1ZnzXvugFLXGCRQ3JH6tnE4NseZcJGBaoPgvfTQ7
 kJW2YIAesAny8p76BXPLFtSPbnnuwRVn/mjcaQrrGvR0DITR7G2jYxm7NdRRUYlEtjHP
 wpZDgvbjIs5uWxVLh0Wse0XwKdEth1WvHzALI2a58RFLE+Ki9czG2+D97oZe7aLrABnj
 9h6xHcyurnQtI+OKJK/0wrnMjdKpBX3V3iwYCtNVUuX1DIac+qOyHD5kJX4QWxsPbleI
 92ggE1oLZ3xwI29hmuV4RxR6ZNljtOTsH7R6T3KNOeosP/ZwBrKcXQHQ0Qt6daoXZoSq
 GWuw==
X-Gm-Message-State: AOAM532nicfZ3JR1NCbxngW6SaR45HzLJQ6QWDIfBHOPhOVwypJSfSdB
 rRCYHx8myttYOYGOlwYqxZZRsy2rrVgDAuQhbprwVw==
X-Google-Smtp-Source: ABdhPJwyPEjkQbPDQ52WjwHQXD0x5QVDBZ58ScpcsGmVrQU079/Q0FFYJNVLmC7n9UMEdKH0YuFHX7sayM/UQC1jqDo=
X-Received: by 2002:adf:f185:: with SMTP id h5mr27725708wro.302.1632739586864; 
 Mon, 27 Sep 2021 03:46:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210916155404.86958-1-agraf@csgraf.de>
 <20210916155404.86958-11-agraf@csgraf.de>
In-Reply-To: <20210916155404.86958-11-agraf@csgraf.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 Sep 2021 11:45:33 +0100
Message-ID: <CAFEAcA_Xdbjbn1nxvC_5CdC+jdo6=ChiJDULvWT9F+c6VWyRAA@mail.gmail.com>
Subject: Re: [PATCH v12 10/10] arm: tcg: Adhere to SMCCC 1.3 section 5.2
To: Alexander Graf <agraf@csgraf.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 Peter Collingbourne <pcc@google.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm <qemu-arm@nongnu.org>,
 Frank Yang <lfy@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 16 Sept 2021 at 16:54, Alexander Graf <agraf@csgraf.de> wrote:
>
> The SMCCC 1.3 spec section 5.2 says
>
>   The Unknown SMC Function Identifier is a sign-extended value of (-1)
>   that is returned in the R0, W0 or X0 registers. An implementation must
>   return this error code when it receives:
>
>     * An SMC or HVC call with an unknown Function Identifier
>     * An SMC or HVC call for a removed Function Identifier
>     * An SMC64/HVC64 call from AArch32 state
>
> To comply with these statements, let's always return -1 when we encounter
> an unknown HVC or SMC call.
>
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Applied this final patch to target-arm.next now we've sorted out
the problem with the orangepi, thanks.

-- PMM

