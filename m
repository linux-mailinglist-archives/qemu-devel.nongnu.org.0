Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88E156FDA3E
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 11:00:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwffd-0004Ip-1N; Wed, 10 May 2023 04:59:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pwffX-0004Ht-Fk
 for qemu-devel@nongnu.org; Wed, 10 May 2023 04:59:31 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pwffU-00056q-Jf
 for qemu-devel@nongnu.org; Wed, 10 May 2023 04:59:31 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3f42ba32e24so12082565e9.3
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 01:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683709166; x=1686301166;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7WVQzTEjB4MCVOMpu/iEPlpMndQxnD0kSG+g3dB1Dsw=;
 b=KmmU2u/qdQbajiuc8y4gUqVT/0gWggLWsZIjtT8t/rqUwYVFDAQVgjl7nWiYONBSvF
 slRAXhrPmO1csuX1FJvfRvBd5i1C7fKhB8QVSuOH/keyem20OSu4Eb1etSC8Jfxhynyx
 p78Ek6K6DfZKA3EQx4DLAmZSl4WE79fPxeKXWME4fqA5wkcQV6rxzyVqx6V2MQsS1tq8
 G99wgaEbiQjUEj1tyqJefAdTYdJtz6HYzHBCBOB/M5O77Gu/UtoLnpc+bNxrN35xXCuo
 tOFk692UnZHzISga9NL7O7C3XH+lQgzpjmZHfHikFLgzCAw9FgCrFhpBsDv3hxXR7lbj
 /tfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683709166; x=1686301166;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=7WVQzTEjB4MCVOMpu/iEPlpMndQxnD0kSG+g3dB1Dsw=;
 b=Dee0350CRqvru/ee64sUwEE9HxAydc9GnoDFU1Qrnejuys29oQRlA99gA77vElHaxU
 ukC/81rCF7c6PITissEsv953wgC6aHy19I2y3Brr1ZXutRKx7fsfkQXZ8ytjei3KTjuJ
 OsMRdum+3snKjCnhqyWTj2pmqZoRxRgMGNNq5jvC94rL5IKj9aRtopHZ0JjWO4hOnMPQ
 wWdNswGs3lJWXHTs9rZCam2/326ebJ3dOtv26lUP+Hgsh+S1xly3g6pZtgwiFyhNQe56
 GdX7ht/L3+5Ah3z4Rvzkj7DZoEaEtvzJjYtB0KV3hHW1aFhNupe0blk7dEoAs0xvFeg8
 t8OA==
X-Gm-Message-State: AC+VfDxlj0KdfIF1qP3OLEN51jEUTgXkHqlNl803qfSiJaRLj/i6XPYu
 HF/XtPOrXy/1GZjLV/6e6tMOLg==
X-Google-Smtp-Source: ACHHUZ5NEsiThzOrBfl6wQE5Vvthg26LzS5ubBrg1jAni/Arutuxp6mmoeFOe5PtFhh1UkWzYbVr0g==
X-Received: by 2002:a7b:c3d9:0:b0:3f4:2d31:11b2 with SMTP id
 t25-20020a7bc3d9000000b003f42d3111b2mr2903713wmj.13.1683709166377; 
 Wed, 10 May 2023 01:59:26 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 j17-20020a5d6051000000b002e5ff05765esm16696683wrt.73.2023.05.10.01.59.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 May 2023 01:59:26 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A3BE31FFBB;
 Wed, 10 May 2023 09:59:25 +0100 (BST)
References: <20230506072235.597467-1-richard.henderson@linaro.org>
 <20230506072235.597467-5-richard.henderson@linaro.org>
User-agent: mu4e 1.11.4; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn,
 philmd@linaro.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org
Subject: Re: [PATCH v5 04/30] tcg/arm: Introduce prepare_host_addr
Date: Wed, 10 May 2023 09:59:10 +0100
In-reply-to: <20230506072235.597467-5-richard.henderson@linaro.org>
Message-ID: <87ild0a7f6.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

> Merge tcg_out_tlb_load, add_qemu_ldst_label, and some code that lived
> in both tcg_out_qemu_ld and tcg_out_qemu_st into one function that
> returns HostAddress and TCGLabelQemuLdst structures.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

