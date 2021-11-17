Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 217BA454B58
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 17:49:25 +0100 (CET)
Received: from localhost ([::1]:44870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnO7g-0000Dp-7s
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 11:49:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mnNwP-0002xO-59
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 11:37:45 -0500
Received: from [2a00:1450:4864:20::32f] (port=40778
 helo=mail-wm1-x32f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mnNwN-0000JK-KP
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 11:37:44 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 az33-20020a05600c602100b00333472fef04so5287700wmb.5
 for <qemu-devel@nongnu.org>; Wed, 17 Nov 2021 08:37:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=cCuUnpiSzrSLyy/HSRLwM1mhsfzm4K8scHN8I9FOk5s=;
 b=F5Ra7HD8duVc2F4BjYyxkOfIYqEiZK1YJOb39si2cYsjCNYnVnVmgYHuokFT2XZs5M
 Umv36xYnXb2F0/pDRK1L+LQFgp3qeciyjTYjWDjekc6SXA5NGoX6ZfRaoTgF94WbJkzS
 tMDVH8YtEFAjpmW9JG8Lm30Uw5uALzo4KC731tCUoNxoyaU97nDJ7Kn0+TdZkQ682/30
 Mg6lkjJpCPpxyMwORx8iiD31qmy4W15oqqlnTcJcmkz2i/nXPUnG00OXlFCV6pZjVhAr
 5/6QWkp6k1hAKg94WkSlxH3Z/x1l3tXVSyotXgxjVuV3BPMyCdXs4U2pXtUcXq/hp8xo
 5NqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=cCuUnpiSzrSLyy/HSRLwM1mhsfzm4K8scHN8I9FOk5s=;
 b=epuQ6x47kvMGRGq/rO+tiVgxiHtPgQuI67m3qCjFGoFU/h4ILSVv96MW8Nt6//s7D+
 eTSoRrqxxvel+nFdn15sQyOgR0jahxDocK+5dwz3WMcxxxUhWi6ubvKYCSEvcfTn5ucj
 4Y5ENsS7RfB81ieoARCFb7SspYmzoXIslBwO2u+67IJUX7ru0uMAoRuLiXqz6za00KBW
 GlXuOKHZy0zzAsLRYlEdsnXX+Mhr182MTDpoU5YLRAt5qcQV+m99zRtq6CAajMYdVi7B
 gQVT1SabR/y/e9CMx3P3He1MEZswe/OLegH524hOdqBGhAqV6/iARpw4ICEe96uoIVXy
 ZxGA==
X-Gm-Message-State: AOAM532V2LTG+hqeIJ7qwuyaJd66FoGdumGv+9jlFIInoYFLswfDP3x2
 4j2afaGIeDr9HElqaev26jEZgw==
X-Google-Smtp-Source: ABdhPJxvU2aPnE4UXeeEN+o60o1SBJcx9gEZqMwZM8jl5cz64LLZ1SxkqmqnwF7b1gh+ufPfixk8mA==
X-Received: by 2002:a05:600c:a55:: with SMTP id
 c21mr1103657wmq.191.1637167061107; 
 Wed, 17 Nov 2021 08:37:41 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o63sm227131wme.2.2021.11.17.08.37.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Nov 2021 08:37:39 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 485DF1FF96;
 Wed, 17 Nov 2021 16:37:39 +0000 (GMT)
References: <20211117160412.71563-1-richard.henderson@linaro.org>
 <20211117160412.71563-2-richard.henderson@linaro.org>
User-agent: mu4e 1.7.5; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v5 01/17] linux-user: Add host_signal_set_pc to set pc
 in mcontext
Date: Wed, 17 Nov 2021 16:37:34 +0000
In-reply-to: <20211117160412.71563-2-richard.henderson@linaro.org>
Message-ID: <87zgq2viuk.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org, laurent@vivier.eu, imp@bsdimp.com,
 Philippe =?utf-8?Q?Mathieu-Daud?= =?utf-8?Q?=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> From: Warner Losh <imp@bsdimp.com>
>
> Add a new function host_signal_set_pc to set the next pc in an
> mcontext. The caller should ensure this is a valid PC for execution.
>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Message-Id: <20211113045603.60391-2-imp@bsdimp.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

