Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E02D408799
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 10:53:50 +0200 (CEST)
Received: from localhost ([::1]:56872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPhim-0005ZZ-Qv
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 04:53:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPhca-0002XP-DT
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 04:47:25 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:37470)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPhcY-0003it-89
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 04:47:24 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 c8-20020a7bc008000000b002e6e462e95fso6313710wmb.2
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 01:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OfsnD68QQ/T9iWz6jm/a56Xia60wrmmtfyBwat15JNw=;
 b=mt1elrNYfVnAA5vnvlJeV30zJi52E12QXm0bTzeSEqWGCuwRjfk3U86N1wdPR3beNB
 O+ufT3KhCHkJueci6woJ8t4rG6P2NUkTYTdWpiF+mqep9MR3QJyDorq0mD+F9sxxl4cw
 RUnbrPDm4h95wJFhXcbwKWdQWErQIXrm3PLvZbCjmtIyGb9VcMJ0xai13ennL21pFjkE
 39dBjG5OODXZe2q9R+mSA0OsVduW4RpyDbdhmQNPOfcw0a2WYQlLD/HtQgpdehoih+LD
 YSRJk06qbl1U18QszOT9zWvV0aGzGAdaCm+gJxISuyrwyenCfwO41H/dKyMMaynhFFLo
 8Qqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OfsnD68QQ/T9iWz6jm/a56Xia60wrmmtfyBwat15JNw=;
 b=PxAIzROslKvxGHjdrSQ+eNWdelgiBf64wkR4rCD2oAKdOml466h44RfLBGBabGZmOr
 iExQrQUs+8veXBtHivkRkYeSK+5lVR9cBsqul0nTREeJh9k6DE3Crlb4TgbuaPnC54fJ
 RDPkVLg5U4GsCAoWugnX0p2njj/tjfBbzYDmuUmk5wYsI1tTlOMJQNAQngu8m/0WRG71
 UpvCvwcGliuabBwHYwdyizCN7JRcAAiJWWU+4zHSC9P8aJyeJP4/q74NW7lj9KkaKOk+
 qqXfSryYFoFrxsUuwbqV5hdZccVSBMFjOXTS0AO6me1DmbXsh+MapLV4g4k9wAp640gd
 EpHQ==
X-Gm-Message-State: AOAM531lrpUZuJ3YVWh28qBFa8V4zqrDAV7d1V+oR7w7txllBv6yEC6B
 WUug2+ZTZaL4tDgIJkYpsbt3QaQfu7DG1XoGGDZC+w==
X-Google-Smtp-Source: ABdhPJy5X82f1+sV/jpe+cvWmMjfC4F5WDX1Pdr4Ajj/rwCNDt3NMNjomCcEFJ6Rn9L5aycT79i5xCymTr8pGTRGrAQ=
X-Received: by 2002:a1c:a505:: with SMTP id o5mr9952379wme.32.1631522840669;
 Mon, 13 Sep 2021 01:47:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210912230757.41096-1-agraf@csgraf.de>
 <20210912230757.41096-11-agraf@csgraf.de>
In-Reply-To: <20210912230757.41096-11-agraf@csgraf.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Sep 2021 09:46:30 +0100
Message-ID: <CAFEAcA9YXjPcps-9z68fND5HCrE90UbmcQTSCCWVd3d=TdWqDA@mail.gmail.com>
Subject: Re: [PATCH v9 10/11] arm: tcg: Adhere to SMCCC 1.3 section 5.2
To: Alexander Graf <agraf@csgraf.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
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

On Mon, 13 Sept 2021 at 00:08, Alexander Graf <agraf@csgraf.de> wrote:
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

Thanks for tracking down the spec requirements.

I agree with the code changes, but the comment at the top of
arm_is_psci_call() also needs to be updated, as it currently
says that we check r0/x0.

-- PMM

