Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8947B342F19
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Mar 2021 20:02:07 +0100 (CET)
Received: from localhost ([::1]:48458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNgrO-00041n-6x
	for lists+qemu-devel@lfdr.de; Sat, 20 Mar 2021 15:02:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lNgob-0003ZI-8a
 for qemu-devel@nongnu.org; Sat, 20 Mar 2021 14:59:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39194)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lNgoY-0004cY-H7
 for qemu-devel@nongnu.org; Sat, 20 Mar 2021 14:59:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616266747;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XL8lKKvTvlpBGgfWPV/xs126CxF+okHxjrJ2bfWFuoE=;
 b=aSQqRyG/jeQz6sPFSuzfF0eFarmlWqv12+xR06uYMFM8syEW+PaRi3dwDIQJZ3QMOw00Y8
 m0JEuVu26H1e2QX5wtXOOQMWNBMX0T+OMKTdCrm3YEPpk/J/qqj0bv7mvgbe/fbFGWHPKm
 By076spumH01TY3/Sqvfu6fXOpUhMsg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-552-Pkn_P6VcNfm9bP9nFKJN2g-1; Sat, 20 Mar 2021 14:59:03 -0400
X-MC-Unique: Pkn_P6VcNfm9bP9nFKJN2g-1
Received: by mail-wr1-f72.google.com with SMTP id b6so8287004wrq.22
 for <qemu-devel@nongnu.org>; Sat, 20 Mar 2021 11:59:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=XL8lKKvTvlpBGgfWPV/xs126CxF+okHxjrJ2bfWFuoE=;
 b=FZUTL/0Seln4YrLP7GSSQIOkVI4qw+OvEvUmeswTEYvzAf/kcg/7g95lQRukaRXpu/
 8zL90WP5wLkzN+jsfDfGu/Azk1OvzNFPr+EMkiOW0eL7H8nBQjOei+jBns4TF5qlpW4A
 Kp1WHCZofwUCgtP64pD0OgFVKpe2gkCKCqdqhNWZOR1C74qwIXo7QAQf4n3UnggboHjz
 vcDZk8jr//7tkmIHWo0olwU/m+XQMYvvVZRwKg1Z8dIWLLci9eVNuMMfIh8nSQ8408zR
 DoiKj/2oKevyyiMpkenbxXo9BwqjD9vcgzXN6tB9gFb2VGcaCcZ/9dAhpclfWx3Q7B16
 xajQ==
X-Gm-Message-State: AOAM53042e6DT5C8k3i5L/8bEysK2ObsBVN91QI8T0fS1uYnrMKGjDcn
 5AH86Z9gH1iOqPTZR6YkqwVDAFy6yXGsQOmDq7VnjtMZeS4HRux5D+WaUpzGOwoNzmwo1yu3HMX
 M9nuQtP4h95+KBqA=
X-Received: by 2002:a5d:50c7:: with SMTP id f7mr10734798wrt.18.1616266741997; 
 Sat, 20 Mar 2021 11:59:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw/KaH8G3Bpa0Vnm6cb2vSjiWkwa4Ntb2dTJ92n0z/BrQ/vvY7b/Q3TB0Sek3ykTx1DcfHMwg==
X-Received: by 2002:a5d:50c7:: with SMTP id f7mr10734789wrt.18.1616266741845; 
 Sat, 20 Mar 2021 11:59:01 -0700 (PDT)
Received: from redhat.com ([2a10:800e:f0d3:0:b69b:9fb8:3947:5636])
 by smtp.gmail.com with ESMTPSA id c26sm14699721wrb.87.2021.03.20.11.59.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Mar 2021 11:59:01 -0700 (PDT)
Date: Sat, 20 Mar 2021 14:58:58 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: QEMU PCI subsystem: what code is responsible for making accesses
 to non-mapped addresses read as -1?
Message-ID: <20210320144325-mutt-send-email-mst@kernel.org>
References: <CAFEAcA_M4zK1aLdO2QdOUgNROTLdHUwLHnCKoUT1BpTcF-cTMw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_M4zK1aLdO2QdOUgNROTLdHUwLHnCKoUT1BpTcF-cTMw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Mar 19, 2021 at 12:35:31PM +0000, Peter Maydell wrote:
> I'm looking at a bug reported against the QEMU arm virt board's pci-gpex
> PCI controller: https://bugs.launchpad.net/qemu/+bug/1918917
> where an attempt to write to an address within the PCI IO window
> where the guest hasn't mapped a BAR causes a CPU exception rather than
> (what I believe is) the PCI-required behaviour of writes-ignored, reads
> return -1.
> 
> What in the QEMU PCI code is responsible for giving the PCI-spec
> behaviour for accesses to the PCI IO and memory windows where there
> is no BAR? I was expecting the generic PCI code to map a background
> memory region over the whole window to do this, but it looks like it
> doesn't...
> 
> thanks
> -- PMM

As far as I know, at the PCI level what happens is Master Abort
on PCI/PCI-X and Unsupported Request on Express.
PCI spec says:
	The host bus bridge, in PC compatible systems, must return all 1's on a read transaction and
	discard data on a write transaction when terminated with Master-Abort.

We thus implement this per host e.g. on pc compatible systems by
calling pc_pci_as_mapping_init.

A note aside:

PCI Express spec has this weird text:

Read Data Values with UR Completion Status
	Some system configuration software depends on reading a data value of all 1’s when a Configuration
	Read Request is terminated as an Unsupported Request, particularly when probing to determine the
	existence of a device in the system. A Root Complex intended for use with software that depends
	on a read-data value of all 1’s must synthesize this value when UR Completion Status is returned for
	a Configuration Read Request.

the title says "Read Data" while the text says "Configuration Read".
Can't say whether that is intentional.

-- 
MST


