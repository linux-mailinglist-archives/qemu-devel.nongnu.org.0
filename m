Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 354986864D7
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 11:56:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNADV-0004cU-31; Wed, 01 Feb 2023 05:19:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pNADS-0004cM-SX
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 05:19:47 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pNADR-0000i1-Cg
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 05:19:46 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 m16-20020a05600c3b1000b003dc4050c94aso994104wms.4
 for <qemu-devel@nongnu.org>; Wed, 01 Feb 2023 02:19:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HzZhJHwe0D5fhCPA8r+CySxiW5m+Mcn7vT6EoUFasfo=;
 b=o/CoDgeRhxKrpxQXK8MbtyUKm6yRR+5AUAF+5x/P0BfUg7iYSP7de2ojHdyI4Ak6vV
 bRtDUmy2ugNoF8xg/DvtNkfXlQbqMgBWcoQroHDkkU9lgPWiLA8Rf3DseqVVw0fuAlja
 aDwwwAndZazNFHv590Pw4ukPg2hBfDAfQ/C3izmjoYkMMc7w3pSd6RuADY5R7M13I68r
 M1L6Nw1qL/e5jEiipcyfRoioUZHFev9gYwhFgJUJgvqGM9fIthNSGs+Yj1PBf6VziRZ8
 UdncPmHGVB/b3vWVO682hYXbmuhYQGCc6z7drcyG30uCuI2Zdsi21BtqnFEqIGJkcof/
 42xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=HzZhJHwe0D5fhCPA8r+CySxiW5m+Mcn7vT6EoUFasfo=;
 b=jy/w2u6qtPTD0aRwNzwfcFgMOHa8k+lFO2g7Z7slIL570PZg5WLpXB6EzBrfMf3KwP
 dtDk7JFpw/HSOSBNexhDYQlv4d/G1qAnJmMV4eOqrWku68S8w0Pcs/dcSviTnBnSb7ur
 2pK6ItKoqCdUybMQRmlgtoLF34csoU/Tx/5pLuQNtcTvUIW+7QyDWsTg/F4ar20p8tTh
 taDYGARyydkd+HHuHm89M0+3iTC69+9Eix48kdYraTen2Bzr62TGLepLSpGob5zoeZQI
 nLXFDTpgezXYsc72X4e1GugnCC/trlxurQj3/jv4VHVIIxzwIuYf9rWVH8W4tDbkTKi8
 qzzg==
X-Gm-Message-State: AO0yUKV5vRza7sx1jXNrtHPE6OKD8VREsXfDW3N1OkSVKxECe8pFgkuB
 ctuA+9bu24E7+Cis00vUoPknkDgvAPWp4FFN
X-Google-Smtp-Source: AK7set/1kcFbcjgOBE0i8abX478xTIGFZV5vzBeBM8x5dy0BphMNyIx7aCvyufwjhelbd6j69E8yyA==
X-Received: by 2002:a05:600c:4f96:b0:3cf:9844:7b11 with SMTP id
 n22-20020a05600c4f9600b003cf98447b11mr1594032wmq.23.1675246783830; 
 Wed, 01 Feb 2023 02:19:43 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 p22-20020a05600c431600b003dc50c38921sm1216636wme.35.2023.02.01.02.19.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Feb 2023 02:19:43 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 07E641FFB7;
 Wed,  1 Feb 2023 10:19:43 +0000 (GMT)
References: <20230130214844.1158612-1-richard.henderson@linaro.org>
 <20230130214844.1158612-36-richard.henderson@linaro.org>
User-agent: mu4e 1.9.18; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, philmd@linaro.org, Paolo Bonzini
 <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>
Subject: Re: [PATCH v6 35/36] target/i386: Inline cmpxchg8b
Date: Wed, 01 Feb 2023 10:19:38 +0000
In-reply-to: <20230130214844.1158612-36-richard.henderson@linaro.org>
Message-ID: <87r0v9sn5s.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
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

> Use tcg_gen_atomic_cmpxchg_i64 for the atomic case,
> and tcg_gen_nonatomic_cmpxchg_i64 otherwise.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

