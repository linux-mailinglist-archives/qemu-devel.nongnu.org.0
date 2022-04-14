Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55922500FEE
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Apr 2022 16:24:20 +0200 (CEST)
Received: from localhost ([::1]:33620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nf0OR-0005bu-F0
	for lists+qemu-devel@lfdr.de; Thu, 14 Apr 2022 10:24:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nf0Jd-0007rN-FE
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 10:19:21 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:41588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nf0Jb-0001mO-RL
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 10:19:21 -0400
Received: by mail-ej1-x636.google.com with SMTP id bh17so10334241ejb.8
 for <qemu-devel@nongnu.org>; Thu, 14 Apr 2022 07:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=96ACQo5rqccw+MuaM9jso1frVzBTDsCzuFADI3QmSM4=;
 b=FE8/QLFq1SuZM/cyhG9jHBa80HBAN0/zofCaSqf9A4smbPuTdRl4drowacBNpjcZNi
 H4LgAZPtCK0znyVowyEr8KhTP+82nN7IFk4alpIKVpKghKco0hwhrdyCD7d7WfVcql32
 J8zDsx7dqwQZwye7ttQ7VelIBhVLw8rM6RUZ4xRBtjEB7Xy4EVwGBfqMy46lShrDW1k2
 TFwkidN+c4CWDIs8LsG3nZuRw3bbXBUMeRxHJ1tv29dUIvWZa3qWnIQsbmKqIhPLzFIl
 r1ICsZsn/wMCMOsrbODPueuL2zRMgzVW+abtMuNffWCx3i+kp0qeRBi+rBqBs1klfL7G
 TqhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=96ACQo5rqccw+MuaM9jso1frVzBTDsCzuFADI3QmSM4=;
 b=2vlnGmzhN65HsfQr4rtfMu5F2zQXQErqRq7UKeTUBnZIXTdxZKeE8OtvGoooxwzX88
 rjvy4I0qIK/wYGGr8z7aW0mwI8/oceBxurOoL0mo616ifYkjEC8nFrsExd4AgHiU98Pa
 G/BhjVCSXfNvXm0+bOUjQKerLrUDtHiGlERXMBm13b3+BNJf5plQIirQpNc+MYE0q6NL
 ByQBR+CWZQPQ1eNk+88Q9ox/3mILYp37i3DjwrwivcoKYHIA6M4y5IhSpL8NwU6frEXG
 8cT23zXm9mDbRWji9/kfw5Lp2b8znwif5nnh82uJ8NsSeVR0lDf2oMs1FRbx664g3kT/
 z1aA==
X-Gm-Message-State: AOAM531APfCz/Za5gpU3/VB8xRYe7Dv2gC3FUkd/Dxvrf1zOLUSNQCco
 HvUEwaihM03Hq4Y7Ik6xszFUgIw4o9rqUw==
X-Google-Smtp-Source: ABdhPJzHBvQ2YRhxQ/vi/CCpxZoCu9gPEzmMi0+rN2k3XX7igJHiIlYDk/hFtawwWQv9unrd84Nsuw==
X-Received: by 2002:a17:907:c28:b0:6e8:9e2a:a76f with SMTP id
 ga40-20020a1709070c2800b006e89e2aa76fmr2467753ejc.345.1649945958518; 
 Thu, 14 Apr 2022 07:19:18 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 m3-20020a17090679c300b006cf9ce53354sm670527ejo.190.2022.04.14.07.19.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Apr 2022 07:19:17 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 202DA1FFB7;
 Thu, 14 Apr 2022 15:19:17 +0100 (BST)
References: <20220326132534.543738-1-richard.henderson@linaro.org>
 <20220326132534.543738-28-richard.henderson@linaro.org>
User-agent: mu4e 1.7.12; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 19/39] util/log: Remove qemu_log_flush
Date: Thu, 14 Apr 2022 15:19:12 +0100
In-reply-to: <20220326132534.543738-28-richard.henderson@linaro.org>
Message-ID: <87fsmfwxwa.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x636.google.com
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
Cc: qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> All uses flush output immediately before or after qemu_log_unlock.
> Instead of a separate call, move the flush into qemu_log_unlock.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

