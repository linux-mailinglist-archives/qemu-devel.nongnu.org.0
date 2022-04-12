Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4614C4FE995
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Apr 2022 22:42:41 +0200 (CEST)
Received: from localhost ([::1]:43986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1neNLT-0008P2-SK
	for lists+qemu-devel@lfdr.de; Tue, 12 Apr 2022 16:42:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1neNHf-0007JJ-Kp
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 16:38:43 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:46823)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1neNHe-0000uz-4C
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 16:38:43 -0400
Received: by mail-ej1-x631.google.com with SMTP id t11so12662064eju.13
 for <qemu-devel@nongnu.org>; Tue, 12 Apr 2022 13:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=8d48jpqbb2PHm/859YUNa9GQB8JtV2jDujKntMDEOeI=;
 b=TopZ1sjAGrdJDk+3yvq4OJYE+Jo9W1VSnTVywrJwtiK/5Vuv4/i/4Z3iHRI0UJtHie
 KpkLoNScwMb04CFQULRHB/s762GEIDJtySXAdo3d2RTg/75IBbdiTSXbPrPfCnJRFh27
 IgoauFGWQYx9piyL0Tt1SltQLyrteKD+bGF+1K9ny2x/qE2pxLGwLZ1jR8tgN8LGXBRi
 JkqSJNIxV16iZv/oqcyXekQYVMsj5nj7+dOZ+B+S+ZRSIsBidCHl64IwoLvCgvgC7+2L
 2pdORTb2EuhpJ8wrAz5FqStkQjPpY8kitI9jOom6RScy3TqKqt701CA3RDW9PLreIHk1
 biSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=8d48jpqbb2PHm/859YUNa9GQB8JtV2jDujKntMDEOeI=;
 b=fsljU8HG8dtUgS58vxigTmQTq4uPWXec48hIcy4b/sP029hzWwzz6VISbidlkVC6po
 fp+NZgR84bcttcgH2DN8RqaK1EilDPZ7jxXYU4ETNGr5ogH5nzZ7blUM/ifgXyo6zEcu
 Oksi9g9P0WQMaQzo01jcBfSPTJFtFNSnbsO+icWrN4xIrGI4ExEV2udlWbBVtxrSW9XP
 fL9ErIZCxjVGhU6imHtapZsyUXKLt5GAfnWxkmAVauOJHRubh6LsiSMxGps1i6eLjqg+
 GlPXsYFmPipUfwP4LfNarELCWOgFcVmVWR1L1yH7zbzPf3P+JYfFWsrdpHvjTkRi/b4f
 zLKw==
X-Gm-Message-State: AOAM533q6EGrU1+4xNuMK3sc3IhcPoAkAqkb1WamemOV8mYx84DiUjHg
 Z6vhDSjKYE/LEkzvbiooYi5Vt+7TSPnqHQ==
X-Google-Smtp-Source: ABdhPJx6bE3TBeJpQRuBwUJQPEK3guiF2pDMytTGnGcLaUwi2rwOEhDo+zAnLg8o/6D3XNRcZgHvGg==
X-Received: by 2002:a17:907:980d:b0:6d6:f910:513a with SMTP id
 ji13-20020a170907980d00b006d6f910513amr34380724ejc.643.1649795920669; 
 Tue, 12 Apr 2022 13:38:40 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 q16-20020a056402519000b0041d77e14005sm225825edd.82.2022.04.12.13.38.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Apr 2022 13:38:39 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E8F101FFB7;
 Tue, 12 Apr 2022 21:38:38 +0100 (BST)
References: <20220326132534.543738-1-richard.henderson@linaro.org>
 <20220326132534.543738-15-richard.henderson@linaro.org>
User-agent: mu4e 1.7.12; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 07/39] util/log: Rename qemu_log_lock to
 qemu_log_trylock
Date: Tue, 12 Apr 2022 21:38:33 +0100
In-reply-to: <20220326132534.543738-15-richard.henderson@linaro.org>
Message-ID: <8735iiyr3l.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x631.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> This function can fail, which makes it more like ftrylockfile
> or pthread_mutex_trylock than flockfile or pthread_mutex_lock,
> so rename it.
>
> To closer match the other trylock functions, release rcu_read_lock
> along the failure path, so that qemu_log_unlock need not be called
> on failure.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

