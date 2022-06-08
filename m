Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF15C543896
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 18:14:06 +0200 (CEST)
Received: from localhost ([::1]:43958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyyJp-0004F1-Sz
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 12:14:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nyyGM-0001Pf-Kn
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 12:10:32 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:35516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nyyGK-0001pf-FO
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 12:10:30 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 l2-20020a05600c4f0200b0039c55c50482so3592019wmq.0
 for <qemu-devel@nongnu.org>; Wed, 08 Jun 2022 09:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=uLdzDmekq95mvRcr9Zsa5UIpjgzvUm/EPMFtyRaxaw4=;
 b=Aq5yhzWzKXBAiLFqE6wAgAPYeEABdrQv4aeCX8iNI70cDVQXH2NfsmEp32mosibKLx
 shQ+mypTyQdSNKylm0tFP9dSMv6HfFh6UtEBHPzl/WvYAV4K9D+ohdyytOK8M+BC0+Py
 o0A2fLqdo4NH2zQjfEqjpkquV9ytO38+vB/duGb1X1sEVoXrVegE+ye/ApOmGKDRhsAy
 joJg+MIQ0y6jU2NI4i72LMd4PSPd178IIvuEBu6eoJwof2xQxyPzZlUK3afV5gyGcUAB
 qKp/5xJIv8BgPgjIOzfTzDFGApHPWMUroYPw/QPAaLsStCJgjEtvRT+jmJm1sitrcDYK
 O2Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=uLdzDmekq95mvRcr9Zsa5UIpjgzvUm/EPMFtyRaxaw4=;
 b=11iwleFhUSnOpfqFv9SjT07nm93I3JKo2ONyU89swvDNMCB74J1N+D3FR5M2tQZqVb
 s0e3zUNOoMwMXLr1nmOt5J/DuvWLIYsxlbquTqKX8w027q/ftCHIVEM3tBV5JkAjjtUs
 sF+nGlpVJNIAazFHT4VkUbc9rj4xPhf3tDH3+9AQLb1qpk+tRGJI6VTgEY51x2G0FWmx
 Yp/isGbNJWMvDPMpcP2vNIKeXyGc1qRWoPRs1ENQgPrwNCqgl1U3BKOuriUUdPcz4nej
 E9B7a5ewzvGqL0R+ST+Kiy3RbxFzHa/9Po75TaPE5ikw/KtHXHR6owcATkoIwzPjMPF+
 84DQ==
X-Gm-Message-State: AOAM532qkqhLFkMQNGYlMJz6kxu8Zmse5a6TXMcFOPtD90cWLNrKLsJz
 ghcTcuhxGF2rmqOQqfdw//c8PqUVzif6tA==
X-Google-Smtp-Source: ABdhPJz3XZ/uDrK9mF6iPXtZiupoqAbadNpBV3bh/G5YX/wqFAStD65pRAbUEPsXrs8O/pyXpFQ0EQ==
X-Received: by 2002:a7b:ce8c:0:b0:39c:5bf4:abc0 with SMTP id
 q12-20020a7bce8c000000b0039c5bf4abc0mr8493309wmj.135.1654704618556; 
 Wed, 08 Jun 2022 09:10:18 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 r20-20020a05600c35d400b0039c454067ddsm16029232wmq.15.2022.06.08.09.10.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jun 2022 09:10:17 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DF9EA1FFB7;
 Wed,  8 Jun 2022 17:10:16 +0100 (BST)
References: <20220607204557.658541-1-richard.henderson@linaro.org>
 <20220607204557.658541-8-richard.henderson@linaro.org>
User-agent: mu4e 1.7.26; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Subject: Re: [PATCH v4 07/53] semihosting: Simplify softmmu_lock_user_string
Date: Wed, 08 Jun 2022 17:10:12 +0100
In-reply-to: <20220607204557.658541-8-richard.henderson@linaro.org>
Message-ID: <875ylbt9uf.fsf@linaro.org>
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> We are not currently bounding the search to the 1024 bytes
> that we allocated, possibly overrunning the buffer.
> Use softmmu_strlen_user to find the length and allocate the
> correct size from the beginning.
>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

