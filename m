Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A6B34C216
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 05:03:01 +0200 (CEST)
Received: from localhost ([::1]:38420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQiB9-00016z-RY
	for lists+qemu-devel@lfdr.de; Sun, 28 Mar 2021 23:02:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lQiA9-0000hU-Jk
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 23:01:57 -0400
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30]:34555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lQiA3-0002ZZ-Uk
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 23:01:57 -0400
Received: by mail-yb1-xb30.google.com with SMTP id i144so12299571ybg.1
 for <qemu-devel@nongnu.org>; Sun, 28 Mar 2021 20:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=B1dWeyDyb/qD0QGjOzAFRGQAfuJbZGUFowNaVVzslek=;
 b=jmiXsIVdsvhDJ46vkQ0wdb+j7JgoJ1B6m/Sb0p//0C1INaeKi5NDx5IddBZhdDgIVa
 SAI6r/seX/6FoC2JHIwGgE/d3J4MtbAVwL3q0QU92/N95yycqLcWP5OF/iFMRxrdVUDC
 bEh8ZUmAzNG/wabc/a1D1Z4pssme2pR5DSHlJDeiHKRUA985HqO5HQwtlpRs8EnqRK86
 aVHghRP4WE+kxSivPgyPPDCVe5+QsCkFjQhmSngBzMv7tzKOHuPS8g8E/+vUndo+TUuq
 CaSeQSyLM3D4pLN7XQwczWPViewWZ4a6VLtN7WQQAxvnLOPqpnqQ/eG8aytWWVCbidVg
 3Y8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=B1dWeyDyb/qD0QGjOzAFRGQAfuJbZGUFowNaVVzslek=;
 b=pCmkc+raOYhxQ8Jk8/WufTU4hJzMgX0rNfxTrQFIcbQCRcfULFXxJQMa6DQNoSaXiZ
 lh3UhcuZP7HGZa1qKtzb4gnmbxsoEdgcZgeS2lUdcCNVplcG8S7Xu+hAS2BlFdxj1NSv
 1TA6JWJ8Nps4sXK+1oliCDvElMgzHr9YdhFL+Z/zDrUOGucUn26PJT69LX0PhoB9yinn
 tamFO7u+K24rpuoi1I8wTB4RLtWO7XdLvCMy9tS3S9VQJ8KflQvkOfcqgcuaXEjCBsgB
 OrsTo6ACDI0hbYSMYS1f+GZEaxHSBKYTYlTF8Yv9hl9dweMMOzfbuyE4OKsaYcH3yRcT
 VjXA==
X-Gm-Message-State: AOAM533sRt2LhWBmPg1dvU+ZcPnYlSx9rKOkO2gowvx73TrjqrqFDXc3
 AJ4vkT5EWy63cz0N+a8ZFxqQwMkmmsdW32eNZFM=
X-Google-Smtp-Source: ABdhPJxIS94gll2m/mvgm6YC/U10VsBIA63o7z1o10I3BIB+VNP8hUU6JLYJqSu2m/oBYKV/JqGaaXBOVeJtdTtZt/Y=
X-Received: by 2002:a25:ed0a:: with SMTP id k10mr37367751ybh.152.1616986910534; 
 Sun, 28 Mar 2021 20:01:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210329022006.55532-1-jasowang@redhat.com>
In-Reply-To: <20210329022006.55532-1-jasowang@redhat.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 29 Mar 2021 11:01:39 +0800
Message-ID: <CAEUhbmUciCL-kiikmTyR172kZ2A0D-nz+gsEXkwP_MneGsu=SA@mail.gmail.com>
Subject: Re: [PATCH] tap-win32: correctly recycle buffers
To: Jason Wang <jasowang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb30.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Stefan Weil <sw@weilnetz.de>,
 Howard Spoelstra <hsp.cat7@gmail.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 29, 2021 at 10:20 AM Jason Wang <jasowang@redhat.com> wrote:
>
> Commit 969e50b61a28 ("net: Pad short frames to minimum size before
> sending from SLiRP/TAP") tries to pad frames but try to recyle the
> local array that is used for padding to tap thread. This patch fixes
> this by recyling the original buffer.
>
> Fixes: 969e50b61a28 ("net: Pad short frames to minimum size before sending from SLiRP/TAP")
> Tested-by: Howard Spoelstra <hsp.cat7@gmail.com>
> Signed-off-by: Jason Wang <jasowang@redhat.com>
> ---
>  net/tap-win32.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

Tested booting U-Boot with QEMU ppce500 on Windows, without the patch,
QEMU crashes
Tested-by: Bin Meng <bmeng.cn@gmail.com>

