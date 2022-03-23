Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 000E24E56D8
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 17:48:01 +0100 (CET)
Received: from localhost ([::1]:43404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX49Q-0001Nm-Pm
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 12:48:00 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nX43I-0002W2-3D
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 12:41:41 -0400
Received: from [2a00:1450:4864:20::436] (port=42800
 helo=mail-wr1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nX43F-0002p5-UQ
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 12:41:39 -0400
Received: by mail-wr1-x436.google.com with SMTP id r13so2930829wrr.9
 for <qemu-devel@nongnu.org>; Wed, 23 Mar 2022 09:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=wCkEWGsX26REzCAqeP2zBkrDsJZyzzvJLEmnDy44Qjw=;
 b=B4ITmaaeTF2u1drIrMFEKwWn41dFfiaIPekjR5DcpZZHvttX+uGmHiHdKdECHajIP0
 s6nEtlHj2TfwH6IndmoHs7QpAMdx5gELWa9l0fdYHd9pMUB/SBjcnOlE0J6AW5db4IaI
 YauSIwwSp5kOmnRA9NEz7P+DXWpd824vqhS+V6s6Y+SdOXFUYfsUo5+bSOuqo+JXMEma
 Zek7dfQVGD2svXTxHxc3vcijhDKnyIgEMCku86hxpN34N8f7xa67U93brfiKfke/DU2b
 0b72z/nI9UtgIt6Dk6LIp4b3QpqO5PnaB38egy/jFczUx3rMXKHzxaRyuDJicUjeS32C
 L+fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=wCkEWGsX26REzCAqeP2zBkrDsJZyzzvJLEmnDy44Qjw=;
 b=RIBMyeGCnpYd3Um0VJSSZo8ndOL5knUdpki0mAY5/WaCwQ17lSYC7RUqVxJB0zdo0g
 WyFoh5W/wagIq3V8Ox4a7qh7nXlXG4hAv+zXGl0PaAjIHGzECHtWMR/StO2EFVtWlihn
 onb5sEsaAUQRgSAp0QOTP8VoeWVG9OFYJMlZfYNV2lq+K3+96iObI8ew44468V5J60si
 b4IazqaF87xGQD1qKC3tBAIFv2iGSZ8CNAAL5qljUUNvQGR7TwtcGCHuAb6+58kmEt4r
 N9oqaRF6GptP4oY3lni1i/vhpfZungEPzJii41OKwuRFpTtYlocUKGJDlv34QQ4Rd06c
 RbBA==
X-Gm-Message-State: AOAM530gsdzruRGc7gDDSDNb03/0NelEUy8Azx8e6pS0UOoEFsk+tmhL
 F3Y/0huEPZZvLmYK4qp0TpDy7w==
X-Google-Smtp-Source: ABdhPJwlCJ1Qr+gnFYIkMk0CJXXRoOI6PoZ/v8iIpDCNu7LebNGXX35egBSJd3Xw9tqAtghFQ2G/OQ==
X-Received: by 2002:a5d:64e2:0:b0:204:1f98:fa27 with SMTP id
 g2-20020a5d64e2000000b002041f98fa27mr715689wri.362.1648053694805; 
 Wed, 23 Mar 2022 09:41:34 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 n22-20020a05600c4f9600b0038c6ec42c38sm314019wmq.6.2022.03.23.09.41.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Mar 2022 09:41:33 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B2BC11FFB7;
 Wed, 23 Mar 2022 16:41:32 +0000 (GMT)
References: <20220320171135.2704502-1-richard.henderson@linaro.org>
 <20220320171135.2704502-5-richard.henderson@linaro.org>
User-agent: mu4e 1.7.10; emacs 28.0.92
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PULL for-7.1 04/36] os-posix: Use qemu_log_enabled
Date: Wed, 23 Mar 2022 16:41:28 +0000
In-reply-to: <20220320171135.2704502-5-richard.henderson@linaro.org>
Message-ID: <87r16s4o5f.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::436
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Do not reference qemu_logfile directly;
> use the predicate provided by qemu/log.h.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

