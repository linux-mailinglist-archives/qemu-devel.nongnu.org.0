Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64FAD62E3BB
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Nov 2022 19:07:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovjH6-0004jZ-0u; Thu, 17 Nov 2022 13:06:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1ovjGy-0004gS-LF; Thu, 17 Nov 2022 13:06:02 -0500
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1ovjGt-0005DP-Kk; Thu, 17 Nov 2022 13:06:00 -0500
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-3691e040abaso26368077b3.9; 
 Thu, 17 Nov 2022 10:05:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Vp8T59fYI3w9fqSU/C6cRrdlwpPjqbQrZfWMQmopW6k=;
 b=pbBBT28OzCi6X7POHa+Cwax9xhe4ZOxiYOug9x5Nr0mzbLplzD9WcEngt1ONfIW59i
 tFq4B997aqFrYbLgI5kYZunI8zeIHsaNNE/8C7+71qd/KgPzKh08/btTiWQVpD75AXnd
 Uwsjxie9DGGpz1CJgVzRslOFuBtTWIT3pQPvjp/T30dn6eRnRWvBN8GwGazkmEco0SA2
 0MsAZZTqX7ZzAa4AicAvUvZDJL6zh6HHJW8VzT6Z2oum66Sua9HD4hLlRj1ciinYSsvK
 SLyG5E5v6wtxR81NDvrZCsRemdWhDkYJiFozJPUrwhy1CYmf8SMaqczDVujui7F9m/S2
 L5Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Vp8T59fYI3w9fqSU/C6cRrdlwpPjqbQrZfWMQmopW6k=;
 b=e9wQct1EtyVq/JYRpvWPJqG0O0iFwsbzcP2Z2jDa7t7G7ht8E8g7Nz9Q86Kranivn1
 yO6YaGaSDHye9ClLC7Ro27FnpzNAD2SL1jqnXcCA6X86bQpzAyYJVolIN/t52/YQAzdZ
 86iWhPtwmMu84owRhma+BsSzD9Bfm8EyOZiQJjKK+x0RoTRGVGSIHaOPpKBYSpJ07Pla
 Ba1iCsRaTBBiUukbESCe2Y16YlMYEG94KClB1jHxHPImGaoXnb8mIt+iOfRXh7mdTpMG
 H6jRR6cfjYEJNZOlVreMkONvZMrg8D84SsQTgZeGimQAf1IVFSLGq7DzYxshO7pdXDsq
 A85w==
X-Gm-Message-State: ANoB5plLX0CjwIXNibURAyateDu/ozCijJeguaRL0WgYvEowWpS/2A3E
 SXfcICVkkeVohXmA0njubD4TucXqe69j9ygCBNM=
X-Google-Smtp-Source: AA0mqf5zp/PLxWUGw2DvImueyI4zJSKNjz4XvaiUuMHElKWE8ogbf9aUOh+auzcY6poOywB15jLPQEcEUnp5cmIOZmg=
X-Received: by 2002:a81:b04f:0:b0:383:68e4:f38 with SMTP id
 x15-20020a81b04f000000b0038368e40f38mr3055319ywk.336.1668708348692; Thu, 17
 Nov 2022 10:05:48 -0800 (PST)
MIME-Version: 1.0
References: <20221117165554.1773409-1-stefanha@redhat.com>
 <20221117165554.1773409-4-stefanha@redhat.com>
 <Y3Z0uasQy+pr0Vng@shell.armlinux.org.uk>
In-Reply-To: <Y3Z0uasQy+pr0Vng@shell.armlinux.org.uk>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Thu, 17 Nov 2022 13:05:36 -0500
Message-ID: <CAJSP0QXHZOJbCbE_qXFdxZf_k4w6mTbhvuk7eR3ZeuWbkFTU5Q@mail.gmail.com>
Subject: Re: [PATCH for-7.2 v3 3/3] rtl8139: honor large send MSS value
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org, 
 Tobias Fiebig <tobias+git@fiebig.nl>, Jason Wang <jasowang@redhat.com>,
 qemu-stable@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1129;
 envelope-from=stefanha@gmail.com; helo=mail-yw1-x1129.google.com
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

On Thu, 17 Nov 2022 at 12:53, Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
> Your subject says "for-7.2" - that's a while off yet! I guess you need
> to update it to "for-6.2" for the next posting of this series.

Sorry if this looked like a Linux patch series. This is a QEMU series
and the next release is 7.2.

Stefan

