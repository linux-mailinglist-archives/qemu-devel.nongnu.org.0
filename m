Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC7975010A9
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Apr 2022 16:51:32 +0200 (CEST)
Received: from localhost ([::1]:49512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nf0ol-0000Sm-E2
	for lists+qemu-devel@lfdr.de; Thu, 14 Apr 2022 10:51:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nf0mu-0007iv-Mp
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 10:49:36 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:38802)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nf0ms-0006VS-TB
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 10:49:36 -0400
Received: by mail-ed1-x52b.google.com with SMTP id z99so6679291ede.5
 for <qemu-devel@nongnu.org>; Thu, 14 Apr 2022 07:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=2dPQbByjBmUSpQI72Gey/qSMWkS84Wz3Mh8yU4FMj7c=;
 b=drg3UKgfx0cNDKpY98k24uyvoI44+RhmU6Fj7dvurmY2XYSldXMLUGSqGAPSG5AReo
 dFp90BkdPXXEk6g3qenP9n3my3RCnz2GU4i+5hS/9+Xm79kX7IEj7NzW+Xiwj9J48hKO
 mK+jpSOv6Z3jN1pduFKcGHnNkg+4MdL8IvC+AFEyfvoxVgdS8aQ4010qIbo9vRge5JVC
 c/AmrDfGAJXkAAAyYX1FFuv55u8Dno5LbEdD9wjR1yZoTzYVuFVNjWUXuesqcwTpOcdX
 kq+zuAA4JT0fZg0izzPhsFMnG1rCwzXhHaOQeRrcF+NO/j5SbG6TZBIGd7cVkR/T02i9
 Iu1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=2dPQbByjBmUSpQI72Gey/qSMWkS84Wz3Mh8yU4FMj7c=;
 b=eWV5ZVi6LfNVhLK0uBGIAx4sdg3kOMpnZSXpasZ3BNlCGdeY4vyIpEC9VDliqm18rO
 yjzFxPcFbuVm7Bj7So5rKCbIOF4qRP0hUj8KpfjdPkachhOJGd4CGcDaZ1imj9iHjgRq
 +Ncj74JFZEN/IXzWDIh9k0kyaZ+dX+2d9oRveE83w9E1mRXzSF9z0RA241FgHAhbHGZn
 F70hCZtFHgUAz4BGVo29SV+BVn5NAh+uCXo1ycQyU9bNi7CSloq+zy0NGAnNx1z7MZOr
 unD8SeIajwW4nOOOeLq+DsBcrDA8rv5yMmq1h+bUOebaEtOSbdrt55wb5D5EX/PWU9kO
 NuZA==
X-Gm-Message-State: AOAM532OcwiZ09KDQ7a7QIDb195A2nK1y/tw6BFaHdcOwwxcVrnxvq4b
 L6HsbAINWv/EoNvXfhqU89YVkA==
X-Google-Smtp-Source: ABdhPJz7bdAqxmqlTYqputdXGqbjjjyrrcx5R36X6OyARg5v+1NyoXnnpNJTLq87sOHMQHL4RsC4DQ==
X-Received: by 2002:a05:6402:239b:b0:41d:89a6:473d with SMTP id
 j27-20020a056402239b00b0041d89a6473dmr3361067eda.105.1649947772898; 
 Thu, 14 Apr 2022 07:49:32 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 bo14-20020a170906d04e00b006ce98d9c3e3sm687400ejb.194.2022.04.14.07.49.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Apr 2022 07:49:31 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D90B11FFB7;
 Thu, 14 Apr 2022 15:49:30 +0100 (BST)
References: <20220326132534.543738-1-richard.henderson@linaro.org>
 <20220326132534.543738-32-richard.henderson@linaro.org>
User-agent: mu4e 1.7.12; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 23/39] tests/unit: Do not reference QemuLogFile directly
Date: Thu, 14 Apr 2022 15:49:26 +0100
In-reply-to: <20220326132534.543738-32-richard.henderson@linaro.org>
Message-ID: <87tuavvhxh.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52b.google.com
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

> Use qemu_log_lock/unlock instead of the raw rcu_read.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

