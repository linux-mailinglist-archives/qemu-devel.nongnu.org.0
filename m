Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 492B2433C9A
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 18:41:33 +0200 (CEST)
Received: from localhost ([::1]:45042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcsBA-0000Mo-Bv
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 12:41:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mcrCn-0001y6-Lk
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 11:39:09 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:51758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mcrCm-0002uN-4b
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 11:39:09 -0400
Received: by mail-wm1-x32a.google.com with SMTP id p21so12473945wmq.1
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 08:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=diWQhBtGVRDypJsSR2DtNUGT51Q/w01bAxdJl4S/REQ=;
 b=qHxJpgBGpQwZEqf7UuEiVBnZTe+Svasi+Xs6xk7HxYvoMUKEDhg5bFuNp6Iw+8gNUn
 rfBZPvVnw7SWhlxPC8XK5vLRjTFxHB8k1EZpreROvRkumyF8AvVQjsg/v8MM9eggKjXM
 lddSGftriHPoj9zMtXEBJ4jNr+imhrmFJ2fdkuRGTFVyeM2/kNN90ixqNaMmffpXmZOb
 TZyglEoG3INjQXlwAO3ZQSJBbof27I+JeVb8cBA0MITP8VzO4fKAnvlQCVy3JB4W+I6R
 Up4+Td2g+Y5J8+1sQJrL8f/Vvbaea0rWLMHuLjPIOI8EUnTuiPCwb8U+GtKgYql92Jzv
 vBMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=diWQhBtGVRDypJsSR2DtNUGT51Q/w01bAxdJl4S/REQ=;
 b=fO0an4XDxjRmPvjoZYNhsNZvC6F/WF3+qW11OXjQYmbL+r3vTJcwn/SzG1C6IgwvaR
 BQLimjEM2j8rT+s/gPkPoSrG2dbLtG+IvrU7PJ+b+/BUJ0/QmJ+JbAx5nsXD8wliNHeQ
 19WCZPlhV9GYU4f9qcn7wW1Nq+iFdGHlhQ0DKnJU+x80/A4If6fWp4lcllz6zmDQt5Qd
 6ciXaapDF68U83Re84jgAiXSx8/gSu/Q9AwvsUQgCoRlO51WhuIyOBcmhAFFqePd+tpd
 47ENq0THY8tNnCaQH43QdwFUvGYj6gtqF0vl5feCWGO2Ks+ZBxgojmb/scvRpUfafqol
 B+KA==
X-Gm-Message-State: AOAM530RaXzW1QDp83zlPhP52QSU0i6elDMiyZjbaZwyDya9XkCqqmDp
 +eJ9jvY59ysN2XpgQ3HCEf/4G/OxvmSR4w==
X-Google-Smtp-Source: ABdhPJx5SfObCjkjKOiNcT/6EDFMlX8q5YwiiHBCq1HyLF6ndEBZ//uv2Ll40i8uejAMrRaPOxGk6Q==
X-Received: by 2002:a7b:c4c1:: with SMTP id g1mr4026873wmk.2.1634657946253;
 Tue, 19 Oct 2021 08:39:06 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id i17sm17881570wru.18.2021.10.19.08.39.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 08:39:05 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 17C671FF96;
 Tue, 19 Oct 2021 16:39:04 +0100 (BST)
References: <20211007195456.1168070-1-richard.henderson@linaro.org>
 <20211007195456.1168070-5-richard.henderson@linaro.org>
User-agent: mu4e 1.7.0; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 04/48] tcg/optimize: Change tcg_opt_gen_{mov, movi}
 interface
Date: Tue, 19 Oct 2021 16:38:59 +0100
In-reply-to: <20211007195456.1168070-5-richard.henderson@linaro.org>
Message-ID: <87ee8hxbvr.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
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

> Adjust the interface to take the OptContext parameter instead
> of TCGContext or both.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

