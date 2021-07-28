Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 556593D8CCF
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Jul 2021 13:33:23 +0200 (CEST)
Received: from localhost ([::1]:51836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8hoQ-0001rH-DX
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 07:33:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1m8hnR-00014s-Df
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 07:32:21 -0400
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32]:33531)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1m8hnP-0006Gv-Ty
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 07:32:21 -0400
Received: by mail-io1-xd32.google.com with SMTP id n19so2670784ioz.0
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 04:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=80opOfY//I7YbRXq9K4Hf+FpspPiUX3ddybE9Ejy2jw=;
 b=pY0uoMv3OIC7D8Vft+IJyEfu8CPv4RzmAemMpezF977tqOuu7vDSPARQXcEB5oCoA2
 RzARi9vqjzmsIjijzZN1cvGik5n61qBsmlssXRir3jQl3TuRsB2/iP6HdL4HcArOpir5
 PmJzVZqiI/DLSxkOb4OOA6RsPYTkhJ1fgAhsy1CSw2qbm2+EskCJ8fmJgR0EEWLas3S+
 4k6t8KXREKktYSP+KUbFjMNuh/H6RhoNiajA38dVhLuTPesY1dDBZSCa4a7zdZJ45HvO
 eUpUzzRuDhSuwP0QIYo4KVW27EySzBo2TQZ9eEHQsOOcjdFiv0Sb8sAdlpHxs8YBmGWt
 PplA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=80opOfY//I7YbRXq9K4Hf+FpspPiUX3ddybE9Ejy2jw=;
 b=CxxYssfIyuiuCQ4dvJqkbsaE+wymjLsirX/XqE+yJjGbkFxMg9TibwOz2OnH8UmlTA
 GAAvwpJmJ9mplk1qJ66Btv3nuhHzct8xP9oIXEz2uZqvwG+UnJ7uH/tOdnPDN5YHCy8z
 7o/fp1xq0oNy6LOwEG8vwE5yiDGwL13vQNiwf+kEbDSDrmTD4wftkBJ4fqyY7PH7f2+a
 lYydc+vBpBv1g6dePDf9fnjIcjUAPg1d5aD/SXJ1znMwyyh6/qtj7dkxrOQfWkllgQHd
 hGHszNeLFRE8iluVi7qYt3ykpIgDjkTQSQGTDiCcjtebd1u+WtB0gcCFTUPQeWBCp95n
 2y+w==
X-Gm-Message-State: AOAM532wf1HrTOnKrXJd/aanMZ013XpV9xZ77Q29SoyGnqHtWqJFNwme
 RYuKdTUGm6sUJ7NI2TXUuJmrM6DAv4ZZJnCDe5s=
X-Google-Smtp-Source: ABdhPJyyqpiojbbg23I3VHzz4TmcS7MgO3a1+8nELJodY7e2gTfpJUSMy4RnhiLmvg0g9Ch+otBmz5n/qC5Wz50EmpI=
X-Received: by 2002:a02:4b04:: with SMTP id q4mr26311961jaa.89.1627471938759; 
 Wed, 28 Jul 2021 04:32:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210722123635.60608-1-david@redhat.com>
 <20210722123635.60608-5-david@redhat.com>
In-Reply-To: <20210722123635.60608-5-david@redhat.com>
From: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Date: Wed, 28 Jul 2021 13:32:07 +0200
Message-ID: <CAM9Jb+jOQFx3O0Z5R4HD-4L72L9o341QKU9RucAENphdxpmarw@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] util/oslib-posix: Avoid creating a single thread
 with MADV_POPULATE_WRITE
To: David Hildenbrand <david@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d32;
 envelope-from=pankaj.gupta.linux@gmail.com; helo=mail-io1-xd32.google.com
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
Cc: =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Qemu Developers <qemu-devel@nongnu.org>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Marek Kedzierski <mkedzier@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> Let's simplify the case when we only want a single thread and don't have
> to mess with signal handlers.
>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  util/oslib-posix.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/util/oslib-posix.c b/util/oslib-posix.c
> index a1d309d495..1483e985c6 100644
> --- a/util/oslib-posix.c
> +++ b/util/oslib-posix.c
> @@ -568,6 +568,14 @@ static bool touch_all_pages(char *area, size_t hpagesize, size_t numpages,
>      }
>
>      if (use_madv_populate_write) {
> +        /* Avoid creating a single thread for MADV_POPULATE_WRITE */
> +        if (context.num_threads == 1) {
> +            if (qemu_madvise(area, hpagesize * numpages,
> +                             QEMU_MADV_POPULATE_WRITE)) {
> +                return true;
> +            }
> +            return false;
> +        }
>          touch_fn = do_madv_populate_write_pages;
>      } else {
>          touch_fn = do_touch_pages;

Reviewed-by: Pankaj Gupta <pankaj.gupta@ionos.com>

