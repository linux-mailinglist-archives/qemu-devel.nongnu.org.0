Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C704A0003
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 19:19:43 +0100 (CET)
Received: from localhost ([::1]:42912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDVqY-00049x-7I
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 13:19:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nDVmW-0002Yz-1J
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 13:15:37 -0500
Received: from [2a00:1450:4864:20::432] (port=45806
 helo=mail-wr1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nDVmS-0006ma-J8
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 13:15:29 -0500
Received: by mail-wr1-x432.google.com with SMTP id m14so12194059wrg.12
 for <qemu-devel@nongnu.org>; Fri, 28 Jan 2022 10:15:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=n8imG8oMK3qYIdDNOdXQGJFm7OosIKXw5PAPRSwWNV8=;
 b=LZPB0B/IRSy2inULLXVEcL7OKNFIeDDq53AlbklkwHTFj0uwgWrMDuO0OKoat5//oc
 Y6VS9OzBmzF5QQAAHbDRg76013nGF33V6eeFqvqyXZ0GHZ0IWBLmdUD3QPNDlKf70eCl
 4eiRbLjwK2tL3nlF6KQTXYWboEOqPwIwRpG1yH/lBdodnGA/6rnf9g1QlzTUaYNIhGIR
 Afh48XdlTMvckYLRVaxRsNSvHUSuKe5Cup6vnVzreQJ2bh/n139yicYNRQsh6FtM+ghn
 gA/4wGYOaPWCVn9xsfL88C41pYDtMqo6wRCkDp1v0c6ac1MXLC0lwjfqnM3HCfS8Je40
 URgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=n8imG8oMK3qYIdDNOdXQGJFm7OosIKXw5PAPRSwWNV8=;
 b=CN5h9KPgGZp3CtciQvdLoWkjndaVrN+Z4R6De2s445D+w/SSYZdV+57Ajb5VUEuFSp
 OngXAE8h/ZTGokASIA8DbK9SuFVxSC2ceFU20+JZ1ffsTGk5GMs5CJU9OkGsrAT5bHMP
 FUiCMlYBZ/SDzFzbkZilv2Is6jZUrt+2QXke1FQjgNwfXDuehUU6xZ94pF7sw/OCIroB
 YAIURbxAFhIn8GQkrLAz67Gz8x7qSR4pdgd2G8/WfIwGZnzUDVnh4z5IGqyfRpXtv3nd
 UpIAEbqsAXqMCYe25ZRwULiVDBtauU+v1955F0DRXCb6Z2ynu5pvS/yOFVal0Vmln5PX
 Q1lQ==
X-Gm-Message-State: AOAM530qwsz2KtIKGSJcgQhBFXZw8LFQQ8BxJvV9Y12MVS+ukX9SgIEi
 gZKsBSBRd44XBdPKZOnUBF4yybLpc7HXi8DuKEqruQ==
X-Google-Smtp-Source: ABdhPJxBv/7rorXkXtpWrVVkTf0c0IT9h+CqRsj2ahXvtaexuZWbpV88z0aYe1eAhTgLNV+wTgZBMzM/9TJXKoZTF/s=
X-Received: by 2002:a05:6000:1acb:: with SMTP id
 i11mr8261062wry.172.1643393726484; 
 Fri, 28 Jan 2022 10:15:26 -0800 (PST)
MIME-Version: 1.0
References: <20220127063428.30212-1-richard.henderson@linaro.org>
 <20220127063428.30212-3-richard.henderson@linaro.org>
In-Reply-To: <20220127063428.30212-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 28 Jan 2022 18:15:15 +0000
Message-ID: <CAFEAcA9iVTTkyO1Dq9e2Bio9zAgUazCQwuZb1GtZ+A3zdhbr2w@mail.gmail.com>
Subject: Re: [PATCH 2/4] target/arm: Tidy sve_exception_el for CPACR_EL1 access
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::432
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: yuzenghui@huawei.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 27 Jan 2022 at 06:34, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Extract entire fields for ZEN and FPEN, rather than testing specific bits.
> This makes it easier to follow the code versus the ARM spec.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

