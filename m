Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9206FF61B
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 17:38:04 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px8MD-0006kw-T8; Thu, 11 May 2023 11:37:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1px8MB-0006eA-O3
 for qemu-devel@nongnu.org; Thu, 11 May 2023 11:37:27 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1px8MA-0000lm-5F
 for qemu-devel@nongnu.org; Thu, 11 May 2023 11:37:27 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-30771c68a9eso8044393f8f.2
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 08:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683819444; x=1686411444;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rXHNSGbcOWbgUmuuhobkP3aMx+GUeB8lIcg8bBXNysY=;
 b=YNeVyHoS00ZwnZFT+aO7UULk8FXv17PgLf7bTPd7wpOUHExWmszW7X8+CO2hg6a1JP
 4M+PDQtGQ6izHkclQon5JHz9GoqBuQIfbCtHU6ZkEqokDy3LzMI/CsIenpBVfTd0epDo
 Yl+mQLH0chvTi1/TKI7tOFC1cUmUD7P5fhqpCxBbzrsb/ifRuOzu9haRAvR+mdttD7RZ
 gNaf4wZuFjmOzWLoTX9qYh6J9/GJ9nbLsGPyZtSlBTjN1l9WUls6ZShxCREk9zcwKeg6
 sNdyMjvdxo+2SozqcNbt76QlVEQ1boUXGRp3+Pj+4Vih98rZh9D/lwy51zhUncHPK5UO
 qBKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683819444; x=1686411444;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=rXHNSGbcOWbgUmuuhobkP3aMx+GUeB8lIcg8bBXNysY=;
 b=gOBa3D1e0O0QfsZN4sl0yXTje2HweTLiQ+EF7saPd1mqqAGLdnV19mZGChi6Liphzu
 wtAmQNwx0qqqbmBlSFAYjJr/Pz3NLIArcMVt6dJL60myBoULwg/koki2GNuUH0ZUJYxC
 Q8jJPDcTWR/VnW3nHI5u3rl81/fgt88sGFl3OhYkTUkC9oX4Xz7yMysTOpWDrrqfNAnR
 EKH6lEL0cVYITPXgMsPczfCqqXculBqYDhzY++JauCtYx/hTehqYiE0SLbulZuWiDG+w
 I8IQ67H2dRXBPLIaSNQJnIV643LjsdG9NbmVUVtnpppsMYqpxYsoQNzKK9kVmy2ZY2TC
 v+lw==
X-Gm-Message-State: AC+VfDxrXLBn/yz0rBgYfuWE2YFVJquUL5L/deeP6/yMXvJIv7R8+G4i
 wgBrNWegD776V0MXNKUUtdsREQ==
X-Google-Smtp-Source: ACHHUZ7wPh7yUQBAN803vhTmKvPscPSUs/EI5MPoJO/tx6B+hL87oxFdjcODUfHeG2jNint6QHSNkQ==
X-Received: by 2002:a5d:4403:0:b0:307:8800:bbdb with SMTP id
 z3-20020a5d4403000000b003078800bbdbmr12919718wrq.58.1683819444462; 
 Thu, 11 May 2023 08:37:24 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 q12-20020a05600000cc00b0030795b2be15sm13115894wrx.103.2023.05.11.08.37.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 08:37:24 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A98FE1FFBB;
 Thu, 11 May 2023 16:37:23 +0100 (BST)
References: <20230503072331.1747057-1-richard.henderson@linaro.org>
 <20230503072331.1747057-9-richard.henderson@linaro.org>
User-agent: mu4e 1.11.4; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: ale@rev.ng, philmd@linaro.org, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, anjo@rev.ng, qemu-devel@nongnu.org
Subject: Re: [PATCH 08/84] accel/tcg: Merge do_gen_mem_cb into caller
Date: Thu, 11 May 2023 16:37:18 +0100
In-reply-to: <20230503072331.1747057-9-richard.henderson@linaro.org>
Message-ID: <87zg6a2824.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Richard Henderson <richard.henderson@linaro.org> writes:

> As do_gen_mem_cb is called once, merge it into gen_empty_mem_cb.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

