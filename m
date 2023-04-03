Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73DB16D471C
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 16:17:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjKzC-0000e2-53; Mon, 03 Apr 2023 10:16:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=xBS6=72=zx2c4.com=Jason@kernel.org>)
 id 1pjKz6-0000cf-In
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 10:16:38 -0400
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=xBS6=72=zx2c4.com=Jason@kernel.org>)
 id 1pjKz5-0003nX-2i
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 10:16:36 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4B5C761CCD
 for <qemu-devel@nongnu.org>; Mon,  3 Apr 2023 14:16:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30D46C433A7
 for <qemu-devel@nongnu.org>; Mon,  3 Apr 2023 14:16:33 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="l6283/X0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1680531390;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P8eMWnSOBMP6HDszOatIyc1QX9hztI/CeTYYOTTkMwE=;
 b=l6283/X02bsqUosrJkCHAxdqe0uk23ALvNNzLHNMioSVC9Hm3Yy/7AbNncM+As8AZuW5Ax
 E94TF4b0ZNEqKM40fo/RYiWu7fysuQQHcCx63a6H+ZA1mH/RP/2d03mplJqfRsVwMkbr0g
 f+swH5NvpltHi09wLZOzQKhFSQ/EeY4=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 4127f47e
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO) for <qemu-devel@nongnu.org>;
 Mon, 3 Apr 2023 14:16:29 +0000 (UTC)
Received: by mail-vs1-f44.google.com with SMTP id h27so25527320vsa.1
 for <qemu-devel@nongnu.org>; Mon, 03 Apr 2023 07:16:29 -0700 (PDT)
X-Gm-Message-State: AAQBX9cbOpPnjsmHeEWriJH8+UfNsLSW1Y1xlMajtM9fimW9kvO4jzX/
 mdfEyYhdRjRrPFcxBYwMx90iC9g3s9tc/3xh6UY=
X-Google-Smtp-Source: AKy350YfmuUwo4WxhWhtALNzYIdn4WcIrYG8zXUec1xWvboTf+Ujvg4FB0uuK+XwgN4bRBB4iJ9+7i0E9tF41aaQqj4=
X-Received: by 2002:a67:d291:0:b0:411:c9c5:59ae with SMTP id
 z17-20020a67d291000000b00411c9c559aemr20874453vsi.5.1680531388983; Mon, 03
 Apr 2023 07:16:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230403105245.29499-1-bchalios@amazon.es>
 <CAHmME9q3W4HKXERGdtrMHvaTO_as3UYow9qHQjRroyWW0iA-8Q@mail.gmail.com>
In-Reply-To: <CAHmME9q3W4HKXERGdtrMHvaTO_as3UYow9qHQjRroyWW0iA-8Q@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 3 Apr 2023 16:16:18 +0200
X-Gmail-Original-Message-ID: <CAHmME9qhqNvDsOaAdn5PzgtogC4tJKgE3uCn6MVC1b+Ha3jKuA@mail.gmail.com>
Message-ID: <CAHmME9qhqNvDsOaAdn5PzgtogC4tJKgE3uCn6MVC1b+Ha3jKuA@mail.gmail.com>
Subject: Re: [RFC PATCH 0/1] Implement entropy leak reporting for virtio-rng
To: Babis Chalios <bchalios@amazon.es>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Amit Shah <amit@kernel.org>, 
 qemu-devel@nongnu.org, sgarzare@redhat.com, graf@amazon.de, 
 xmarcalx@amazon.co.uk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=SRS0=xBS6=72=zx2c4.com=Jason@kernel.org;
 helo=dfw.source.kernel.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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

On Mon, Apr 3, 2023 at 4:15=E2=80=AFPM Jason A. Donenfeld <Jason@zx2c4.com>=
 wrote:
>
> Hi Babis,
>
> Why are you resending this? As I mentioned before, I'm going to move
> forward in implementing this feature in a way that actually works with
> the RNG. I'll use your RFC patch as a base, but I think beyond that, I
> can take it from here.

Grrr, sorry! This is for QEMU! I understand.

(Kernel ends from me are forthcoming.)

Jason

