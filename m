Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E79D0530812
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 05:30:29 +0200 (CEST)
Received: from localhost ([::1]:50886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nsym4-0008Hb-Gx
	for lists+qemu-devel@lfdr.de; Sun, 22 May 2022 23:30:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nsyka-0007WF-6l
 for qemu-devel@nongnu.org; Sun, 22 May 2022 23:28:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nsykX-00083t-GA
 for qemu-devel@nongnu.org; Sun, 22 May 2022 23:28:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653276532;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=12J69UXrTyEtKW4Gy5HWh+XNKG6JSMU36cDib6RJE4w=;
 b=AQfw+in09aK3PU3YBtI3u7LfPPLz/R0J5zfzBW3K8Ykq8lewNXRvD3jzG5MhnZ1RaIVS56
 gPRbSXYN4GOFnaaFw9wUD2NaJVY92KfB5QuvoDBqoyBvp1/Wcnb10v5j1xR/jQubTkskFA
 xsCI8PmCJfj27CPOYGiNT1S6aZobP3w=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-49-v6soRJbfMlmZWcbRo-0tig-1; Sun, 22 May 2022 23:28:51 -0400
X-MC-Unique: v6soRJbfMlmZWcbRo-0tig-1
Received: by mail-lj1-f198.google.com with SMTP id
 o23-20020a2e9b57000000b00253e47e6e97so485193ljj.15
 for <qemu-devel@nongnu.org>; Sun, 22 May 2022 20:28:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=12J69UXrTyEtKW4Gy5HWh+XNKG6JSMU36cDib6RJE4w=;
 b=tpeBCdliij3hsZyNy6eAjvD5Ek7NqjkikDpJ8Uub9hcoKwtEseSwQ0UInAMmV6qDSp
 0tGerZWVMblE26Y2FQ+oNVqsFsH28tvBTTlfZ8AWDyvQhL/RH8szj2TzliV3EM/MySDC
 hvNxK+SZdLzsx3QODYFVuElz3JpYVfEuaS/ACsTBI/ud8YvH6IuTQ4EtSwxxG8S1Q1SH
 TPQvlez7Lk1/PRRWBwpBu2UldgydOTWYGBExxNzL86ZnANkEezVz3ymxtw/4f3KZIbd9
 RwccQmRLUjzQAxvPZiaxsG8dcC4oWdkl4hlUPsodtdI3ltkra0fno/4Qn/4Ll/9c4FCT
 BSAg==
X-Gm-Message-State: AOAM530kYEIN8Ym5Eprm3jGNhYhzdlxkwH9E5Z0udoaqb1fSWAPsnP+m
 DiqV7qr49cCIG2vcsRadWj1x2AUKMl4YflBkr0KveRn8hQ4FsTtr7WddONAsLp56D+UIqj6s7/r
 qzvVFlG/My2mtnVhc3v0XmMs3Ziouc/Y=
X-Received: by 2002:a05:6512:1395:b0:446:d382:79a5 with SMTP id
 p21-20020a056512139500b00446d38279a5mr14866145lfa.210.1653276528438; 
 Sun, 22 May 2022 20:28:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyFGHnJwh8yzoSCXzxQhuV6MNtdFCNEm3zqkcIVT0dKWex0sVdZaO4gCXnZ+Hd/SvDbSj+MQn0CGVh1Yotv5aE=
X-Received: by 2002:a05:6512:1395:b0:446:d382:79a5 with SMTP id
 p21-20020a056512139500b00446d38279a5mr14866135lfa.210.1653276528194; Sun, 22
 May 2022 20:28:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220520065302.715904-1-joel@jms.id.au>
In-Reply-To: <20220520065302.715904-1-joel@jms.id.au>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 23 May 2022 11:28:36 +0800
Message-ID: <CACGkMEsc8-VE3uKvKUELtCe7NwnMN6427XUcZFTyVaDgTXPbfQ@mail.gmail.com>
Subject: Re: [PATCH] hw/net: Add LiteEth model
To: Joel Stanley <joel@jms.id.au>
Cc: qemu-devel <qemu-devel@nongnu.org>, Gabriel Somlo <gsomlo@gmail.com>, 
 Stafford Horne <shorne@gmail.com>, Brian Swetland <swetland@frotz.net>, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, May 20, 2022 at 2:53 PM Joel Stanley <joel@jms.id.au> wrote:
>
> LiteX is a soft system-on-chip that targets FPGAs. LiteETH is a basic
> network device that is commonly used in LiteX designs.
>
> There is an upstream Linux kernel driver for this device and support in
> various other firmware projects for it.
>
> Co-developed-by: C=C3=A9dric Le Goater <clg@kaod.org>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  include/hw/net/liteeth.h |  56 ++++++++
>  hw/net/liteeth.c         | 299 +++++++++++++++++++++++++++++++++++++++
>  hw/net/Kconfig           |   3 +
>  hw/net/meson.build       |   1 +
>  hw/net/trace-events      |   6 +
>  5 files changed, 365 insertions(+)
>  create mode 100644 include/hw/net/liteeth.h
>  create mode 100644 hw/net/liteeth.c

Haven't gone through the patch, but any chance to have a unittest for this?

Thanks


