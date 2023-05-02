Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D7B6F3FC5
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 11:04:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptlvF-0001qR-T6; Tue, 02 May 2023 05:03:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ptlvD-0001pt-Mq
 for qemu-devel@nongnu.org; Tue, 02 May 2023 05:03:43 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ptlvB-0005eN-No
 for qemu-devel@nongnu.org; Tue, 02 May 2023 05:03:43 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3f09b4a156eso21839655e9.3
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 02:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683018219; x=1685610219;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HmolcvxZmCXKcqkXmLRZFLcgj3wTzcHfocvHjn2cmCk=;
 b=OeDWlq8l+K96DTUOlcRjqcboZc7WiZRi4qik8Z2rotPl1GDolHTVReA/3xbSxa8qiF
 cl51VtAI/w16MrvKfUh+dTyxUneupeDZHrxKEb2O5bOJ34YFNrlh4LCNUvXLRsMu/yjs
 BOdhgAg1vaxIE4OYT4hYjwJAKT9AnPJrl3B9nQWGIqEq6cl4U1o+ZA6kHql1suixaFB1
 6UvPW9pI7AcRw4u5xsQByjvf7ABrSLPISiDux+hZ43+NLoRjJXNkbuQBKpG1QuyNpYki
 313947pjsFGF88Aj6QHzIP+OhnTRi8RaJiukzbiBWxWMVwPyyYoOFzJDwYnRKRSiNVdy
 CFjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683018219; x=1685610219;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=HmolcvxZmCXKcqkXmLRZFLcgj3wTzcHfocvHjn2cmCk=;
 b=aN2h0blpQooV2FI59TXj2oUO/3gTX3zzK8ys5KJ5sR6HxoHUDW9S6SWY8BzQg5TaLY
 9vyNtPxoeg/jc508M1VYQu40wSxtlMSn4mZunbZ+n6HEUpQ6lXmItwtOq2QaqIXdtWgV
 uSaageJ5oPRoF0nufCTRaz3KCp/jeQeATUgrGl71K9SLIM+n4tNn9S2/hng54YqsXdMw
 ahe2BhHa460mbcqDidYLoLDeGbAXipWcBl1fM28HNjH5SkBkRS4cdHTqljevF+jS6QRp
 g6yABmbT4uyeBO5q/rrjLnkfI3K+zxBe5HrSED7l+wPF4jM4Dbop3d9Z4ctCYi2YjJcO
 Lk8Q==
X-Gm-Message-State: AC+VfDx1VfLN7LJG8gh92nefjDqbpgxGycK61iqDoPDtKZXCaIPih1Fe
 XtGWWbDSbaaXwKPwG6O8FcFHIw==
X-Google-Smtp-Source: ACHHUZ7KIDJVBc3W4cD31dBGPh4vDy/GluSjSrHyteK2nNINZ+DfAsdt4XDL1MHzzijpuj4VURYlZQ==
X-Received: by 2002:a05:600c:2199:b0:3f1:70e8:c1ac with SMTP id
 e25-20020a05600c219900b003f170e8c1acmr13077732wme.8.1683018218744; 
 Tue, 02 May 2023 02:03:38 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 u19-20020a05600c00d300b003f17eaae2c9sm34925797wmm.1.2023.05.02.02.03.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 02:03:38 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 64CC81FFBA;
 Tue,  2 May 2023 10:03:37 +0100 (BST)
References: <168141244011.3026479.13697197743885252330.stgit@ltc-boston1.aus.stglabs.ibm.com>
 <168141245022.3026479.1619179446205380588.stgit@ltc-boston1.aus.stglabs.ibm.com>
User-agent: mu4e 1.11.4; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Shivaprasad G Bhat <sbhat@linux.ibm.com>
Cc: philmd@linaro.org, richard.henderson@linaro.org, danielhb413@gmail.com,
 lucas.araujo@eldorado.org.br, clg@kaod.org, david@gibson.dropbear.id.au,
 groug@kaod.org, qemu-ppc@nongnu.org, john_platts@hotmail.com,
 qemu-devel@nongnu.org
Subject: Re: [PATCH 1/2] tcg: ppc64: Fix mask generation for vextractdm
Date: Tue, 02 May 2023 10:03:32 +0100
In-reply-to: <168141245022.3026479.1619179446205380588.stgit@ltc-boston1.aus.stglabs.ibm.com>
Message-ID: <87cz3jt89i.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
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


Shivaprasad G Bhat <sbhat@linux.ibm.com> writes:

> In function do_extractm() the mask is calculated as
> dup_const(1 << (element_width - 1)). '1' being signed int
> works fine for MO_8,16,32. For MO_64, on PPC64 host
> this ends up becoming 0 on compilation. The vextractdm
> uses MO_64, and it ends up having mask as 0.
>
> Explicitly use 1ULL instead of signed int 1 like its
> used everywhere else.
>
> Signed-off-by: Shivaprasad G Bhat <sbhat@linux.ibm.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

