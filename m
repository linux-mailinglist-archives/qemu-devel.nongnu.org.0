Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 757E43B6B97
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 01:57:14 +0200 (CEST)
Received: from localhost ([::1]:60452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ly17o-0000PL-Tf
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 19:57:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ly16u-000864-Uh
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 19:56:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44182)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ly16q-00006V-Ly
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 19:56:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624924570;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=v1COVOVofbPo/e33IB2BNxQ46AUVt2Tjy4zY1XXEb+Y=;
 b=i8u8GYhAE8I+kxvDzcIiz/CyZZDRUxvU1UgzlrfAE41XJ/N5f6IjIzHXI8su1evQ3NtBAT
 2ed8oO9aoA1c89p4Ysyof+aaScohHd4Ed80jSs5jjl0leT7HWRLGhKmas63fv9dN7rxlDM
 VSKn0mfimHUF1Xc0tdAgjz8Z+ulXcuA=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-564-6XOAsUpFO8WBniy4Gc-vnA-1; Mon, 28 Jun 2021 19:56:08 -0400
X-MC-Unique: 6XOAsUpFO8WBniy4Gc-vnA-1
Received: by mail-ed1-f71.google.com with SMTP id
 j19-20020aa7c4130000b029039497d5cdbeso10559558edq.15
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 16:56:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=v1COVOVofbPo/e33IB2BNxQ46AUVt2Tjy4zY1XXEb+Y=;
 b=FpXmKZSkF8CVdCMWM5QLywuexzpqw5wpw3lF8gNYFGcIQa2Xqn14LA+Y/THbkOYVdf
 f+9kXUpy9D6qk2gY/pesU+dv13IqxcHOkRssiLXzGHq3udhLWJ1ZgFKtgrApmST043VB
 CQpr5REy6Z09HtGGva6jB5inmWeQB7vUimnCFzjrJm5ib35Q1Y8ftqCzMI6kv8qZhwG3
 cTizbIpjB2I0wS0ilvWlyDwU2fZr25KhBYf7/HIul5JWTDCVpbL/F9uVHkybRRlAXxEg
 FMdpG6KowC2TXMFeIh/QvUMKHVYPpNB0FgeyI9MeduaIrwfGBqK/ux7E2BZclNHbEAHd
 Kjjw==
X-Gm-Message-State: AOAM533WlykAnkuGyTswygB2JmNMTA3aO0i0N+jbLJcYbbwL+sCdKImN
 sNtgTWkLbTdQ771DliCiZ73ybGgv5oQ6Ue5mKZ+tqkwECPsTg/YR2RWPts4+n4Hn/R4JPZ/1wa8
 za4DF0cYmPHC2+xY=
X-Received: by 2002:aa7:d74d:: with SMTP id a13mr36811885eds.43.1624924567684; 
 Mon, 28 Jun 2021 16:56:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzxS9aI575u9GFNAtXEQqSU0Xv3vEYGadMUG3VrOi1XdIYXv/jc9bif/8RCbeFIK4WLTH7Unw==
X-Received: by 2002:aa7:d74d:: with SMTP id a13mr36811867eds.43.1624924567438; 
 Mon, 28 Jun 2021 16:56:07 -0700 (PDT)
Received: from redhat.com ([77.126.198.14])
 by smtp.gmail.com with ESMTPSA id a1sm10436445edt.16.2021.06.28.16.56.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jun 2021 16:56:06 -0700 (PDT)
Date: Mon, 28 Jun 2021 19:56:03 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH 0/2] pc: acpi: revert back to 5.2 PCI slot enumeration
Message-ID: <20210628195558-mutt-send-email-mst@kernel.org>
References: <20210624204229.998824-1-imammedo@redhat.com>
 <YNnJOWdLZc97T73L@stefanha-x1.localdomain>
MIME-Version: 1.0
In-Reply-To: <YNnJOWdLZc97T73L@stefanha-x1.localdomain>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.375,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: berrange@redhat.com, john.sucaet@ekinops.com, qemu-stable@nongnu.org,
 qemu-devel@nongnu.org, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jun 28, 2021 at 02:06:01PM +0100, Stefan Hajnoczi wrote:
> On Thu, Jun 24, 2021 at 04:42:26PM -0400, Igor Mammedov wrote:
> > Commit b7f23f62e40 (pci: acpi: add _DSM method to PCI devices),
> > regressed network interface naming for Linux guests in some cases.
> > This reverts PCI slot enumeration to its state before 6.0.
> > For details see 2/3 patch.
> > 
> > Thanks Stefan for troubleshooting!
> > 
> > Reported-by: john.sucaet@ekinops.com  
> > CC: stefanha@redhat.com
> > CC: qemu-stable@nongnu.org
> > CC: mst@redhat.com
> > CC: marcel.apfelbaum@gmail.com
> > CC: berrange@redhat.com
> > 
> > Igor Mammedov (2):
> >   tests: acpi: prepare for changing DSDT tables
> >   acpi: pc: revert back to v5.2 PCI slot enumeration
> > 
> >  tests/qtest/bios-tables-test-allowed-diff.h | 10 ++++++++++
> >  hw/i386/acpi-build.c                        |  9 +++++++--
> >  2 files changed, 17 insertions(+), 2 deletions(-)
> > 
> > -- 
> > 2.27.0
> > 
> 
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

Tagged, thanks!


