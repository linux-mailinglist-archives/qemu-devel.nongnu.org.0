Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A7E686471
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 11:38:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNA9i-0003Fu-Uv; Wed, 01 Feb 2023 05:15:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pNA9a-0003DG-D1
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 05:15:48 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pNA9Y-0000IH-Pn
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 05:15:46 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 c10-20020a05600c0a4a00b003db0636ff84so1005448wmq.0
 for <qemu-devel@nongnu.org>; Wed, 01 Feb 2023 02:15:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qqp0KZOb6qtgmEcQZpUuBhm4ReTA+NLd9bKpWp62AD0=;
 b=nUyf2fJUZsvHGfr5ZRNMR7Ji2LA5pPpzKZaxeoUXibdPuaRtf8UDcD1z+3Q+MM0swb
 6kgYKPWuUDWI0LKB89EHZweAxeNhruy3WaoWbEaQJdOvskUWJ2rek6Nc2LPp/NkzPlC8
 okMKf+l+OezviIvnTNS6I8rgL+D+4oRP0jrH8lGQ7S3wLlf46im5NZx5n44dZbbYL2OZ
 0AXhPz0zk7KH73LnlngXRlymlSuXhj0KRR4C+Uz6HjMSZj5bQ2/zd5NHsu++EGEximE8
 f1if52YBZLXHFa+hR8ZKMAqRWWUYFYdvVptxKzALZBZlUpzTJIVZCa8QRIN3EdfB84C1
 Enig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=qqp0KZOb6qtgmEcQZpUuBhm4ReTA+NLd9bKpWp62AD0=;
 b=EFScdaucCe3jX7lbAnrcuYZubNNduupd8tFwpekvdWJprAsRfXVjN+bMOz5BQzTE1v
 vhmrI1kVOKI52seIRdoamANDBHaQReZ4g1c6ntfH+7NSmM7tZjI5WkJm0DKEORV4s7b0
 C7xIjDT14k3gaF1U5SJgs+1odQf8Ocb8DDcRYU5057bIVhLAPjcqQHu+aiXy13SFwrq/
 PmFsAXFriFWj+B9kUPWgN10ni8HtLBey+jg98CZyPiZ3zR+xwoBsmMg88kZdjQPu85/A
 3jVWim77yckxBkiHPOqCWHzM1xWjynrUZCo3p4yhbAql5tVBPlWx4VHFgDGSopLbcLZR
 RXBw==
X-Gm-Message-State: AO0yUKVq5BHuG4beaAjsnu6HyXCdCKUHsW39jtnHH7G1xFPSr8E/OcAr
 JcK6A/FafrUUZho9tNrNscL0PA==
X-Google-Smtp-Source: AK7set8Lcxh0AAZ+yWyssOxQEimlE7mp7dEDUUB7bzBAh8baTTerZxnaYkozmYCGRtFi49N2GxA9Tw==
X-Received: by 2002:a05:600c:35d4:b0:3de:56a8:ae6b with SMTP id
 r20-20020a05600c35d400b003de56a8ae6bmr2294640wmq.34.1675246543330; 
 Wed, 01 Feb 2023 02:15:43 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 c18-20020a7bc012000000b003d1e3b1624dsm1302699wmb.2.2023.02.01.02.15.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Feb 2023 02:15:42 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 786FE1FFB7;
 Wed,  1 Feb 2023 10:15:42 +0000 (GMT)
References: <20230130214844.1158612-1-richard.henderson@linaro.org>
 <20230130214844.1158612-17-richard.henderson@linaro.org>
User-agent: mu4e 1.9.18; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, philmd@linaro.org
Subject: Re: [PATCH v6 16/36] tcg: Add tcg_gen_{non}atomic_cmpxchg_i128
Date: Wed, 01 Feb 2023 10:15:35 +0000
In-reply-to: <20230130214844.1158612-17-richard.henderson@linaro.org>
Message-ID: <87zg9xsnch.fsf@linaro.org>
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

> This will allow targets to avoid rolling their own.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

