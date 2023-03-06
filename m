Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABD8B6AC5C2
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 16:44:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZD03-00083J-QV; Mon, 06 Mar 2023 10:43:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pZD02-00082m-L5
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 10:43:42 -0500
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pZD00-0003nC-Bw
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 10:43:42 -0500
Received: by mail-pg1-x533.google.com with SMTP id y19so5802856pgk.5
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 07:43:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678117419;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=F2rIuIzeQjQU6QZpMhrypLZXkxARjX9ri2kzsNKD58M=;
 b=uZZ2U/DeaKY7Yasu8fbCf6bF721FUnmzxurM8v3B+omxv2iCnNno/nI7hjJAxc1KqL
 gMsNBkqDzotoHgb95Dcfhwp0yFYOBYpnXZHIZPB9ZIKt1y3hjkF1hlvBCH/9D0pG7lZp
 PIvbZeAasKUJXi1QRy4au7Ne5MkKUunp6725TUkCgDGhHeFWBboq7afA49zloS+FP5IA
 2V7LaNst0nfBVPVPQ3q01FR4PQO/clm8d0G077qCPiW5cp6O3KsAuTJPSd46Mj3qnI5K
 B85ekyJRBgTZkVAhM30oaJjPLtkOdC8S30F/q+2TdVW+Z7vF8ATCZlpN0WxWdue1Pr7Q
 4gMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678117419;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=F2rIuIzeQjQU6QZpMhrypLZXkxARjX9ri2kzsNKD58M=;
 b=hA0YAwcu+GLW8mzyyAZojlooeTzsUi5TcL9v1vhZ7gwmok70VQe1HN7U9JRtQC50Qu
 t8oB/bfFcYbvcJMaj5bwtgwEraXfNhzVGJuresW2FRsBYs2Exs00dUYSNdfmQOuW8fe7
 ccAoh+Y5+OuTamC6Yz5ceAFCDNhfuVfm6JNdXwAqMhKoS+wyoG6lb1hI3b4tO+vGNTgH
 yErShQR++zh58uFgRS21AUEZLNAdvUcWUQ5lX/VND1KYOJcbyUji4ARIXJ8CGu0pnOH/
 YYuvRDAL0Xs2omJDmaI30iRyowtPTswf+P0lSLnndP36gc6gXcX4ntrnNo6nQSlXBYgF
 NjOg==
X-Gm-Message-State: AO0yUKXTKAs2aRI8CMW/guDnc7PE/h0jz6zhAbcnPN2MlLTlwNfeK0Ri
 +ZH2wElvJxIyKkA1V6bDPn1QsaJ+UwyUt0h0xDOqOA==
X-Google-Smtp-Source: AK7set/AKWmnbQ94R6/HM51wjxL6hX8wDunzD1taDcxanbyf7Lgdmf12ItcC+HwDo/Or13Ib7pb0kHigvvJ/wfIDbhM=
X-Received: by 2002:a63:ee12:0:b0:503:2583:effb with SMTP id
 e18-20020a63ee12000000b005032583effbmr4034731pgi.9.1678117418670; Mon, 06 Mar
 2023 07:43:38 -0800 (PST)
MIME-Version: 1.0
References: <20230306151243.3877250-1-chenbaozi@phytium.com.cn>
In-Reply-To: <20230306151243.3877250-1-chenbaozi@phytium.com.cn>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Mar 2023 15:43:27 +0000
Message-ID: <CAFEAcA8saKA2zHXpPLHVSB3ya=HFG2ayPZCvD3BUut76NAmQCw@mail.gmail.com>
Subject: Re: [PATCH v2] target/arm: Add Neoverse-N1 registers
To: Chen Baozi <chenbaozi@phytium.com.cn>
Cc: qemu-devel@nongnu.org, Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, 
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Mon, 6 Mar 2023 at 15:12, Chen Baozi <chenbaozi@phytium.com.cn> wrote:
>
> Add implementation defined registers for neoverse-n1 which
> would be accessed by TF-A. Since there is no DSU in Qemu,
> CPUCFR_EL1.SCU bit is set to 1 to avoid DSU registers definition.
>
> Signed-off-by: Chen Baozi <chenbaozi@phytium.com.cn>
> Tested-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> ---
>  target/arm/cpu64.c     |  2 ++
>  target/arm/cpu_tcg.c   | 62 ++++++++++++++++++++++++++++++++++++++++++
>  target/arm/internals.h |  2 ++
>  3 files changed, 66 insertions(+)

We should add a comment here:
  /*
   * Report CPUCFR_EL1.SCU as 1, as we do not implement the DSU
   * (and in particular its system registers).
   */

If that's the only issue with this version of the patch
I'll fix it up when I add this into target-arm.next.

> +    { .name = "CPUCFR_EL1", .state = ARM_CP_STATE_AA64,
> +      .opc0 = 3, .opc1 = 0, .crn = 15, .crm = 0, .opc2 = 0,
> +      .access = PL1_R, .type = ARM_CP_CONST, .resetvalue = 4 },

thanks
-- PMM

