Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D6544B308
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 20:09:43 +0100 (CET)
Received: from localhost ([::1]:56786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkWV4-0001Xf-Lj
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 14:09:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mkWSw-00005M-LZ
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 14:07:30 -0500
Received: from [2a00:1450:4864:20::32b] (port=43951
 helo=mail-wm1-x32b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mkWSu-00014j-6Z
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 14:07:30 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 67-20020a1c1946000000b0030d4c90fa87so208629wmz.2
 for <qemu-devel@nongnu.org>; Tue, 09 Nov 2021 11:07:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=9BTjcxIVUzHKSmypCV2Lhw33t4C3uk+QwYBy1JefT1c=;
 b=xXzkeoBpnS2yC2gtFe0LJg6GmjbE5Sh/hVKXCVV22VaiCQGION5li91dKrUZoVUity
 pra9sRxbLMhynKVqYC4menuknt+Aoj6RpYYCo5Y/h/fZy+AB8GkzXJzAgHn9v3vUE4mw
 KsObip39CSB9tacqyqYElDLiUwLecxDGs7j8pI+TCIt9GEApP5rp6x7qk3//j4CNh8+H
 zteoq1oxaHhwO9EUGWWZ9nmp7affz3e8bkkP2WFd/JMw17Xhcuzcyb90UXm7npimnHRP
 fQgEAwYNvbFtN/rDTNuK5WDO1xY3hA6CpEkvppH0yTV7oLKjNpi7V2GnET3MShcTFfx+
 NDUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=9BTjcxIVUzHKSmypCV2Lhw33t4C3uk+QwYBy1JefT1c=;
 b=SnsvKbGlKNpCpoAW9+6x8nFa4zuNhLZaPUbBJDsAwb2nDsStFbjP+cLykaKqXjfpLY
 4Yy7yglZed+FatuYcyuEtSZIQfuew70K5CNLy58tlbROwz/griUjpB3koMcfhEp9B/vf
 IvJ2S6TWHDdKIi5/obrQedcxWmwd5bN4LGqRi14fO5g29ztInickXixcXrCLBGMcHuMd
 o28IPw2ADrcLkUiXyj91Sd+qmebKqlDYDh715sp60ndcT8uTmCFtIMQivqr198lJAWGn
 IXR7mCgOAMqCnI3kPQsYXANyq7cNs3B/Q0w7waGgRRdPxJHSCC3MuS4PKvm7a9b5zJA0
 WJ2A==
X-Gm-Message-State: AOAM532y9RTop9rVKkSe98g4ZeB87pjv8+qUCFNoC/4g34Mv9VtYdaNR
 yeaJhh3+yZlbo0fCABwMpprEThzmiAeEAxbz6Mhg7uBGRKk=
X-Google-Smtp-Source: ABdhPJwexW1y8auepWq2nn8rg9OwHyi7AAeegvkwJL5qlvkfVCa66wsIh0wqrHgxwGe3CRXjYZezxuFbVYk65cYfOYs=
X-Received: by 2002:a7b:c389:: with SMTP id s9mr10057696wmj.133.1636484846621; 
 Tue, 09 Nov 2021 11:07:26 -0800 (PST)
MIME-Version: 1.0
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 Nov 2021 19:07:15 +0000
Message-ID: <CAFEAcA_LUNY7NRt=vDeoHDgaeBYZTzVEx8i8Ce_KopE8Z4_WpQ@mail.gmail.com>
Subject: qemu-img.c possibly overflowing shifts by BDRV_SECTOR_BITS
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi; Coverity is complaining about some of the places in qemu-img.c
where it takes a 32-bit variable and shifts it left by BDRV_SECTOR_BITS
to convert a sector count to a byte count, because it's doing the
shift in 32-bits rather than 64 and so Coverity thinks there might
be overflow (CID 1465221, 1465219). Is it right and we need extra
casts to force the shift to be done in 64 bits, or is there some
constraint that means we know the sector counts are always small
enough that the byte count is 2GB or less ?

thanks
-- PMM

