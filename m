Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E823940DEC1
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 17:55:40 +0200 (CEST)
Received: from localhost ([::1]:40868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQtjf-0002wo-SZ
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 11:55:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mQtOb-0006SP-2a
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 11:33:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mQtOX-00053D-BN
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 11:33:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631806425;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=W8bm2Q8tnXq1saUgjFrWtX5D46Y4Plobcus6HUTJKok=;
 b=eJneyuSJk3fQbNba+dgzT3JKxsl6cLuAM92UrIopS77Tb0/+DxP9tS9srJlRAQml9jiora
 G/muampcAZQ12Kic8hFbBBw1YuV9kmfwNNAFrjAdZAKdBkpmtyth/ZE1065NqQ33G4kGBQ
 gT3Uo4WqLZ7uMJ8z3bTXmTSLtnhKzjM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-121-pjaYo1XdP6GMVcnXayZiNg-1; Thu, 16 Sep 2021 11:33:44 -0400
X-MC-Unique: pjaYo1XdP6GMVcnXayZiNg-1
Received: by mail-wr1-f70.google.com with SMTP id
 x2-20020a5d54c2000000b0015dfd2b4e34so2587047wrv.6
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 08:33:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=W8bm2Q8tnXq1saUgjFrWtX5D46Y4Plobcus6HUTJKok=;
 b=32xRFmI/T9x7L6Ps3M5K50vryJEDhMR56IAQYiT4HhIREmhRRo8j/xOR8CU8O2qEXh
 fvmzp211AiVt7vqxp9sV1uC8ndGRhoy2qkaGumU8P3ZoH7EwXjydJyokY+Oxd49olrvK
 tiMKvQ3r8rA2EExhMMSlmcLoRuahYDSmR/tRJYrIzgPUNlxO0sG64k2WK7u5Ugj2OnyA
 NMRIzqv3G39Bn/iDT+FPWIHwNx9VIeKPWWCwwDcgR/tgJjI1mRTyXqG9ABLIjBPHD5Wt
 y8AfkCaF+3TqQxXHe1GjeNE9Dp0b+F4lIydq5hcu+QLQSNwvy8NftlL6aR9OQgm0I9MY
 VpXw==
X-Gm-Message-State: AOAM531kVIWe/fG359c2bCeWDy4yLnvr6jjLNbFZNPeEOAcpWP7U7TEM
 mwIlVU8b9xlLWCkPZgUrrb3WuOa42Z2MTYuhShNxtAqqi+aKpULaLMdzQWSM2wgnf+oQFnOGsZx
 T8V3HRIHX2i8Et6c=
X-Received: by 2002:a05:6000:14d:: with SMTP id
 r13mr6949891wrx.420.1631806423412; 
 Thu, 16 Sep 2021 08:33:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyCNbNz8UKOhbyAOLtxRmTQH1tvVi8cilOPpY+L6Rs1kp51/PQA+pYldPWmh+szeSVJ3LSAqw==
X-Received: by 2002:a05:6000:14d:: with SMTP id
 r13mr6949863wrx.420.1631806423164; 
 Thu, 16 Sep 2021 08:33:43 -0700 (PDT)
Received: from work-vm (cpc109021-salf6-2-0-cust453.10-2.cable.virginm.net.
 [82.29.237.198])
 by smtp.gmail.com with ESMTPSA id d9sm4856047wrb.36.2021.09.16.08.33.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 08:33:42 -0700 (PDT)
Date: Thu, 16 Sep 2021 16:33:40 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL 0/2] virtiofs queue
Message-ID: <YUNj1DQT9VyU54DV@work-vm>
References: <20210916135241.150566-1-dgilbert@redhat.com>
 <CAFEAcA-k=jKqBcEzxd+ALPYz_UVT1_AG3PnsuX2N77_UTSE=nA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-k=jKqBcEzxd+ALPYz_UVT1_AG3PnsuX2N77_UTSE=nA@mail.gmail.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Sergio Lopez <slp@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Maydell (peter.maydell@linaro.org) wrote:
> On Thu, 16 Sept 2021 at 14:58, Dr. David Alan Gilbert (git)
> <dgilbert@redhat.com> wrote:
> >
> > From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> >
> > The following changes since commit 57b6f58c1d0df757c9311496c32d502925056894:
> >
> >   Merge remote-tracking branch 'remotes/hreitz/tags/pull-block-2021-09-15' into staging (2021-09-15 18:55:59 +0100)
> >
> > are available in the Git repository at:
> >
> >   https://gitlab.com/dagrh/qemu.git tags/pull-virtiofs-20210916
> >
> > for you to fetch changes up to 046d91c83caac29e2ba26c63fd7d685a57463f6d:
> >
> >   virtiofsd: Reverse req_list before processing it (2021-09-16 14:50:48 +0100)
> >
> 
> gpg says your key has expired; what keyserver can I download an
> updated key from?

I pushed an updated one to pgp.mit.edu just before I sent the pull;
I can see it there (although it's a bit slow to respond).

Dave

> thanks
> -- PMM
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


