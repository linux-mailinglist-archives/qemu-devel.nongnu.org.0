Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E00760C7B1
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 11:14:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onFzW-0001aV-F0; Tue, 25 Oct 2022 05:12:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1onFzH-0000sY-Si
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 05:12:44 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1onFz1-0003UF-Ry
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 05:12:43 -0400
Received: by mail-wr1-x432.google.com with SMTP id o4so11503633wrq.6
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 02:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Flm5DhoZvg6gBG9HEcrwNWDpy2rGBHsk0+cjg8tSXxs=;
 b=VHQrdxKAFp/5DtkzQqZ0BwnbFHWtnBTBxiVUOD2agRisGgFqfm4YrNpucD3kBAAVQa
 X4/9lBwVC514DFx60Ru7w7TCiuiF5cvBJ7oTUE7eldQzJN/fePwIQfZ0tYQvKhf+AjYS
 J1gpTVUGDVvWTPaMsEiFFQgC3kFKiCzFuPi+aGnX0z2vt4a02Mih86CkPWUo7qflJz4G
 nOGjmUQyN5GChuXyCHDbA7TSH6Wa/re9ycLXCSn4AsSu3XWn9ghDkbE5Ka43O9XOWyFF
 Li2kTF1bf6tD8n7nAs5Lprqd31OOxcY+HzqerJS4o+pC+A/SGRkGFch/rqCpv/hxhQAz
 +g2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Flm5DhoZvg6gBG9HEcrwNWDpy2rGBHsk0+cjg8tSXxs=;
 b=QJF9so93GQOd0v6MwDhW0UG9Cag7ImGUBwr9BoX/Gi1Jfwb+TPhWF+PmXduTdplLa3
 L7nycX4jaSLUM6V1a9YfOfoRSITixDILCEtv7Yjj74ZUSQmpADS3EzXEsdjeWhJESU9b
 ZDbH4VKjc+zEizcyQmwc8jqb7ofb0u2K3DpbvwCT2YP3KrYOjOSqDgEFJyu4mpjalYBR
 TPPrYswKnq9ZOqhzxz4mR3ESTj7BhM20B5KRZUiODMy+nzhniX5OomdTpHIdKih/bCKh
 hYEztEEzFP9b/gPYyIvoeS37zc4j3Pxu7oIlxdNpWWcjo42fKIx7q3iKePyLkbKL7uDt
 4TfQ==
X-Gm-Message-State: ACrzQf1nAadLq2dx10uxCEKw8QqpnjDgVtkRoZKg0sphy+hijRgcyvS9
 bG0fGPlwAysTB9ilIhWHqE1m2A==
X-Google-Smtp-Source: AMsMyM7k0ZnwmDxhFdKCvnfu9BJ/4HXE+V6ZSV3dpo9Q979WLOvr4+w1gvvCco+00MhAf0ePPh8/mQ==
X-Received: by 2002:adf:e805:0:b0:236:5635:9520 with SMTP id
 o5-20020adfe805000000b0023656359520mr13495085wrm.154.1666689141576; 
 Tue, 25 Oct 2022 02:12:21 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 d22-20020a1c7316000000b003c64c186206sm2046503wmb.16.2022.10.25.02.12.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 02:12:21 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8C71F1FFB7;
 Tue, 25 Oct 2022 10:12:20 +0100 (BST)
References: <20221006031113.1139454-1-richard.henderson@linaro.org>
 <20221006031113.1139454-9-richard.henderson@linaro.org>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, laurent@vivier.eu, pbonzini@redhat.com,
 imp@bsdimp.com, f4bug@amsat.org
Subject: Re: [PATCH 08/24] accel/tcg: Remove duplicate store to tb->page_addr[]
Date: Tue, 25 Oct 2022 10:12:14 +0100
In-reply-to: <20221006031113.1139454-9-richard.henderson@linaro.org>
Message-ID: <87zgdk6zd7.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Richard Henderson <richard.henderson@linaro.org> writes:

> When we added the fast path, we initialized page_addr[] early.
> These stores in and around tb_page_add() are redundant; remove them.
>
> Fixes: 50627f1b7b1 ("accel/tcg: Add fast path for translator_ld*")
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

