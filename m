Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C2039A5AD
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 18:25:26 +0200 (CEST)
Received: from localhost ([::1]:44962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loq9t-0007KW-IR
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 12:25:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lopom-0000uz-4U
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 12:03:36 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:44919)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lopoj-00013d-Oz
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 12:03:35 -0400
Received: by mail-ej1-x62d.google.com with SMTP id c10so9967927eja.11
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 09:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YMYxIZhukdd8DJ9AY5feK6+Pe06Qimq1MaaF98oYrC0=;
 b=QThHzDcSBqD1bts8vKjkVOUGgkodxcsQDg3nFDxFEG8wK9ymTT1AtUjGOseopMPswB
 drlCgqEYieiVFt1JZX862g5YDn8wyCuSj1+s+/FzwKVpaep530F+N4X4iuo1HT3WPZOL
 fZY7XL604+zxqbRmW4sNmfJMtntDPcayDwq5E9JEiqrRn+FFuQHDJ6rFS69ziepe2Aum
 u0gMSP1t49vfFpCmSX78rH8IoMGb0RhOcef9y6riBLJUDUp/Q5jzrJAW4PkWgVPIBMp3
 kX+i0yzgss9VVpnntIyjS5GOpcK7BobkTfRpokk2Ztk/CnkQAHySRsR1/LxoNs9zdhUa
 NxTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YMYxIZhukdd8DJ9AY5feK6+Pe06Qimq1MaaF98oYrC0=;
 b=kHE8Ke//x6zpKgfBzxZnfTFzA++0OnIEl7JZQTL+937KPsqop4cUdWGcwi7LM4KBb7
 I3gBdm7m1D/AUQAlLWDJc1ItHyKhWCI1f9b7Vf2M/p8IWqzt65ogIWjYYVJaH9zFKWw7
 6z3vvkEDDkwDAuzUqfyWG2wpL/ZogU7nSLbG5hyr3XA4Cid94gdhxeksXM7LCYG0ylP/
 X5D0xwfwVFsWCOA7w7XF6G2IwkpQwrItJi5KRDk7BWChdniizSG3y8cJCmOw/aegSOR4
 2H1sCn9tukrvuUc06AYa3BCcWhmnIdAVYuQe1FFPfm5sJm33xwk2LkYpZcia1yoYpg0R
 1l6g==
X-Gm-Message-State: AOAM5319qOFbG8UfrxMO6pmJPJz7FpMD9ZHXDHkrFv9Gjx9PIpm9UzpG
 cwqepkbrGHf64UjXN6WC/VRsf79HsJtoZj3JdaXM1g==
X-Google-Smtp-Source: ABdhPJzZTnh9jqdnGRRQLpWpS3OTs33U5Rfuav1NOIeBlyzQ5ycs2oFr7K7qOZ9x2Pcv9UHp0CmRBwrrXyUorbUVYig=
X-Received: by 2002:a17:906:d1d2:: with SMTP id
 bs18mr125829ejb.56.1622736212266; 
 Thu, 03 Jun 2021 09:03:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210503095418.31521-1-mreitz@redhat.com>
In-Reply-To: <20210503095418.31521-1-mreitz@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Jun 2021 17:02:59 +0100
Message-ID: <CAFEAcA_33PcmTSTAGGM=KGdP8Qrh-xKBdEa1d97HUhkWChzVSw@mail.gmail.com>
Subject: Re: [PATCH] block/snapshot: Clarify goto fallback behavior
To: Max Reitz <mreitz@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 3 May 2021 at 10:55, Max Reitz <mreitz@redhat.com> wrote:
>
> In the bdrv_snapshot_goto() fallback code, we work with a pointer to
> either bs->file or bs->backing.  We close that child, close the node
> (with .bdrv_close()), apply the snapshot on the child node, and then
> re-open the node (with .bdrv_open()).
>
> In order for .bdrv_open() to attach the same child node that we had
> before, we pass "file={child-node}" or "backing={child-node}" to it.
> Therefore, when .bdrv_open() has returned success, we can assume that
> bs->file or bs->backing (respectively) points to our original child
> again.  This is verified by an assertion.
>
> All of this is not immediately clear from a quick glance at the code,
> so add a comment to the assertion what it is for, and why it is valid.
> It certainly confused Coverity.
>
> Reported-by: Coverity (CID 1452774)
> Signed-off-by: Max Reitz <mreitz@redhat.com>

Did this patch get lost? I was just going through outstanding
coverity issues and noticed it was posted a month ago and not
in master...

thanks
-- PMM

