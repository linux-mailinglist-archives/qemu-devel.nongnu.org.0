Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 200F36B4FA7
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 18:57:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pagz4-0004t9-Vg; Fri, 10 Mar 2023 12:56:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pagyv-0004kG-6Z
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 12:56:43 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pagyt-00032Z-28
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 12:56:40 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 bg16-20020a05600c3c9000b003eb34e21bdfso6687967wmb.0
 for <qemu-devel@nongnu.org>; Fri, 10 Mar 2023 09:56:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678470996;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x+FDN7OkOKdLaGSLFaYBOOY7hiHWS1A5ruZL53w73X0=;
 b=sRrxnt5MBBdBbIoI216k2+/3dUh9CUobhPl8IKUHgzJ/mOxWenoTWPD/R2ZtWyUjlL
 qXjO0QDlHNCvdpyPsOxf9H36WCcrFE81grT3cFUBBTGPm+P1lBptMuw4ts4/9Ok6Niru
 Wo8xgbk3um4Mhkrg19sIRL4HPqOEJb1aksXnw/Oz2OQx1QL6WO9MFkFNkPQTAoBJsb2I
 5jSA6FQDdYgyRz1sviHsIQLhjsSZeSaar5unSrpUM9NaINWUsWrnp7oVh2ViTafRl8uR
 wNbiZO6/IcZZfaXhG4bXG8gwF+GDEmdhXO6GyaVCFbLGIvsj9Zk+We2OggaSfyikbHPd
 5IJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678470996;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=x+FDN7OkOKdLaGSLFaYBOOY7hiHWS1A5ruZL53w73X0=;
 b=T8PUmdXFkdroDMAK94p7rr11ZcIDR3gmJab6PYK/6AaSvZP2A07rSBiXnYLA0Mt3gZ
 cbMJ/dK6WCnWaVZhoHpvLrl9tZIPJQShtQJvoKD2dOSHbu/mH6F7WybpAQo1cvTJMB01
 tF4GMmLX4YwD0uxMvXh8u4DufeN8xaINqTPRxyX5WTrF9rdC31BG/PwCU8jt/F96gMga
 qHg6TWMVcFKqyDiWWgIVQyXWzsplIYO02PfFKzEDNNyvFxBoBNvGN/AXbmmMw/KawIKr
 A5zAnXO3ftFuxN5BAERVC86sWXFISYDurRY52HvJ6tKFZzTqXqPLE6EmgJGhl2IoVpaZ
 Sq1w==
X-Gm-Message-State: AO0yUKXpiiktUiFWZm3hdqPGEJcsSlrBxC/MFllWGrIoCMFD3JcoO+Gy
 fPNrfbv76SNhIJ1viRPC4/SI3A==
X-Google-Smtp-Source: AK7set/fYMJ03EBi4heorj0gYXRWOKEjxMUwZFGL3s35K2yUvCbaI1GAeBc47qjmdWWGXn1m9xGt3A==
X-Received: by 2002:a05:600c:3585:b0:3eb:29fe:70de with SMTP id
 p5-20020a05600c358500b003eb29fe70demr3707629wmq.0.1678470996504; 
 Fri, 10 Mar 2023 09:56:36 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 q11-20020a05600c46cb00b003ebf73acf9asm830403wmo.3.2023.03.10.09.56.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Mar 2023 09:56:36 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9CD461FFB7;
 Fri, 10 Mar 2023 17:56:35 +0000 (GMT)
References: <20230310103123.2118519-1-alex.bennee@linaro.org>
 <20230310103123.2118519-8-alex.bennee@linaro.org>
 <97cbb69d-eae9-e7e9-cabd-afdba875aed8@linaro.org>
 <766cc218-dcbc-b6bf-d172-bb4d4ad0b7e2@linaro.org>
User-agent: mu4e 1.9.21; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, David Hildenbrand <david@redhat.com>, Wainer dos
 Santos Moschetta <wainersm@redhat.com>, qemu-arm@nongnu.org, Peter Xu
 <peterx@redhat.com>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Peter
 Maydell <peter.maydell@linaro.org>, Cleber Rosa <crosa@redhat.com>, Thomas
 Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Beraldo Leal
 <bleal@redhat.com>
Subject: Re: [PATCH 07/11] tcg: Clear plugin_mem_cbs on TB exit
Date: Fri, 10 Mar 2023 17:56:22 +0000
In-reply-to: <766cc218-dcbc-b6bf-d172-bb4d4ad0b7e2@linaro.org>
Message-ID: <87wn3olcbw.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
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


Richard Henderson <richard.henderson@linaro.org> writes:

> On 3/10/23 09:39, Richard Henderson wrote:
>> +=C2=A0=C2=A0=C2=A0 /* Undo any setting in generated code. */
>> +=C2=A0=C2=A0=C2=A0 plugin_gen_disable_mem_helpers();
>
> Oh!  And this is the wrong function.  Should be
> qemu_plugin_disable_mem_helpers.

Did I miss a newer version of the patches?

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

