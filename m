Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95EEC5010D0
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Apr 2022 16:53:40 +0200 (CEST)
Received: from localhost ([::1]:54792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nf0qp-00043M-9V
	for lists+qemu-devel@lfdr.de; Thu, 14 Apr 2022 10:53:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nf0p7-0001x4-HM
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 10:51:53 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:39440)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nf0p6-00077g-1s
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 10:51:53 -0400
Received: by mail-wr1-x431.google.com with SMTP id m14so7268890wrb.6
 for <qemu-devel@nongnu.org>; Thu, 14 Apr 2022 07:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=cbhbByvuZF0hbDcITXNfrz45odlYJuzTz0EppxN/Wq0=;
 b=K5vZ5io+R5Y4LHHgyW0TMaLdYOVHApPQcvDtc+ZiH1x0VhkR6zUjBbZtCCLLmA4GZr
 B/1O2ZZoNqjV/FZUHctecdUyGVum3w4inB4SETvSRJlGYwY0aTW6Drzdz0mmhXNSIC0K
 l2jUyyta1ziHogd8ojb4BTyq2tXXe+U9K/o+XGxp/gwGHuuRSSzTMRZEwpWxXY/AICs3
 03ae2uxBxPiA8pVsXiMkTmOr0HOglHenn/CtF1T0wAsOYtSKwMy7VL8T++m2jano94KS
 zPFkEzUwMkIdlrMV9KLCYiy9cJ9qgMMMqbQpfmlO/2gRUkOxIjTn3cImegBOHw74CxD/
 o/cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=cbhbByvuZF0hbDcITXNfrz45odlYJuzTz0EppxN/Wq0=;
 b=HRYb+Q7T6hgiVLW6ZaL46Ci0AQi7q+JWvAcg4ypxjOpnhPBA4wCi4wjXmSiQPy9xFp
 ksB6h97fSEj9LUpmBQxFWo62/DzmSL1Sitrd6M7K0PN388NOZpnRbpshS09rdw3/qyDH
 TZmkvLsgyoSD3AYrAYiIjFvubi4K1KHn9Kaf3Z6bQYEfhDzoeomYlPveS41tfVn4RuFG
 4JFMHniWqY7+1fk7prN2kF1ocLaN2G30guZctKD8V0mN9tV29kssbyKjm6m9bW0AS/A+
 t0cSGNmJUQTIyoGQ0lgYapTQjnv1a/JL3QTMUkSwGJor0/+ca1Ii9s76NGCEGycjNmR1
 MuuA==
X-Gm-Message-State: AOAM530irGDgFzXAHiHyyr3NVzh7BfzioQZh40TH2jgo+g52jrauxlyY
 3slN9UMPIixrOvEsglpt8RS8mw==
X-Google-Smtp-Source: ABdhPJxOMLIuuap7TdMzJRSGDwR1wRpdRDp7mbJTdlxcIauSpjhqz1C1QfmMYw5I92T5qQOAI3NVlg==
X-Received: by 2002:a05:6000:15cb:b0:207:9d85:1c1c with SMTP id
 y11-20020a05600015cb00b002079d851c1cmr2429529wry.495.1649947910592; 
 Thu, 14 Apr 2022 07:51:50 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 2-20020a056000154200b00203ee1fd1desm1997010wry.64.2022.04.14.07.51.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Apr 2022 07:51:49 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4F0851FFB7;
 Thu, 14 Apr 2022 15:51:48 +0100 (BST)
References: <20220326132534.543738-1-richard.henderson@linaro.org>
 <20220326132534.543738-35-richard.henderson@linaro.org>
User-agent: mu4e 1.7.12; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 26/39] sysemu/os-win32: Test for and use
 _lock_file/_unlock_file
Date: Thu, 14 Apr 2022 15:51:42 +0100
In-reply-to: <20220326132534.543738-35-richard.henderson@linaro.org>
Message-ID: <87lew7vhtn.fsf@linaro.org>
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> The bug referenced in os-win32.h was fixed in mingw-w64 v6.
>
> According to repology, version 5 used by ubuntu 18, which is
> not yet out of support, so provide a meson link test for it.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

