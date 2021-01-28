Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1299F3079E5
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 16:37:56 +0100 (CET)
Received: from localhost ([::1]:55214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l59Mp-0004ms-54
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 10:37:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l59Hj-0007mp-Qm
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 10:32:39 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:44642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l59Hd-0000Zz-TA
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 10:32:39 -0500
Received: by mail-wr1-x430.google.com with SMTP id d16so5783840wro.11
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 07:32:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=yq8yVz/sj5sPqyPI64kJ4g9pSnpQC0++tbQJGZX95UE=;
 b=rG4PZUFKfk1QS+IE2znBnwpGeF+ImYLbzk9TMlkSNTNo2VYpWoZrOzHeu0BrYGiR8x
 UrN/C84xWzfT8ytF99wi8guYbxrgapzwLyKwt60F3YJ26X5CC871TfiAC1wYgwKuaaLg
 zTjTOOiij3n9OXOspwaTNZ41AmwL95enXDqDOBOc7xzbWW2LmoQFUljNbc5sfTy3ROUr
 pYXwj/fxKBb+pvcR1Xqzc8Bv1dQPx/IE3LuGo1+lUYa3+brYQI0DGBj0SpcsyeFo/b3g
 olNZBvRSjOG/PZ68q9H2aJQyEblBriQ3fZ8HVQQrQdiWLPQotAd7AwBlMNg/P5l1l9Ty
 kr5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=yq8yVz/sj5sPqyPI64kJ4g9pSnpQC0++tbQJGZX95UE=;
 b=dFaKB+rwG6udg24WSkaBMRY7AasDu4JFil8a32x1BEKb7Dgx/XENNQZVlDEmc20PMM
 YAFVKv3XuBYHrXzHO6JcfyBJcrlAKPZGPafCAHqia1qx55erRYWHvyRm2/DK6giw59qX
 /nfVgFJ71glvE3cfnmipjJte2E1z5VVdgNrQls6ceQm9egExcuHTcd/jlUS99Z3xttfx
 f3/x+ow6Yv3EErOVhUkKblEWh0ZnR4sUwstlzeG7MlVhTmsCDPgBvBeIc8bezQrGl7RY
 QmSZsPk4xtRmO0RGmX6yS2wcso5fOFavSjodCzTO9888xbxmSxFStkaJoV6AP6v2yI8j
 BvIw==
X-Gm-Message-State: AOAM533qzBpQSnXK+vO5ORa6nCeYslz7PBGyATvfUdDCivtOSmnfYhoO
 6NePLZLUhSgaSWbgr24ntS2XY2QpwL3+Cqfj
X-Google-Smtp-Source: ABdhPJwRtdkMAsVzUeoMAQ/+BxZZT1iT6n1UIPjdtL4wv7idOfrUIfhBGwtsfUTYjHol0coJk7vwLA==
X-Received: by 2002:a05:6000:1547:: with SMTP id
 7mr17022340wry.301.1611847951989; 
 Thu, 28 Jan 2021 07:32:31 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c5sm7442525wrn.77.2021.01.28.07.32.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 07:32:30 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2555B1FF7E;
 Thu, 28 Jan 2021 15:32:30 +0000 (GMT)
References: <20210128082331.196801-1-richard.henderson@linaro.org>
 <20210128082331.196801-11-richard.henderson@linaro.org>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 10/23] tcg/tci: Inline tci_write_reg64 into 64-bit callers
Date: Thu, 28 Jan 2021 15:32:23 +0000
In-reply-to: <20210128082331.196801-11-richard.henderson@linaro.org>
Message-ID: <87sg6lulf5.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
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
Cc: sw@weilnetz.de, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Note that we had two functions of the same name: a 32-bit version
> which took two register numbers and a 64-bit version which was a
> no-op wrapper for tcg_write_reg.  After this, we are left with
> only the 32-bit version.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

