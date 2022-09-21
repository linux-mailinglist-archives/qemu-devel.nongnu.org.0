Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24FDF5C020B
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 17:47:22 +0200 (CEST)
Received: from localhost ([::1]:52766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ob1wW-0004iU-VV
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 11:47:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ob1pS-0007ju-Lf
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 11:40:04 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:45666)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ob1pQ-00048i-V9
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 11:40:02 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 d12-20020a05600c3acc00b003b4c12e47f3so4006520wms.4
 for <qemu-devel@nongnu.org>; Wed, 21 Sep 2022 08:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date;
 bh=RFrp+lQqRHXuLpCeIygBXb3gq8r0nl3GcBdsrFGCUzc=;
 b=YmKa7KBHbGyb9lBsZhhtWSPCmpsw2HhNJcyZ6BOrMNb58WwtvhsIi/OT0WoAxeooEG
 ThtD5sJetdb3EdI0+K1PK2HtmFvp36AYsEY5+pFdyHqDozs52WdCoIsFflh15XxFhlkN
 4Sw+bPbRBzXFnMxyKRAUZA5eeEKpsm4AxdyOeMkby1RlAKXS7M002Ztm2mfQauywNmQY
 MSYtgjYfcasGC82bTS3DpszP/uoO5qJqmzWj8LooShJQNiU1zgdZsrg82PepBx4JXaoi
 a9553f6lFacSH4nAj5JVcbZnYzaj+5T0hQgQFGTajZjTTA8BZ2emNh+OcxSBMB1zK9xF
 5C8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date;
 bh=RFrp+lQqRHXuLpCeIygBXb3gq8r0nl3GcBdsrFGCUzc=;
 b=TMX522ZaToGzXCuo/imhtSobO3Ovl0qYMKYpSK2R9k2kZLZ4RezdCd2T19fxKA9PBx
 6ziBRorqJRi14zIFppRBiKuIPtGYusVOnfHt5t2Bi77RI6WPHJ7YmWcIVCEw6ZxXR165
 co9VVEb9W6h1V6c7yzWbC/s9/Zh2bkF/zHjZnI8Yb2RfdDMFHmtPLdpnO3tdBKy3pDbN
 XuXkCFskdexsOduk6BWbFgw6e48o/TChOs5UkQr0/is9hOS9xlys8j2pGXInZ+jxwB3p
 TLIgGE14WFLicWrLEkCNyfNm5uRrS+msvtlhObn/8IlYy6JrBzCyt/3K9w5PDTaoxkFM
 /5cg==
X-Gm-Message-State: ACrzQf0GfmrVw2dU2xLVAGyMDRdz3Z7NSV1VyNIz0QTyuD0ju50g0cly
 JLLPCb8KkSm6BJ+GE6h/VKH4dQ==
X-Google-Smtp-Source: AMsMyM4fKYGXcIGSPyNXc4FnDywhZeKhjnxtTvsHDZa3KSBXYJ6W+7sfxtfs7h4EDAmq+kc507kF5A==
X-Received: by 2002:a05:600c:548b:b0:3b4:61f4:804e with SMTP id
 iv11-20020a05600c548b00b003b461f4804emr6062827wmb.188.1663774799083; 
 Wed, 21 Sep 2022 08:39:59 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 c62-20020a1c3541000000b003a840690609sm3989501wma.36.2022.09.21.08.39.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Sep 2022 08:39:58 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2E18D1FFB7;
 Wed, 21 Sep 2022 16:39:58 +0100 (BST)
References: <20220901182734.2987337-1-fasano@mit.edu>
 <20220901182734.2987337-5-fasano@mit.edu>
User-agent: mu4e 1.9.0; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Andrew Fasano <fasano@mit.edu>
Cc: qemu-devel@nongnu.org, erdnaxe@crans.org, ma.mandourr@gmail.com
Subject: Re: [RFC 4/4] tcg/plugins: Add example pair of QPP plugins
Date: Wed, 21 Sep 2022 16:36:29 +0100
In-reply-to: <20220901182734.2987337-5-fasano@mit.edu>
Message-ID: <87r10468j5.fsf@linaro.org>
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Andrew Fasano <fasano@mit.edu> writes:

> The first plugin, qpp_srv exposes two functions and one callback that oth=
er
> plugins can leverage. These functions are described in the corresponding
> header file.
>
> The second plugin, qpp_client, imports this header file, registers its
> own function to run on a qpp_srv-provided callback, and directly calls
> into the two exposed functions in qpp_srv.
>
> Signed-off-by: Andrew Fasano <fasano@mit.edu>
> ---
>  contrib/plugins/Makefile     |  2 ++
>  contrib/plugins/qpp_client.c | 42 ++++++++++++++++++++++++++++++++++++
>  contrib/plugins/qpp_client.h |  1 +
>  contrib/plugins/qpp_srv.c    | 33 ++++++++++++++++++++++++++++
>  contrib/plugins/qpp_srv.h    | 17 +++++++++++++++

Oh and I forgot this toy case should probably be in test/plugins/qpp with an
explicit test in tests/tcg/multiarch/Makefile to exercise it during
"make check-tcg". This should hopefully avoid having to mess with
PLUGINS in tests/tcg/Makefile.target.

<snip>

--=20
Alex Benn=C3=A9e

