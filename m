Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D8A60E292
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 15:50:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onglt-0001pZ-90; Wed, 26 Oct 2022 09:48:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1onglg-0001hc-Sa
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 09:48:28 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ongld-0002Kd-N1
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 09:48:27 -0400
Received: by mail-wr1-x430.google.com with SMTP id j15so15912913wrq.3
 for <qemu-devel@nongnu.org>; Wed, 26 Oct 2022 06:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=inOVGoehyAc0OMMzrVchjr5br64FkXhdfZWiqEETiog=;
 b=hAuLP1UlTQwy2hOcCbmbV4yNcmGCat+LzY3Lk+nMppuahmPbq+tGM1uZwzHH9uFO3R
 V0BhWbxyCfQmj9ab/XBm5PKpM5RV/omvLY5eXbKgm0VzEhZjZyfqgAQQ+Lj60bc+5ynM
 svsUI3COR7TolPAo9nv9uphjbSIwBXhKQvCP1aFSR6Ir1RnVj2jl7rzh864eFaoT5eb3
 MMEzLbvisM7qkU/lL0nh8NTn0j4L/g2zifaKXl4vKY+BGztmNsgW82oqimG1WeLcoAmv
 G0Mz0l5hlh0rj8acdvDLi+ZeqRjh5+/jP0j9oWkN4VTSjD+73J42EmZfAMEExU0SXQoZ
 unPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=inOVGoehyAc0OMMzrVchjr5br64FkXhdfZWiqEETiog=;
 b=hEUKQv7idJlzqFP/0He5GJH+rvk23UTkNpPypDM6HgQ9HI8I/R+ocB4tzXxY2WcMFR
 9MLPwBETrivnqjl4HJKsEw1uU2z9715Nm5L89Fk5sMYlovWlJTX5NHWiTXQFUzsYZaHn
 psgRI6KkEoyX92ITJtYcf9Y5s/wasNjCH1EvjZf8A9pmLcqEUtRWHHJVh4bcm7mpZyD6
 237+8eymW1SMvcEa7rxpuCP9yPJ3WJ4LZ+7sEbFITHkuFDVBjCGlHEb1zoggEysvc9Bz
 hvheuQWg+IkX1F3oy73fTHGik6onE1Qk2WClvBEt7tOuUd3xczJirKxwUilGnABumGK+
 8qtA==
X-Gm-Message-State: ACrzQf2hk9FWOQbw8f+9LhgUX0It/qab89L2KKX5oKc5EwZCcDJsZ9IA
 Qh2yYmUhSAf+Gu902d4l4hTSXA==
X-Google-Smtp-Source: AMsMyM5cqByWo3WVmXNo8lQ55RiraShBhVHdPSw7RaQmNWQqmGBbdA8xwbcZgWRDBclwPYAD4RCvbg==
X-Received: by 2002:a5d:5a18:0:b0:22f:4f72:213a with SMTP id
 bq24-20020a5d5a18000000b0022f4f72213amr29690673wrb.57.1666792104208; 
 Wed, 26 Oct 2022 06:48:24 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 h5-20020a05600c2ca500b003b435c41103sm2651541wmc.0.2022.10.26.06.48.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Oct 2022 06:48:23 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5E2B51FFB7;
 Wed, 26 Oct 2022 14:48:23 +0100 (BST)
References: <20221006031113.1139454-1-richard.henderson@linaro.org>
 <20221006031113.1139454-25-richard.henderson@linaro.org>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, laurent@vivier.eu, pbonzini@redhat.com,
 imp@bsdimp.com, f4bug@amsat.org
Subject: Re: [PATCH 24/24] accel/tcg: Move remainder of page locking to
 tb-maint.c
Date: Wed, 26 Oct 2022 14:48:19 +0100
In-reply-to: <20221006031113.1139454-25-richard.henderson@linaro.org>
Message-ID: <87a65i4rx4.fsf@linaro.org>
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

> The only thing that still touches PageDesc in translate-all.c
> are some locking routines related to tb-maint.c which have not
> yet been moved.  Do so now.
>
> Move some code up in tb-maint.c as well, to untangle the maze
> of ifdefs, and allow a sensible final ordering.
>
> Move some declarations from exec/translate-all.h to internal.h,
> as they are only used within accel/tcg/.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

