Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F9E26AC001
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 13:58:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZAOj-0005Fm-Oh; Mon, 06 Mar 2023 07:57:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pZAOf-0005Ea-Tg
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 07:56:58 -0500
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pZAOb-0007wa-SN
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 07:56:55 -0500
Received: by mail-pg1-x530.google.com with SMTP id bn17so5434036pgb.10
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 04:56:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678107411;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=QflXGVGD25Srpxxqt4y19t+28KMGVEPY2i931OrLEyU=;
 b=s6jzt8dJO053RbP+UcRJHLChWG+0UQ5J1cDIB5M6dVXwkScPyeVEVe+ju+vZRwb/R5
 yCsjqo3pWsMXHbCIxlq285z2q/sJ+eXdGNWagFxCs8s3bXgD0RpEWg3yCel9k/SpPEYY
 tcw9ivGvNOg8F+gVN9aQvwzON+V6mHRID/cPta6uRzyC3suNLpNgk9Ut0zLTIcp72M/7
 N7q3IcLmn0esFew3QMWhij5RI05pOcmeev0XRR8CGaoKHFhvxdX4Z6SNNZNO+Iby4O4y
 XNRsA7JtjT51BVfLvRQr5BwaPulbIq61H1v0NLosSpga3wd/2g5yJ0i+UTKrboKC/sIC
 v6Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678107411;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QflXGVGD25Srpxxqt4y19t+28KMGVEPY2i931OrLEyU=;
 b=eJ9cZXOazsjQ6aputIHsRrthf0X36s6IFtI2LoETOkjXMM4Y6p6cr+eKZm/8Rvf4/q
 ZnMB/WwY7SsYaTSlqVArMBsIb9P8bd174se01cmhSrijSSgVwhNV7MoNw5qAmKUrb+46
 fNwGbLLTZXXUMKjGv7lDLs/s9Vibow8+NAMbKpP7srSdXqTbS9cZJxgQLnOWw9nTfY5N
 zIC9/nx2EwuKgV6QmSzYBIxatzwCcGdK4afjAMRAdPSBgpa1BVOEvDMyT0JbQVd3SODf
 ahWo3aAPO0W4wHD2P+xGG3xkrz9Wdv45gHPYHpm8jmmg2QsWXYcN3hxno4rcL1Cg4qb/
 g6+Q==
X-Gm-Message-State: AO0yUKVzQ+MTCdRu4mdZprapyjwe5gFU/Oh83HlGeJ3UDpN8dvhYrz0p
 /Lvl/glqS+2JrnIMPyPaq6szsH9K2rpp1c9POD3kfg==
X-Google-Smtp-Source: AK7set8f8cpToUzQ+UMshnjMi/ej7xjMTopvjgd5mQAS8SweJuseibzl8pOHRHyl76AgTtIBL7kHykf20kbR6EgFkts=
X-Received: by 2002:a62:db45:0:b0:606:653c:f19b with SMTP id
 f66-20020a62db45000000b00606653cf19bmr4483753pfg.5.1678107411034; Mon, 06 Mar
 2023 04:56:51 -0800 (PST)
MIME-Version: 1.0
References: <20230306021307.1879483-1-richard.henderson@linaro.org>
 <20230306021307.1879483-2-richard.henderson@linaro.org>
In-Reply-To: <20230306021307.1879483-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Mar 2023 12:56:39 +0000
Message-ID: <CAFEAcA81_bQMYK9w0LitTrBkp+ue33gUocUMZco_HG0AxgGeaw@mail.gmail.com>
Subject: Re: [PATCH 1/9] linux-user: Diagnose incorrect -R size
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x530.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 6 Mar 2023 at 02:14, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Zero is the value for 'off', and should not be used with -R.
> We have been enforcing host page alignment for the non-R
> fallback of MAX_RESERVED_VA, but failing to enforce for -R.

I'm pretty sure we have users who specifically use "-R 0" to
ask for "definitely turn off any reserved VA".
Here's a random example from an old gcc bug report:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=60681
and somebody using it via the environment variable:
https://www.openembedded.org/pipermail/openembedded-core/2015-January/100572.html

thanks
-- PMM

