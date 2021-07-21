Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4015A3D0C8B
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 12:49:16 +0200 (CEST)
Received: from localhost ([::1]:56964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m69mt-0002x8-92
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 06:49:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m69Zg-0000Hf-T9
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 06:35:36 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:36737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m69Zf-0004JY-C7
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 06:35:36 -0400
Received: by mail-wr1-x42e.google.com with SMTP id c12so1640346wrt.3
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 03:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=KfLOHXriu2MzUiuKWRsEtDPxL+dUWdEe/djsUhxevT8=;
 b=p1V5W1w0ho6qhPPuWsj8j3o9ZhfK8Z+pDYLwAFYYoFrmMirVRnQPb1sEE3WOJ+6z77
 c5+Dt5Xu6qW5j3GblytGtmwaqL2tvHQKX6dp+M+XLHgovqWc0oQOmPWAmVQ5wEdYClXz
 8eRs4ZE7GZGdu0znDdRTqt1djvm/UDm7Wxo/F9MfDiBiP93XbpJM97cj3jKoKuJGjBNT
 gRzr7vbjlj0u2ixthSN7Av30xYxmRfv1djQ3H1ZEL3D+6wI1LWvX1RKiTbSc+gScNdYe
 FtiiQg9U0hiW12NLLys7XaiVNG9bFvl5hhXgtdOAb0RPlGyTknBJsrxIGdTmccyunn3w
 wE1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=KfLOHXriu2MzUiuKWRsEtDPxL+dUWdEe/djsUhxevT8=;
 b=Rx+M1yRSwMMELbo/0kNo2o2TkAnWtJS9rByeqiD+Djp5mdOlS56wm0GepGIoHfziqi
 gYx2W9vbRChmOZKiuAr7MOi4/g3/oU0XDxC2FCVuQ+0J6NIsDd1iDLob1CY4yDS8kTpg
 oCr4LIVFMys4LhbdBpLRrGvCI4GgkVoYpTP5LMYEcbpYNiZwJL/2rsZc5GV40x81LpNL
 QqnmkBRyiThnwWXCaEwqehkzO66UNMWEXBzWN3ZL9NaUFJkwN/9fifqTNpjIRM53H1Rb
 83POKtigY+pHfmEcrs9Cw72kEpDUjIIuWrGHR09MKRfF8HNxKc3pRbqOb2kfcZczRyF3
 OsHg==
X-Gm-Message-State: AOAM530PTyoRGEdH0FUyh0kGHStJUZltfoa1Fmg39YC8+Bh36F575jjN
 lpCq6nKM+obXGksHSV+H5xKlmg==
X-Google-Smtp-Source: ABdhPJzXNc1FjFPNO89/zB1BBXqCRZ+kyZsqroNs3hZiRRrb67p5ZEctNErCmB9Sp2ZPTjexTTYzkw==
X-Received: by 2002:adf:90e2:: with SMTP id i89mr43204087wri.338.1626863733941; 
 Wed, 21 Jul 2021 03:35:33 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id d14sm26650004wrs.49.2021.07.21.03.35.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 03:35:33 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 765DF1FF7E;
 Wed, 21 Jul 2021 11:35:32 +0100 (BST)
References: <20210720195439.626594-1-richard.henderson@linaro.org>
 <20210720195439.626594-10-richard.henderson@linaro.org>
User-agent: mu4e 1.5.14; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH for-6.1 v6 09/17] target/arm: Implement
 debug_check_breakpoint
Date: Wed, 21 Jul 2021 11:35:27 +0100
In-reply-to: <20210720195439.626594-10-richard.henderson@linaro.org>
Message-ID: <87bl6wkl8r.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
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
Cc: peter.maydell@linaro.org, mark.cave-ayland@ilande.co.uk,
 qemu-devel@nongnu.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Reuse the code at the bottom of helper_check_breakpoints,
> which is what we currently call from *_tr_breakpoint_check.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

