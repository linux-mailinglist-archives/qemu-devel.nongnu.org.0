Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F728432319
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 17:38:54 +0200 (CEST)
Received: from localhost ([::1]:41378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcUiy-0000o9-EU
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 11:38:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mcUh7-000802-KT
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 11:36:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30240)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mcUh4-0003tj-6X
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 11:36:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634571411;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wrM9MDXI75Q+VO3xBmhiIxnAJCkPWx5BweO01djWaHE=;
 b=hJcCeYPEzJ9A93alGuY1Jaan55VLYB1ggUhpCqecj4qNPjuNwJA1RC7cj1B/zoIODu62VQ
 6GHQLLOAC29g1nq5CHv8gq4jbaasGXz8yrjgcjv3++BXf3lG2RHAhsKdrfAJvM4OpnUcd7
 5x1hYFn/7BrFsy1ZSvso65IqtCRJAjY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-593-k20omE2OO7qvWSY3kMqVFw-1; Mon, 18 Oct 2021 11:36:50 -0400
X-MC-Unique: k20omE2OO7qvWSY3kMqVFw-1
Received: by mail-wr1-f70.google.com with SMTP id
 j19-20020adfb313000000b00160a9de13b3so8984090wrd.8
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 08:36:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wrM9MDXI75Q+VO3xBmhiIxnAJCkPWx5BweO01djWaHE=;
 b=iB73jcSMToVi9X5zDjp1jICoNPg+Z6XJi9KVLq4Rd2zAzc5hFFHrUlSdVGvCyCoZkC
 JjDcgJ+w/mdZ90WIGCnLcogiFai0TrBJyre59xCkIUPms7uewDbdKVpfHX0pi7Lm8kLB
 dFdQ00T9+YS8p+HstyQFctyGzf15sSvs0V3junWj+5z3OjcOdmHaRahapy5/P6jUObpu
 PXNR6eC6S7dmRGXBnM0z906UQaIajCh8DBdHhvxt5uJN+2fTGS/9CeEjRgqp40OjRMRO
 4UzF3aObABnj/tXluIgkLP5QRgFl3wFsB2HFbzvrtv7+h6/IZJWW6edICWdt/F7ubRfd
 bGaw==
X-Gm-Message-State: AOAM530LTcPLjIDGHrUnKtfX+xdpeYP0D/LaPE93ILJ89t5Yv+1TCZJy
 6GdujHd/+VTexrSOAPPR9iiW6u/WVwtQ+U3oMaupmRsQXM9n6pSfIqzaJHCPuzmNUwsZZM0PuDQ
 LOeaZpaTyZUf/bBQ=
X-Received: by 2002:a5d:6b88:: with SMTP id n8mr35622323wrx.332.1634571409117; 
 Mon, 18 Oct 2021 08:36:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwBR6cwiCrDEJfHnjMglA9qPx1xFk91v46y5bCTLbDMoQmoQPzYMVbJnnaAMtULMvjpewz1iQ==
X-Received: by 2002:a5d:6b88:: with SMTP id n8mr35622297wrx.332.1634571408921; 
 Mon, 18 Oct 2021 08:36:48 -0700 (PDT)
Received: from redhat.com ([2.55.19.190])
 by smtp.gmail.com with ESMTPSA id 25sm19342715wmo.18.2021.10.18.08.36.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 08:36:48 -0700 (PDT)
Date: Mon, 18 Oct 2021 11:36:45 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH 0/6] RfC: try improve native hotplug for pcie root ports
Message-ID: <20211018113535-mutt-send-email-mst@kernel.org>
References: <20211011120504.254053-1-kraxel@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211011120504.254053-1-kraxel@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Oct 11, 2021 at 02:04:58PM +0200, Gerd Hoffmann wrote:
> 
> 
> Gerd Hoffmann (6):
>   pci: implement power state
>   pcie: implement slow power control for pcie root ports
>   pcie: add power indicator blink check
>   pcie: factor out pcie_cap_slot_unplug()
>   pcie: fast unplug when slot power is off
>   pcie: expire pending delete

So what's left to do here?
I'm guessing more testing?
I would also like to see a shorter timeout, maybe 100ms, so
that we are more responsive to guest changes in resending request.


>  include/hw/pci/pci.h   |  2 ++
>  include/hw/qdev-core.h |  1 +
>  hw/pci/pci.c           | 25 +++++++++++--
>  hw/pci/pci_host.c      |  6 ++--
>  hw/pci/pcie.c          | 82 ++++++++++++++++++++++++++++++++++--------
>  softmmu/qdev-monitor.c |  4 ++-
>  6 files changed, 101 insertions(+), 19 deletions(-)
> 
> -- 
> 2.31.1
> 


