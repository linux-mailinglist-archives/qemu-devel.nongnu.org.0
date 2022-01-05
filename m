Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F06485054
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 10:49:31 +0100 (CET)
Received: from localhost ([::1]:36270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n52vB-0004Pd-To
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 04:49:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n52tP-00039o-NM
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 04:47:40 -0500
Received: from [2a00:1450:4864:20::329] (port=51760
 helo=mail-wm1-x329.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n52tO-0002tu-92
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 04:47:39 -0500
Received: by mail-wm1-x329.google.com with SMTP id e5so24668483wmq.1
 for <qemu-devel@nongnu.org>; Wed, 05 Jan 2022 01:47:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=aNE1RtOW57ZzkP1hGTEIViZl3KUtwW07YZ7EMaQarWk=;
 b=SAeOcD6GssYdFhpxB1t1MPRomzCxo6eIBoEo9Yg0vFABxK7gqepf+crE3Iz16xgfWS
 W7Ko2HnDFVoSZ93zdTw9xb7HbQXtyTiF/5gkUZ8XZrp+VHYOBbsDRWOMUq/2sBf+jnvv
 +mveG3Wpx3KhKLns9EKfiWhvaxv7ycBr0oPR3M4rNkw23YpQmvFcpJbgyfa/c3qoF47Y
 eVdsOLtgVpQZLhWKnmAozg7vjQyU/ctxBCUxLykCkN/zwi1FJW0KT8UqqaYjcS+UbIeT
 6NSpCFaDWfEpB1k7101Eh/1ycO2hWKTrRdTyRpC44yxzDBSfIekNV/mO47OTxT4W0PA7
 3yXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=aNE1RtOW57ZzkP1hGTEIViZl3KUtwW07YZ7EMaQarWk=;
 b=U7drtEy4VC8wJ/lEg7G68aTdB5fbr6Sm7dnzg6afSep+H/BHKWL6UMcXtEjSbb8RI/
 Y8eaZwPQONSZWiAXg6UuSGgpr3f5QltX6hY2FovO6v/vLrCueLtXlT/MyvfMJZnYkhny
 IbnABEmukwf4/2msYlK/1t7WsTdJYIh7cqCGhT1r0EWFhGJJvbal8h7Q+176AB6Ty6RW
 sNNwSfc6XYIZQsHxKcER4rG9ndsDnHCL0NizumGPKYK+VF8FLWxpGTMpp37hO2TXncpo
 JjH/qWERLF8bNy1mtjgRA2xPkZncFsmcy3KfgFpK42+Jq86asREEUkN3F4wg0bI/myBV
 U+sA==
X-Gm-Message-State: AOAM530beLB75NAt4Hs4C3ZjXY7GvjNCEHJKY61hf2m4gWaSjUs1Fz5p
 hZqEdlVYLoBB4DOmUYIDa3z/AA==
X-Google-Smtp-Source: ABdhPJxXJ14WJWe5OlStJbKnDEiZ9/AKAxEw4eqMC9clK2QCQeBUKi0yFGolRyFGxv+oTBGQu2ruIA==
X-Received: by 2002:a05:600c:4ed1:: with SMTP id
 g17mr2109817wmq.112.1641376056824; 
 Wed, 05 Jan 2022 01:47:36 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l4sm46315662wry.85.2022.01.05.01.47.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jan 2022 01:47:35 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 59EBF1FFB7;
 Wed,  5 Jan 2022 09:47:35 +0000 (GMT)
References: <20211215084958.185214-1-thuth@redhat.com>
User-agent: mu4e 1.7.5; emacs 28.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] linux-user: Remove the deprecated ppc64abi32 target
Date: Wed, 05 Jan 2022 09:47:30 +0000
In-reply-to: <20211215084958.185214-1-thuth@redhat.com>
Message-ID: <87pmp6jyyw.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::329
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>, qemu-ppc@nongnu.org,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Thomas Huth <thuth@redhat.com> writes:

> It's likely broken, and nobody cared for picking it up again
> during the deprecation phase, so let's remove this now.
>
> Since this is the last entry in deprecated_targets_list, remove
> the related code in the configure script, too.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Queued to testing/next, thanks.

--=20
Alex Benn=C3=A9e

