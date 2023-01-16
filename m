Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 509DC66D034
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 21:31:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHW6q-0003og-L8; Mon, 16 Jan 2023 15:29:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pHW6j-0003oD-7U
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 15:29:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pHW6h-0002n0-CP
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 15:29:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673900966;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CvhmTGKBcW4Jf2kWh/Jq4jyMg0GZGV4qCt9tofsk7Nc=;
 b=P9IWIW6BuD6j6+ARk1AUlc8fgdWl3RLH1gudkRafowCfy4NeHF5fU3tHtXRE8owvdW1F5C
 IIflzVbUJUDu+T7l9iD5WjRbhN52QQcJ0r/vKT/29Pc92vmPYpbblONRtYMdVlz+ubVo5C
 1UiFybIS46ai773kanvI71uFgKMtBWc=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-645-FsVDYb4-NyyfuDtP5AaV7Q-1; Mon, 16 Jan 2023 15:29:25 -0500
X-MC-Unique: FsVDYb4-NyyfuDtP5AaV7Q-1
Received: by mail-pf1-f200.google.com with SMTP id
 f15-20020a62380f000000b0058db55a8d7aso1065002pfa.21
 for <qemu-devel@nongnu.org>; Mon, 16 Jan 2023 12:29:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CvhmTGKBcW4Jf2kWh/Jq4jyMg0GZGV4qCt9tofsk7Nc=;
 b=CuqwQO0me+LUW1r/KICGD2nYxp21HSeU6mrw+tJPzCzm3aPhLDUt9uv65mf0Tpuwsn
 kcj778QA2THvl7IlD/UlANE1e8+JzOZfshgNzFZDPNOpcBFdBlLkFQbRQM/7KwijXqy9
 2T3f6FJwzmu8xFKKBAXuqwyvZK9KVaf5zu/AqdKomFSEOSA1O7kJRrKST76lbh2Vcupf
 1pr5Do/Om6VQFjFbYtdBR6fosF+sb+xujb9PHpFMSkoQG3AeiR0t/3bX5Bd/nDLy8JbK
 cWlR7/j37cK/RtUIx6/wqfRwwU8Qz9BouR06pdXItZq4b7NNZYuFk1sCwmhYcSSPJH9I
 DDVQ==
X-Gm-Message-State: AFqh2kphlSkQA4xg1iTol8XV5OYDE60JF+UCtvmfNxOrZs/r/S4yMR/X
 j66kBVcWkcTs4KdlPrDfjZLnp/fAmNlaqxs8i9ni/jWaJvA9VjKxcmJNmU2wSKYypwQrIbgDGdL
 CCjHVBiQz8lnx2/tDCSU5oyWh5nmK2TM=
X-Received: by 2002:a17:902:7590:b0:193:1b3b:f514 with SMTP id
 j16-20020a170902759000b001931b3bf514mr82955pll.28.1673900964238; 
 Mon, 16 Jan 2023 12:29:24 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtOCCZ2mbn/PvW5evgMvpUagiO7JajvseT9TL0iObiQxEFaePocKf7Z8dTaxh1zoNDLLHs6nxiicaM8inEe+M0=
X-Received: by 2002:a17:902:7590:b0:193:1b3b:f514 with SMTP id
 j16-20020a170902759000b001931b3bf514mr82953pll.28.1673900963955; Mon, 16 Jan
 2023 12:29:23 -0800 (PST)
MIME-Version: 1.0
References: <20220219080818.327683-1-liavalb@gmail.com>
 <A83604D0-B156-4C34-BAF2-29D13D341386@gmail.com>
 <CAFn=p-bzzTM2cyEM_uVpnutj=7D5NgKFb3=854rNQe_Qc4GTfA@mail.gmail.com>
 <59AF7FF6-64F3-4633-B079-2C41DDF3B76C@gmail.com>
 <7e7bf877-0300-7a2e-e0a4-f8db6eeae88b@gmail.com>
In-Reply-To: <7e7bf877-0300-7a2e-e0a4-f8db6eeae88b@gmail.com>
From: John Snow <jsnow@redhat.com>
Date: Mon, 16 Jan 2023 15:29:12 -0500
Message-ID: <CAFn=p-YwPCZOOzBpQb6FwdjKEYiNJj_HWrYVUs+Xg5i1=PkG0Q@mail.gmail.com>
Subject: Re: [PATCH 0/1] hw/ide: share bmdma read and write functions
To: Liav Albani <liavalb@gmail.com>
Cc: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

On Fri, Jan 13, 2023 at 9:10 AM Liav Albani <liavalb@gmail.com> wrote:
>
>
> On 1/11/23 01:07, Bernhard Beschow wrote:
>
> Am 9. Januar 2023 19:24:16 UTC schrieb John Snow <jsnow@redhat.com>:
>
> On Tue, Sep 6, 2022 at 10:27 AM Bernhard Beschow <shentey@gmail.com> wrot=
e:
>
> Am 19. Februar 2022 08:08:17 UTC schrieb Liav Albani <liavalb@gmail.com>:
>
> This is a preparation before I send v3 of ich6-ide controller emulation p=
atch.
> I figured that it's more trivial to split the changes this way, by extrac=
ting
> the bmdma functions from via.c and piix.c and sharing them together. Then=
,
> I could easily put these into use when I send v3 of the ich6-ide patch by=
 just
> using the already separated functions. This was suggested by BALATON Zolt=
an when
> he submitted a code review on my ich6-ide controller emulation patch.
>
> Ping. Any news?
>
> *cough*.
>
> Has this been folded into subsequent series, or does this still need atte=
ntion?
>
> Both piix and via still have their own bmdma implementations. This patch =
might be worth having.
>
> Best regards,
> Bernhard
>
> I see. Since you are still interested, I will try to see what was the out=
come of that patch as I really don't remember if it passed the CI tests, et=
c. If applicable, I will send this as v2, or if it's already approved, then=
 I guess we could just let it be merged to the tree?
>

I was just going to run some smoke tests on it and as long as it
didn't hurt anything, I'd wave it in. If you want it alongside other
patches that I also should stage, you can bundle them if you'd like.
Just let me know what you plan on doing.

--js


