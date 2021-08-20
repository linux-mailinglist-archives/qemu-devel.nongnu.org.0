Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA6B3F28D4
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Aug 2021 11:05:47 +0200 (CEST)
Received: from localhost ([::1]:56384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mH0TC-00024m-Ah
	for lists+qemu-devel@lfdr.de; Fri, 20 Aug 2021 05:05:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mH0QF-0008W3-0N
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 05:02:43 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:33383)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mH0Pg-00065h-0q
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 05:02:42 -0400
Received: by mail-ed1-x532.google.com with SMTP id s25so252171edw.0
 for <qemu-devel@nongnu.org>; Fri, 20 Aug 2021 02:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Q4azZTLAV8Q3cPup83a4JGlOdytY8TYbbUTbb80QnzU=;
 b=hsJ6ey8pR1tqSM7X+wD6WZE4y4PBE3Tr3OWCfqxIuAvF9xuK/H3pI4IYZLM2t5nSfZ
 ZP4MOzZGmQEdX5ooAwlnfGncvof7z0VnJlek1HNLpzzNTYlu75EZaG1JL+ovHHGaVVqi
 6d38ScmQZt5ihiQYirbQyA4wQGVr4iEedyDSKAI+icsmXlxA076TORfGTO+iWWVfspvx
 tpZ+w3VSKKpot22ckd2vyafk1XAPGQ1Vl1H4Opi/MQ9R3iwlBlgZn1A0PocD2keeUbb7
 8gsuJCl7tvMI14Nb2/95NFBKR40UjhK/Vv+s2NivR+vNHFMR9y8hNzRUWUAdSJFIBhs5
 CoNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Q4azZTLAV8Q3cPup83a4JGlOdytY8TYbbUTbb80QnzU=;
 b=TWyM+UzBVCebBcFQMj7rdXzTPaPShfrPP8Nzt/T5aC7HZftAqA4VDdFB2frZLBvX0s
 /M1zlTGYlDjBJXP6gHlurIROdsTKootlpngpJOvAXsKPK6gWT+CokTwQHHQWh7Agsokl
 SPYzfmPsylF/zrFe6sMYItskE5cFJe2C8PZwwV7aVI+TpsisqAuLi+ir1BKw3dHXX94B
 mAJR6lPzXyV1jVyd2cH1OFYUNq/P5jIyJEqzMdtYm/ArMPn46UqX+17d3M9Jr4zFg01F
 LQ6j88SS2R/i+WCPScq+iOp9r8rGUOk2pOSGDfy0DDREcsH4EIcQn0Szkfxq32kUyC8g
 61UA==
X-Gm-Message-State: AOAM530AYdiGPpde/l9pJU31KxJ68qQo4TP7W2NfoK+4yV/a9uzji3+m
 OREBWYTCQgRpmMCAfe7YukHMKLP6opjUFqDDXkt0zw==
X-Google-Smtp-Source: ABdhPJx6cN9+ePw3hfOKytDZ2ZDzv4kV1qgG3oQNwgcPDvQqZPjmPZ5T7E494WQDAO8TyPf5gf5mph73PZU3Eazoco8=
X-Received: by 2002:a05:6402:3099:: with SMTP id
 de25mr20990212edb.36.1629450125940; 
 Fri, 20 Aug 2021 02:02:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210819163422.2863447-1-philmd@redhat.com>
 <20210819163422.2863447-4-philmd@redhat.com>
In-Reply-To: <20210819163422.2863447-4-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 20 Aug 2021 10:01:19 +0100
Message-ID: <CAFEAcA9LP5LWW1FUM7MpNQgS3RC8KGyMRcRFxTQ4B4JD08A7+Q@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] hw/dma/xlnx_csu_dma: Always expect 'dma' link
 property to be set
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
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
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Alistair Francis <alistair@alistair23.me>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 19 Aug 2021 at 17:34, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> Simplify by always passing a MemoryRegion property to the device.
> Doing so we can move the AddressSpace field to the device struct,
> removing need for heap allocation.
>
> Update the Xilinx ZynqMP SoC model to pass the default system
> memory instead of a NULL value.
>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

