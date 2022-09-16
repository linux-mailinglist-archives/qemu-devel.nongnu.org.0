Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC7C5BA6D2
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Sep 2022 08:29:09 +0200 (CEST)
Received: from localhost ([::1]:60020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZ4qa-0003h5-3x
	for lists+qemu-devel@lfdr.de; Fri, 16 Sep 2022 02:29:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oZ4me-0001Dc-Ke; Fri, 16 Sep 2022 02:25:05 -0400
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831]:41508)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oZ4mc-0004ET-W1; Fri, 16 Sep 2022 02:25:04 -0400
Received: by mail-qt1-x831.google.com with SMTP id c11so15265162qtw.8;
 Thu, 15 Sep 2022 23:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=Rc2C7wvtm8xUnEnOB0zogfM7+veZnUqWoKlVJuUTFVQ=;
 b=oSIiZQHEWKMukSg6moNAZh24/d0MlNvgH82R8ZwBS0IhDuD2Z5HWTWeWtzFBiSzyh9
 X9DIIwtL49W6olsIYDM44OOMqHjxrtxlUroMBPttz9GQWiwsesMSIfgPK0DyJWNyQRa5
 93Q7kKbqGMdYPXucVTPI9weRXQBA/tTIOpAkvvVcjJgvWu3MbNPwSjZDt6B2e/Jcflen
 6Ei8ubSsBc7PfRoGnT70piZbZJ5Q34ay+lIwRnuRd73R6+ZzGXAK9fk4s2RyTPzg2tir
 mGxKhe1m4YHV8SglMOgLOuy9bHDXXsiStl93alj54g2B5H7XTBv17GHaDtrYlvC433Jj
 lOWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=Rc2C7wvtm8xUnEnOB0zogfM7+veZnUqWoKlVJuUTFVQ=;
 b=lkfspOCTlKQIQehouZ1C/3Ee3bYOJrm1svAApBExgtZvzTa3SlCQooSdA+sfLRtA56
 VvREWGL3l0DdEnIUn5g7H1nvLsfd1NqA/E9sMFYOgXw0/YkC1F1HJqjPKOT28KGQIWtL
 S/iKMiZCSYArcFQbt+HXYo2fID6/V2gfeGTab2Qth1XmmN41osqVgoBVm0nWtPRjnNqj
 5u+zwWjzkXa8vJbP3KEnbNIryhblGtLzl8mo860YN3jXUUgvtYK2YbsjD50wQ2bChGzK
 ot2c1LH7S15gamYG4aAbS2Cy9w5LcSKLSMdTQaXb63jZ43Aw0Z9D2CvXB8J8YNZt582P
 lgYQ==
X-Gm-Message-State: ACrzQf0w/9wmmmj+WsjHw3s4UKQ4HZxfWOqHmeITmO/3sf4YCedirgOq
 yXX9JVNDVPkcL3Yu3pWNq8Rk/PgjeCA+tv7vyOI=
X-Google-Smtp-Source: AMsMyM6RpzcwNmIUvhTATH5TbDS5XoARZFgrZaUtP419Py7ZBdTOnkzrfgfGBCSOVKTAkgEt+EZXZAe4CbDlHI1nSBM=
X-Received: by 2002:a05:622a:653:b0:35c:cb81:e063 with SMTP id
 a19-20020a05622a065300b0035ccb81e063mr3008035qtb.365.1663309501208; Thu, 15
 Sep 2022 23:25:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220915152520.21948-1-shentey@gmail.com>
 <20220915152520.21948-7-shentey@gmail.com>
In-Reply-To: <20220915152520.21948-7-shentey@gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 16 Sep 2022 14:24:49 +0800
Message-ID: <CAEUhbmUmfjsAFwxKD-+b754kf2V96Q7_10UMW2GjswqYeS8ziQ@mail.gmail.com>
Subject: Re: [PATCH 06/11] hw/block/pflash_cfi01: Error out if device length
 isn't a power of two
To: Bernhard Beschow <shentey@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>, qemu-ppc <qemu-ppc@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::831;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qt1-x831.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 15, 2022 at 11:26 PM Bernhard Beschow <shentey@gmail.com> wrote:
>
> According to the JEDEC standard the device length is communicated to an
> OS as an exponent (power of two).
>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>  hw/block/pflash_cfi01.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

