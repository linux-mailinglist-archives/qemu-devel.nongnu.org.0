Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5F152E842
	for <lists+qemu-devel@lfdr.de>; Fri, 20 May 2022 11:05:57 +0200 (CEST)
Received: from localhost ([::1]:33264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrya3-0004mv-Ob
	for lists+qemu-devel@lfdr.de; Fri, 20 May 2022 05:05:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nrySN-0002i3-EP
 for qemu-devel@nongnu.org; Fri, 20 May 2022 04:58:00 -0400
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b]:40401)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nrySK-0002mV-Q9
 for qemu-devel@nongnu.org; Fri, 20 May 2022 04:57:58 -0400
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-2fedd26615cso80419637b3.7
 for <qemu-devel@nongnu.org>; Fri, 20 May 2022 01:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5v7rcfJGcXB4/yuw6lJjgI3mfIXirFMKeyQR+LJM0Os=;
 b=tCepznhsZsbgvYljvM3K7f2neNN321vZ7FlBNUpQ00R4n6ginWCoyhVwdwGM1zm5e3
 m8wrRV1sZcS1+1eqobpiMWkq1M/117m00laHW6DllMVBExLP628xW3ITFWBDdVJLj2v0
 y8W6JZphOPkRyO3RwUzjUCcuzNpq99/3Lb8SUs6HGO5WRzvLWdkbuDrdoSl0RnnbT5GD
 vA0dgf+q/1+nzQI4Zvyg0FfRoRS4TqYd6Csx1aEp5BVjfytqcoeJlg0gf2dRXpaiTDcu
 UGpeyx02t9QEkgwtbP2mV6XB9dFFg5lngvwWKhkSqV7Wc4c8Dpd+J7LsRnFgoopZo7oH
 jxcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5v7rcfJGcXB4/yuw6lJjgI3mfIXirFMKeyQR+LJM0Os=;
 b=UzT6w1udOKD0kr1aAYQkotQJ6Bpi8hTxuxBfU0mobfu7MowNHwzn8k2AbKigoKgPIh
 sDXQqtjawEQEL7D/ap3wsSORk0b2ogqc2b8Y2NREpZ0BtsyXEwfuD7qzUvqbPqdxiHoO
 2WxZIhbaLtLIM7FyS9tau1ESyL7qB26hKB3mUdiN5c1TcBYBD2KOHKZ8bUm4Wpe8+8kn
 T0ouim6I8dUjwJfEPrqJceyWah1MvCJDqWzw81Mdazfs3B9byL9yj3nIZsiA6WJtLVqy
 tcV2Ar26bbq+tzI2CN4pnVMk6ZTCvJYy69gLRJt6AED4WTApPeDaakiYwPz82ss/6/Ch
 ZDGQ==
X-Gm-Message-State: AOAM531pBb5CCGrjhfGOi5V46/xFoDkYIs/a63PlzHoE78iioEgiQh0Q
 EITNVrMYyHPatROVYwI7kbfHCulV1UXXrX97ngJ+gdTnd9c=
X-Google-Smtp-Source: ABdhPJx5hOnXwpZtgE8cFpgUT6i7LomGN6dKF4ljzSM6DL1fdYQFRBeFihjnzaBvnsohVlsFewpYJneFtdafw+0ZOnc=
X-Received: by 2002:a81:1dcf:0:b0:2fa:d094:14ff with SMTP id
 d198-20020a811dcf000000b002fad09414ffmr8884083ywd.10.1653037075594; Fri, 20
 May 2022 01:57:55 -0700 (PDT)
MIME-Version: 1.0
References: <CANW9uyss4-NC3SH7xzofpMbu-cn4aDVT9Vvwjk6_JUzBwX4ioQ@mail.gmail.com>
 <CANW9uysaP5dFbXNi-ZmvhMJ9ESzHbqrhoLqXR05c2gBhQS6Hfw@mail.gmail.com>
In-Reply-To: <CANW9uysaP5dFbXNi-ZmvhMJ9ESzHbqrhoLqXR05c2gBhQS6Hfw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 20 May 2022 09:57:44 +0100
Message-ID: <CAFEAcA8XW0DGvysnn08m+dVVnfUADS4khV1jgXea2JgZEPzVaw@mail.gmail.com>
Subject: Re: CPUs supported by the sbsa-ref board
To: Itaru Kitayama <itaru.kitayama@gmail.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112b.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 16 May 2022 at 02:58, Itaru Kitayama <itaru.kitayama@gmail.com> wrote:
>
> With the latest, manually built TF-A, I was able to boot a72, but not
> max. Since `max` type is supported by TF-A, I think it might be
> a Qemu issue.

How far did boot go? Does '-cpu max,lpa2=off' work? There's a
bug in older Linux kernels that makes them fail to boot on
CPUs with the LPA2 feature.

-- PMM

