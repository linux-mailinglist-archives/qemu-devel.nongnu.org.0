Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62FE664EB51
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 13:18:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p69eq-0004FT-HU; Fri, 16 Dec 2022 07:17:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p69en-0004F1-Ud
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 07:17:41 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p69em-0005uS-8B
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 07:17:41 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 p13-20020a05600c468d00b003cf8859ed1bso1626261wmo.1
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 04:17:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6UOdn3iCEP/AucTZvcMzpdCzOxEbgd0rNuq5SN8ncSM=;
 b=Nb2tZnP5Vr0xV7dmQnTev3b3RsxJ0psFdQom0Pkfq+w9P89CjPqzI5mBRF0iMGBQ1u
 SlId0Q1je7n+1Uy3baZgMQLoF036MRx+K+AkyqqFVQZZIIHcLaGUMT261pmLqsfxC9bz
 nJRtP0/OG71CTisCR/EmomYsC3zDDNfLhQ82mHvdPoZNdD+se9OwiPQeZuCjVFI/bC05
 4KM6HkXvUPdKBkQCkKea/KgJaz2wEG3MiI6nfmJrgU1EpbfbJi7VK8KYDFckVhZ3SOUh
 /Bf5nA5b8u3lTUfvgZazBr8T/eHYXGWwtXCf848LF7lBcc3Wuxaj5y8x0vN58wcI4ILH
 +sTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=6UOdn3iCEP/AucTZvcMzpdCzOxEbgd0rNuq5SN8ncSM=;
 b=k7lA7wENUF59OhFJTGHJuK7HicZI9wTNBgmlMCL4C5R11+PW6AoSCKpjmXD2IDs4lU
 REpEnv3F/hfZkpAZijekpMazRzKKxMbPyEcMQ78MhgHyZxSSOwbkFHDmeQYfSxzD5Hef
 fC9CALUlSkr4HQ42csGk/Z96JR38aGzCp3yDWxcX+frIkJzL3eHrb1rti7CaI0nN/Qz3
 AU+kvK9uS0R2AWKR1mmUh0NFMQlcdWNBaAMH8A59CeHUzNbhI889XhlSr/0B3kEmuYe6
 iQjActj1A/S7y0bLYFYsIem07sBZsIaJcSSxfdcMn4x5b83ZDI7KltuCjEdqAx9SG0lz
 GDZg==
X-Gm-Message-State: ANoB5pm/xlgxH/HPYmDFcMLbc6Ev0BGgfNQ8d/VY5RsOQ476DJ2er5Qd
 yOjG/gNIKCLYg1x5biprJSxvkQ==
X-Google-Smtp-Source: AA0mqf75IfizUZGiPoEm6C1tXXMaTAgQK+b0rZE4urHbQswcGuSEO2oKFDGSKQlzY0h+uaGWiIc+Lw==
X-Received: by 2002:a05:600c:310e:b0:3cf:b07a:cd2f with SMTP id
 g14-20020a05600c310e00b003cfb07acd2fmr24618190wmo.37.1671193058144; 
 Fri, 16 Dec 2022 04:17:38 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 f9-20020a05600c154900b003b49bd61b19sm6669621wmg.15.2022.12.16.04.17.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Dec 2022 04:17:37 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 634981FFB7;
 Fri, 16 Dec 2022 12:17:37 +0000 (GMT)
References: <20221209093649.43738-1-philmd@linaro.org>
 <20221209093649.43738-5-philmd@linaro.org>
User-agent: mu4e 1.9.6; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH-for-8.0 4/5] accel/tcg: Factor
 tb_invalidate_phys_range_fast() out
Date: Fri, 16 Dec 2022 12:17:32 +0000
In-reply-to: <20221209093649.43738-5-philmd@linaro.org>
Message-ID: <87k02rh7a6.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
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


Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

