Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4EA460D171
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 18:17:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onMaF-0000pK-K2; Tue, 25 Oct 2022 12:15:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1onMa9-0000Ui-W0
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 12:15:14 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1onMa8-0005Eb-3U
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 12:15:13 -0400
Received: by mail-wr1-x42d.google.com with SMTP id o4so13725311wrq.6
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 09:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WMd6umwzS1GxoPeuoXtqvVpjS+UEosw4rKRFgfx2fbk=;
 b=wAMj+usb3Rn+sUe5HkkqV2Cm9B9EwwMCsVnhxTLI77jf6EynScdcMzyJIRhV8WmrdB
 PJvANVlRacZA5KgsbdaaJP4H47EYzBkwZ0Bbqly5uAsuRS94MQp3cyI+qDAp9cHG19SK
 Ush8JBXRa6B9nvnursNW0pIBsY+10g6HAM0PSqvUzLL4vMDqQ0yxPMWvWWcH9Nucjqlb
 3iovXTKai9kB6ektQ48ngsiYqdl+TT8yFMwy2UhA/ilIaQqBhA7ef+8mSXvpkhNKKi3z
 2iTfwwteBFcH7A86lLuhyCwTQTSJKUTmC1/Wj2HdyISF6mwDbpobl3JE/ltTBUtLcmKe
 Mm/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=WMd6umwzS1GxoPeuoXtqvVpjS+UEosw4rKRFgfx2fbk=;
 b=RNmDzsOfTbJTFgCSyUoTqIbLzcKIWPp0KEbIhitUHsieHjTe5W8VdMAKXogOxrUdg0
 N9sHYMrxbNhDaCHBDLPfyp++eb86Ik7I1TQHJS++8+5s02QEYmSPjOEiMP6g4XAi1SLu
 wF7iHMV1WUcHQMZN//mG+Ku6E5WSNKCxWX3ZHTFgYjjloV/q8/VhXF+HBmykGc1BItxs
 WifdRJIhzj6kvnI+s8KAQCBnDXx0RIEoKn8EhM25Fhzdo5+vyLAi3exYFCHmZZPh78DD
 qYEOyksdJ4DQCqgEAB2M8ngyHmhk9wRVcr9IwZhFIgWA4fqnsa1btvw1/gvPtskOFQws
 MJaw==
X-Gm-Message-State: ACrzQf0YwB6GZJUkDMSegLIi4HD37RmsO9mX5usEO1ZuaouMhUOqCHT+
 szo0QxS2+be0wznD2zlNOSkiqQ==
X-Google-Smtp-Source: AMsMyM4c+zo1XHGcxSIcSLiqEYAawQz87NY/nb3Y8zaBg7iFMJMIL1hkdg96F0W+46x0a+s5gMvlOg==
X-Received: by 2002:a05:6000:1f1e:b0:236:6b05:7a6b with SMTP id
 bv30-20020a0560001f1e00b002366b057a6bmr9605833wrb.278.1666714510022; 
 Tue, 25 Oct 2022 09:15:10 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 bd13-20020a05600c1f0d00b003b47ff307e1sm3066425wmb.31.2022.10.25.09.15.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 09:15:09 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id F2E911FFB7;
 Tue, 25 Oct 2022 17:15:08 +0100 (BST)
References: <20221006031113.1139454-1-richard.henderson@linaro.org>
 <20221006031113.1139454-19-richard.henderson@linaro.org>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, laurent@vivier.eu, pbonzini@redhat.com,
 imp@bsdimp.com, f4bug@amsat.org
Subject: Re: [PATCH 18/24] accel/tcg: Move TARGET_PAGE_DATA_SIZE impl to
 user-exec.c
Date: Tue, 25 Oct 2022 17:15:03 +0100
In-reply-to: <20221006031113.1139454-19-richard.henderson@linaro.org>
Message-ID: <87k04n6fsj.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Richard Henderson <richard.henderson@linaro.org> writes:

> Since "target data" is always user-only, move it out of
> translate-all.c to user-exec.c.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

