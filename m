Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D43958ED68
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 15:34:44 +0200 (CEST)
Received: from localhost ([::1]:55000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLlr9-0005ac-QJ
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 09:34:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oLlVA-0004pY-T3
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 09:12:00 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:36433)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oLlV8-00033r-QH
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 09:12:00 -0400
Received: by mail-ej1-x636.google.com with SMTP id m4so27649448ejr.3
 for <qemu-devel@nongnu.org>; Wed, 10 Aug 2022 06:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc;
 bh=eUDHjxliG5q7Vh4G/6lKAujXu2JvT+nMQJL19HPFEi0=;
 b=BItvCraZozwgv13htKuvFMe4lPnsrfEjhIW6CcX16OajEVrpmogmaGSnpVI6GSMw+w
 /Ghib1dRoZme/TKogUErY007MiusYzYxMyXMAsR8EJft3DAsmdp4Rrfk+0fzF/BTRX+k
 3h2fkCu6ZC5Ooyh+rvnURIgNDhWsxR5ZGPOPvqjzf8KzcJ3/YADNe6J6a4E5CpJNyPBG
 pulJ1buCSTnug7waQrCp/ap29QBtTtekQcDyaJISkOLDP/+1NmW1VhEOMzfDBy2iIWG4
 aDBCK58ZaIOSvbP7UpmBPIDP8ljg/Sg1Ooo86gIWye+e5xvWUSbsiTAzUgx4uMkNNYXS
 8jhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc; bh=eUDHjxliG5q7Vh4G/6lKAujXu2JvT+nMQJL19HPFEi0=;
 b=T9EGnp3fcx0skvM7E5VdazM+RI0g1nDPSHbfNC7NG0bYEnIiJa8cPY/ESuhG+HAhAo
 ABfkTJVShxhuX9VtRWV+5NwA/uOuHESabTSLPimAeEjaPpjBAbqwq5JuYO0a1Cxq37zk
 P1nYcNAjzbmBaaUPyWql8Q/7IBR1iLdA4i7HphIzAtpsVQkzYh1OtjipJ9VICIdAEhcP
 u/giBRq4tcv9mb4KLx8SP3CJ3jOpJnFxqk4fx7CK8hAohVVRZlirFPEXj60rp57EzuS5
 /nqeM6Ibw98agpRbVm1482xU7zIbuLYhXDDWpSinMkaX0SKMBfKtQvdZxzBIxgWkf7q7
 Zdrw==
X-Gm-Message-State: ACgBeo08Kl/wePGv9LEWEwj4qvIIgQDrs39bCHG3IVPWP68eei+FkzUE
 UH01NaThQyPbw63IedbnxuUT/A==
X-Google-Smtp-Source: AA6agR50HstuL/rz7Gc19Dp7F06kFUl84EA3+FcbT5mld6r6aAOhihVXWZSRkOP33HbH0bZVWrOznw==
X-Received: by 2002:a17:907:7628:b0:730:b755:4414 with SMTP id
 jy8-20020a170907762800b00730b7554414mr20186298ejc.11.1660137117214; 
 Wed, 10 Aug 2022 06:11:57 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 l9-20020a1709063d2900b00730af3346d6sm2298442ejf.212.2022.08.10.06.11.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 06:11:56 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1D9FF1FFB7;
 Wed, 10 Aug 2022 14:11:56 +0100 (BST)
References: <20220703082419.770989-1-richard.henderson@linaro.org>
 <20220703082419.770989-18-richard.henderson@linaro.org>
User-agent: mu4e 1.8.8; emacs 28.1.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH 17/62] target/arm: Remove is_subpage argument to
 pmsav8_mpu_lookup
Date: Wed, 10 Aug 2022 14:11:06 +0100
In-reply-to: <20220703082419.770989-18-richard.henderson@linaro.org>
Message-ID: <871qtomeeb.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

> This can be made redundant with result->page_size, by moving
> the basic set of page_size from get_phys_addr_pmsav8.  We still
> need to overwrite page_size when v8m_security_lookup signals
> a subpage.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
<snip>
>=20=20
>      ret =3D pmsav8_mpu_lookup(env, address, access_type, mmu_idx,
> -                            result, &mpu_is_subpage, fi, NULL);
> -    result->page_size =3D
> -        sattrs.subpage || mpu_is_subpage ? 1 : TARGET_PAGE_SIZE;
> +                            result, fi, NULL);
> +    if (sattrs.subpage) {
> +        result->page_size =3D 1;
> +    }

We should probably document the meaning of page_size =3D=3D 1 in the
comments for the definition of GetPhysAddrResult.

>      return ret;
>  }


--=20
Alex Benn=C3=A9e

