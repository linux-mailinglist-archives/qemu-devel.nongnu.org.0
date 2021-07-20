Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4AEC3CFADA
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 15:39:57 +0200 (CEST)
Received: from localhost ([::1]:39288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5pyW-0003Az-QV
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 09:39:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m5pwl-00018k-VU
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 09:38:07 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:33704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m5pwk-0003Qy-C4
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 09:38:07 -0400
Received: by mail-ej1-x630.google.com with SMTP id bu12so34476474ejb.0
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 06:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SxYcmrUXEfFoCnr55lfa1fe0u65LmX3WqfEJ46nHEE4=;
 b=FBxD1Vd+UE8Z0U9swtfZ4KVXFreuERNGt7N8Oy3dm66OiPR7raRd/yU/Cm17XqPM3g
 m1CN9rkqm7bq0wCcQATVwT9Soo391UJ1k/etEHHF8oowfEtvzNVXnjvSicrXZqvYnrgp
 D0KXHqLcuYpIoSsQfQwwleVirqNkkOx4pPyZxIGuviQEoex2f2mvoSR9A2Y8BCyiNsU2
 FJQXzr+sqdcSmFte4l7fffxpQ0eqI9kieK8S+Rp+z30WV86Btle01U0iV8VFFcpKkkgc
 bHVBmN19tnfow9vrMOyscblXUTkzA0JBAttLzuySBOYqo6/KvtGVUG3z3UUmof3q/l5F
 vTGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SxYcmrUXEfFoCnr55lfa1fe0u65LmX3WqfEJ46nHEE4=;
 b=YwvL+vaOvV0DvBkbAOSdhsfYNo3ZmGk8fvf49CxySKRZP5jv9s2IchZfd+9fCW35gY
 tpQFf8+IzAL8oiUxrYYRj7DbBEdzBD+NwLIbUVps4Kus2uaRyp+QQoGpjDOcyMG3EXBO
 FlAntpVwjVj0VNcZ2d6OxSYgDlI2vEmwDzKrvYvySzRLqnY1e0Hj1DdHEHNpLo9y6m+L
 imCtrTUNi+DMiINfxle6h3cRbF8sKVLF9olM/pgsSzukfHsD2YgAMjH3WD5OZoz3/mh1
 37mwh7SHyGNBZrD5yYCtQ08wsGr4HvZP+za0ugT2WBkDRJi9YZqZN3za2nkZ5nVdhHIL
 8mPA==
X-Gm-Message-State: AOAM533iYFWcWVR1XfygCIVv4r3JarPi8h3iV5LUkg2o8Alt5Vv4rqra
 omNd9xfUsEFgaGDQgpK/nIoPSU4krcuKAcicG7edlQ==
X-Google-Smtp-Source: ABdhPJzz5aAps2KI9vVqNnYeilel5FWUqejckfuD8m7XjRRFeU5sYGioLx6484n5LIUn6N+lr9sCPY9h0+A14DHtUT8=
X-Received: by 2002:a17:906:a2d7:: with SMTP id
 by23mr32191607ejb.382.1626788284750; 
 Tue, 20 Jul 2021 06:38:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210719224647.68559-1-its@irrelevant.dk>
 <20210719224647.68559-5-its@irrelevant.dk>
In-Reply-To: <20210719224647.68559-5-its@irrelevant.dk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Jul 2021 14:37:24 +0100
Message-ID: <CAFEAcA-UFOwBJ68YzWJSkpkK9zWjE9fYMnB5KoF4+75+w=SjMA@mail.gmail.com>
Subject: Re: [PATCH v5 4/5] hw/nvme: fix mmio read
To: Klaus Jensen <its@irrelevant.dk>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 Laurent Vivier <lvivier@redhat.com>, Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 19 Jul 2021 at 23:47, Klaus Jensen <its@irrelevant.dk> wrote:
>
> From: Klaus Jensen <k.jensen@samsung.com>
>
> The new PMR test unearthed a long-standing issue with MMIO reads on
> big-endian hosts.
>
> Fix this by unconditionally storing all controller registers in little
> endian.
>
> Cc: Gollu Appalanaidu <anaidu.gollu@samsung.com>
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> ---
>  hw/nvme/ctrl.c | 290 +++++++++++++++++++++++++++----------------------
>  1 file changed, 162 insertions(+), 128 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

