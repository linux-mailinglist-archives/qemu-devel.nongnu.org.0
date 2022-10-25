Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FAD960D18F
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 18:23:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onMel-0006Gc-Bl; Tue, 25 Oct 2022 12:19:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1onMei-00066Q-Jw
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 12:19:56 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1onMef-00060A-Rp
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 12:19:56 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 b20-20020a05600c4e1400b003cc28585e2fso5319623wmq.1
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 09:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4PoEyjenNy5cJT+c67rsmrVyTa6rieFixDx73CHj7FM=;
 b=CGHdCHemCOr0NRor58MfYzT6eR4/OW6Gej+XWh4+eBwBgihlO0VhR+Prm7uGYmia7+
 qIYLryafDUtBJK84w+oiHmEYsKKRKzyvTw6GUoKTbFIDjskkT6kkbUkAl7s692itQ9X8
 WgHSKTWNUVNeTb9jNFCyuIeSg800t6fOKXBqUFWr2VdTFAtbbjEt2T9VuP+uPgKSA9iA
 6Gzstf44cvSIAwvAjrDqmlCVeq4O9SmLzNXliEtIgSrzKbAZpgx9jlNTPLqwk8gxpjB2
 9CDNLzmuj1R+FpARoV/57bq3GRGJwsB323R26KnnhdcrGkcji7O9Bx2V5nYTmEA2K2T3
 GF+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=4PoEyjenNy5cJT+c67rsmrVyTa6rieFixDx73CHj7FM=;
 b=7EShZ+xQJOUB003wjJHOPG5k1m6XQ9CA7w6KmlcSTACRZ8nmZmO7oSx0dy+d0inCos
 qeEE+LIqtrEOITQAi2kSIotmjb8S619EloQ6jYr7Bx8GRhHOnstdZu8w6OBdd8sSSisI
 fTJq31RZvvi8k7g70ymVJTTgYMtj95DBbMZjrKJSU6sKXCcQSkFKs1KpXuxzplwDiUnM
 XQF5vvgp0E55Cv0OGQZCKj9y3aigQlUcrQRQDKFeBNKYeuDrKagvv30SqmiYBG9KvlLz
 2dSOM66yv9xETzrC7WEe4cKr1mDtjOqnn3tT9zoAtAoNdlh4Kx6h2ThzY0z/QAul/2l0
 ExhA==
X-Gm-Message-State: ACrzQf1Fji2bRwi9U3GuIhYNtGPP8gSrodvgklFK6me/saKp5nFYsp6C
 ZGb6V5ATtOvcN53VxuL8b2ZaFg==
X-Google-Smtp-Source: AMsMyM52k/T8Tt351wCSoqtq5cGFc5z7ZdSUFr6ONtAFEr7hAwcPtrU8CQYS1w+0ZHNGujb6kvyCAw==
X-Received: by 2002:a05:600c:1c1f:b0:3c6:bfda:d485 with SMTP id
 j31-20020a05600c1c1f00b003c6bfdad485mr25540478wms.59.1666714792038; 
 Tue, 25 Oct 2022 09:19:52 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 c10-20020a05600c0a4a00b003c6deb5c1edsm2914483wmq.45.2022.10.25.09.19.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 09:19:51 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D69BC1FFB7;
 Tue, 25 Oct 2022 17:19:50 +0100 (BST)
References: <20221006031113.1139454-1-richard.henderson@linaro.org>
 <20221006031113.1139454-20-richard.henderson@linaro.org>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, laurent@vivier.eu, pbonzini@redhat.com,
 imp@bsdimp.com, f4bug@amsat.org
Subject: Re: [PATCH 19/24] accel/tcg: Simplify page_get/alloc_target_data
Date: Tue, 25 Oct 2022 17:19:44 +0100
In-reply-to: <20221006031113.1139454-20-richard.henderson@linaro.org>
Message-ID: <87fsfb6fkp.fsf@linaro.org>
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Richard Henderson <richard.henderson@linaro.org> writes:

> Since the only user, Arm MTE, always requires allocation,
> merge the get and alloc functions to always produce a
> non-null result.  Also assume that the user has already
> checked page validity.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

