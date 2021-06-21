Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A23743AE318
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 08:26:08 +0200 (CEST)
Received: from localhost ([::1]:44382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvDNn-00042M-MC
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 02:26:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1lvDMW-000317-9C
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 02:24:48 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:45817)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1lvDMU-0002N3-MX
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 02:24:47 -0400
Received: by mail-ed1-x534.google.com with SMTP id r7so17270751edv.12
 for <qemu-devel@nongnu.org>; Sun, 20 Jun 2021 23:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CSn6TAQFJIuqJmpiCSsLUTH6CV6wBHNoLhaUfdpa+5g=;
 b=aDukXlnDpWChSodd/V21tFt/vry47QoVVcAMv3e1cGyXsM7QakUhEcgoy/4J2lSdpK
 bVQAgYOQ5eaXrFz2akvK3N8pTiyUJGJMkjM2jgWjyJYdmyuMnCSiL+fcIUugmRt0LAaS
 W3+vBv2eNoGycQmewuq2P1Tax/nk2ZOnysFh8MJLwTkboSn7I0zcR4nA7PeKSzxdwjvB
 mJ4dgO8sAsRyWuu0ZVpRmFPFEP99qmYXsXPWGYOlPRS8FUquXYAOWaNM+ZdiTBD+7vbP
 YH6Tcyma6wpRSCxkG/uypb0Ab58sGTCNqGScNwY5V65XTtSQyAmugZVTwsXMDurYgPza
 3z9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CSn6TAQFJIuqJmpiCSsLUTH6CV6wBHNoLhaUfdpa+5g=;
 b=V52GVcrcScHz9coVj+mjxEGQZB4HeXL8+T2BY+qXjz2IQWbV3jC4y5NkIE2JV//WHq
 BfprOmeevQQ+8T2nQkz/cAfj6mOSjc39jTJx0Tko+RwsqTuZo+N4iBWb3E7vw7I+Fwpj
 DTLWBEQlNdhKWSAJSK7nikXkIq+ktYA7iefe/cMs2z+plaTNpfnwH1//GqwZKMOaOdGb
 CWXZg6dWdfvgJ/YYC2aFl8LsxduCAdssVQN4POZ5k1ydAsw9wUwrobofXq5ozeIpj2Fj
 hGeL9uR8oadwRfoam34RsV6TfJ8STm4NGUNNMQiOUmXlq6Z0rqt1OC6sEavmd1nbJsJw
 8Dog==
X-Gm-Message-State: AOAM532me855mnPgi7COKjuNXRSDfz7exmTTg06I8CvH8lXDYilz0K09
 VsHFZHZ7Mh7887CT2NwinQHXinxfrm1C3UoYwBI=
X-Google-Smtp-Source: ABdhPJzMl5QerQ508xYx2zd8otAOjzZoUokbOMyOhbJh9tMwkRTXxpGGlKFjhgmp0u6V6gKPviQJFlqwteghlCtSaGU=
X-Received: by 2002:a05:6402:1716:: with SMTP id
 y22mr17099298edu.237.1624256684491; 
 Sun, 20 Jun 2021 23:24:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210621013439.1791385-1-richard.henderson@linaro.org>
 <20210621013439.1791385-2-richard.henderson@linaro.org>
In-Reply-To: <20210621013439.1791385-2-richard.henderson@linaro.org>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Sun, 20 Jun 2021 23:24:33 -0700
Message-ID: <CAMo8BfLx5ATa9kq1BEDhs6dx+zchxKwwpswF9rU9NMXQ+f0ZOA@mail.gmail.com>
Subject: Re: [PATCH 01/26] accel/tcg: Introduce translator_use_goto_tb
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=jcmvbkbc@gmail.com; helo=mail-ed1-x534.google.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.999,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Jun 20, 2021 at 6:36 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Add a generic version of the common use_goto_tb test.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/exec/translator.h | 10 ++++++++++
>  accel/tcg/translator.c    | 11 +++++++++++
>  2 files changed, 21 insertions(+)

Reviewed-by: Max Filippov <jcmvbkbc@gmail.com>

-- 
Thanks.
-- Max

