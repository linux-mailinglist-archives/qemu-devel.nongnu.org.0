Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11921500FED
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Apr 2022 16:23:01 +0200 (CEST)
Received: from localhost ([::1]:58436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nf0NA-0003Kb-6r
	for lists+qemu-devel@lfdr.de; Thu, 14 Apr 2022 10:23:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nf0Lv-0001I7-DW
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 10:21:43 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:39801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nf0Lt-0002eE-Jh
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 10:21:43 -0400
Received: by mail-ed1-x534.google.com with SMTP id g20so6557629edw.6
 for <qemu-devel@nongnu.org>; Thu, 14 Apr 2022 07:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=+Hwrd0fa1WEGLe1O6a1ZySYI+U1g0t2JVBk1WQnxhvo=;
 b=mnxp+gLhlt49g6QODpOkf64PXv++GXOfhxXcnrqurhAYB2tDBYePigqm69x1qXyxW4
 nKJ5FCnGe7ziFCfkDDnvlU9hFiDBYjfHqSJMqPkPDQkRwTPJv3QnDe5Gk1c0jduiaypu
 Gt3ZdedN3l/JUeEaeIaqn+9MPr+S/yMuYgXLboF0E33k2I5tOz5y9YohtLYQxNAo9kuU
 glOyM/jamIDAjJjVPVJmpSl4uVRS56F9FkyKWynXmu9XvIhOvtgOVd3D/9NPj2hUcltC
 zHb26S5zPhjY9bVk77e+NHAoA62fAK/vTiFS526D5GEq12B0CFu84p3WBrdAe2daFfvl
 hniQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=+Hwrd0fa1WEGLe1O6a1ZySYI+U1g0t2JVBk1WQnxhvo=;
 b=JCMsxZwv+pTns4TRL3TmGTtih2mFNU74RcFCS/SU9b1FoTXgWLKd8BtaTXstbyJSCc
 +2rLbz8+BsveUCq+6cHuHNpEC/qin7Bo1fO+zO+bUmkTmQohma7tiNg1eVfmwVbfetFG
 bYhewAud77smf4TYLkEj7S6J5cAGHDb5e924egXAqyLHlYiRj3yXE8XIAOKPkuuZ7eUu
 OUllarsMw9NATlN7yPC6hZMyXaX8yKsF57Q9Fzj5W6M7M2KIvmGYx2MdlKotS1U+bSrk
 LknAPyO9smyWXnCVJ6ix4TuA0OLzGVyQjtNxarHVkKkpB+tcju8DoMEFDRk//4qycbq/
 Wt1w==
X-Gm-Message-State: AOAM531MWhZGdnnzgD3lQYmCpx0392m2khBvFbtKSIW+ydwPZoA9uuWG
 3s2yaGWoTnUjKiyaOzSX+FZd6Q==
X-Google-Smtp-Source: ABdhPJzksttxKvF9VoKgL+GhAPo1mIShyP+jGKjUV8uwO3/HmjXi2nniaDvMkF0KUcdJBFKGLKVi5g==
X-Received: by 2002:a05:6402:3548:b0:419:6a02:c5cd with SMTP id
 f8-20020a056402354800b004196a02c5cdmr3296971edd.290.1649946100076; 
 Thu, 14 Apr 2022 07:21:40 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 q2-20020a170906144200b006ceb8723de9sm662576ejc.120.2022.04.14.07.21.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Apr 2022 07:21:39 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 858951FFB7;
 Thu, 14 Apr 2022 15:21:38 +0100 (BST)
References: <20220326132534.543738-1-richard.henderson@linaro.org>
 <20220326132534.543738-30-richard.henderson@linaro.org>
User-agent: mu4e 1.7.12; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 21/39] bsd-user: Expand log_page_dump inline
Date: Thu, 14 Apr 2022 15:21:34 +0100
In-reply-to: <20220326132534.543738-30-richard.henderson@linaro.org>
Message-ID: <8735ifwxsd.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x534.google.com
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

> We have extra stuff to log at the same time.
> Hoist the qemu_log_trylock/unlock to the caller and use fprintf.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

