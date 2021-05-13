Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C0237F51D
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 11:56:34 +0200 (CEST)
Received: from localhost ([::1]:43992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lh853-0006O8-E3
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 05:56:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lh81y-0004U0-IN
 for qemu-devel@nongnu.org; Thu, 13 May 2021 05:53:22 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:39679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lh81x-00056F-22
 for qemu-devel@nongnu.org; Thu, 13 May 2021 05:53:22 -0400
Received: by mail-wr1-x42a.google.com with SMTP id v12so26297010wrq.6
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 02:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=PKd7z7eOGt6CPTxtTKaZCTDy6wctJ92O/JCR0S6EDSA=;
 b=WTvFg4MNxQinwR1ZYxxTmZujf2tT+jGK4bGZqKtwVbdujhp40RixT2RQvL4BMVdGnJ
 rj0YaOHBviYcgrZ0SN+v/HMbcZkmJcBvSfVV5Tbk/BidWq8k+zVvLxYNBo9FHetA0oXw
 iGcEl7GGFs1QmYJ5jmhfEdDD/FZpQvsIakj1z4o8A/YU4Ll9biQW0BusZOeS4yK7glGS
 /LSTIbDk3Hv0/2BU8KeuBSekmyApbBKEimpnrEfZGCg6i99R2SYFqGOFZIqD2iO2Kr12
 Gj0YY1gXVYNPSQE/74jLgZ0b1MOgjWvlNRCvhphpeVTyR+LFafUPko3U045WO5zEgFY+
 ccHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=PKd7z7eOGt6CPTxtTKaZCTDy6wctJ92O/JCR0S6EDSA=;
 b=gS0DlM/FuUHnWhJ3zYe4b3iyRIC3J2TnxgjyjQ2oyE5kAmz4dm+fAaWZBfd5x28Q4E
 49bfKZv/L6SkL0zLh0SZs6Sd4ukahnRE9e5s+lcLxZFW9b0PA18HNh/bOPVLkeA5M105
 m+IMm5UBWXD2udvkY3HNjZ7qm3V+ayFMGHJ768hhRqW3d6kN248bYvxioNqz8be4JaJE
 U7dgmoMZz9PsDyV23AF1cRjpdXH5ZOHNdz9CJXQHcmVXjv6y9p0mmmGT/OjGTI92kf51
 4HMewNlo1KvV+UvjvTjkNpAvxTzEnVTMcUqY/Ya/Udf+JFrpibu6nzuLy0ILblIEKPIP
 MZSA==
X-Gm-Message-State: AOAM532E1Yg45/cuwe81fTUg+WtRm9nZt9Bl+FscUCIm7KSdStSb8biF
 EiIQEG0HrUkFQPFLYiRLvB0WGg==
X-Google-Smtp-Source: ABdhPJxiAAI71Y/nvrLJ3yflyc0lJnKYvSd/Z502FPVTVpBY7zfR/eOham1s4Ald9RfBIYWvKnN+EQ==
X-Received: by 2002:a05:6000:1541:: with SMTP id
 1mr51370294wry.364.1620899598462; 
 Thu, 13 May 2021 02:53:18 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id t8sm1900142wmb.2.2021.05.13.02.53.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 May 2021 02:53:17 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 12EF21FF7E;
 Thu, 13 May 2021 10:53:15 +0100 (BST)
References: <20210508014802.892561-1-richard.henderson@linaro.org>
 <20210508014802.892561-33-richard.henderson@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 32/72] softfloat: Move round_canonical to
 softfloat-parts.c.inc
Date: Thu, 13 May 2021 10:53:10 +0100
In-reply-to: <20210508014802.892561-33-richard.henderson@linaro.org>
Message-ID: <87tun7dkok.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
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
Cc: qemu-devel@nongnu.org, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> At the same time, convert to pointers, renaming to parts$N_uncanon,
> and define a macro for parts_uncanon using QEMU_GENERIC.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

