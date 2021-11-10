Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1297244C0B8
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 13:04:38 +0100 (CET)
Received: from localhost ([::1]:59078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkmLF-0004PV-7e
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 07:04:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mkmJ1-0002sF-VN
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 07:02:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59922)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mkmIu-0003Ev-6V
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 07:02:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636545729;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zONRDWxJXiTxyEYaCIr8f6H2/bhaPRq+akv9d+l5wJg=;
 b=ZhcDm6MDmQSTOBdhOXYpWhw1tKR8wQaIv6GLzeKrxNdt/i/0pO1liS04fD2bloJBGqIWUo
 YJ0sFGvHwEq2t2R+n64RNAsM54YlyiPxjYchVQM2DeDV6yK+Wmao7L7ysoiCF7YQsnaAF/
 IUWjZLN5l/fSSOplRoDmCVpAxB/vftc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-547-1mvu26YsPQmPFOfb__9uyA-1; Wed, 10 Nov 2021 07:02:07 -0500
X-MC-Unique: 1mvu26YsPQmPFOfb__9uyA-1
Received: by mail-wr1-f70.google.com with SMTP id
 q17-20020adfcd91000000b0017bcb12ad4fso371453wrj.12
 for <qemu-devel@nongnu.org>; Wed, 10 Nov 2021 04:02:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=zONRDWxJXiTxyEYaCIr8f6H2/bhaPRq+akv9d+l5wJg=;
 b=Pdo8NbM59fTYmjLMa5Zs6+w5YPQNQdU7t1zF1WXtpqvXMVNXINh+6HFrheazMQ6/dZ
 pGD3Za0BCRsKPQxGfV395dIH7rfplL1jtHJHbV0pzMB+UhMGZd3JEXQTlyWua5sLn2RX
 IyKL1DWh7R4K3iLE2dmx9bPfVmxgIXxkSyLN7WUpoy/ERLnlyJHOK1Xm6nzWUuTlgQrk
 f9M3AhcvgKvv1cpCEGJMuANj7XQjqGu2Yny5nGXBYZWF3vf5fWdkqrqwjyEF/GipzLER
 B3JikKV0dJT0UGFTpJTwdl7DqGyJ4fLenAWj7Mj8pKQ7OmHPy3Uy/NP9dPFhX0VcurUb
 jpSw==
X-Gm-Message-State: AOAM533hiNe9aOa3NjS958XBzo9QDNsax2qHSJkJIBDyCGgGLvDYHO8k
 vqcmugryQAJ+xHQL61W/tKoo3zRPiCj9/+PcchyCJ7ZZW/4R1ZUATG8gey//fAwdJUHvsLpJOGV
 k1M3OirXFxip9Dko=
X-Received: by 2002:adf:db47:: with SMTP id f7mr18756598wrj.113.1636545726836; 
 Wed, 10 Nov 2021 04:02:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzSmudFsiRZdVh3ANpUFVADoB+B1H3OaB2WrM4MEalkpQ9B2C4FRKBhvFlAlHEfQXZx49ttuA==
X-Received: by 2002:adf:db47:: with SMTP id f7mr18756548wrj.113.1636545726547; 
 Wed, 10 Nov 2021 04:02:06 -0800 (PST)
Received: from redhat.com ([2.55.133.41])
 by smtp.gmail.com with ESMTPSA id f7sm17998059wri.74.2021.11.10.04.02.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Nov 2021 04:02:05 -0800 (PST)
Date: Wed, 10 Nov 2021 07:02:01 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH 0/6] RfC: try improve native hotplug for pcie root ports
Message-ID: <20211110065942-mutt-send-email-mst@kernel.org>
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
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Given it's a bugfix, and given that I hear through internal channels
that QE results so far have been encouraging, I am inclined to bite the
bullet and merge this for -rc1.

I don't think this conflicts with Julia's patches as users can still
disable ACPI hotplug into bridges.  Gerd, agree? Worth the risk?


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
> 
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


