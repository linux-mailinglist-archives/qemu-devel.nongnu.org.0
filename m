Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6108B399D5D
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 11:03:41 +0200 (CEST)
Received: from localhost ([::1]:60988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lojGO-0002kp-Fg
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 05:03:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lojD4-0006mB-Kl
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 05:00:14 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:44815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lojCz-0006ZD-Be
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 05:00:14 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 p13-20020a05600c358db029019f44afc845so3209181wmq.3
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 02:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=R29Fo2RpU1BGJJM3VJLOra8o7XApw+0K5YKOb5nf8XQ=;
 b=ra+nRD1XNl0oDpxrTioCqtgga4nsdRi22h5RF2PD7gsyyO7FcLwTodeIGKnupaWuZX
 QTAAB98A/37gFIAN5lmkZbaxTOlXpqeYz63dhkbw0d3z07K7ow0SCGv48+7q5EEnc7bG
 Qk+5M90Ec1DQnRs4oAUi+ePd/xSSRIUJDIdHua/wRV33A4F+fVCXfgvAOn4x6u2dzwlr
 MQIml8LlQxVAYeYmNtR+5yRcRTeYtjPvrhEmBTgwZv/NEYuC4nhIuCu8X+/RSdRHRqRi
 aKPU+gtP/KAgpz3cGW9o+9haSsa0Ut9pzE4b4L6Hi99KWxMmtEUoH3j9orrOYZ9l04KK
 b0CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=R29Fo2RpU1BGJJM3VJLOra8o7XApw+0K5YKOb5nf8XQ=;
 b=TTpiV9Gz8448wZFFG5HNMowtzVjMjGyBAsvGDgGDrFv7ojQTl8SAljHRAdD3cas9mX
 dfL1t9updLSmVQiSKR12HAvqV8H+BAw8rJuRqy4C4K/2RbNDc/YE7NlCKFOfcSc6/OX4
 LB1Oh+X6g4HcXR5gwu1c69GBcqnHOInqYHOUtDaNxUdEsH9EZM3ajN9jxQCtLv+E60EH
 O5FLf9iUieSVm18igRGLz0fLm+qSnvNxCYzUMVjxEFqcgtprl2uXnjCrJhC0XTiBJ4YE
 0DWTdJ30RFeWfpzp5MRvlmMUE12D1pMz3q1fWJKSeayQGDmPRXDJl/kfqo3AD4Oz3nRZ
 QUrg==
X-Gm-Message-State: AOAM532pcB5mJmDLOlWFlrEBVAYT8F2N+ULdD6LdkMnrhaotLYozMWi3
 XHjrls1EJB5q/OSlIISr1LYQVw==
X-Google-Smtp-Source: ABdhPJybRcJ/iZJioIA5lB3eAnJWeRDe1nm6/yUeGRaHcdI6uEsnGQu28X02mQH478s3NHrYV7UpoQ==
X-Received: by 2002:a1c:5f09:: with SMTP id t9mr7990397wmb.42.1622710807220;
 Thu, 03 Jun 2021 02:00:07 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c7sm2620990wrs.23.2021.06.03.02.00.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 02:00:06 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C6CBC1FF7E;
 Thu,  3 Jun 2021 10:00:05 +0100 (BST)
References: <20210525150706.294968-1-richard.henderson@linaro.org>
 <20210525150706.294968-6-richard.henderson@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 05/28] softfloat: Move compare_floats to
 softfloat-parts.c.inc
Date: Thu, 03 Jun 2021 10:00:01 +0100
In-reply-to: <20210525150706.294968-6-richard.henderson@linaro.org>
Message-ID: <87tumf9vca.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
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
Cc: qemu-devel@nongnu.org, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Rename to parts$N_compare.  Rename all of the intermediate
> functions to ftype_do_compare.  Rename the hard-float functions
> to ftype_hs_compare.  Convert float128 to FloatParts128.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

