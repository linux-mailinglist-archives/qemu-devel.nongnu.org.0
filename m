Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 033F56FF7AD
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 18:44:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px9Oq-0007Ay-Uc; Thu, 11 May 2023 12:44:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1px9Op-0007Ap-9e
 for qemu-devel@nongnu.org; Thu, 11 May 2023 12:44:15 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1px9On-0007qV-Qd
 for qemu-devel@nongnu.org; Thu, 11 May 2023 12:44:15 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-3f42711865eso33941815e9.0
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 09:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683823452; x=1686415452;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zcQ7DlWWMNxGFHBXya4quQhkeRXMCSM4QDUz24kuSdA=;
 b=F/0XVcfeACI9R2lKMKjcIzSuW8ElbzC4pDSGquvaBLWHCS1jV5kWpv8F6zpvomLucI
 ElRyXdefPxAKjxAG5VI64qJDpLF8QrHbRQSUdFsiVAiMWN6Fb3yLw6FZs9ln7wRmw0JX
 9335rp786Ywj1aj8LhaNkJBObKXST31/ME6oxEebytIWZ15zQAvv50KZDKOpfCH/bRYm
 UWz497QNpdFs/6rtmeN8yBwDMiXNIKB+BF0GSU5+x22DTix3rn70wz9vtSjlVFbVAlsJ
 92okWrkzkD9eWtFcqAgPqfpgO82smyYmpLgHYfx9YG1cC1oWtSePX0KFaWUXBhwZIsGu
 sfCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683823452; x=1686415452;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=zcQ7DlWWMNxGFHBXya4quQhkeRXMCSM4QDUz24kuSdA=;
 b=lbrCwrLf+3YYC4wQLlSi+HOeVAi1tgEfFoJlKMlmdReRgaiypPrvtxVS0jHXSBpLU8
 hbOQbLHVSy96m3sFRLjuleixBrU8XEXRarjl8a1M8uCGCId1UM6ct6n6QGR60niAG09g
 AttkfjiOthZcPOaf5biJePXrhOcGSnTTPePvx1JFSciKSW3SIoYj5NzUOsJ4eBtulFo4
 L3+7ChKhoFAqD5ZeGawjs/rfcKtj53SNLRR8Fj7JKoEIviAKHV235fffWAPYXCufhQEg
 sJ5/jeajq8nOk2oqp9MKgidFM/jXrrK2ANu39KBEUbFDl7rmp+Ukb6Q6BfFtfsURq/WL
 FwJw==
X-Gm-Message-State: AC+VfDxZY4gcNc8goLEn8Kol7dw1OKWaO0BgAezD7sHeCEYMHIeQNPhK
 ijwsD6ej3H4QwK2FpSytbpBP0A==
X-Google-Smtp-Source: ACHHUZ7bxad25vIEVoEUpC/H7k5KTvTR9gFauNRJkblAkLBEFMYDd+p7UuWHmiMk+Nbc62W8v2NxGA==
X-Received: by 2002:a1c:7703:0:b0:3f4:2c8f:d2d3 with SMTP id
 t3-20020a1c7703000000b003f42c8fd2d3mr6421717wmi.20.1683823452363; 
 Thu, 11 May 2023 09:44:12 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 u19-20020a7bc053000000b003f09d7b6e20sm26130830wmc.2.2023.05.11.09.44.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 09:44:12 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BD0E71FFBB;
 Thu, 11 May 2023 17:44:11 +0100 (BST)
References: <20230503072331.1747057-1-richard.henderson@linaro.org>
 <20230503072331.1747057-21-richard.henderson@linaro.org>
User-agent: mu4e 1.11.4; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: ale@rev.ng, philmd@linaro.org, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, anjo@rev.ng, qemu-devel@nongnu.org
Subject: Re: [PATCH 20/84] tcg/arm: Remove TARGET_LONG_BITS
Date: Thu, 11 May 2023 17:44:07 +0100
In-reply-to: <20230503072331.1747057-21-richard.henderson@linaro.org>
Message-ID: <87fs82zulg.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Richard Henderson <richard.henderson@linaro.org> writes:

> All uses can be infered from the INDEX_op_qemu_*_a{32,64}_*
> opcode being used.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

