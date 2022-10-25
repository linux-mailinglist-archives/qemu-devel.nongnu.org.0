Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D91C60C8B4
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 11:48:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onGXO-0003M4-O3; Tue, 25 Oct 2022 05:47:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1onGXL-0002ck-Qw
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 05:47:55 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1onGXG-0001ZC-Tf
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 05:47:55 -0400
Received: by mail-wr1-x42f.google.com with SMTP id bu30so19879035wrb.8
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 02:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DKkY4zMGpZBdKnB40nPaHYv3u7yuILY/ioxu1pNVoNc=;
 b=CnvrqISnlW2MxqdYmtarUvKxKpwXVD+nFynAnijSVVyLA/CyBqEku8CEcbKkpzLCYx
 wLd6Lb7fYQfVm2YoFKTjOcX6hq8Upt0OJ+1C+2NoVBK5Mi40T1CPAmFOfWOAZdRqhZ0K
 AlGtZ33YHKZ1Hay1pPckIglxgI4po82KhiG56QQsPn5DtyjhlnJ06e/1snEZLYX5Czrf
 LkaQInrDK//s6wWepvpPWYAg5zH7pvUq1JBN0aXZ7JjVXDRv8q6ZBaHWZZP1Pi+qO5Ox
 DkG0XW9Qjb5auvyV9ZvDxHyszAw7v4CaZPRRECvKUpp5Pwp/r5xEz5vMhTCtnH0JKhj1
 3dXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=DKkY4zMGpZBdKnB40nPaHYv3u7yuILY/ioxu1pNVoNc=;
 b=TT51WNaoBEp+VmTJ6zdziTgtdh0yGXD1RAdijMGKUAix4BVcJUwjxi/98Ljb6hAIUI
 KSaOrRgATQSX2iO715K6eti/FEql61xxMZMphflttc0X0m9UX8Bmz/1Kld/xi52ERX85
 GpNKmT01cT+6fTBxolQWi8pi4vE/ieGlYOwjiqEwuzyXRvh/T8lZ/kwUv0BkZDmvJUgP
 a2trexWrMwQ+scJrMa6y/PSHyiTQOnxjxS9/ZTZYDJ0q939Lq/ZWVzS4rCtVB7YA1Xxz
 k8YCWd6zjaVxyPDTzo3B3bwnCGC58cBrKougOiLlN8ClFK0dfHcx0oRp4Xn70fCZrmAG
 +/BQ==
X-Gm-Message-State: ACrzQf3uVUN5JSIJM0VSiMMY5HM7l9eZXBUjOCvk/eyUItsCjZFidkwC
 e1N2S19H+aX51A4QV5uLGcipRQ==
X-Google-Smtp-Source: AMsMyM6D/KGkZZYnF5D36WP2OWaOxVsmLYmYKVP6cABrovWK+xWvvl8EruhqICJPlo1ejEVs3oq+Cw==
X-Received: by 2002:a05:6000:1c18:b0:232:a0fb:efe1 with SMTP id
 ba24-20020a0560001c1800b00232a0fbefe1mr24633206wrb.459.1666691267850; 
 Tue, 25 Oct 2022 02:47:47 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 i8-20020adffc08000000b0022c906ffedasm2067257wrr.70.2022.10.25.02.47.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 02:47:47 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D15931FFB7;
 Tue, 25 Oct 2022 10:47:46 +0100 (BST)
References: <20221006031113.1139454-1-richard.henderson@linaro.org>
 <20221006031113.1139454-10-richard.henderson@linaro.org>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, laurent@vivier.eu, pbonzini@redhat.com,
 imp@bsdimp.com, f4bug@amsat.org
Subject: Re: [PATCH 09/24] accel/tcg: Introduce tb_{set_}page_addr{0,1}
Date: Tue, 25 Oct 2022 10:47:41 +0100
In-reply-to: <20221006031113.1139454-10-richard.henderson@linaro.org>
Message-ID: <87v8o86xq5.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
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

> This data structure will be replaced for user-only: add accessors.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

