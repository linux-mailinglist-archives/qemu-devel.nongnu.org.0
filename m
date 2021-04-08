Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF1D358A2A
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 18:52:50 +0200 (CEST)
Received: from localhost ([::1]:44316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUXth-0003nL-9k
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 12:52:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lUXsd-00036V-HO
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 12:51:43 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:39574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lUXsb-0004Ye-Ns
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 12:51:43 -0400
Received: by mail-ej1-x631.google.com with SMTP id v6so2947687ejo.6
 for <qemu-devel@nongnu.org>; Thu, 08 Apr 2021 09:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=hKITSTaYjCvtrIX0EC/wLz4O0XSwjXoY7dCYriuCzpg=;
 b=hQmIIUm+mSGvRSL5huTf1649ZbHitKUmGwLc93nbJl8E1FsTWGSRO44yvsepuRxaZl
 hD4LUWWtiJbsVTgFe4u7xltkbpPlqTk1gg5TXqtwfbV9IoNAbVocYtBHaPQnz0UIr04S
 wlMHsts8uvG6lgeH34KVanNXEnNhzDqwA2aUQadi+ZujiSN3hiatbTzEFhZ/4ZGPrvXh
 PGuHicSs5EfkYvg59SCSWRRdzhu+H9A4tCyaTGoAszg7Bco8538Dwj9X4jUzHrOcBUSB
 VmIcQoV2UsT4rF6BS68WAr2hQDwnudVeEV+f9TZg9vZaw3NYT6aunU1kfhxIxKN0bS9c
 DR1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=hKITSTaYjCvtrIX0EC/wLz4O0XSwjXoY7dCYriuCzpg=;
 b=SsFVtbjNZOFIoGBnR1506K+UO/GFQGdavkvaEfcWuxtNfQvQ+oq7caDZf03nDNGgKQ
 hymlPT0JYzNrL5yZApNB7HAoCrWm+whPm2vOLHwMXGGf/TNWbufDcGcrbcxAcy+Gzriw
 +TPQMl3wY+PcvWyAb8+MkvyWX0zkIlSllrcfYRB78kxfkwTlKWyVGntu/sxQP0c2Za0T
 4WmkS1ZOu4zjsK2aoEjcDgdNxgYlxGpvYc0QE0r651qp6NVlg7vv0ioYMzueIe0P1VbI
 JvHLYz2el4w/QHWs/E+cEgqk8tKH3yg7q0z1gLD1ZAdjAZAkbc6aBbvwCcb4moQ49nM7
 xmXA==
X-Gm-Message-State: AOAM532loInF2WF/AmSCNdyft+EIKi8+wtD1h6WFCSlcm9bbfzxqHMbe
 /FXpuoj3Pp1hwY29BWS6R5RYzVwZ2zxntphVawMWFA==
X-Google-Smtp-Source: ABdhPJxONiefvgpQZ3vPvBrdoT2qjTxZrOC3swpVV8yi/GUMsSkJyKruU0g9w7e7crzsTUQcHf88iiNT8NMjHZY3HuQ=
X-Received: by 2002:a17:906:8a65:: with SMTP id
 hy5mr11776573ejc.250.1617900699871; 
 Thu, 08 Apr 2021 09:51:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210408164610.14229-1-alex.bennee@linaro.org>
In-Reply-To: <20210408164610.14229-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 Apr 2021 17:50:59 +0100
Message-ID: <CAFEAcA_zfjdajX_A=qAd5noqufx6aqfLmXCZPWFWMPETpOHMjg@mail.gmail.com>
Subject: Re: [RFC PATCH] scripts/checkpatch: fix uninitialised value check
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x631.google.com
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
Cc: Isaku Yamahata <isaku.yamahata@intel.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 8 Apr 2021 at 17:49, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
> This was starting to show up in the check-patch test on gitlab.
>
> Fixes: d2f1af0e41 ("checkpatch: don't emit warning on newly created acpi =
data files")
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: Isaku Yamahata <isaku.yamahata@intel.com>
> Cc: Michael S. Tsirkin <mst@redhat.com>
> ---
>  scripts/checkpatch.pl | 1 +
>  1 file changed, 1 insertion(+)


Already submitted by Greg:
https://patchew.org/QEMU/161786467973.295167.5612704777283969903.stgit@bahi=
a.lan/

thanks
-- PMM

