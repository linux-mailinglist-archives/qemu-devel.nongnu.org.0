Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D68894C2A0D
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 11:59:06 +0100 (CET)
Received: from localhost ([::1]:59532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNBpy-00007k-06
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 05:59:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=7c/N=TH=zx2c4.com=Jason@kernel.org>)
 id 1nNBon-0006qC-Uu
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 05:57:54 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:46368)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=7c/N=TH=zx2c4.com=Jason@kernel.org>)
 id 1nNBom-0006sh-8J
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 05:57:53 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0E22F616A7
 for <qemu-devel@nongnu.org>; Thu, 24 Feb 2022 10:57:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A5E8C340EB
 for <qemu-devel@nongnu.org>; Thu, 24 Feb 2022 10:57:50 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="Aev4oP76"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1645700268;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l9uFhoNHD0ubvFpgP+CfgQfLWDk0rbzVcNs9eAAzOOE=;
 b=Aev4oP76SM7Ky5tVHBurpSFk24ePStDVbpz4sUcYrWj/NVQsvMbzkZERrzKlvWiREIkUjg
 pns/T3HQBI1W+E7V4L0ZxLhtdwhTycvyPky5RJ4kmyYS40PqhCMFfq2I7AWj1l2AbnW3gZ
 2IoA6U4VwICTXSzBigeWX4GouwiGKE4=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id fb84d94a
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO) for <qemu-devel@nongnu.org>;
 Thu, 24 Feb 2022 10:57:48 +0000 (UTC)
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-2d68d519a33so20226077b3.7
 for <qemu-devel@nongnu.org>; Thu, 24 Feb 2022 02:57:46 -0800 (PST)
X-Gm-Message-State: AOAM531J9c4/RGNptzi/mF7H9sLDduxaohPoojv0kjm6//jkzOT4Ga4Z
 qO4Ul4h5QHoiPvl9StOtYIzk1xyD6N3WtNAVI0c=
X-Google-Smtp-Source: ABdhPJwN40erEHMdIbnTWhaEGW2JI+hoWIa30mje4icqtRKOBfnV+2qG9wPZOdlYssF87EiAylHOO7YqwwX1PQC4yTE=
X-Received: by 2002:a81:5a83:0:b0:2ca:287c:6b5d with SMTP id
 o125-20020a815a83000000b002ca287c6b5dmr1747645ywb.2.1645700265594; Thu, 24
 Feb 2022 02:57:45 -0800 (PST)
MIME-Version: 1.0
References: <20220223131231.403386-1-Jason@zx2c4.com>
 <CAHmME9ogH_mx724n_deFfva7-xPCmma1-=2Mv0JdnZ-fC4JCjg@mail.gmail.com>
 <2653b6c7-a851-7a48-f1f8-3bde742a0c9f@redhat.com>
 <YhdkD4S7Erzl98So@redhat.com>
In-Reply-To: <YhdkD4S7Erzl98So@redhat.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 24 Feb 2022 11:57:34 +0100
X-Gmail-Original-Message-ID: <CAHmME9qRrLHwOjD+_xkGC7-BMVdzO95=DzhCo8KvDNa0JXVybA@mail.gmail.com>
Message-ID: <CAHmME9qRrLHwOjD+_xkGC7-BMVdzO95=DzhCo8KvDNa0JXVybA@mail.gmail.com>
Subject: Re: [PATCH RFC v1 0/2] VM fork detection for RNG
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=139.178.84.217;
 envelope-from=SRS0=7c/N=TH=zx2c4.com=Jason@kernel.org;
 helo=dfw.source.kernel.org
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: linux-s390@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Theodore Ts'o <tytso@mit.edu>, adrian@parity.io,
 KVM list <kvm@vger.kernel.org>, Jann Horn <jannh@google.com>, "Singh,
 Balbir" <sblbir@amazon.com>, ben@skyportsystems.com, "Weiss,
 Radu" <raduweis@amazon.com>, QEMU Developers <qemu-devel@nongnu.org>,
 "Richard W.M. Jones" <rjones@redhat.com>, LKML <linux-kernel@vger.kernel.org>,
 "Catangiu, Adrian Costin" <acatan@amazon.com>, graf@amazon.com,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Igor Mammedov <imammedo@redhat.com>, Colm MacCarthaigh <colmmacc@amazon.com>,
 Laszlo Ersek <lersek@redhat.com>, "Woodhouse, David" <dwmw@amazon.co.uk>,
 ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 24, 2022 at 11:56 AM Daniel P. Berrang=C3=A9 <berrange@redhat.c=
om> wrote:
> IIRC this part of the QEMU doc was making an implicit assumption
> about the way QEMU is to be used by mgmt apps doing snapshots.
>
> Instead of using the 'loadvm' command on the existing running QEMU
> process, the doc seems to tacitly expect the management app will
> throwaway the existing QEMU process and spawn a brand new QEMU
> process to load the snapshot into, thus getting the new GUID on
> the QEMU command line.

Right, exactly. The "there are no known use cases" bit I think just
forgot about one very common use case that perhaps just wasn't in use
by the original author. So I'm pretty sure this remains a QEMU bug.

Jason

