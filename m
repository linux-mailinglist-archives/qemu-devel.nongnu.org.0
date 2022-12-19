Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14AB065136D
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 20:45:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7M4u-00017G-2a; Mon, 19 Dec 2022 14:45:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p7M4r-00013g-TV
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 14:45:33 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p7M4q-0007VB-Bx
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 14:45:33 -0500
Received: by mail-wr1-x42b.google.com with SMTP id y16so9778363wrm.2
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 11:45:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IkOjxNX4yAkZM6aLYrOikFB8ZOFYIsRPT08bHvH1iHM=;
 b=txgXf+YEEWVAVM/8Q4Z/lV8VEVMSioiy6g+nK5Aekfrxlp1SD3/A6hYQ5V0TlP4yxu
 arsF4GsugnNJo0LqO3TdRTsYsiJIiokAciHF6OZ1mX8Ap/yHuqVk6OOuKRnBihyiHUBZ
 4gRf1t/+Y9eYEvNbzGBpt3TUDQ3P6O4XNuQz+3o9P0a+LcG6B90aTNStb5qtlLnMeJY9
 NN+KNiZD6h93bOvO1ZLr8Z3nTKWRPUK5GfJ7RPMklH6o8n8ClsOkQZJdx1puAj7ve22G
 x3/E1s2oEJr9c/gYw9Uv3udmmd5+rEgVDnh5vQJxmbgub8mdzzb7s8oEqfHzDzMuqmth
 tMww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=IkOjxNX4yAkZM6aLYrOikFB8ZOFYIsRPT08bHvH1iHM=;
 b=1y5K5pCqxZSwREGceDReZgeHvPEnnXkmgIVg5C2MX9SNcmcbXKgNwMPYFf0o3uqf7p
 1Qj3o4v+1uD7vQY2RjLN/4aArDnjhiDFQoLVn82P2/PTdz/UD5L6F1FgikkvCXbtuM5u
 CFaE6wFZ3V7NG/UGHHTBmUg6yfjpV+0qkyhVX90I3cbKOcEgGFaRTv1Dw9EF7Plsbkhi
 lWvuqz13aL4xuaY7EXh1Op0a0YIPj2hcuasxpmM1/SrnrasqUs2GyPkpBs/0Q2mexP2R
 eY6k5ekMVmLfPCOuQbkxDHOlg80TytWjTys670z6zES/9Y/L+urbnz/gkpPXUKQcXcyL
 Xplw==
X-Gm-Message-State: ANoB5pkWyDlo5jsZgU4OT54UfMReFK3HluJtT8R6DcFi1Z7IROhewpRb
 fflvxPOJCthNneWOJzqe753pLC/66Hc/mM6S
X-Google-Smtp-Source: AA0mqf4XSo5AuG03uCxLYj2V8MS31PkHmvCgVXOMU4MBg2xF0gpYlZ4yEuqL+8kVt/ip/e59nfsPbw==
X-Received: by 2002:adf:cc85:0:b0:242:713c:7f65 with SMTP id
 p5-20020adfcc85000000b00242713c7f65mr27953369wrj.55.1671479131102; 
 Mon, 19 Dec 2022 11:45:31 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 q15-20020adff94f000000b002368a6deaf8sm10693880wrr.57.2022.12.19.11.45.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Dec 2022 11:45:30 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 65FBE1FFB7;
 Mon, 19 Dec 2022 19:45:30 +0000 (GMT)
References: <20221201133756.77216-1-thuth@redhat.com>
User-agent: mu4e 1.9.7; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, John
 Snow <jsnow@redhat.com>
Subject: Re: [PATCH] .gitlab/issue_templates: Move suggestions into comments
Date: Mon, 19 Dec 2022 19:45:23 +0000
In-reply-to: <20221201133756.77216-1-thuth@redhat.com>
Message-ID: <87edsvi3dx.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Thomas Huth <thuth@redhat.com> writes:

> Many users forget to remove the suggestions from the bug template
> when creating a new issue. So when searching for strings like "s390x"
> or "Windows", you get a lot of unrelated issues in the results.
> Thus let's move the suggestions into HTML comments - so they will
> still show up in the markdown when editing the bug, while being
> hidden/ignored in the final text or in the search queries.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Queued to testing/next, thanks.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

