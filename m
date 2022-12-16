Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C8164EB17
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 13:01:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p69NQ-0004GM-8J; Fri, 16 Dec 2022 06:59:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p69NN-0004Fs-R3
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 06:59:41 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p69NL-0007uJ-VU
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 06:59:41 -0500
Received: by mail-wr1-x42c.google.com with SMTP id o5so2280841wrm.1
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 03:59:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3HLiedRywOMPhL+tYo2E7BOXdIsLhsS5nG77vvm7QwA=;
 b=mYohkI1lGCCXgJgtM8s2KPAopPjey+PccZSr9W/WY8KXtjyj8Saw9FPb4tErYd0H/M
 /wwXZS/lws/07HrxRRRKt/3kZvJAInmWNDNO9VaGp4IhKE0Q9HiTUXRv9+U6O33Lhykc
 +QNvEZWUKMXFZ1O3r3EaFcV1xRcOCDUvG07VBZj96NXUeueVlkb1B7w0hMKTvZxheAXR
 ok6kaWsrGWeiva9a9bfolQ7ws6PwhuhLFRJrzetKWhLk1vjaTB0QLBoxT2qE89nyOdBc
 oPrh7humOxoDMTXvhJ4nZ08SKWIZyVYLacp1QLTiRNI6HaCsA6ryS53PwjJ7zVIUyO9+
 SOjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=3HLiedRywOMPhL+tYo2E7BOXdIsLhsS5nG77vvm7QwA=;
 b=IKYd2dYLBrCZV7l+b65SIypPMEJVgXaGcgkSxZtH4UD9TPR2ovsFSEj3NDRHhfOqNY
 DAztfYAGwFm/DeEebRVC/Oh1qwz9V6uDq+TzqGfjn+GnGlzUOZx/dRCqFsWOa8rTlzrW
 nEVjsa8H6kLeKQMomsVrjW16IhgTdLNym40zUqtC2wwMdyVPtnPUFbjgUo7M178GbNMY
 ok6s22kafmpeBDdTPjrhe0Z1u5i88QFUufgzWKOEBJ8LWJ4rSoe2AJSoAj3iKP++YBoS
 6YrV8Bbr1gQooe2Rrr47u+O6d1kyQHWHgmToS1yEC2Z7QnNHd8dmfmdA8ygv+uTLVyXR
 5Jyw==
X-Gm-Message-State: ANoB5plc7SORA/iZLAGHZ1AscI56dxiF07xiaRbP12RigIrTmukq0zp/
 jE0I2hTQUArkpkOLdX55wl67Vg==
X-Google-Smtp-Source: AA0mqf6O8elKGXuRxYJcNK7XyOwnT1uC4Yd8nPfrqKsUEutVstoOk11GMThUpWdV5X5O1MQt4DG/LQ==
X-Received: by 2002:a5d:668f:0:b0:251:d76:94d6 with SMTP id
 l15-20020a5d668f000000b002510d7694d6mr13347456wru.8.1671191977784; 
 Fri, 16 Dec 2022 03:59:37 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 p2-20020adfe602000000b002368f6b56desm2466773wrm.18.2022.12.16.03.59.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Dec 2022 03:59:37 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BC7C11FFB7;
 Fri, 16 Dec 2022 11:59:36 +0000 (GMT)
References: <20221209051914.398215-1-richard.henderson@linaro.org>
 <20221209051914.398215-5-richard.henderson@linaro.org>
User-agent: mu4e 1.9.6; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, laurent@vivier.eu
Subject: Re: [PATCH v3 4/8] accel/tcg: Use interval tree for
 TARGET_PAGE_DATA_SIZE
Date: Fri, 16 Dec 2022 11:59:31 +0000
In-reply-to: <20221209051914.398215-5-richard.henderson@linaro.org>
Message-ID: <87a63nimon.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
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

> Continue weaning user-only away from PageDesc.
>
> Use an interval tree to record target data.
> Chunk the data, to minimize allocation overhead.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

