Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D62E4369292
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 15:00:50 +0200 (CEST)
Received: from localhost ([::1]:44708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZvQP-0004YB-J8
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 09:00:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lZvMk-0001xy-Bh
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 08:57:03 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:42811)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lZvMg-00064i-Sf
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 08:57:01 -0400
Received: by mail-wr1-x42e.google.com with SMTP id p6so41650829wrn.9
 for <qemu-devel@nongnu.org>; Fri, 23 Apr 2021 05:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=zVPOQERJnfFthOH5XYIExA+vVe68y6DJr06TrdyzkSc=;
 b=mM5mR7GjsNenTmjb8q8D0tz6n/ey0qOYz/RGg93dHyTcsEDSRsQCUjOn5PeXd1b78B
 o4Hl9oSuknM53Fg07AuWEsYCtBhR/+DG/+P/VzoYYUinvjmELrfcEIFaFDzarbAS0feZ
 m4qIdq/BEHsxB8Dd1JoN0927C3k4s4766YXy1Ktvg6fB+yNN2DQkK19Z+57aGj4Xb+xO
 3jShDm3+9UE3/at9BMsq9CLAdJWLv/ZkXPp08KjHD91T+6trnBKAiSJK6OTSeWiCIu8Z
 +HhrSSl1iY0LeQgKlrHBK0wW9NML+edhFI2J+hFLiasIcpUtJ/wE0d+8qxFl71QG9qhr
 RwBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=zVPOQERJnfFthOH5XYIExA+vVe68y6DJr06TrdyzkSc=;
 b=iRKsG7a0XcGemJC2+NoKt92wt3tX0SqDwBaxn9gOJ0KtA5IvUw2PESgDGn3sK3vVdS
 1IXf/OOglqEBrFFFCwkZa4TK1zsjTx/TSO1NoBdI8oLAUJ2XI84ptj+mhh4HQclJZK4t
 h5Z71gJWa6KUzkV8X6nsCZQo2NxVswsiogdRid4+9nxADB155NxUrokBuXUo9UdkAbCA
 olMD65S6JD8/tU5JvFsfoXllkt9ESS+fdXJNiZzCfrTZdaAYrDb+1dy57ph7mXK6KhH6
 fPzldq45KXqklLUu0Y0zS5QnNXYleJbYWoDvVHSGmORRXHDXQGDgf0exsJr3gKdSD/I0
 q88w==
X-Gm-Message-State: AOAM532B196MnGxJqO64XZGvfZNHUVjB9z5/7ZK6Ceq+L1uwyXE4a+Hl
 xzFhvbyOXsVUVw5G5X04TExdfA==
X-Google-Smtp-Source: ABdhPJzQ2bOauaW8lVBdcD2HvJGoKc5rSzEqfqMjsLd9rfjQmDfHDnMSI9ALRfA3drj8FAqZP/T6jg==
X-Received: by 2002:a05:6000:b:: with SMTP id h11mr4483628wrx.81.1619182617279; 
 Fri, 23 Apr 2021 05:56:57 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o18sm9290109wrj.88.2021.04.23.05.56.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Apr 2021 05:56:56 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 66B601FF7E;
 Fri, 23 Apr 2021 13:56:55 +0100 (BST)
References: <20210422230227.314751-1-richard.henderson@linaro.org>
 <20210422230227.314751-4-richard.henderson@linaro.org>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 3/7] linux-user: Pass ka_restorer to do_sigaction
Date: Fri, 23 Apr 2021 13:55:29 +0100
In-reply-to: <20210422230227.314751-4-richard.henderson@linaro.org>
Message-ID: <87tunx6two.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
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
Cc: qemu-devel@nongnu.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> The value of ka_restorer needs to be saved in sigact_table.

It would be nice to add a comment to sigact_table to describe what it
is. This is some of the oldest code in the tree so there seems to be a
fair bit of implicit knowledge is the way things are done.

> At the moment, the attempt to save it in do_syscall is
> improperly clobbering user memory.

Otherwise to my slightly confused eyes it looks pretty sane:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

