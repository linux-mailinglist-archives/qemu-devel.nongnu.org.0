Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B6CD3CDE0A
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 17:42:28 +0200 (CEST)
Received: from localhost ([::1]:38232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5VPX-0003dQ-Ij
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 11:42:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5VNz-00028l-3y
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 11:40:51 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:47038)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5VNx-0007eM-HW
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 11:40:50 -0400
Received: by mail-wr1-x432.google.com with SMTP id d12so22557186wre.13
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 08:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=rDqGO8g2J2q35nlezxrz05gBYuqRCXtLlAK5c3ty+SQ=;
 b=JQ55CrV5E6Tg9ZBf9hKqKo2RPpPKWHMZwR3Cq35wbJw/VV9NXhkSiQ0jTo1yllBlMs
 rnVvrhtlFWc+bczf1El/u5v0x28A/KDoI/cLMZdvireTsOBcd5mK6BeLtixggww0GD/K
 J8ZU6uLQL45q2G9GqDx/GaSo5DFQ76DDDRvOkq3nIFWFQ8E01e8a+Mnf+e0KAXf10pnf
 3uYVX/+EZDVJT1iK9mvmwAuMUkFbue1Te3ewb0OHLJ6TsVyRAB/tY00bc7r+9/Dlp4DJ
 oOp0EgiQKz2d8r9uZqUf0i+pUW1hGV7xvSOO0SQbu9Hd9Ch6L9QY+zzh/wkki1LGkN/T
 EJOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=rDqGO8g2J2q35nlezxrz05gBYuqRCXtLlAK5c3ty+SQ=;
 b=gkVlBmHErBCalbNymtKHBKylJ5YmJs8DIIzoBhM/afVGQWL9SK7RO/T5hiCvPUTB7g
 01ElXy/Crf3/eM9ujzgkLReCFz8tQu9Dmbd+nJnypARmXbMai5e4J/XiiHh+2kkTlEiE
 M/L8lnmeo5XFHlN/ggd1INfH90WvVcCsy8zTxytAZR1P9Y/svUzaEd9+DaB0qn4OuXJe
 gCePTfPQZYlVg+h0a3C8NsPNf99ge5v6nzFzxSQpR0od0mFhF15eM0I0eQsG4DFtuh2L
 GEC8wSSggKiL5u2BIEcoXADjyEmglGOAVypc+tjfI+lu6TAluVf/YBoe1V5erQUd5CcG
 w+BA==
X-Gm-Message-State: AOAM530q8sdjHfiNEVRjBIyjvTMRW5VsBECy7CPyeMxPWA/nygsfRDdP
 WGYGCrKVlF1x0SLHsJj8pHj+gA==
X-Google-Smtp-Source: ABdhPJyaPVN+ST6L0ZAXYal+wcQzXVLrgyuxW8BRfukpB6ktWe6zM3x5aVzHU8w+EMTjzq6teyNX2Q==
X-Received: by 2002:adf:d1cf:: with SMTP id b15mr11606357wrd.382.1626709247822; 
 Mon, 19 Jul 2021 08:40:47 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id p7sm15729052wmq.5.2021.07.19.08.40.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jul 2021 08:40:46 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 382B01FF7E;
 Mon, 19 Jul 2021 16:40:46 +0100 (BST)
References: <20210717192419.2066778-1-richard.henderson@linaro.org>
 <20210717192419.2066778-3-richard.henderson@linaro.org>
User-agent: mu4e 1.5.14; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v3 02/10] qemu/atomic: Remove pre-C11 atomic fallbacks
Date: Mon, 19 Jul 2021 16:40:42 +0100
In-reply-to: <20210717192419.2066778-3-richard.henderson@linaro.org>
Message-ID: <87k0lmnwg1.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
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
Cc: peter.maydell@linaro.org, crobinso@redhat.com, qemu-devel@nongnu.org,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> We now require c11, so the fallbacks are now dead code
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

