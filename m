Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 915612DCC20
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 06:43:07 +0100 (CET)
Received: from localhost ([::1]:38690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpm4A-0001Sq-4g
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 00:43:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kpm2y-00011h-A6
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 00:41:52 -0500
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32]:45259)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kpm2w-0003BU-Py
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 00:41:52 -0500
Received: by mail-yb1-xb32.google.com with SMTP id k78so24760757ybf.12
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 21:41:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+vlAOrHvIr2rL5exh179JZrXpyi0hBy9LxMmMGxyCvs=;
 b=Q6ZCvw4UTR2WcXI0Pks4nNujyl3m15ke/LBQ7/k8IrtSy7arinJJJ2bYgYxRziraW8
 9prDV4qpC/bp1LRf7WJPAitemdVSKRH2bPPhS1xxJnmXnfShrbTDTHGbYkfpxyvFIjpB
 ckWGvVx+LuP6v9aqvmKP0hECxV2m3HNOUrvDjWUVAz6JCBbEFP4I1PJGqQLIJXMcO5Aw
 RAVD8wmO38ZjpNJB3ZGou32/aVZEecXsybvTiO12rX6m8ZadUjW/uK55AppzUH6Jzm5z
 yjGMG9RthWtGNIrRUUBpi0TAXqCIbflXoWX7bnXh/mS4GDnzl98HIIA81m3NsOFvqjCp
 bIug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+vlAOrHvIr2rL5exh179JZrXpyi0hBy9LxMmMGxyCvs=;
 b=fntGbzAls1eI2lQUJkcJVkvCRfsVzhb26Rf/iBRIvx/HAXle0fstIcGYWP/Kkox/rc
 7aZ6Pc2jOl493Y5fOgGFfqfuKRi1NLtR0PvIg4on7Nnpp+aO8lgh5FwhxMj3MNby6CSY
 8sdnHPfvZBQ3bPTo214k5RTs+F1izlsQm6KZwoVvaj4gdDo26pD5WOH4Abp/ADP/g6dJ
 2a7BnrWYjMH+6B+/RUbFH7YHAEFJl3aO5i65foBdqmCjjMPvSlMDxdHrHOuKks7dTiQV
 nV7AcvvkZ0mxJj2T3SCsO2FynAjwulGTGUCXZHs53remAfcPTjeY+YgMu1PgzZEaa2wV
 fnKQ==
X-Gm-Message-State: AOAM531WaLO+ycGhiup3slLdNhHma26itdGkEsVoZEytMGyzZqmz/IvZ
 sBpZiby29kposvpYf5Pi3dYrk1mUtEO89bLmg6crn6ih
X-Google-Smtp-Source: ABdhPJzysi1Se+7sesX92QsM3Stw0lFl57VqBqI/iI/sLq5vjC+2a8VAUE7ZqnsX1bm3g/ky0pvvvzE0L36KpEEwOJw=
X-Received: by 2002:a25:690b:: with SMTP id e11mr53150577ybc.314.1608183709190; 
 Wed, 16 Dec 2020 21:41:49 -0800 (PST)
MIME-Version: 1.0
References: <1607679312-51325-1-git-send-email-bmeng.cn@gmail.com>
In-Reply-To: <1607679312-51325-1-git-send-email-bmeng.cn@gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 17 Dec 2020 13:41:37 +0800
Message-ID: <CAEUhbmX=Dz_uPwWvBHtuoatBwGf2kE954R3wjRRoF9M_kH7GVw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] net: checksum: Skip fragmented IP packets
To: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Jason Wang <jasowang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb32.google.com
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
Cc: Bin Meng <bin.meng@windriver.com>,
 Markus Carlstedt <markus.carlstedt@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Jason,

On Fri, Dec 11, 2020 at 5:35 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Markus Carlstedt <markus.carlstedt@windriver.com>
>
> To calculate the TCP/UDP checksum we need the whole datagram. Unless
> the hardware has some logic to collect all fragments before sending
> the whole datagram first, it can only be done by the network stack,
> which is normally the case for the NICs we have seen so far.
>
> Skip these fragmented IP packets to avoid checksum corruption.
>
> Signed-off-by: Markus Carlstedt <markus.carlstedt@windriver.com>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
>
> (no changes since v1)
>
>  net/checksum.c | 4 ++++
>  1 file changed, 4 insertions(+)
>

Ping?

Regards,
Bin

