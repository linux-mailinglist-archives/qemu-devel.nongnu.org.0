Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11FE36A5E75
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 18:58:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX4DX-0005SK-LK; Tue, 28 Feb 2023 12:56:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pX4DO-0005Qk-PE
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 12:56:38 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pX4DM-0004k2-H6
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 12:56:38 -0500
Received: by mail-wm1-x32b.google.com with SMTP id k37so7046006wms.0
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 09:56:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Skk49i/shedgc81y2UM/JeyxDXNyTjq+cP9YqmQExiU=;
 b=z1EMO5YJpaz+ATxWetuC9e2BC06HKrnjBFRT/W2N9ZJypRNIQZf/yWByQ6xQd/hALe
 XcH65oLYDaBNq47x88aY9wWZOY9MmI3MuzaTt6KDJ2hkPhlEuZn6PxkHyIynEGs0dymV
 pGdAh9rQwRvwlYQRAoyphojrwnNXrlfa79SY7cH71fuHUFrwXugkjya3A3pZJjWe27LW
 am3DoCWSet33YemU6ij2W4vlanSfu25JCtpLeUrUEmW3FFio3ErTW58azLU8hwFA66o6
 +u/SKgWoh5cvFsUA/Y154TJyhvx/s8bJRp8cm9eFuJ8akLBZmMtVUykoxTwJNm4EqutA
 0uzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Skk49i/shedgc81y2UM/JeyxDXNyTjq+cP9YqmQExiU=;
 b=iT0zL8gtoeHHeSJFHcabP8yrqB2yF5aWBLr8Mr2Uo9X7XiNPlzkc5k5WVq+s9vWMCP
 J3c2QYJDt5DRedwO/VaIybNCP81JcWoNir8PwFnZPD52WDXkcDZN5+kzQJk44Gllj/KW
 Cim6WKRbmW6T1C03FpeBeMFoZez3Ht3rAKOYNjztP/VcjMdYWxjVs2FLPKLX5wEjYFwv
 i2rH6u5DlCHwA4A7R7FTmnhj458iqo9uRXoJFa8hqNd5HIKOaCVtzlgv1BSuYHwHX6XK
 rux92DgR2zRUIuvmf5YlTE36YpWkm3SpkSdBxYQfk8a2oeAicWB4r7cMig9CxmmOKJb6
 HKxA==
X-Gm-Message-State: AO0yUKXBZ1C25+oQmOrwwNYCS+WD5+WWSR7DyZKRNeCpx3JXGVqqyckW
 h5hNcciEtaqXEVzSuH6Nx9eo7w==
X-Google-Smtp-Source: AK7set/Day3TBlpgqBslBbiThPWhmDDbVzmNMzNOAr1tvXfuPAnrGrbevgqstBebIr26pfrV9tupgA==
X-Received: by 2002:a05:600c:4b1e:b0:3e7:cee4:f8a with SMTP id
 i30-20020a05600c4b1e00b003e7cee40f8amr2937351wmp.29.1677606994592; 
 Tue, 28 Feb 2023 09:56:34 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 m4-20020a05600c4f4400b003e209b45f6bsm18041074wmq.29.2023.02.28.09.56.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 09:56:34 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CBE471FFB7;
 Tue, 28 Feb 2023 17:56:33 +0000 (GMT)
References: <20230216025739.1211680-1-richard.henderson@linaro.org>
 <20230216025739.1211680-3-richard.henderson@linaro.org>
User-agent: mu4e 1.9.21; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH v2 02/30] include/exec/memop: Add bits describing atomicity
Date: Tue, 28 Feb 2023 17:56:28 +0000
In-reply-to: <20230216025739.1211680-3-richard.henderson@linaro.org>
Message-ID: <87v8jlekry.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
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

> These bits may be used to describe the precise atomicity
> requirements of the guest, which may then be used to
> constrain the methods by which it may be emulated by the host.
>
> For instance, the AArch64 LDP (32-bit) instruction changes
> semantics with ARMv8.4 LSE2, from
>
>   MO_64 | MO_ATMAX_4 | MO_ATOM_IFALIGN
>   (64-bits, single-copy atomic only on 4 byte units,
>    nonatomic if not aligned by 4),
>
> to
>
>   MO_64 | MO_ATMAX_SIZE | MO_ATOM_WITHIN16
>   (64-bits, single-copy atomic within a 16 byte block)
>
> The former may be implemented with two 4 byte loads, or
> a single 8 byte load if that happens to be efficient on
> the host.  The latter may not, and may also require a
> helper when misaligned.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

