Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B955868BD3E
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 13:49:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP0vW-0001gL-5f; Mon, 06 Feb 2023 07:48:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pP0vK-0001fu-TI
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 07:48:46 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pP0vJ-0003RW-CX
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 07:48:42 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 f23-20020a05600c491700b003dff4480a17so2353161wmp.1
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 04:48:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EuBry+mKvbixcO1Ga2Feg00C9N7emtjYOwiBjij2BxQ=;
 b=sDSMJWsqsANq9nf7lOg0DZWoIlA9zaxmWni3Li8R6qQIEFtNhxfAcgjGiTZ9IuQkPG
 u2ONmta/nWyiEm8CPeZZq+Uk7vuXYnE8TdOkai3i7HpMcuVpBzt/EOwRMdm7lA34L5iO
 k+rOfkewzNuV+APr6g1O1KCzByzqtn9xRR2ESyiUxPmzPoZA8aXh0+6jvjc1W/2jKPK6
 uDTXuPGLOqCz3y5SnYVV6WUborXGoUBl4vBWtQO2EIItTuVlnUQ1u6X2/eswJaxGOCQR
 +PcRWGhOCR56IaGSuwA8WiHJXF8DKYnGViPMZdZCKH75La+nfy28XPIQLWRj/oz9HjiK
 Hmtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=EuBry+mKvbixcO1Ga2Feg00C9N7emtjYOwiBjij2BxQ=;
 b=7HtsC+uggWZ9Y3JNQ8Z3q765xAmcf+kUB/tWb39wJu3nTlwTGpDNG942lTOm6OdluM
 ZE9nQaZigUJLjoPHtrv3RkP0kXLoGzhmUpWqE1oPv8heco/2F91SrJ7CzEZH27qekITn
 dgFOBR9zkzkXKjS4KU6ICshRbsR1/87YkYmUeftRexKRehrsogo0suVlDuREK0TE4yLh
 nM1KFk1IlfC2A4L/CBHrv7hSVqw68yK4Ctnsx6vU+R6OtlYCe13YPV2bswZfA+uH/yv4
 zh0AXWJYWFndEFXKjSJS7BfRDwVZKzbUuLZ1/rCN6b50Q7VKHxGzX+JGMwmytC3qRjDx
 LLMQ==
X-Gm-Message-State: AO0yUKX5CCuHs0/AJXRFUTSoEU4ODEBUwY54EaWVC9FEH4kLfhKBl3/f
 RFyaIAsmFpf+Y9D2UvDrJsMhy6f5si+vK6wW
X-Google-Smtp-Source: AK7set9EPvrgT2snaHP9FRb7JMjMWUo5qXayY2YD3+/rSeoV3IsORKtAtfTVTleiSmygVuMuR7uv/A==
X-Received: by 2002:a05:600c:601b:b0:3dd:1982:4ce0 with SMTP id
 az27-20020a05600c601b00b003dd19824ce0mr18400890wmb.16.1675687718489; 
 Mon, 06 Feb 2023 04:48:38 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 o2-20020a05600002c200b002bde537721dsm9020659wry.20.2023.02.06.04.48.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Feb 2023 04:48:38 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 980FD1FFB7;
 Mon,  6 Feb 2023 12:48:37 +0000 (GMT)
References: <20230206102037.3621709-1-armbru@redhat.com>
User-agent: mu4e 1.9.19; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Markus Armbruster <armbru@redhat.com>
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org
Subject: Re: [PATCH] meson: Avoid duplicates in generated config-poison.h again
Date: Mon, 06 Feb 2023 12:48:30 +0000
In-reply-to: <20230206102037.3621709-1-armbru@redhat.com>
Message-ID: <87edr3q7ru.fsf@linaro.org>
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


Markus Armbruster <armbru@redhat.com> writes:

> Commit eed56e9a89f "configure, meson: move config-poison.h to meson"
> lost a "| sort -u".  Restore it.  config-poison shrinks from ~4500 to
> ~700 lines when all targets are enabled.
>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

