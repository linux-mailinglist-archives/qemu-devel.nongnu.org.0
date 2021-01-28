Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C12307B17
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 17:39:34 +0100 (CET)
Received: from localhost ([::1]:41778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5AKT-00021s-VA
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 11:39:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l5AJD-0001FA-A2
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 11:38:15 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:38303)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l5AJB-0001bc-EN
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 11:38:14 -0500
Received: by mail-wr1-x42f.google.com with SMTP id s7so3068768wru.5
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 08:38:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=Ma+Ervy49eCaCVcluMgULNy3IZluJZrW6lkRJJPyfRY=;
 b=u5U1EHw5c1UbQNwCFMwxMIEdOXkXoy1xKRVyHdIA0GFyS1Q2EuC6qMAZhAsPVk+F9Z
 wmHWUA6gBbc4DXHOXCqUIc8iqRmvYlUVy1hzpSx9ShPEFN2I04GoSknXUyQ4Bq7YD7HW
 0X0SAFxaikeMa50iEPrjsEG0OIgw65feXAKsDuYpe2078rK5f1mp9G4djO2i+a7DyROw
 sZ6QjTOrQDlm4M7JwyvBQd0RjfqzA1NpJVdawGD7XUiomJmgY9YDmIOr8GXiDzARE0/y
 neXbLYLjvdT0VfOGhkMqeGqhLH1XygqGeq7aGGf0Ghi2HYtkV9Y7gO9p9aTg1Kx0ipLz
 u2hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=Ma+Ervy49eCaCVcluMgULNy3IZluJZrW6lkRJJPyfRY=;
 b=awiHHBrIiz1YhD8XdYU7jjziGYnwm5SwiEROcmC9+0m+moSWYAw8USYtEv92vqweT0
 gZeHhA4yyrldB+cJTAbEt50HP5BsPAURJQzwU+FhBQw5gG3ygvGTgTIhvVR3Fazv28Zm
 GU1cz4dO8/u5BblCAlUQW8ROAW4nD0aEI01F6igeIOA8fO6WbbsndrEsV5lrWIsTSWaU
 +g96XxQ0xPR2OYpGbByt3mwbxt1eahgNqDi50l+QBvG/cu486OQZxP+GKefHhTPshOi3
 1QZRI5yDXQmcoAubRFtgbse2VSZosODqzH1FKAuuAjTRD5wWi8iUEuWo/GaIwYi5yAjK
 hYRg==
X-Gm-Message-State: AOAM5318U/w0+9UhfjQVZ7NJaJv3H48dofW6m7un5CIrydcEMzXhIy5Z
 u+JE4tdVc+piDqaezgOXiX3fjw==
X-Google-Smtp-Source: ABdhPJyj9Fn0+P4Dti4pQiJDK/GAfQklJC6AhLabdUPgoGiTh7c08b4xToH8I5zLiGYK8nQopd71nQ==
X-Received: by 2002:a5d:5611:: with SMTP id l17mr17717596wrv.2.1611851891194; 
 Thu, 28 Jan 2021 08:38:11 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c16sm7459663wrx.51.2021.01.28.08.38.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 08:38:09 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 063A21FF7E;
 Thu, 28 Jan 2021 16:38:09 +0000 (GMT)
References: <20210128082331.196801-1-richard.henderson@linaro.org>
 <20210128082331.196801-19-richard.henderson@linaro.org>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 18/23] tcg/tci: Move stack bounds check to compile-time
Date: Thu, 28 Jan 2021 16:37:44 +0000
In-reply-to: <20210128082331.196801-19-richard.henderson@linaro.org>
Message-ID: <87lfcdt3tb.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
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
Cc: sw@weilnetz.de, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> The existing check was incomplete:
> (1) Only applied to two of the 7 stores, and not to the loads at all.
> (2) Only checked the upper, but not the lower bound of the stack.
>
> Doing this at compile time means that we don't need to do it
> at runtime as well.

You confused me with the statement compile time until I realised which
compile time it was ;-)

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

