Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 640DB50BB9F
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 17:24:20 +0200 (CEST)
Received: from localhost ([::1]:60458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhv8t-0001VB-HV
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 11:24:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nhv6O-0006AG-1i
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 11:21:44 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:40722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nhv6M-0002uX-DO
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 11:21:43 -0400
Received: by mail-ej1-x62e.google.com with SMTP id y20so17033143eju.7
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 08:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=bwF96FdXesmpi3RgCyhS5EM8kD+oOnyx8s/oSfnH7Us=;
 b=j2KB3mITPRmMlnWUQ6rV1tZDs9BQgnbOtBbEugbFbEQDy3QhCgtx1u6Ss8Ls4vAv4R
 3cLz7Ssu/jLj4DNEiTu4fzgkCKlW/svn6CM4NJRis5Q/s0zKAhblx0d4NITV0GJkPp/I
 7WjbuDkIAvOid/nFJLH6NiYuspsN9E+vUH6rrkcDAbT/GnrUFy0d0UAL72Jiq/m5cpKh
 LJ2Xg6RGOmrMA8g4Ldma1bFr5UpHfknS1QQe1HeELrOFCIQPwq6v+lzRBaow7PXExIm2
 Uca4wGCHmjB4YBa9/Wb+2JbWtvWOP1fuFwRNQiqeS9RTcCvQG5wXrihMJTG8i9VeaeBw
 0UCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=bwF96FdXesmpi3RgCyhS5EM8kD+oOnyx8s/oSfnH7Us=;
 b=DAFk4C0GTBlDm6Okap3BvigVvkCNP4hkCbWZ3OVJUHEFDDbnyBQ0Aq2G7EY99IAVUB
 1oR3V/MdEc469RAwndgdo/RL4jZAugGctdFv9bcRxL47lLsDAJTGVqKdpSVQob3lgspj
 9OEV4C63Q+Wq2FjpJ8WMW1kjzRBQ/0syqRIiVY95zibsXFVKf3Yhx/dOQZyCuCphWSZ7
 jot5UVn5X2nmcMoVvhdks7OoB04VFVuwrUexXxmiqxXPtq3VpWI4EXWY9G4PjWMxc64I
 bzsDLYQe0asVZJZhRGkTp8UR/kD8zzyz8y6DG7mu73EiDEKv1FjgOX305mIujf1IYfZl
 shZA==
X-Gm-Message-State: AOAM532SwAWucDk/qYe53IF6RwJiVIg2I2m6wHLjq/qkWm0H0enAuX3/
 58TONU+s15lT+ZAFOkXAK9EVog==
X-Google-Smtp-Source: ABdhPJy28cXXHbnZZi4jii2uY07MHcDCPGGXbfuzHS8sB33A+bRUPEHWHZv/dckV1MA2Zm6J/WSpNA==
X-Received: by 2002:a17:907:1691:b0:6ef:fae3:ea75 with SMTP id
 hc17-20020a170907169100b006effae3ea75mr4506625ejc.410.1650640900806; 
 Fri, 22 Apr 2022 08:21:40 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 e26-20020a50a69a000000b00425c11446fasm705269edc.3.2022.04.22.08.21.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 08:21:40 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5B9721FFB7;
 Fri, 22 Apr 2022 16:21:39 +0100 (BST)
References: <20220417174426.711829-1-richard.henderson@linaro.org>
 <20220417174426.711829-25-richard.henderson@linaro.org>
User-agent: mu4e 1.7.13; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v3 24/60] target/arm: Split out cpregs.h
Date: Fri, 22 Apr 2022 16:21:30 +0100
In-reply-to: <20220417174426.711829-25-richard.henderson@linaro.org>
Message-ID: <87sfq5ta7w.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62e.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Move ARMCPRegInfo and all related declarations to a new
> internal header, out of the public cpu.h.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

