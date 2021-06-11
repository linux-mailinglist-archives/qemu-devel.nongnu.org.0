Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 880CE3A4127
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Jun 2021 13:19:54 +0200 (CEST)
Received: from localhost ([::1]:33874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrfCb-0002w6-Jg
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 07:19:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lrfAW-0000Ov-EA
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 07:17:44 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:33752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lrfAU-000146-Pk
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 07:17:44 -0400
Received: by mail-wr1-x42a.google.com with SMTP id a20so5688640wrc.0
 for <qemu-devel@nongnu.org>; Fri, 11 Jun 2021 04:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=9tmKiz1Kd0zxkt3OjbB49LLqHhNJGB4HuXio0nrE2LY=;
 b=inqqbJZWRIDSiFx5jVSqLi9Lr7Voh9lOV3IKVQ2FoyMfo17H1ZdlXTw6od4uFCbdJh
 XCRj0LZSYiStrW83iDr3vIviNdZDTtl2cOHEUfB9aY5DsUXqtbvk3xznUOR+kQPK7crW
 Ql6FUWoAVLRiqMZAiUOyObyXvVvuYpUUdoKKx2+FO4Z7hviVz+1qGn/SYlR+nU43wVEq
 V6OeqVrNO2IBzm7G/nh9l3xo3EMUXG6WGBbnA5q3cAog8RNvdIXdjyfiTpUOx9jnRNAX
 q1WVZocLZ+JC0fLkhbSgGaMfM75YymPvTcU02Ivm0VjfzC0ZA9nY2lVw8Y0f7iLUmTcc
 G6pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=9tmKiz1Kd0zxkt3OjbB49LLqHhNJGB4HuXio0nrE2LY=;
 b=V+gi6H2LgwS27KHr3NZ/zV+ayh+fU27LWb/FKXfAhm2ysupQsn3pEbfq6WTtWzb/wM
 kduoqV/t1r/qezvVo644mD6hL21hLUqm7bUcNc1etYfiMj1TdS1Ren2M+4Tof4c3EjFn
 bET2QzMzGBY2bQkrFbIUhULsvV3FBRvtGS88PY2HdSWA2telmXvUD7muLbyR2PGBQfKB
 dBH/HIzTG2R9OEnPE1WyN5hia6cEuq4qOzjqDF2Qv+Ee7lgq2Kf/tJy75l0W8933jpJu
 IJ5j2WqmMyvoYGTSpVq0VX9rVn+OQUXTUR7rozEyKVTJqI4CHBWum1gzGp0fVM9djsBD
 RjYg==
X-Gm-Message-State: AOAM531WmNveXGDQ6dxhT12mBhon9hLsJLZlHlQah2JBGx32PcNGgw7R
 O4fJSLKs2mCVhD3KET248tejtQ==
X-Google-Smtp-Source: ABdhPJxhSjX5dg02/FY80tGFzp9Nal4/gcOKoWfNW3ao5lM0O44+U7vX95UOOTvmuw3knwlPULByag==
X-Received: by 2002:a5d:628d:: with SMTP id k13mr3462494wru.410.1623410260990; 
 Fri, 11 Jun 2021 04:17:40 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o6sm7253937wre.73.2021.06.11.04.17.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jun 2021 04:17:39 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 666031FF7E;
 Fri, 11 Jun 2021 12:17:39 +0100 (BST)
References: <20210610164111.233902-1-richard.henderson@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH] tcg: Fix documentation for tcg_constant_* vs
 tcg_temp_free_*
Date: Fri, 11 Jun 2021 12:17:32 +0100
In-reply-to: <20210610164111.233902-1-richard.henderson@linaro.org>
Message-ID: <877dj0irak.fsf@linaro.org>
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> At some point during the development of tcg_constant_*, I changed
> my mind about whether such temps should be able to be passed to
> tcg_temp_free_*.  The final version committed allows this, but the
> commentary was not updated to match.
>
> Fixes: c0522136adf
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

