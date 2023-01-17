Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C1966E542
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 18:49:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHq5G-0007Tx-DV; Tue, 17 Jan 2023 12:49:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pHq5E-0007Te-0o
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 12:49:16 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pHq5C-0003VZ-Dw
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 12:49:15 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 f12-20020a7bc8cc000000b003daf6b2f9b9so5443067wml.3
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 09:49:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WmSUYEjs+LDedL2Bz0o9zbBox5JGCYlqLsYmT5Lu48g=;
 b=pjWtDtrsjDZI/0KynjbWSqlByLZAP0Nvq/3yevi8+R+7ibPa+ElRbhYGENxPjnd34r
 7wRrbFayc3vmdMQ5iD3d76IgNCBAiUhNjOXNnstg5HmL9eg4Ijex2o/Ooe+vsTfKXCrm
 ZI5H2xX1Kb1MyPYDVNwtv/qMy2KcNWGiVbHAtsrdQVeWvZKAzJbVrDafuIB2LgF3fX6b
 0OAjmTp8VG3silVtXIsu82bc+VVdsuiFGGU6D3v29U07fBfbzZwQtzZaZ4i+WVZ6zyy6
 cVHkG/8/S+ZduHG5xX4pmua9ayhGsMidJreEqGSf3sdRNTuuyhBamMFOhU2HIljXktFl
 o6MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=WmSUYEjs+LDedL2Bz0o9zbBox5JGCYlqLsYmT5Lu48g=;
 b=qj3G2f4CQvRc73iUd8tnsyFUoaqpqqdU0OiYqyNIOu70Zo4tEiKBZ23jD5EaR98Xnd
 kLxyCf1f2pqliBdU0nhjCpf7MhzQOEK0twg38vfyW0qtgwHPlmISzEPA7W7YoeXJRq+l
 bdPlvqbRQkibaqao4sgdZY04l/DU8m8bSync5fUCCVd1DPraA2MtlFxyy4l6AZq3V++e
 7rhKFW/dTatTf2BbjuRV750l66yF5w7mVTcTXdgD5Lw0OAHW/CJrihNm0yO6jlO5nKXQ
 oyy15hAcyJGH6AmzfIFhR+RbtXnVtl4Uixhom6661VxslfKIAQBF2AaXfXw4h6V2PaCU
 Aalw==
X-Gm-Message-State: AFqh2kpaqPk1H9lkXyeL9ZbNppVU+3xmBOTU6MPB89Z9TrKedHkXrJvQ
 HHORA/DOKO72X3CFfC5ytos++x/TYAYp66bT
X-Google-Smtp-Source: AMrXdXtLGETKNSQ0fGYPusnxErILwKkfO+F3DIMs57YP3aHpwGMPe8yKI21KyGf7Ial5b0aMd1aNjw==
X-Received: by 2002:a05:600c:4f86:b0:3db:66e:cfdd with SMTP id
 n6-20020a05600c4f8600b003db066ecfddmr3123668wmq.9.1673977751766; 
 Tue, 17 Jan 2023 09:49:11 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 d6-20020a05600c3ac600b003da0dc39872sm19781637wms.6.2023.01.17.09.49.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 09:49:11 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id EC4401FFB7;
 Tue, 17 Jan 2023 17:49:10 +0000 (GMT)
References: <20230109014248.2894281-1-richard.henderson@linaro.org>
 <20230109014248.2894281-7-richard.henderson@linaro.org>
User-agent: mu4e 1.9.15; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH v2 06/22] tcg: Introduce set_jmp_insn_offset
Date: Tue, 17 Jan 2023 17:49:05 +0000
In-reply-to: <20230109014248.2894281-7-richard.henderson@linaro.org>
Message-ID: <871qnt3vc9.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
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

> Similar to the existing set_jmp_reset_offset.  Move any assert for
> TCG_TARGET_HAS_direct_jump into the new function (which now cannot
> be build-time).  Will be unused if TCG_TARGET_HAS_direct_jump is
> constant 0, but we can't test for constant in the preprocessor,
> so just mark it G_GNUC_UNUSED.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

