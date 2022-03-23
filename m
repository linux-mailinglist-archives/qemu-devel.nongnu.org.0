Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D4B4E53AF
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 14:57:07 +0100 (CET)
Received: from localhost ([::1]:42054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX1U2-0004xV-Vr
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 09:57:07 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nX1S2-0003Tt-JN
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 09:55:02 -0400
Received: from [2a00:1450:4864:20::436] (port=34521
 helo=mail-wr1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nX1S0-0000Db-Q7
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 09:55:02 -0400
Received: by mail-wr1-x436.google.com with SMTP id m30so2277846wrb.1
 for <qemu-devel@nongnu.org>; Wed, 23 Mar 2022 06:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=kJbAVtWFgZLsd05ZvfCXU/u+IoTc87o28Xij3zY0wmg=;
 b=rTeEzvKvrdD/N+ELvIcUJR36p+TWEPoeCZD7tIBwZutrXKdq7E2l6wB/jwPkveDO90
 tncn24ATpDoVN+3zAqu3uYnNxuz2C7kQJURCORSZp3Jt5kOrvWaYmIq/VroZprDP4XlD
 fDMZuKjH7M3hZ9zxVSGKb2OivuLFOQtOdaCmjXmsFAIxYYT56BwdWwBxMziVrAT94WTu
 BKXYadYpnSXnrZ4FUIy1FUYiqayuwgSeNMxRhwvcFj87yBLTX4OSj+B+KNvsKzidrAXG
 LQSTDDvS6dBcQLECCVtoblcYFWYuELLJuchJQjaZpR5e/+2Luu+R0Uwk2WPHiH30aXcO
 cddg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=kJbAVtWFgZLsd05ZvfCXU/u+IoTc87o28Xij3zY0wmg=;
 b=DWDeq/VhswMWESV512Pej6hRY7f0mtEeXWTXd2+CKlXOzLoi9O2BROcmVCAADURVIw
 7Lhvs3ZUuydr2JKz4ya311t3/XWhUeV4oxjDoJWjEqfRNsBJAa9vtouqhgse4cs6HV5q
 08ZSAWTuqAUAuHh5SQJPStw/Ucxm9QsOrCDwstfeZKyC/sUUp4VLOeimCWtAqSbJpp4c
 UVFgmCeBgbKTD6RhysCiVZIhxoVmKMD+qWReZPKY0a8iOwKbVmlADMcpq8Ae/E/42Y3K
 aeyLLpEKcON7gaIvnSN9uilVYIzl8pHR52EbPRnSJ+WxiGGeuXiiQk8qYbnZlfjgYiYw
 ZnyA==
X-Gm-Message-State: AOAM532uRtz3NzatpM4EV8MfOzBNtYF9BLdeilfcH4YkYTOdv4BNhkgN
 TVQWQRFmy1d7BBNyzOtYkzsKPQ==
X-Google-Smtp-Source: ABdhPJw/xjy0OYEAMpw3bAEAQl9XJNLWUxAABMI8zCVvPOGgecOX2a6a1ISCTQJ1u2jOifZTGEkuoQ==
X-Received: by 2002:a5d:584f:0:b0:204:1749:2ce7 with SMTP id
 i15-20020a5d584f000000b0020417492ce7mr11378484wrf.584.1648043699183; 
 Wed, 23 Mar 2022 06:54:59 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 o6-20020a05600002c600b002057f1738fcsm3267061wry.110.2022.03.23.06.54.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Mar 2022 06:54:58 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 500AE1FFB7;
 Wed, 23 Mar 2022 13:54:57 +0000 (GMT)
References: <20220320171135.2704502-1-richard.henderson@linaro.org>
 <20220320171135.2704502-2-richard.henderson@linaro.org>
User-agent: mu4e 1.7.10; emacs 28.0.92
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PULL for-7.1 01/36] util/log: Drop manual log buffering
Date: Wed, 23 Mar 2022 13:54:52 +0000
In-reply-to: <20220320171135.2704502-2-richard.henderson@linaro.org>
Message-ID: <877d8k6afi.fsf@linaro.org>
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

> This buffering was introduced during the Paleozoic: 9fa3e853531.
>
> There has never been an explanation as to why we may not allow
> glibc to allocate the file buffer itself.  We certainly have
> many other uses of mmap and malloc during user-only startup,
> so presumably whatever the issue was, it has been fixed during
> the preceeding 18 years.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

