Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B900C557916
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 13:54:04 +0200 (CEST)
Received: from localhost ([::1]:46280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4LPP-0006dW-7K
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 07:54:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4LEX-0002O7-Em
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 07:42:49 -0400
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c]:37646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4LEV-00033O-Tl
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 07:42:49 -0400
Received: by mail-yb1-xb2c.google.com with SMTP id w6so35362330ybl.4
 for <qemu-devel@nongnu.org>; Thu, 23 Jun 2022 04:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=y8t4huc/a/R+d/eHo98icgB9bpiDx5ZVRL2x6ofh6pc=;
 b=e7b9/KAPCrgfUpcBUj+JKe+YD98jikX75shHPXOpvwkLiqshRpVVlY7dNzSWmCsA8P
 kdj2ZwR8EQuwb/Vtuh7XQhpEvRBz14ELLuoxsLAthTlIwc7kRYX/xu9mUxc98vV7Pgme
 eekffeCndzDtLaHLiZ1vv/olwNdcq3UgGuKw+zx4xPKqXF6g/9jQoEzlK0zTlKZtYegt
 h8L08vyoDxwy6XeJgAFgEvsJtDrZL0x1yUeRxYm95xMLY65Ol5obWRitM0s1GbvBm4k/
 zfpx234ftg027bG9qjwoHzjpzUUwmY2pleWBglu9aRXxFwFvNbNarNMz/GTBOAj9SOKi
 Yk7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=y8t4huc/a/R+d/eHo98icgB9bpiDx5ZVRL2x6ofh6pc=;
 b=40Fvfe7yuRZa2DfRXHJN5tmZcob8fIN+QIkNIaNGBObstefBAR7bYokRUo+WCMYpO6
 D+8+Rlvgp8vWQCvXP5UziCEf1kqVwqa7m4mnoug2K1POKEPr1b72nArCHPhM9uE3uYy8
 f2AUvl2TZXclbfpZFyeEmh0pIY063AwvL3qA+RefD0PS0JLgpmFtjZzNLDJ2jVUgvuMm
 /wq+zi2nSYZuKNcmUeXEpgeZvDNK0+xJF5Qdb3E3X3Y7+lrtP1tGk9zjFdTkw+vJncgo
 D0V8snOowU/1cpV4APYqaLuIHif6Ao/1Pn0r+vdv+dreGhdMQuXuL2X6/uvC/0DVU0Xs
 IUdQ==
X-Gm-Message-State: AJIora85PHL9wZ3Mr6dGQY1ct2EIKinCiFWukuy1AG2LrCCuaxHMEptG
 PiM0Tiyw30QiGpa1XynUZZTTIuC5NqTCfDyakhjcLg==
X-Google-Smtp-Source: AGRyM1te4uqsQVCgiKUOZ5LXs2BjWY1hqHtfC9JE28CUxibwUgdv119MM7yDSZd01kBzLSeTY/0lWFhL060wGuW/luE=
X-Received: by 2002:a25:d288:0:b0:669:12e2:b561 with SMTP id
 j130-20020a25d288000000b0066912e2b561mr8827983ybg.193.1655984566983; Thu, 23
 Jun 2022 04:42:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220620175235.60881-1-richard.henderson@linaro.org>
 <20220620175235.60881-28-richard.henderson@linaro.org>
In-Reply-To: <20220620175235.60881-28-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Jun 2022 12:42:36 +0100
Message-ID: <CAFEAcA9ac=P6Ggb+tTMxz6FkOzepfGUNBXUcu_xbUNE5+JVDaA@mail.gmail.com>
Subject: Re: [PATCH v3 27/51] target/arm: Export unpredicated ld/st from
 translate-sve.c
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2c.google.com
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

On Mon, 20 Jun 2022 at 19:12, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Add a TCGv_ptr base argument, which will be cpu_env for SVE.
> We will reuse this for SME save and restore array insns.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

