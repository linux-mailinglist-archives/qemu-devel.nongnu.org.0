Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 470F96DDB5E
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 14:59:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmDZV-0007h6-8F; Tue, 11 Apr 2023 08:58:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pmDZK-0007gP-BU
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 08:57:55 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pmDZF-0006Tf-RA
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 08:57:52 -0400
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-504ae0a698cso1082185a12.1
 for <qemu-devel@nongnu.org>; Tue, 11 Apr 2023 05:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681217867; x=1683809867;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xJvJS40WCNqHmshT8Ne3VQVW4OPsMKMaWe8mRIHcQ2M=;
 b=QCAPEUmb64UP8ks4R4sfQBN0NJnynRoXMj4y3f24IaMO6r7KkjlOeLIyh9pSqOdNOg
 svNgdwCK5aF3I0LET/oIGpA4AGCybEGAVAyIbmzs9IE/Oe0OQyugvh3xB/WLcKpphpuT
 r3HtkXqBGdKttJB43a1t1XCCxlRtXMJAHqotQILIdYRSuOPM/Vd9/JgQjn2x1/FgWXP9
 Kcba1Lc2n7bHCnf7Xu8JU4Q5foK2NZp4h6WqCfjzBlnec+6hItPzIxeSZ7QOdc1/Ku10
 KMkQJlRhDTvvLHwdDiyQjxWgLJYzYaDCJT4LmxrqtgXrCh173moXX9ldMayFSOeOq+m9
 YGkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681217867; x=1683809867;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xJvJS40WCNqHmshT8Ne3VQVW4OPsMKMaWe8mRIHcQ2M=;
 b=EUQuBNMhZ1lNqdSREaclD5gILrcy1See8+apCH/KtRrTxA+FwCgZkXEGGhb+Ua2cn1
 b3MDgZQ9quc0FV7JOga1/eboMFZylPMDEqdaW6qo8W/qx8m9hIj1zRM5IjLlnJ2zK2MC
 isy8TE2G12a5WHILPregogzZJb1LDiWtyTjps2Iro7JEvqeI5YJmcsAdxYbP7nAQQz7E
 HG0K8D6Q0bx5Jx5BQDSZKJu+z5mp/OavowQ/1ql3Xtqkj4d8hQqyH827qC8f4HyViWrn
 KlKIpdFKQchSERF5KEM5s8cGrqv3Scqsf/kvq5cjq5+zj83lM6O89ceJtQDXrK/wBTFE
 UU1Q==
X-Gm-Message-State: AAQBX9cTazAwLdgBhmVbjJ2eXyuPIxsVoKYGXnEzxfryNVdRWShjRDej
 HAXqILjcW+o5Fzo1uzHog9xPqBDXV1niNIpZTwcbOw==
X-Google-Smtp-Source: AKy350ZyDGQlfo2poXM5BF/S9Fnj+GRGIJHzH+Ef6vY+uap5YJ8JkM75kXGC4GxAoGHs0936/W5QV1bimFo6iUlYilI=
X-Received: by 2002:a50:d0c3:0:b0:4fb:7e7a:ebf1 with SMTP id
 g3-20020a50d0c3000000b004fb7e7aebf1mr6726356edf.6.1681217866332; Tue, 11 Apr
 2023 05:57:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230409200526.1156456-1-sw@weilnetz.de>
 <0dd900ec-cb08-b89c-bf09-851cca144afd@linaro.org>
In-Reply-To: <0dd900ec-cb08-b89c-bf09-851cca144afd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 Apr 2023 13:57:35 +0100
Message-ID: <CAFEAcA_cQF+GmQy2hy1VW1fbhioyWaYnU2iHg3-f13G4D5NsPw@mail.gmail.com>
Subject: Re: [PATCH] hw/arm: Fix some typos in comments (most found by
 codespell)
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: Stefan Weil <sw@weilnetz.de>, Shannon Zhao <shannon.zhaosl@gmail.com>, 
 Alistair Francis <alistair@alistair23.me>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Tue, 11 Apr 2023 at 11:42, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> On 9/4/23 22:05, Stefan Weil via wrote:
> > Signed-off-by: Stefan Weil <sw@weilnetz.de>
> > ---
> >
> > The patch does not change code and could also be applied for 8.0.
>
> But not user-facing, so can wait 8.1 :)
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Applied to target-arm.next for 8.1; thanks.

-- PMM

