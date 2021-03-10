Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B093337E4
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 09:54:53 +0100 (CET)
Received: from localhost ([::1]:33438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJucG-0005w2-Uz
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 03:54:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lJuWT-00088b-It; Wed, 10 Mar 2021 03:48:53 -0500
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b]:43278)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lJuWL-0007wT-RY; Wed, 10 Mar 2021 03:48:53 -0500
Received: by mail-yb1-xb2b.google.com with SMTP id u75so16996878ybi.10;
 Wed, 10 Mar 2021 00:48:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=x8u0ZUHuFb0LNEZQcY6afcc0NXL5vnd8e4OAqoaNRsI=;
 b=ux51/yowJ0wCR5DfjIqCvhL/USc6mnCTJjQ1cjZk8CmPJaL0mOeQIqft57R4e+10v+
 AWqThJveitOpuD1xJ9eTzZWyA3gGFAtqKwHyObKKQQrZHeUbxUFr6f+jOsRE89vNIhG5
 D00Ya/L0Q4CvpDe39cE635cXWZQjCcTWrZVe4rfuIOMcqZPaXL1xzvJs3ckDpoHlAx8Y
 BpXtNkubE87KqnlN7avV0BTO0cYtePUHn+Ez+MLY2RpZ/W2dFatrg6nVhgeiZ/9ihgZA
 RxTeYJG3IZ1nPiJWPuBeRx3vIlVjODHo9a3k39p7wWjWQU5oozE/kr83JQlk4bjHJJ0F
 0P7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=x8u0ZUHuFb0LNEZQcY6afcc0NXL5vnd8e4OAqoaNRsI=;
 b=T+ndFuWZmP0TLqLowZjUQhd8OIW7KiH/iuiF0X+8PnVtitjyJgBgiJkIFpbjd2ixM9
 bN0vmbj0wu/SQedumFfrX3c/E9B30oZJebs6qFX8kpReTwT8KV3P7Xw2x04lk1QUBOgG
 hkeq06kJPCQtvt2Whq1mCuj9l+u1L3NsutKpxBDppIa+FxDL7kuBeVgVwX1QNzHBPFxu
 OUaG8ncy1VXJlq2QolGz/h3su5S1mO4jpTx5Mwzukdsh883yhWKWNmK3LALrp0/mZFI+
 v66wYMR3L3hEj4p59m8ylg/KhN7T7xhg9VGm4U47rZqdxl7ZzaPxwCzlXIk0hJJUoJmS
 p3yA==
X-Gm-Message-State: AOAM5313aUVLdafXab7o7SlzHy9te+URNoeLwPejw5bZTnveb9+OeSRx
 kOJpHrTlLRPU7FCjmD7wEYBClnW+v0GaBg0gaeyCQvku
X-Google-Smtp-Source: ABdhPJzxdA//kTOvlvjDHNdLMe8Z207zBld1Y7lPcTt9UFCFM4a8cGvKbpRaQ7dWwmIx1weUcsFN31pXGqocA1AYKIM=
X-Received: by 2002:a5b:147:: with SMTP id c7mr2765852ybp.332.1615366123864;
 Wed, 10 Mar 2021 00:48:43 -0800 (PST)
MIME-Version: 1.0
References: <20210309235028.912078-1-philmd@redhat.com>
 <20210309235028.912078-3-philmd@redhat.com>
In-Reply-To: <20210309235028.912078-3-philmd@redhat.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 10 Mar 2021 16:48:31 +0800
Message-ID: <CAEUhbmV6-=Ldrr3CLxLhr4=B5i12W=x4cksuLY4PapXaJi2TVg@mail.gmail.com>
Subject: Re: [PATCH 2/9] hw/block/pflash_cfi01: Extract
 pflash_cfi01_fill_cfi_table()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2b.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Stephen Checkoway <stephen.checkoway@oberlin.edu>,
 Qemu-block <qemu-block@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, David Edmondson <david.edmondson@oracle.com>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 10, 2021 at 7:51 AM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> Fill the CFI table in out of DeviceRealize() in a new function:
> pflash_cfi01_fill_cfi_table().
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  hw/block/pflash_cfi01.c | 140 +++++++++++++++++++++-------------------
>  1 file changed, 73 insertions(+), 67 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

