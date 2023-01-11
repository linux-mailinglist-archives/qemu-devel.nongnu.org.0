Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12878666048
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 17:21:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFdpm-0004Wy-3Q; Wed, 11 Jan 2023 11:20:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pFdpj-0004WW-Up
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 11:20:12 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pFdpi-00043C-DD
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 11:20:11 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 g19-20020a05600c4ed300b003d9eb1dbc0aso10127195wmq.3
 for <qemu-devel@nongnu.org>; Wed, 11 Jan 2023 08:20:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Qeft7dz6XVBFF176iTjFmxbxgxL824tb/F/dZ8ObcU8=;
 b=S8Vl4ROCXqEq+j8ltoKAGbFUMo5WSoOYaq+aP/sq8JXtKCoFnJdCUl0Ik0Dz/rZxlf
 wSjcq24+NfGwy7MITmY3ynSilwySDaKZImoBUL1wgDmFktGM448KKvf5mbXz02iP398b
 bFfY2mMtEy2c38fL7aBDpyTobYytv0HbddDR8Y+nPpedsMTcSJ+5169dqp3xDkKEoSoG
 RbuXqbLkfVko+7u2cjkRJl9CAYAjctkBuRhmLk9bkSMOhE5ifHDY67m0k/2NL3LUcN53
 X1uVnFtSeGBoTqbh75/6mT3TcX23/jBdqyBrjb5RIpZ+45+UA0ZFnQ4buSmWryO2S5a/
 Rypg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Qeft7dz6XVBFF176iTjFmxbxgxL824tb/F/dZ8ObcU8=;
 b=5C7/FEp0T0sY32f8axwqqQHFugnmVMjTH7N8brFsup/6HR7v9LvUJnr36ebDmUzKsU
 XbatYQaXOGH0zvm4BOcMI0lvrmKa3pJloQ4IZ41Nv1aZsteJpCShryS1TOiL7NgXfita
 M2aX8e69O7tMgcaI0tHDoKEPfqssPJsULZbu9/wT6wPcLuUSihCThZJJ2FYiTQK5/RSM
 wGc9jUcf2b1RWDnd89qBFPhMO4GNJWP8hEFw4K/oZ+ev1UqWOFiJKhUMI+2KX6pnsHUi
 emOnK1pIbMVRPnAARin/NsYB6pykcyBHPEmw+dPN4UkExaU9IyfOQ3cqKw/9viSl+/Hb
 OKTQ==
X-Gm-Message-State: AFqh2kpM6fcQAqNaa0cVkgDXNjrU9IorfCxrdjpWX5E5qNjJvojVNDeD
 cy40NXHf9G7fnVJ8jYMdsPvpEQ==
X-Google-Smtp-Source: AMrXdXufPKoynhKRxHIzTraTq6HT2HmxjBayeSTUQS2f9sgkCsAOPrcwwTz7xWAWPOG/CvlHktuPCg==
X-Received: by 2002:a05:600c:3509:b0:3d3:4f99:bb32 with SMTP id
 h9-20020a05600c350900b003d34f99bb32mr53670142wmq.36.1673454008852; 
 Wed, 11 Jan 2023 08:20:08 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 m5-20020adfdc45000000b002428c4fb16asm14485071wrj.10.2023.01.11.08.20.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Jan 2023 08:20:08 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 088AF1FFB7;
 Wed, 11 Jan 2023 16:20:07 +0000 (GMT)
References: <20230111151628.320011-1-cota@braap.org>
User-agent: mu4e 1.9.12; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Emilio Cota <cota@braap.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Richard Henderson
 <richard.henderson@linaro.org>
Subject: Re: [PATCH v3 0/5] tsan fixes
Date: Wed, 11 Jan 2023 16:19:06 +0000
In-reply-to: <20230111151628.320011-1-cota@braap.org>
Message-ID: <875yddnivd.fsf@linaro.org>
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


Emilio Cota <cota@braap.org> writes:

> Changes since v2:
>
> - Add R-b's
> - patch 4/5: Fix incompatible pointer type errors
> - patch 4/5: Remove leftover helper
>
> Thanks,
> 		Emilio

Queued to plugins/next, thanks.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

