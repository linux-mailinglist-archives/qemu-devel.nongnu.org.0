Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E634466E53A
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 18:49:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHq4Z-0006rT-Du; Tue, 17 Jan 2023 12:48:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pHq4W-0006kL-8s
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 12:48:32 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pHq4U-0003Ls-KY
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 12:48:31 -0500
Received: by mail-wm1-x331.google.com with SMTP id m15so1709468wms.4
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 09:48:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=th+H+pNsyJyJ/rRhchoyda96ZOj2mzBfJD20cpEViRQ=;
 b=paD9ZqncC/sK/w3xkWaQnjjqeX4KUtVlGDhT6PbWvZfnQYGIb1cWo9Dq9+eH4z39J9
 l1VHAbLCliod/OpyK0K4C744QvJWePPjIDzbCIJWgosvl7ys3rLHhomGwB3D4Bu9epIM
 slZ2pAGjSJTim9M0uTV2NNp32bt/F6Juin5iIOKBg5GJr/4p6HdgKB0hHTZs4WrLZiMu
 oNYP6So8BJMoMgQj6J3be464RDFr+xibIkI4OG5l6F7wNhjZLSUjK0nkzZmS95iiZzIt
 mQRItrTZVHZQcy2nUcbE4N3T2lVSrfFq29rRxlnSPrQo/RYXSxeKvP2QW69gWzUvUaUg
 0JYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=th+H+pNsyJyJ/rRhchoyda96ZOj2mzBfJD20cpEViRQ=;
 b=jX6R1Chgsua4xQLOXJMiKgrQSiauFJpvefx/B6vwzU+EveReD/pBZ/vVRHrKZ7cyC9
 p0ur+oKyi1L4Ibh/ymwmsj9vZutEAXRw0U2AaxaUCWUwFNi2+ovlMFDeKXTFA/0DsVsu
 0UgnE5HXkMTDU8sWKeVp9rQ7EtOMSPKF0Ca7tVcXaIUmaFEJwmBbFul8ddmPpTbgce5Z
 EtSlWury6+Cy7dVH5OPdPlrmAqo5CNPJ0xPFKis+cVZQ+Id7fGJ/AqSsGiW5H+S+LXt3
 nsfbFXbfzT1We4Vmxh5x20Btlrs9Z8tS9iJ0L7L/cc5dbW9q15Qxv2JxP/Yuz1RjIHcp
 nbMg==
X-Gm-Message-State: AFqh2koqt33Rogo2WyA7kf4cjTLoMVc5gtDuBhEd17gfz38TFsNuPrzh
 UiXSuvT0FuraefAHBnlOcLOP1g==
X-Google-Smtp-Source: AMrXdXsNIEGEOLXql6v7qE0fEegQfckkLtTDpkiQVpDUTs5Qv1iF6Sq9e2HWnw7VMBaqdMUCpQhjxg==
X-Received: by 2002:a7b:c5d6:0:b0:3d9:fb89:4e3d with SMTP id
 n22-20020a7bc5d6000000b003d9fb894e3dmr3921630wmk.28.1673977709215; 
 Tue, 17 Jan 2023 09:48:29 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 fl12-20020a05600c0b8c00b003dab40f9eafsm10678844wmb.35.2023.01.17.09.48.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 09:48:28 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1CF851FFB7;
 Tue, 17 Jan 2023 17:48:28 +0000 (GMT)
References: <20230109014248.2894281-1-richard.henderson@linaro.org>
 <20230109014248.2894281-6-richard.henderson@linaro.org>
User-agent: mu4e 1.9.15; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v2 05/22] tcg: Replace asserts on tcg_jmp_insn_offset
Date: Tue, 17 Jan 2023 17:48:23 +0000
In-reply-to: <20230109014248.2894281-6-richard.henderson@linaro.org>
Message-ID: <875yd53vdf.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
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

> Test TCG_TARGET_HAS_direct_jump instead of testing an
> implementation pointer.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

