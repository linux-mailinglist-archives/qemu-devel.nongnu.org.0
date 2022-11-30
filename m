Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C6B763E102
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 20:48:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0T3f-0008WN-EU; Wed, 30 Nov 2022 14:47:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1p0T3A-0008Hp-0p; Wed, 30 Nov 2022 14:47:22 -0500
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1p0T38-0002Ry-MV; Wed, 30 Nov 2022 14:47:19 -0500
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-381662c78a9so182206407b3.7; 
 Wed, 30 Nov 2022 11:47:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=F60uHXdtaSmOMZFBkHMwLvuA8fkz6G0fopDKnUaLsPo=;
 b=gIz8EQZ+c2cKiCw0mEmelsdJ/TMGxSxPvZ2GaYS+hYKcTdNnccA6bp6kdiyu9atAhq
 SmuJwmmzaNSdx2az0eDnVP2bYFU2YyIWzh1K4HMOpfA4RuH7d26blwFQr7Bljaf48U46
 eJo+hSaS9MlGjyiTkpkcFFiqYy+AazIhOdZvg73cMDnk+FSoNewqpW5TqwRJy74Zdsd9
 kOffEwKmtWf20XSmDInjlQp8aAGW2diLNJDQESnbyA103WSqkGUwOgZIXmDZtoZI/Z8D
 MuXmH1mCm9wE41g8ZRQSLF56HNOraHi0sEJpkfHnMOV8bBr7DuaCkTKNkD0SYTU2Jhpu
 5nJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=F60uHXdtaSmOMZFBkHMwLvuA8fkz6G0fopDKnUaLsPo=;
 b=556FPvCm69Xgyum0GssCf3iwjl8IN/HzM1ATN1F4kDcH479DNaOxaZtOCCmwOPFQKg
 WcpZChNTmZejUggJyY549TzCXZUJ0LDcCmalBCQwpY6KYIhYv9EVs16fR3043VhmA86S
 hUtojE/VLqVzLNtJnuRr06M6Lwd9DuVthuA5uFLV5pLWlu9zyMF/udRctQzGJZKSt0On
 macFTY5uChvvbDhXnzAYIQdi/LbZ9LfKQoRJSXQDDlCuL42jwCsBr1bmfPRZT0zaF2Jl
 vfVk8/IXmMThDVVM9YImc6dtkqAwghebSU0tPFKRTwWqPJvSlSa7bgRt5NgTi0ahZPJe
 B+4Q==
X-Gm-Message-State: ANoB5pkvN8f+hc79hctwHYDyw/0A6NueEJjSy9bVqCfkGVyBUtkysjEX
 68bkoYypDyXErQn/tTXZdSBvTuU4H6tIEUyEn4VVeOkJEpQ=
X-Google-Smtp-Source: AA0mqf6iywn5tbOhV4N/TWZPi0zxTDnb/HTHjVVgg6En+t1kOcHS4vJJ0FgUtL5dV/SjLIahJ3+yu6OSJhRyCIUEu5Y=
X-Received: by 2002:a81:5309:0:b0:38f:80d5:f22d with SMTP id
 h9-20020a815309000000b0038f80d5f22dmr42498307ywb.296.1669837635470; Wed, 30
 Nov 2022 11:47:15 -0800 (PST)
MIME-Version: 1.0
References: <20221121211923.1993171-1-stefanha@redhat.com>
In-Reply-To: <20221121211923.1993171-1-stefanha@redhat.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Wed, 30 Nov 2022 14:47:02 -0500
Message-ID: <CAJSP0QVnDRowkHjT05pt4g380q_PMe+vuXWVjvDxPLjML0CvoA@mail.gmail.com>
Subject: Re: [PATCH for-7.2] block-backend: avoid bdrv_unregister_buf() NULL
 pointer deref
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, 
 Hanna Reitz <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>, 
 Jonathan Cameron <Jonathan.Cameron@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=stefanha@gmail.com; helo=mail-yw1-x1135.google.com
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

Merged. I will work on supporting graph changes.

Stefan

