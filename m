Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDED46FF020
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 12:49:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px3qA-0000cH-BW; Thu, 11 May 2023 06:48:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1px3q4-0000c7-Tq
 for qemu-devel@nongnu.org; Thu, 11 May 2023 06:48:00 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1px3q3-0001cq-Fu
 for qemu-devel@nongnu.org; Thu, 11 May 2023 06:48:00 -0400
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-307a8386946so2179136f8f.2
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 03:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683802078; x=1686394078;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FeqvIuOtOlFzpnZIX8zpWd7k+qtYjjD8NLiI6U364Ic=;
 b=EoQGryj9ZKmNxxSPatgTv89deJNMmai/zwaSg4XKktat6+Fa3qw2Ac74pNhrP3a1RL
 sVXYchSeozFNReIl1hbj3mb1AXXMqr/SErBjrst7yUtSkjmUUbqsLCNqXBLzrD/Jy1x9
 17+fyy4QhCwf2GdVasbPPkyG9+YJxMNYN8tsfWXzf0nQjCW2rxIALegI8D1W2KTv1Ck3
 X3OncaziAH/Ad8Vxln8/bTgZlE2OvOQwi/DzzhPqg7tR1+P2yu4hQvlXA/OCjAwkjsHE
 EAbOu/bB0WRCEzjY6Qv0V71YNM3+JZVbipVFPrTlG/uMhclqAZcMiv+x0xkT/e8Au9QG
 26dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683802078; x=1686394078;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=FeqvIuOtOlFzpnZIX8zpWd7k+qtYjjD8NLiI6U364Ic=;
 b=e2VeIZGCjQf4YWbXSk0bV3IS5LfNYCodXLac1teZeXOO/dvql+5FK6RTFgktgVacZK
 bFWBGLwO65Ek4Cej02M1FARZ3MroZRMNygiRIg0z5jCAATcCYgLnS9RDJeRJyuC711/M
 AXnMagJAYUqbOqoLqM793xmZYBulERKom3RpAd1Euoi06zkjjvijY59f/clKqIV8WxT7
 LRhlp+9yElBeWrhd8LzNNNAzJ5XhPAhKKpPwDh7UMPj7eiCDuX5sajN5eIvKo8CQjab2
 cq+vVFb+h5ZrMPwsiu/GesBra5nsBOdhWpCqwrfgv6+Qer/4Zj5Vqm0NI/xu5PWsAyc1
 oMVA==
X-Gm-Message-State: AC+VfDw1PPjui+FEABSHoH4En1uyIZgbrPOgBAK4cxcmK+aalHXuZ2IM
 cAPj1IytbTrszgoBBZt+jMyebg==
X-Google-Smtp-Source: ACHHUZ6bfpqVu7YtR11p0l+r/OEH6T+EN+VAu6TW69mkvMfrBSbpHN8B2v+WtiHqOe7TVhZhC2aLtw==
X-Received: by 2002:a5d:5191:0:b0:306:2a21:b5ff with SMTP id
 k17-20020a5d5191000000b003062a21b5ffmr11873822wrv.17.1683802077917; 
 Thu, 11 May 2023 03:47:57 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 p1-20020a5d4581000000b0030639a86f9dsm19941864wrq.51.2023.05.11.03.47.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 03:47:57 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 17B271FFBB;
 Thu, 11 May 2023 11:47:57 +0100 (BST)
References: <20230503145535.91325-1-berrange@redhat.com>
User-agent: mu4e 1.11.4; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Juan Quintela <quintela@redhat.com>, Peter
 Maydell <peter.maydell@linaro.org>, Wainer dos Santos Moschetta
 <wainersm@redhat.com>, Thomas Huth <thuth@redhat.com>, Beraldo Leal
 <bleal@redhat.com>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [PATCH 0/2] gitlab: improve artifact handling
Date: Thu, 11 May 2023 11:47:51 +0100
In-reply-to: <20230503145535.91325-1-berrange@redhat.com>
Message-ID: <87bkir400y.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> We are missing test log artifacts from various check jobs on failure,
> and also missing test logs from the coverage job

Queued to testing/next, thanks.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

