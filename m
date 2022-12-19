Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC3A651132
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 18:24:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7JsE-0003BZ-OA; Mon, 19 Dec 2022 12:24:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p7JsC-00038j-Sj
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 12:24:20 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p7JsB-0003Jb-6F
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 12:24:20 -0500
Received: by mail-wr1-x431.google.com with SMTP id o5so9408019wrm.1
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 09:24:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TXp4BC5zayxSufYk8qNyXUS4X/1HVNU4Wp6ktPjk0SA=;
 b=Xgo88aIqZU2XxfiFOhHrSgjtByl5tCC8DH6EB6hWU7bO5zJa4uyGV1PNwyJcLaYdPx
 e1HQ9iqua2CbS0KJERYKl0SQBQQcFNwXS7NFGYh107A4PjfUHQP9VS5eYZw4h/43ov4Q
 ancN95EwWwcjPt7lV+NLkMLzsomh2U0eyz102OTifu8uJ2thgOjnlZGncXC8x0uRxztw
 2xWXVqglGRP0L6ENMgZiV2SDDHJtwyLQYmu8ZDf+0U3el04PNOh5P4YGqlMd0brDB8m2
 vvQoAH6WHo/3ux2TUcmMa3IEPEJuJlVdNjzS6UzKETozSeVkKCeY2C4TuE0RsBHpCKXH
 VxSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=TXp4BC5zayxSufYk8qNyXUS4X/1HVNU4Wp6ktPjk0SA=;
 b=aj14HjTogS79rcyIWV5rY6NghjCmIDfFigcB2xoSc7rooOTsoysbF7EWcfxXbqGT7E
 jVzsAJT8GIRSAefUJMIJT/1Om2VyQBYuZgxPI0rLJRgabauZcDkMc8Zp2nqE1Mj8TFqL
 EzRGVP5yWuHnzRWLWVZlzCw120GW6kW6CnFf7VEl2KOEnHblHFmPG+xOZQEcrRr22qBT
 Uws7TbK+h9diMtC3talv8e7XXuNW6srOBLZmU/hFI2iwOnR8Vww/s+uhdqzR2KgrwbuJ
 VpEF3iPgWmXx5UqtRJE4PQnMCccWA8juVbCzwBxh8bXGWDGNHeTnpmgCIadWNT4QwzB4
 x8rA==
X-Gm-Message-State: ANoB5pl7dGYgMRRJ6hkIUmX/0/Gp4Unw2ym4JCwIDRsQfOop8UdKNtMo
 tBUXYAYb9MrYAKjN2ik4L5CDotvaDvoAc4re
X-Google-Smtp-Source: AA0mqf5OAIUmUuGEHHkvB1jCX6tepHUH4MrcYXYrEOSmtYozM81DweNygFtYv7JuGRVfsARdchL3sA==
X-Received: by 2002:a5d:4750:0:b0:242:15e0:d592 with SMTP id
 o16-20020a5d4750000000b0024215e0d592mr36380996wrs.33.1671470657731; 
 Mon, 19 Dec 2022 09:24:17 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 b8-20020a05600010c800b00241cbb7f15csm10603816wrx.106.2022.12.19.09.24.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Dec 2022 09:24:17 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 08B1B1FFB7;
 Mon, 19 Dec 2022 17:24:17 +0000 (GMT)
References: <20221213212541.1820840-1-richard.henderson@linaro.org>
 <20221213212541.1820840-20-richard.henderson@linaro.org>
User-agent: mu4e 1.9.7; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>
Subject: Re: [PATCH v4 19/27] accel/tcg/plugin: Use copy_op in
 append_{udata,mem}_cb
Date: Mon, 19 Dec 2022 17:24:11 +0000
In-reply-to: <20221213212541.1820840-20-richard.henderson@linaro.org>
Message-ID: <878rj3johq.fsf@linaro.org>
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

> Better to re-use the existing function for copying ops.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Acked-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

