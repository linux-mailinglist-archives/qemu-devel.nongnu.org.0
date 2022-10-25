Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E29F60D166
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 18:14:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onMXw-0002cS-CA; Tue, 25 Oct 2022 12:12:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1onMXr-0001bQ-5D
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 12:12:54 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1onMXn-00054J-O4
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 12:12:49 -0400
Received: by mail-wr1-x435.google.com with SMTP id y16so11487574wrt.12
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 09:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yqojcLuGi2K7x1kYDAgYQ3hgMRdEipxQJlJthW9ivAk=;
 b=b8gCoByE2Xp+IprivM/uqnHRsqaoyer5JHBHTXCm5STCu/j13n+Fj9NcbBelpZMPsD
 dhg+KA0fIpwD+G6QdMt1yo76EH34wY1Z3eJSOXu+Lj7A2TjQ9x2vFXJwPRcAA5s52K9V
 7wNUDyuIB8R0ZcDcrmB6TMADD7MJ/g00jIs/ksFORTIQ/IxKFVMwHMsIruzxfS+oOmO+
 rHSedd2aqe3iuoZzG1Ne1qQr0W9SLpewB9DFHNXdzQeVrRn9JqOb2fEQjHP03UOeKKvD
 7nR8pFbeCgjioJuAdXP8cchGugIlASv/LeO2JHPzKApJCEgUvoAewGDLEaGeE7uoN1oP
 Uhvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=yqojcLuGi2K7x1kYDAgYQ3hgMRdEipxQJlJthW9ivAk=;
 b=zAIYLmX9JdJOKuLUkRQk/Q6DO84jcNZVGk8O7tplvSDC5DT1ZnKCFNzJQ8pq0YBV8i
 w0cuIOx324THcCmJlf37Wl6up/x7RLj6SOv3I988NY+CIc51tODTNTsIunk+P0+q6WKm
 pD47ANzCBSXy5u3jMnK18YELFyzbPSml4p6ftA7pOb/vF/Nq2rKetgh3BLJewEphVm9a
 isJE13swBUw92Kn0MaYYvr/FJR/BBknA988FSKAiZxlDZz1nIf6KSfrINwucIY8C8tz0
 2AYqUIK7Ikw8ZJrzZtYu+KyceikFIQh/VGzszZ/OS4lhRYik+mLiqxB6mOWv3jNIbwQ0
 o0IA==
X-Gm-Message-State: ACrzQf1d+iHQAr2Xzq8OAZenTg3HomOv7pCuDdKkSw+jwjN2LtpCl4J0
 DZOOz2ZDYapv3LTmX4x1I9w02w==
X-Google-Smtp-Source: AMsMyM4Jp4HsiM/lBTj2Hj+wO5HbgTSLMmOXurEIN/lZw3MjbMXQmG25hiM81eL5XmgXtDbm7fCxRg==
X-Received: by 2002:a05:6000:912:b0:230:9113:1a09 with SMTP id
 bz18-20020a056000091200b0023091131a09mr26044275wrb.707.1666714366145; 
 Tue, 25 Oct 2022 09:12:46 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 a20-20020a05600c349400b003a6a3595edasm2945184wmq.27.2022.10.25.09.12.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 09:12:45 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DD0A01FFB7;
 Tue, 25 Oct 2022 17:12:44 +0100 (BST)
References: <20221006031113.1139454-1-richard.henderson@linaro.org>
 <20221006031113.1139454-17-richard.henderson@linaro.org>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, laurent@vivier.eu, pbonzini@redhat.com,
 imp@bsdimp.com, f4bug@amsat.org
Subject: Re: [PATCH 16/24] accel/tcg: Use page_reset_target_data in
 page_set_flags
Date: Tue, 25 Oct 2022 17:12:39 +0100
In-reply-to: <20221006031113.1139454-17-richard.henderson@linaro.org>
Message-ID: <87sfjb6fwj.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
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

> Use the existing function for clearing target data.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

