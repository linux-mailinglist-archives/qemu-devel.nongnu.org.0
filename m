Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C782037A3F8
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 11:46:51 +0200 (CEST)
Received: from localhost ([::1]:33346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgOyY-0004NT-T4
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 05:46:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lgOq5-0005zG-Ay
 for qemu-devel@nongnu.org; Tue, 11 May 2021 05:38:05 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:34759)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lgOq3-00062o-LK
 for qemu-devel@nongnu.org; Tue, 11 May 2021 05:38:04 -0400
Received: by mail-wr1-x434.google.com with SMTP id t18so19436992wry.1
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 02:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=jnIGm/EMKGP4/ZOaaM8NKfd0H1d1nPdQLRdPQ2sbAIY=;
 b=gCjeMyJohp4wmcPWz9KIcGQ+qTW1vCaf1nrCBclLvwdjzxReO5glCNOTKU2RZNoZCy
 qx3yiAdGMLYhtfqJjwgKdJIwTkB6UMiv+TQSdB+CLluU5IGT0cJPMboLxhhjDnAyt5jT
 m/rTUb+K39pN23PxU0VOj3Pd2OO3G0U98FXG7s2B8UTDoBg0Ox+Al+smGfTebuq+ngBU
 tgs2AgrrHjrv1BiqfWrkMvmZvSnItwBFfhY6JnZDCkNjxPVnU82V8hW8HW9v/R503Gbr
 EWN4mhG8nw72ImpKyYOsQzb3FxLKXmwdvGhxKWEtH8i6zNjVgJyuyNKmJ2qENF8aeX2g
 Ok1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=jnIGm/EMKGP4/ZOaaM8NKfd0H1d1nPdQLRdPQ2sbAIY=;
 b=Frkxcn0C8Krl4dqJEBDrCc3nP1N7UcymLuod8XnEDa8GiLwGlT3Wy7cgJLzFsKREnn
 Qoc/jDRdhAHoWHum3iddTITxZasl7pqHg4cNWu0eRRkTFCVIEf6uByQ95teuQ8h/YxkN
 /vE01qgWzHJaXwvHwklKIQcyIyd5JFJHUoedCpKFyaKNKbVsn96KMCUVcQXcyf/qOWN4
 ecF/R6Jq25MsadR2KhMmZFXeqArlxolP+/BWgvAe7OsKfrqOX0QIihKtDKib6ly+X0TF
 1Yyv6idQGwFXvimjYH7Rbvpx3a2sKhzpJnQF5OQ0gx6IoCo63BaIgzYf3//qhabLio5D
 ts9Q==
X-Gm-Message-State: AOAM5332mgmt26qxqB71dnpVAb9+Ka5Q15//TYsdjzlHTJmdKq1o5kVb
 MQw6UUMtr7AsZ7va+YSwDLiTLg==
X-Google-Smtp-Source: ABdhPJxpKzTb+Ltg6tLEVEGOGmkhE44cvPgalmdx1JcnDeIK7BIpcnEbzhIIvD0BMHN0hcArvjNhUw==
X-Received: by 2002:a05:6000:1567:: with SMTP id
 7mr36927331wrz.300.1620725879714; 
 Tue, 11 May 2021 02:37:59 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id j7sm23197476wmi.21.2021.05.11.02.37.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 May 2021 02:37:58 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E676A1FF7E;
 Tue, 11 May 2021 10:37:57 +0100 (BST)
References: <20210508014802.892561-1-richard.henderson@linaro.org>
 <20210508014802.892561-14-richard.henderson@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 13/72] target/mips: Set set_default_nan_mode with
 set_snan_bit_is_one
Date: Tue, 11 May 2021 10:37:53 +0100
In-reply-to: <20210508014802.892561-14-richard.henderson@linaro.org>
Message-ID: <87sg2tk3uy.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
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
Cc: qemu-devel@nongnu.org, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> This behavior is currently hard-coded in parts_silence_nan,
> but setting this bit properly will allow this to be cleaned up.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

