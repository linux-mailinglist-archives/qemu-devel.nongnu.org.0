Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 446B460D16D
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 18:15:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onMZp-0003EL-P8; Tue, 25 Oct 2022 12:14:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1onMZi-000290-2j
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 12:14:46 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1onMZf-0005CF-Va
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 12:14:45 -0400
Received: by mail-wm1-x332.google.com with SMTP id 5so666226wmo.1
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 09:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xC4S8CnFQCMlXuO6ZnQhhSL09fHnw2Qj1b0P+CQxAUQ=;
 b=Of9niu0uzpr+B15bVntZroSino7zsQZGG3QGJuYrgwy3rLeXQDO6GIsjqzypGC/9ba
 gqWuchdOUyCZiQYulFRYPo3vOtfqOn7pHYciHdyTFxg+jIxbbAsIGBHbFOwnp+6aeWnZ
 qbwJqQWaGdfxXDIzFVMLrRyyw1jH0/Svhaaqv8jTBbblg50VMzlWgBsUw6VA4YjHoQKk
 3joAF3sV16dJbsbhQAU1RBK6FoHbAM3SwNEwKW4zkm0W3tf8U2TWmeq75qvvOJpqbhut
 vqLGAl8FEksp5XFsE4dSgYqKHO6TxeCpiYfQG7JVBxSHFY6X5+RIXau/1e8IaX3hlBD3
 hmlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=xC4S8CnFQCMlXuO6ZnQhhSL09fHnw2Qj1b0P+CQxAUQ=;
 b=INQVZK3mOpwkHEs9Fpx588xh5nFdPU/YOZt/n6YOptbCbXH0QsIi/1ZKwiqerepXCP
 aTwedJcjFDWj8zyu6aFMEAZd+hrs+zcn2z/6GOZsIzHXHoCmh+8FMa1Ym1usaOVqIwMc
 7LHtkdxwz5RxbCX+/Q9AJIjJT3HW956OynqqqbkQfUPXNpWrptcjjSBloV6RhpX5zqvT
 JUyV8fG+FgOcOTNEWMXCIFzrJ1+WG09k4AC8Qu61lW8IwEwOHOiILCpLyAQGgPwA8SCp
 hfnbVEkvtfTlTqr2DlEDz4xVQ/zs/PSrI3s1L3HOjBCuiM5EJ+iMvIE5/+6/a7VH34H4
 Yy0A==
X-Gm-Message-State: ACrzQf1+kTiHtdaOqnafUm1DSF5GinysBjE1piJHXaLrNrCikBzgmdj9
 lJ7YDOaCUAsIfs0xEqwICjRwmA==
X-Google-Smtp-Source: AMsMyM6IVRpU52yYMf5pCLjPV37j/OswyEYdVF//SRKLRWcXL0U9oZmzluV/d/uFnjHzOSbQTgysCw==
X-Received: by 2002:a05:600c:310f:b0:3c6:ff0a:c41 with SMTP id
 g15-20020a05600c310f00b003c6ff0a0c41mr25741561wmo.91.1666714482242; 
 Tue, 25 Oct 2022 09:14:42 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 r13-20020a05600c458d00b003c6f3f6675bsm11698219wmo.26.2022.10.25.09.14.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 09:14:41 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4B2FD1FFB7;
 Tue, 25 Oct 2022 17:14:41 +0100 (BST)
References: <20221006031113.1139454-1-richard.henderson@linaro.org>
 <20221006031113.1139454-18-richard.henderson@linaro.org>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, laurent@vivier.eu, pbonzini@redhat.com,
 imp@bsdimp.com, f4bug@amsat.org
Subject: Re: [PATCH 17/24] accel/tcg: Use tb_invalidate_phys_range in
 page_set_flags
Date: Tue, 25 Oct 2022 17:14:32 +0100
In-reply-to: <20221006031113.1139454-18-richard.henderson@linaro.org>
Message-ID: <87o7tz6fta.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
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

> Flush translation blocks in bulk, rather than page-by-page.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

