Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A88433AEE
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 17:43:15 +0200 (CEST)
Received: from localhost ([::1]:38330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcrGk-0000jR-D1
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 11:43:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mcqy9-0003IS-Cy
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 11:24:02 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:45879)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mcqy7-0006sL-H7
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 11:24:00 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 o24-20020a05600c511800b0030d9da600aeso3555710wms.4
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 08:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=F18iEBsR6iFcA3sDPmLXz1rj9ZJNZ8kDCq7+E7aQgo0=;
 b=nUJQqgn7o/mnFwcHJoE6xEasPFGYGjP0qtjV7bxua3UK9DrIrwDPTkHOJfz0qgTR00
 zDhKrkxJdzRw80opL+0LsO2w10bsDJiCa56uW9qZ2g2rFcMk5zbwota8hnbUxTP51JvC
 W0ndD6jwUB/hyDbt9K/b8h8VRzAfTgL29A50du91GO3YN1YrD1OcKwj3TBGfJz3SrPH9
 w0KzBl4FadtYGUL0HdEF6NLFJQerQGvJz1fPh37w853AzOQmk2fL2TzuZ0mwBbNDSZCO
 8qYRRwr1ypQa/cNHZkXDQNl0kVaPs+V4uo4LL0n5inqtkSP4Yyfy2NMWCF7jP7UHGj9r
 DITg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=F18iEBsR6iFcA3sDPmLXz1rj9ZJNZ8kDCq7+E7aQgo0=;
 b=ywNmvVqAlITF156PYn0PnhnaEELiu1OvwSyfluPEXusPmuJaDtnlapP3RS/Hw4MfF7
 kQrHIp6zK4Tk5nMYcqarMxRpAkiNfMrbyLAREhZ2D9XFXHVK/q/A3/OJjdEXTxKmUQki
 tSDIj3hc48PPXBu1oJpNNmP6Qw1EATjWReu9NwqL9iVVh192pRtNvp2dRIBW3RR+HNkn
 pJnTH0sFsFlp4MkkBd16FvNviuQ4Apfo5p/OZHa3ikdC9nPPfcllrZNfLF1dJX8KL09b
 AMF5IJN+PysXCGQseitYnYYdriGsG6kbpmUm+AxypbAVGPNAqDpxIjUnYd3xuTaoJQ/P
 mSkg==
X-Gm-Message-State: AOAM5328STChtyiv1rR1qiGdC0b8Ucgrp3wSYN1nhOK9349gAX+DxJ7k
 vFBWzheWu7dGyUU5EqN9mZiDqQ==
X-Google-Smtp-Source: ABdhPJyW2xHy3ZhLs4bzM1Ab4bLMfQNOCCQMh2ZLrPh5ICJ120tOlwq100dtJgiTHgY+pinfZJ9lEA==
X-Received: by 2002:a5d:4281:: with SMTP id k1mr25811167wrq.89.1634657037635; 
 Tue, 19 Oct 2021 08:23:57 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id p3sm15211843wrs.10.2021.10.19.08.23.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 08:23:56 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3F70B1FF96;
 Tue, 19 Oct 2021 16:23:55 +0100 (BST)
References: <20211007195456.1168070-1-richard.henderson@linaro.org>
 <20211007195456.1168070-2-richard.henderson@linaro.org>
User-agent: mu4e 1.7.0; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 01/48] tcg/optimize: Rename "mask" to "z_mask"
Date: Tue, 19 Oct 2021 16:23:50 +0100
In-reply-to: <20211007195456.1168070-2-richard.henderson@linaro.org>
Message-ID: <87y26pxcl0.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
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
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Prepare for tracking different masks by renaming this one.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

