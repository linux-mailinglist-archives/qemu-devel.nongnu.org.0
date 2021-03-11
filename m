Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F15336A66
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 04:08:16 +0100 (CET)
Received: from localhost ([::1]:42004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKBgO-00037m-0W
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 22:08:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lKBdb-0001Nm-Pv; Wed, 10 Mar 2021 22:05:23 -0500
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32]:32858)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lKBdW-0004jF-Aq; Wed, 10 Mar 2021 22:05:23 -0500
Received: by mail-yb1-xb32.google.com with SMTP id x19so20225767ybe.0;
 Wed, 10 Mar 2021 19:05:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=84BJANA8aiN31htTlgNI/whq07EWbozc5fHZDXSzGIE=;
 b=HUTvvuh3qyWwv5Cne4CM/iXj9+qcDXwBuV/qI5VelPYyVA3fyRsIpQekdRKGnAs/K5
 +MRkAfgN8RD8YujIdDOXAAh0qL7Py5T7RrmqPksQPAIza6SQsydr6FMIMbP8NPS8rAZg
 9bglFbNpHQZcfVvjnMclSXLrsJquiqeg/ZRxEONOJswgKs+AEKOm2YLwhJbOTzhX4vcC
 OPWudb/y0+A7QAXocMc5k275KDPfYI2LMtYrnKlZoKMoVYrb7btpSdblHxg2ekTIjB6h
 H7EAJywBRFVS7lB21ls9eoes+wSCDyLe8rscQKETIgA/BElvK5YcGp9X/GzUwORLRjHS
 2JlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=84BJANA8aiN31htTlgNI/whq07EWbozc5fHZDXSzGIE=;
 b=pC1DbsiBRvtyuWNH7TeamwVxM7YV2Do2FcrbIPF4In3zhBAer6zqfZmV1YpTkOQ8Pq
 HxV8giTjfGWHJMSCUan/bS4sUe7UvLANehS0hskaYFAopkO1c6iFz+IF5xmV1Kq1MmhL
 zTP0cmRbFqu+AAyis9AkNKN7lOKoXz/FWim07JrHw9WP23i2hs2XkMsLLlh3nE2DELha
 Jl5QxWgjZQ/jHfWqIcfjFhN6iRT5ZscDlk7SOFyNyNdqX+/IdXU6tT0MbqTmfb2lchjN
 SSacUP/THzdlM5P7I7AkDEB1oJhWuwmydI+M5H67bFEY/fSipvxzdKtdt1v5ClLqI4G1
 kOeA==
X-Gm-Message-State: AOAM532uveTbXI/vAujr60lOq38YryHhUHNeM0WlLl1QwnqwQJ+M4Ts+
 98M3zGdGGxSZNPVJOGxzBj84xFaAKyqIxGEH5kc=
X-Google-Smtp-Source: ABdhPJzfL2kzUP+TLl+Wx3rFxsjt0DpUhFS02vxvsflOzngGhofcuzMYHiS1egaTVrNbli1HmWU0RBsI1pce2/CXNTo=
X-Received: by 2002:a25:d08d:: with SMTP id h135mr8814775ybg.122.1615431916932; 
 Wed, 10 Mar 2021 19:05:16 -0800 (PST)
MIME-Version: 1.0
References: <20210310170528.1184868-1-philmd@redhat.com>
 <20210310170528.1184868-8-philmd@redhat.com>
In-Reply-To: <20210310170528.1184868-8-philmd@redhat.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 11 Mar 2021 11:05:05 +0800
Message-ID: <CAEUhbmU--5tMagXCkssi9i=iT__-Myfii-f9W+NGC+tmQWsM7Q@mail.gmail.com>
Subject: Re: [PATCH v2 07/12] hw/block/pflash_cfi02: Factor out
 pflash_reset_state_machine()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Stephen Checkoway <stephen.checkoway@oberlin.edu>,
 Qemu-block <qemu-block@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, David Edmondson <david.edmondson@oracle.com>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 11, 2021 at 1:36 AM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> There is multiple places resetting the internal state machine.
> Factor the code out in a new pflash_reset_state_machine() method.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  hw/block/pflash_cfi02.c | 20 +++++++++++---------
>  1 file changed, 11 insertions(+), 9 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

