Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E8E6FF6BC
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 18:04:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px8kn-0001a8-9v; Thu, 11 May 2023 12:02:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1px8jT-000188-RP
 for qemu-devel@nongnu.org; Thu, 11 May 2023 12:01:33 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1px8jS-00073q-BC
 for qemu-devel@nongnu.org; Thu, 11 May 2023 12:01:31 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3f315712406so291925905e9.0
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 09:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683820888; x=1686412888;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SkfiNEBurfaH8m5ZimL08tsED2g7TSjWQ1tqOa6K3MY=;
 b=jjRaapFQ6UNo/VMygrZkQiw6qjyVLs/tl8KNxzpahzm+HxQf0wuCEnpA9io4xnV/wo
 sYq46Zlrc43bQdmnKQ4FZ7/EbJmWxHmgdzEeX24+6a5WEFqjwep4rtxMJsaW0W/4jAVy
 jnot82bj90Gidki2m8PEEYTd3mmnBh+D1n1ajK2oKSn3AfKqvX9KeMey2+kC2iq94EHi
 F7tMw0fsQBD3suafGEFfb1UaNLcsj4LWHILB4XNKEp70banaFBqaIX+9qfyrqmg3pjdL
 TcYEMdODm+r28EpMuura/XIO1MRWIwz579bdMUXsJ+FCFnXu8QecYcaHl4QvL1NkLCbP
 nExw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683820888; x=1686412888;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=SkfiNEBurfaH8m5ZimL08tsED2g7TSjWQ1tqOa6K3MY=;
 b=UJMSeAo9Xp1WkfIq+ewRyD03UfmmVZ53usYBpxIDHHwAGzdKvWvZiJG8+AWhtZU2O2
 RcdJ2z30iXlkTp66OPMvBq8s49K2DSkqh257IuE2rXSz0McLMal59uQl1a/aX/LA0qeL
 5GHvyLVtwSwEqNO1iYlmHLmmwZz99Ht5L9uTXJy8rpZSPf8Xlvi/1uF/z7aMZ+sljMZS
 iA1GaWtF8VeVEt4pGGXgLtux3Qw3K6c9b4eP8ia5Bw/WTBE03lj58N2cbra2i424cuR8
 YesXnThDU5dd2DBjEOwLjw8Vb4hLs/d8azHQgt7g8Xv+zvpWOLky5Hg5XvprmPwFjRld
 yNQg==
X-Gm-Message-State: AC+VfDxzVA2NO1oNPLi52HcnpVkggsDVamBMyN4M2G5lI5YgrW5jikon
 GDSM4LHgU52y0YdXh6UpXVVvgQ==
X-Google-Smtp-Source: ACHHUZ5Z+b0/7TO5ViFZ7GljqNQEiKoZ45F24rO8JHDsFsRDR1N1iJGmCkr2qJlAOXdfixFExigX7w==
X-Received: by 2002:a5d:4d82:0:b0:307:8fa6:7968 with SMTP id
 b2-20020a5d4d82000000b003078fa67968mr10996135wru.12.1683820888339; 
 Thu, 11 May 2023 09:01:28 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 n22-20020a7bcbd6000000b003f41bb52834sm16688080wmi.38.2023.05.11.09.01.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 09:01:27 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5691C1FFBB;
 Thu, 11 May 2023 17:01:27 +0100 (BST)
References: <20230503072331.1747057-1-richard.henderson@linaro.org>
 <20230503072331.1747057-13-richard.henderson@linaro.org>
User-agent: mu4e 1.11.4; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: ale@rev.ng, philmd@linaro.org, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, anjo@rev.ng, qemu-devel@nongnu.org
Subject: Re: [PATCH 12/84] tcg: Remove TCGv from tcg_gen_qemu_{ld,st}_*
Date: Thu, 11 May 2023 17:01:23 +0100
In-reply-to: <20230503072331.1747057-13-richard.henderson@linaro.org>
Message-ID: <87ilcy26y0.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
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


Richard Henderson <richard.henderson@linaro.org> writes:

> Expand from TCGv to TCGTemp inline in the translators,
> and validate that the size matches tcg_ctx->addr_type.
> These inlines will eventually be seen only by target-specific code.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

