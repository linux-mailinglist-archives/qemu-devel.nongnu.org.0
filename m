Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC779680EA4
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 14:17:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMU1j-00028G-KB; Mon, 30 Jan 2023 08:16:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <idryomov@gmail.com>)
 id 1pMU1h-00027E-Jl; Mon, 30 Jan 2023 08:16:49 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <idryomov@gmail.com>)
 id 1pMU1g-0004wF-6g; Mon, 30 Jan 2023 08:16:49 -0500
Received: by mail-ej1-x635.google.com with SMTP id ud5so31620029ejc.4;
 Mon, 30 Jan 2023 05:16:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=7RKGnRk8HLputxMSo2Ntk5p3kM923JGFMFqoT3A5riU=;
 b=mphDgSGTNz0DzrPFe/jKxL7eNOgLYMlLGp2I/PUp859N1RZqTCS/wVN3ImkQLcdW5i
 dhdrRDqtJqVHqaOZYMwAjINemaRiNKLWp/+3UQGGcvNO97MwATWtGE44sQKEiB1jHnVo
 E4i4E5fC0UX0YztdHTL3jrkg0j/suV314l9x9t5+Hsz3yUzsp16/DOTPrb2E0kcyX3Y2
 vpCsP35mgQJ1ix6zV/JCyzex0aSvUzbIXZ9Z97EyBuB+extuMO/80KErG+JPexCEgvcj
 SaAbiCPBb3zbm5wQmUvCOtsfP4HPppJasKnfy04r/NvYwOuMRW2DizN1Dwy+E5n3SVKb
 zP/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7RKGnRk8HLputxMSo2Ntk5p3kM923JGFMFqoT3A5riU=;
 b=NXPs7jzSEoB5gdSul4He4DpyrO56LxnM6k4Y65xu33SdAe2BPm1cnPKVFP0wG+Mn2z
 RNeltavfj3yirN3FUpxQq4fdRY2k8W2xw+5TNpaX+UkLuu22efku0IUL3wmsMK9yEDNA
 /dma9gmbs8u4D3iDWh4VX7kJspV1Z5UtF4rAM8KXx92TGN2MM89BpD0gZSz0XmJo6jPS
 jW2ls2HXpI9Ifhc3c5pG4Eq63RA28cbruFFs1WAHMLWIi0Lp/SUrg3TcnkFY4QvPh+if
 Ayj61DAaEayjQfIC1aOO7Ca6u4+FkPO6zlShQQeVkLFCfOO/+HyvluGBctHfKVTeFbbj
 QtGQ==
X-Gm-Message-State: AO0yUKVP3sgPY90vQEfckp+XwrCpjjBZn8J0zNIEx2fgY8MJrzplEXAx
 XksG0SYof6z1EQFc6k8tebgKmST7Z1+728fllP13x7bijNI=
X-Google-Smtp-Source: AK7set+cQrfo5euo2EbRdk/WIGH9B6dwjHqE+MmRW1+WZ5rTnbBTDff29gWT/OElnLL1XuOoaQh6/2IMI/NzCmfcxtw=
X-Received: by 2002:a17:906:faca:b0:88a:5d6f:b69e with SMTP id
 lu10-20020a170906faca00b0088a5d6fb69emr405332ejb.59.1675084606222; Mon, 30
 Jan 2023 05:16:46 -0800 (PST)
MIME-Version: 1.0
References: <20230129113120.722708-1-oro@oro.sl.cloud9.ibm.com>
In-Reply-To: <20230129113120.722708-1-oro@oro.sl.cloud9.ibm.com>
From: Ilya Dryomov <idryomov@gmail.com>
Date: Mon, 30 Jan 2023 14:16:33 +0100
Message-ID: <CAOi1vP_G3zYFRGwKnuRiTsvu+Y1FKjSBJTTt_Mq_JDvFV+rchw@mail.gmail.com>
Subject: Re: [PATCH v6 0/3] block/rbd: Add support for layered encryption
To: oro@oro.sl.cloud9.ibm.com
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, oro@il.ibm.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=idryomov@gmail.com; helo=mail-ej1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

On Sun, Jan 29, 2023 at 12:31 PM ORO@il.ibm.com
<oro@oro.sl.cloud9.ibm.com> wrote:
>
> v6: nit fixes
> v5: nit fixes
> v4: split to multiple commits
>     add support for more than just luks-any in layered encryption
>     nit fixes
> v3: further nit fixes suggested by @idryomov
> v2: nit fixes suggested by @idryomov
>
> Or Ozeri (3):
>   block/rbd: Remove redundant stack variable passphrase_len
>   block/rbd: Add luks-any encryption opening option
>   block/rbd: Add support for layered encryption
>
>  block/rbd.c          | 188 ++++++++++++++++++++++++++++++++++++++++---
>  qapi/block-core.json |  31 ++++++-
>  2 files changed, 205 insertions(+), 14 deletions(-)
>
> --
> 2.25.1
>

Reviewed-by: Ilya Dryomov <idryomov@gmail.com>

Thanks,

                Ilya

