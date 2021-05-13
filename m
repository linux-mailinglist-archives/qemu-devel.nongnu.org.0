Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0CC237F596
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 12:27:04 +0200 (CEST)
Received: from localhost ([::1]:56196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lh8YZ-0003Ml-Vu
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 06:27:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lh8Ee-0007nt-AF
 for qemu-devel@nongnu.org; Thu, 13 May 2021 06:06:28 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:41815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lh8EZ-0003z5-Nx
 for qemu-devel@nongnu.org; Thu, 13 May 2021 06:06:27 -0400
Received: by mail-wr1-x431.google.com with SMTP id d11so26340325wrw.8
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 03:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=KTYlFodcFXZky1xhUKwtOk4/xonXJVpLyVukq6fO+2Q=;
 b=dcATVna9iXKBBamqM0UZB1OuA/C+GS203IOyEBoD6mpwAJdn+klX9Sn+UFbo43as4A
 LtsJCO5yMNJz6lBDR5cz6iZD0NyDr8GFZQlXTxC1bff8QbB67Kmng1F4TicD7yv5G1Hf
 S6LlEIWblPg5MqoUuzijQCXt05fd1oKqAyHlz5smmMwZUuUGQU+YsTzDjZTE3LM7uoS9
 EmgZSyJm+V8PO2CO/cCR5Q/Vw2aU95x4unN0d2xyB/Ib12BQrdEw44rj8dzKoz305kWo
 pA/OTbElEyCdVepfBtAUwlMjD3LLjKctr095scCg5xqUPwX/m1VTEGHLt1SonIGTVEUv
 zyeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=KTYlFodcFXZky1xhUKwtOk4/xonXJVpLyVukq6fO+2Q=;
 b=IxXOOrcpt08n3pCvg+Bm8OvVNCBTqMysE2S9VnD7D9GbOMnt+a9eFX1702EQYef4vA
 6zL4hgtI+gfFrt9QaRZw9Bw9gFrqYhXgmqKCcDkmp1O3dK+EzfHDSPHMS77A9Ta9j+Wx
 O6HQQVKW6EIK/U4D6LinrZR2VJdM9EFC+KYFVfJbtHjhv4Xu2sgUPclSJBSw5tnC02JE
 6VkO4ko/T7pepITW8uMcDmpzYJF2pILij6NvQuJIrl55LekMjZeu6vnAcoxowpQ25ZxW
 v2Z13aHhvW5iJbgIJ7pxAhdA2r07GHc1M/23aWnNgnKEgjiY4+igFPwI+TcTd5O+2SCp
 /lhA==
X-Gm-Message-State: AOAM533D5PHoGEPbKk+eWrC59moZ+6oaH9cRvQv9FCHFzHQ4CNv7g51I
 yg3l9z3Mq6M/9K/Ovz+VYh2Q5w==
X-Google-Smtp-Source: ABdhPJwzlMPr94iRFFWCvHVRVrgw+DmQ8yhdC4aZdzuxkHrrbcWJcBQnUor50dcBvzKsd9v7VDKDtQ==
X-Received: by 2002:a5d:46c5:: with SMTP id g5mr51331089wrs.33.1620900382253; 
 Thu, 13 May 2021 03:06:22 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l14sm2422896wrv.94.2021.05.13.03.06.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 May 2021 03:06:21 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B752D1FF7E;
 Thu, 13 May 2021 11:06:20 +0100 (BST)
References: <20210508014802.892561-1-richard.henderson@linaro.org>
 <20210508014802.892561-36-richard.henderson@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 35/72] softfloat: Implement float128_add/sub via parts
Date: Thu, 13 May 2021 11:06:06 +0100
In-reply-to: <20210508014802.892561-36-richard.henderson@linaro.org>
Message-ID: <87im3ndk2r.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
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

> Replace the existing Berkeley implementation with the
> FloatParts implementation.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Nice ;-)

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

