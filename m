Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCCDF6BDFC3
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Mar 2023 04:46:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pd11j-0007Fc-MF; Thu, 16 Mar 2023 23:45:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1pd11g-0007DN-Tr; Thu, 16 Mar 2023 23:45:08 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1pd11e-0002op-1I; Thu, 16 Mar 2023 23:45:08 -0400
Received: by mail-ed1-x531.google.com with SMTP id fd5so15481628edb.7;
 Thu, 16 Mar 2023 20:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679024702;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=42zKkr+jA/SYJcRCtFD2SMkXv6iiKp0lbJVL6b4yzcE=;
 b=myFwG+EPkwUaupESYhHdlLobJ9eBp8lkEQLGWPUnCayOFy3xbG9IMPRtXmlF2qlZeK
 ecaq5CU4Za7tEfMknKixHAbvPBnHuQgRJCYmWwl59r5WurE6rQwzEUHVUKmdLIBs4GGu
 nOoHvidGAdpH3+6EZdvuC1Yx6Tagr6w0CuGFM7lIVFvUq7So3xwwKkAP8ggCCidjJRg4
 J3iru6KOVSm0q3tLw8gPTNUdA7NSv27zPG6/Y/7ge5u2R/S2aZ6MotLK6e3DHFvm4skd
 vRcvIG290T1xjZsgYvAk+TjAvSDpnxNgDFhKLN98YHx3E2cIv1+AD8LZkiXPzQJzObuF
 6RpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679024702;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=42zKkr+jA/SYJcRCtFD2SMkXv6iiKp0lbJVL6b4yzcE=;
 b=HaRbVa+V44MZPJyLUhpj3S7NG/FesY6Ssa5gnsONOEc4T0cNE+B3D6u8v4S8Y5FARq
 IAcwtlWlc/evSHYltwJ95m2T341CbUSWzV3Z+SKq8M8vmdDJhIOz/J5SRR1DmATu5RP/
 zWr6yHUuy8bQcgMl91u94bB6j68NcWVYs709LlFtbhtXhKo15E67vOKMoz091/hOAtIm
 uq8c7f/w1CJBtVNLSg1fgs2NPNs4LB3nYokgk99vcJOC0VKMSuzA4N2sddfXousJVg4c
 pwHH3ZH4Oh3dGRCR+D5Q21YpSzHuYh801Qd6KOhHu+Ch3I+k7GBcy1J+FtvOJ55BvLdw
 VXMw==
X-Gm-Message-State: AO0yUKXW/LbcTR0xIGbDEdefnzO6vytyl1J4hEEKrQ6aWBLDe2GYFfdM
 CvReVPG6j1EvVEnQKaq3yO8l9wsiHpgedoaO5n8=
X-Google-Smtp-Source: AK7set8FrwCReQDzvIYMK9q/ud8T/7M7QBhDfAfK4PGkQ6mlVXikgE6AhYGJNnPgPuOm1pjyMBuyumXv19+kfwJAqSI=
X-Received: by 2002:a17:906:1f53:b0:879:5db8:8bb2 with SMTP id
 d19-20020a1709061f5300b008795db88bb2mr5789351ejk.7.1679024701684; Thu, 16 Mar
 2023 20:45:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230310105431.64271-1-faithilikerun@gmail.com>
 <20230316192423.GG63600@fedora>
In-Reply-To: <20230316192423.GG63600@fedora>
From: Sam Li <faithilikerun@gmail.com>
Date: Fri, 17 Mar 2023 11:44:35 +0800
Message-ID: <CAAAx-8JXJSdBYawBw+rXsrZxmBZHc0giaU3JSyNuafn+OToUDw@mail.gmail.com>
Subject: Re: [PATCH v7 0/4] Add zoned storage emulation to virtio-blk driver
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, damien.lemoal@opensource.wdc.com, 
 Hanna Reitz <hreitz@redhat.com>, hare@suse.de, qemu-block@nongnu.org, 
 Eric Blake <eblake@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 dmitry.fomichev@wdc.com, 
 Cornelia Huck <cohuck@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 kvm@vger.kernel.org, 
 "Michael S. Tsirkin" <mst@redhat.com>, Kevin Wolf <kwolf@redhat.com>, 
 Raphael Norwitz <raphael.norwitz@nutanix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=faithilikerun@gmail.com; helo=mail-ed1-x531.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Stefan Hajnoczi <stefanha@redhat.com> =E4=BA=8E2023=E5=B9=B43=E6=9C=8817=E6=
=97=A5=E5=91=A8=E4=BA=94 03:46=E5=86=99=E9=81=93=EF=BC=9A
>
> On Fri, Mar 10, 2023 at 06:54:27PM +0800, Sam Li wrote:
> > This patch adds zoned storage emulation to the virtio-blk driver.
> >
> > The patch implements the virtio-blk ZBD support standardization that is
> > recently accepted by virtio-spec. The link to related commit is at
> >
> > https://github.com/oasis-tcs/virtio-spec/commit/b4e8efa0fa6c8d844328090=
ad15db65af8d7d981
> >
> > The Linux zoned device code that implemented by Dmitry Fomichev has bee=
n
> > released at the latest Linux version v6.3-rc1.
> >
> > Aside: adding zoned=3Don alike options to virtio-blk device will be
> > considered as following-ups in future.
> >
> > v6:
> > - update headers to v6.3-rc1
>
> Hi Sam,
> I had some minor comments but overall this looks good. Looking forward
> to merging it soon!

That's great to hear. I'll address them in the next revision. Please
let me know if any further issues arise.

Thanks,
Sam

