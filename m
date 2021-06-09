Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B50CF3A1024
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 12:32:30 +0200 (CEST)
Received: from localhost ([::1]:54094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqvVd-0008Ur-Pb
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 06:32:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lqvTA-0006Qr-7E
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 06:29:57 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:38879)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lqvT6-0005eT-Tp
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 06:29:55 -0400
Received: by mail-wr1-x430.google.com with SMTP id c9so16198669wrt.5
 for <qemu-devel@nongnu.org>; Wed, 09 Jun 2021 03:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=rV1psOxkPVriJiWZlD/xVmgL7GiUAzvV11wVcUyC0zc=;
 b=YUtwawQmy8OCFdjb5c/dKb5AdHvlKTPFyXuVckGdEnqwUNUKcIBD9hifVQgKf+lmZd
 pm08ICdmO5+CKsfAqWoSF8YL5GeWikVUO1FVHOIxRKvim0oYftJZIrjUQQyIBtREUuZ0
 2bXlJOew8T0/m2G0JkACfrVh0xlwt1QZHuwqRs8SWBUhl8oNOEDR4HtNJu0g1xgQO7l2
 9gDd7Oo9Xm2B0t39XRxuF7CmZQpIAhgfkxJWD+pEIKQNQADrgFDmFeoHl6NKe3hpYhWs
 1ah3CS+jrmmxrv+abl2JKiTVwHHUppvvOJBz+ZXCLhgNF8KKv51636gGjPEfP25L+yyd
 k2Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=rV1psOxkPVriJiWZlD/xVmgL7GiUAzvV11wVcUyC0zc=;
 b=mg0lecgp5Hb83wNN9W3MO8C1iPWfQ+2e6mbxma7LeFMMX2MxkXnQy7MEqWmghAWeX3
 g/c4VjCcSgaAowNvTnc0hfYhlKc3LTUPxoP+qKqR50bArqqPRB7R97hVct3dAtsRaCQ3
 EOfrSQxIaca0n3x8pNd1pa5ejg7x7PP0t/OKNgr5aMj5JaiHzWbCjLi1WAd+5zkeWEST
 KA0PuRZlmzvHlCAGPdeOPWh6WEkYbsUX2Xteoh130qrc9J2pfqKHWopnNDcz9KrQSG+K
 FXX/3CeeHCAOw1gQMuJomiv4mdxf9aoErI9QoNttoE6FT5WIM9Y4flu78y6k8rH2iwSF
 JVQg==
X-Gm-Message-State: AOAM533x12j0lwlxsa+ry8V4mBXJdUy8vIcL+E+DIM8ZuQS21w/nKw6g
 odDnsUFzarDpoMJswcbmGSy8f06i8GSUig==
X-Google-Smtp-Source: ABdhPJziQV2qnNw56dJYl3UnR9BdkExa1hUvABpPuCLYI48bHDM/FEjZ0NL6Hl9kNWekjlQypsHcsA==
X-Received: by 2002:a05:6000:1803:: with SMTP id
 m3mr26879100wrh.257.1623234591662; 
 Wed, 09 Jun 2021 03:29:51 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id i21sm5653232wmq.12.2021.06.09.03.29.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 03:29:50 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 79E9C1FF7E;
 Wed,  9 Jun 2021 11:29:49 +0100 (BST)
References: <20210502231844.1977630-1-richard.henderson@linaro.org>
 <20210502231844.1977630-22-richard.henderson@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v3 21/28] tcg: Allocate code_gen_buffer into struct
 tcg_region_state
Date: Wed, 09 Jun 2021 11:29:44 +0100
In-reply-to: <20210502231844.1977630-22-richard.henderson@linaro.org>
Message-ID: <87mtrzjppe.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Do not mess around with setting values within tcg_init_ctx.
> Put the values into 'region' directly, which is where they
> will live for the lifetime of the program.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

