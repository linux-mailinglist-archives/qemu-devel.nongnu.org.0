Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F666AB18E
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Mar 2023 18:20:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYs16-0004kz-BA; Sun, 05 Mar 2023 12:19:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pYs11-0004jX-Ny
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 12:19:19 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pYs0z-0005eu-1w
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 12:19:18 -0500
Received: by mail-wr1-x431.google.com with SMTP id j2so6631211wrh.9
 for <qemu-devel@nongnu.org>; Sun, 05 Mar 2023 09:19:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B/zACWnI63sWDzKAkMg1l+RIG5rCymbUeYsMviSQmYc=;
 b=bqiSwAaunZQ//BBMv7gNnz4QCiXZBPI7lSTy6xHfKoDE2q0tJ/NSWHuHRIvtqiAYrC
 ifurKBq5DN4CZYG0w1XOufdu6BHJxtetmxr+JaUcvIPnu0GqlZBQMyOdbLxVZmNP+zN7
 OisNNLFS7V/m6N8tfJy/7516+b/DOPjDV0A2r05Ds00byoPl3/J+xbGuM4Lyzg9UvlOY
 shOU7w9R7wxrf5LmpQGQBHsCFCEeB84nlCy7LSfMNgVq0252JIiFu2kQnc+03DJ4pItn
 BOc4vkD0OvAZG+K9205bcN1IjrhXG01Q7AhZbaHdnN+ntjMNL+SfG7+VjSEL1CXlMsmq
 9F+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=B/zACWnI63sWDzKAkMg1l+RIG5rCymbUeYsMviSQmYc=;
 b=JhVaE5Bxyp0cONZXXxuBwUC6mtWXQLKBaeXYbNhlHpH1dO+N1RHIhgvy2bQ8xdRUz/
 5k3GpnnEoLR+nwnm09VJc1eWR6ufwTMkC9AW/Ho1h19WF0KgkwM7VoJS2q0Z3YeTVHlZ
 yD8mGMk36P1OSMdiMf3vZfv6AsgvBbEI93nS3xPKe5VS3ao5FwM0nhCGMFa79a0nerrU
 WsPz74eN94dh+bZiXUIUKUXRnb5/gtPoQ3brND71EcSL08R6xY//qirvGDqmrLy1x4R/
 uclT4+IhtppNag+NrFYITjP4OOb23SA78kKcqUJ6IBRHRgHTrIzLE7+MjwAQRYFTwfRj
 VDSg==
X-Gm-Message-State: AO0yUKXJRlCHaqE1HlmuHQhyuk1acA6kpNrYIm2tnSxhM4waTru//DjI
 dlYHCQdoy58CMDgzbWT7KhfAzA==
X-Google-Smtp-Source: AK7set9EZGr418GZmBldUrQmHdnlmcsC+QJ+UErAawzd2Kxjmklu0tRYmtglAn3tJZAh8X6OoJskoA==
X-Received: by 2002:a5d:4f05:0:b0:2c7:1d55:a56b with SMTP id
 c5-20020a5d4f05000000b002c71d55a56bmr5042633wru.70.1678036754819; 
 Sun, 05 Mar 2023 09:19:14 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 x17-20020adfdcd1000000b002c5804b6afasm7977608wrm.67.2023.03.05.09.19.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Mar 2023 09:19:14 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 19FC51FFB7;
 Sun,  5 Mar 2023 17:19:14 +0000 (GMT)
References: <20230304181900.1097116-1-richard.henderson@linaro.org>
 <20230304181900.1097116-20-richard.henderson@linaro.org>
User-agent: mu4e 1.9.21; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v3 19/20] tracing: remove transform.py
Date: Sun, 05 Mar 2023 17:19:07 +0000
In-reply-to: <20230304181900.1097116-20-richard.henderson@linaro.org>
Message-ID: <87fsaj2k19.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
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


Richard Henderson <richard.henderson@linaro.org> writes:

> This file, and a couple of uses, got left behind when the
> tcg stuff was removed from tracetool.
>
> Fixes: 126d4123c50a ("tracing: excise the tcg related from tracetool")
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

