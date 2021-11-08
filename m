Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BCF1447F7A
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 13:31:33 +0100 (CET)
Received: from localhost ([::1]:58934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mk3oC-0002T4-4p
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 07:31:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mk3nD-0001c0-74
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 07:30:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24927)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mk3nA-00021W-3d
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 07:30:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636374627;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9LqyPLtrLefgHSoFxwcNBbwmeZfd3Qeu3k/Nt9hn8ko=;
 b=dgI7CeFfivBaTKVpsx4FPNWi8+fZ+TqHFyzZAe2vfyLIxHqACZhmKk0Mv/FsgKE3jCa6KQ
 gOjZytT3k8NER9Ss9uxVhQwWWWD7NOH6d90KcPJbZ9f7ySXi4Jz0zVwQJg0metSTM1XLmt
 m7Se4e38c5WopwgOVjFblkXlQ8hW2zA=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-24-qAy5NgEOO4yP6PANvH51cA-1; Mon, 08 Nov 2021 07:30:26 -0500
X-MC-Unique: qAy5NgEOO4yP6PANvH51cA-1
Received: by mail-pj1-f69.google.com with SMTP id
 a12-20020a17090aa50cb0290178fef5c227so4636743pjq.1
 for <qemu-devel@nongnu.org>; Mon, 08 Nov 2021 04:30:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=9LqyPLtrLefgHSoFxwcNBbwmeZfd3Qeu3k/Nt9hn8ko=;
 b=zCnb4eT9MUeSZJiC3MYNfW2bPu5WxB90i7mCzvbUfWfonffQl4haUa9IUGiyKL9YVX
 lkAfC5/VGXvwQCc2g0TdsM+Zz856WUSLO6tObYpRRyhGJKdRdlvLbV5NztSZkNOciF4g
 uzdebmhVLdTSgbcsQU6rg8uOWjliOInLyD4Cd8mlQaIP/fsDr90lJVzNSfgMfkpjYa3j
 IGm6oSvWRfG5Wa3QUda9sJI8gAjhHHmAdne7+jzlHYieZnaAeg6uV4dLN9ykGuf4uYr4
 95uJU6zsTNxM3xl4PaWdTU0ujTmZ+MYdy605prrykI1cTfi0ABaF6ZNzKuHvvPpRL5ZN
 2P3A==
X-Gm-Message-State: AOAM5304ADDyK/s8PU2F0dTqnNQm0ePy8YsTtQOI1hCF6s4RW+ps0Ieh
 MZci1GlKaILtxrehFk2KHcT0ej7b2SGpHjdp6JP43dl0mrKePh3RRjQNtXl+EM1DuDsEjZEsi62
 po3ap48zRAl09+vG9w9uPsMmoVBE5Lbs=
X-Received: by 2002:aa7:81c2:0:b0:47c:1d4:67f5 with SMTP id
 c2-20020aa781c2000000b0047c01d467f5mr81984035pfn.38.1636374625109; 
 Mon, 08 Nov 2021 04:30:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyobgvBsg62hi968XyPmWTJzlAhXUxmuTPlL/BNiKZgVRboHo039M6ooqzy3BVnqB1xU0YahX3QOteyTgdsbmU=
X-Received: by 2002:aa7:81c2:0:b0:47c:1d4:67f5 with SMTP id
 c2-20020aa781c2000000b0047c01d467f5mr81983999pfn.38.1636374624812; Mon, 08
 Nov 2021 04:30:24 -0800 (PST)
MIME-Version: 1.0
References: <20211106091059.465109-1-philmd@redhat.com>
In-Reply-To: <20211106091059.465109-1-philmd@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Mon, 8 Nov 2021 09:29:58 -0300
Message-ID: <CAKJDGDZJC_pqigs8GHFT_uw6rOBT917zeTNdSYga1LCi2-xDFQ@mail.gmail.com>
Subject: Re: [PATCH] tests/avocado: Remove p7zip binary availability check
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Nov 6, 2021 at 3:14 PM Philippe Mathieu-Daud=C3=A9 <philmd@redhat.c=
om> wrote:
>
> The single use of the 7z binary has been removed in commit a30e114f3
> ("tests/acceptance: remove Armbian 19.11.3 test for orangepi-pc"),
> we don't need to check for this binary availability anymore.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
> Based-on: <20211105155354.154864-1-willianr@redhat.com>
> ---
>  tests/avocado/boot_linux_console.py | 7 -------
>  1 file changed, 7 deletions(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


