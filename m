Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B64765D300
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 13:48:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pD3Ak-0007dP-UD; Wed, 04 Jan 2023 07:47:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pD3AH-0007Yr-Hm
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 07:46:45 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pD3AG-0003t0-03
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 07:46:41 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 ay2-20020a05600c1e0200b003d22e3e796dso26349681wmb.0
 for <qemu-devel@nongnu.org>; Wed, 04 Jan 2023 04:46:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ux9u2MB29aiXk+cFN7b2jnfJKGG/GvysJAtiwMmN3i4=;
 b=qFzZCEfHBWIyhr4MgfE+eQjTs/zXov16Oa9driyJVd+Cl3rOoU8cLqPHqMDJPSOHEn
 5Rg+pGeA+9m3bUBACe2BhfIPP7Oyb0hZOb2icX420hzZ5uttezzToFivksz5UYAqQEeD
 KrreJ+ZWaxksh+rCy6hi1yy6pz3M+5k0Q2nZKdO8YlzbYFkn++FK8oCu9tSrMZyEdJFD
 H1Q0eP5IUgguP10GhepSkbHyHFdeF0nWcZm5ZXF8oRNKP6g6VN8cFws7+sChSGwBjIyJ
 vJsHUmQBehVkGFFbeGXKCuWTKRmA5xammhHohyEmMwREWf7Zd7jl9KkP86fX9sphCFpI
 acog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ux9u2MB29aiXk+cFN7b2jnfJKGG/GvysJAtiwMmN3i4=;
 b=lQJ+4gUWgz5uVAgO355qHTQ+K4sxnN5hQ9UHLGRXj0otlArgMIwU1XPUOoahM5ZNj0
 hTWHWWVtJUftwaKovqV9IluODqimj6yH+YaOFwGr7ZRxwM7Fy3K5WYlrO+SDS3HAFOg6
 rBY1s94eQvlrhDYc0ZvK2yA9Qb09Fm21UUlBLA6YZG1KXMH4HzVUiE1B9xvpno1/5Wl3
 OEpIMOb4LEgXJWRV5CFsLrovKrvfbemylTqwnaJaJEgAwRzN4sT+WZfBhsiCq/dexXBe
 KJSnzEORNoBhvETjTF3h4m1DgdVWgkRIdKtN3G4lRkeYzlqDsgDa0C0hoe3fUOQFTI7m
 L/rQ==
X-Gm-Message-State: AFqh2kqhSVWu87/SAk3rpMaCzNRpnk9ej973DGgs9ZJz9yzlfmHqBVLa
 LhvtxXLQcppSyIqGNyXkiTANoA==
X-Google-Smtp-Source: AMrXdXvoRE38wlixx/X6qbNgKl++3jamlm+mWYpniNiDzil5COW7RAgR99xVASOhR6kZ+idUMEX80w==
X-Received: by 2002:a7b:c4c8:0:b0:3d3:5a4a:9101 with SMTP id
 g8-20020a7bc4c8000000b003d35a4a9101mr37161253wmk.23.1672836397907; 
 Wed, 04 Jan 2023 04:46:37 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 n41-20020a05600c3ba900b003d358beab9dsm50376787wms.47.2023.01.04.04.46.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Jan 2023 04:46:37 -0800 (PST)
Message-ID: <fb4a0a56-052c-ecdd-7b42-5c8c7c861c91@linaro.org>
Date: Wed, 4 Jan 2023 13:46:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH] .gitlab-ci.d/windows: Work-around timeout and OpenGL
 problems of the MSYS2 jobs
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Bin Meng <bin.meng@windriver.com>, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <20230104123559.277586-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230104123559.277586-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.708,
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

On 4/1/23 13:35, Thomas Huth wrote:
> The windows jobs (especially the 32-bit job) recently started to
> hit the timeout limit. Bump it a little bit to ease the situation
> (80 minutes is quite long already - OTOH, these jobs do not have to
> wait for a job from the container stage to finish, so this should
> still be OK).
> 
> Additionally, some update on the container side recently enabled
> OpenGL in these jobs - but the corresponding code fails to compile.
> Thus disable OpenGL here for the time being until someone figured
> out the proper fix in the shader code for this.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   Now that the timeout and OpenGL problems are gone, the 64-bit is
>   working fine for me again. However, I'm still seeing random issues
>   with the 32-bit job ... not sure whether it's a problem on the
>   QEMU side or whether the builders are currently instable, since
>   the issues do not reproduce reliably...
> 
>   .gitlab-ci.d/windows.yml | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


