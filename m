Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B504E4FA2
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 10:44:36 +0100 (CET)
Received: from localhost ([::1]:55046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWxXe-0004w9-PZ
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 05:44:34 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nWxQo-0001Vb-7e
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 05:37:30 -0400
Received: from [2607:f8b0:4864:20::b31] (port=45598
 helo=mail-yb1-xb31.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nWxQl-00010K-A6
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 05:37:28 -0400
Received: by mail-yb1-xb31.google.com with SMTP id t33so1576755ybt.12
 for <qemu-devel@nongnu.org>; Wed, 23 Mar 2022 02:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Vixv8Pl/vh2YiFou4asJUpkHKzEIT+511pSxB5YybtY=;
 b=tThAy/PHH0Q7P5BO+BwlCVKK1xQEBIqrJP69RO3G0daXopLQ/IRxIUI3S7zYY0XJEM
 jZa4qBamewqwMJ/wmRV3KJUfyl6u26D48yIJPh+X+jjuqE1ky2d+/uvd1kXkkpICepyo
 zAASBJykdcGQQ8+Tu+aNqSrMEUoVRg3NMC8FYKcZn2mbERGRkKFjl2GEDbgnAvaHHoDr
 HrgQPz2emgFtfrYv6zyUQfGxM0erQUbMGoEPud7GHGehziXaatQD0/WSRk12g42vdR+v
 7Dht3SqBStMZGwrBy61sZLvLdWly+R33Sifotq69qNH3fnA2ejwDVJdMt3zHAi0NzN/A
 BRzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Vixv8Pl/vh2YiFou4asJUpkHKzEIT+511pSxB5YybtY=;
 b=cpIlxbM1xddc9uLEoYrlF1zAgdppJ8xFElMejYB8Dc+ytgv3knWX2Ss9uX6hiTzC9M
 nT4Tw+wGZ92ZCYs+JxxEAcaviJeTsmoIGPHmHo0IM2GkDnUkKzpuHMoPwODg/DC0DxKH
 bppfIbe9MyUSepypAJW5zAiUNTzk7ODQnN8hJvl5S3H31oC/HMKVq+fyeOeeQdfE+bLN
 Qlqnq7dyyF/kwGVX7j9WgCKcdzBpR7F5XL9z9VWyZ8u7x3F8GPKLYK92JX0nNuDEOYRw
 HvaHymkTmoPKsU+cq5/yi9WoLDwXAGKYU37xTs+wPeEyBlVJYFdCtZUwtoZ/lwCKE9/w
 ET4w==
X-Gm-Message-State: AOAM532liSYa9M3tR3k8AkbSmi1hICDNRpXpxFHSEAGQ/4Y8Xdcht4S/
 p97fwzbS4/4b9Yh/so3/cQ8X4J/9QmcsKEgDFm5kKg==
X-Google-Smtp-Source: ABdhPJwNYe7xDsO0n2PQGpTFuYFm4OYuX7I2+ndvAwVWNNd59TiaQDpL4XBym/mXbcjMeVaZuK0Wuz7dWaPBD5Pbfpc=
X-Received: by 2002:a25:d8c3:0:b0:633:c81f:737d with SMTP id
 p186-20020a25d8c3000000b00633c81f737dmr21522412ybg.193.1648028243311; Wed, 23
 Mar 2022 02:37:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220323091637.5609-1-dylan@andestech.com>
In-Reply-To: <20220323091637.5609-1-dylan@andestech.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 23 Mar 2022 09:37:10 +0000
Message-ID: <CAFEAcA-iYmzGg4aqW6qPhiGhbWtp+kY06pGsPHgDiOyyn6YpUQ@mail.gmail.com>
Subject: Re: [PATCH] hw/char/serial: Support serial_mm_init() with wakeup
 event.
To: Dylan Jhong <dylan@andestech.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b31
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb31.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 23 Mar 2022 at 09:20, Dylan Jhong <dylan@andestech.com> wrote:
>
> Although the "wakeup" parameter is declared in SerialState,
> but there is no function actually setting it up.
> Support "wakeup" as parameter in serial_mm_init().

This patch seems to provide a new argument which every
caller passes the same value for, unless I missed one
somewhere. What's the reason for this change?

thanks
-- PMM

