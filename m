Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2189E22B028
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jul 2020 15:15:49 +0200 (CEST)
Received: from localhost ([::1]:49786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jyb4e-00024h-6G
	for lists+qemu-devel@lfdr.de; Thu, 23 Jul 2020 09:15:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anthony.perard@citrix.com>)
 id 1jyb3p-0001dd-0z
 for qemu-devel@nongnu.org; Thu, 23 Jul 2020 09:14:57 -0400
Received: from esa4.hc3370-68.iphmx.com ([216.71.155.144]:18580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anthony.perard@citrix.com>)
 id 1jyb3n-0003MI-2U
 for qemu-devel@nongnu.org; Thu, 23 Jul 2020 09:14:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595510095;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=SGBze1Rjcp7fRvfsWjbOM2rEJ4H/kksfqLsKRbOGU0I=;
 b=EbKwPs+9MWqxIAYsTpojK9FZsdE4SSeZ6sWz77QfkC2wgOk+5Ah0mvI9
 0R4x2b+xucH5cz36k+g0dBh3TfEnpj2XRwwqSHXmImH20hiwQcmk3wgrT
 B3pmlu3zjgItLbZOi+Mi085dbyC8aAeXhSih4Ym3zKLvn7iG6Tjjhh5Ed c=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 5qdSDU3UUcaR8NZWLyQCc/rdwSlq6EykCbuVoDXqyKfhf94BhiolQ5uBfPtT+gKxGbeWTDQU5j
 eUb87uKOh6ZoTVhfiKLAzx1WBOveZTUre1NKvvfhf0yniOZAWvXRBIoWx5RXJZHclvN0Io0B8U
 j+E3hF1+pRNd7mRKGHsWWiiNT5TyCMOp07cRm1isbXTx/FaW8KJPjKS5DjGg5g1SnGonGt6Pu2
 8NdSMjBKR5tBxSlT1VsL8l3IchNSN7TBwPA5U/z8g3D2jmRL8T4V7Lk4Ym4PRLSiA+qC7Pwnqy
 WcM=
X-SBRS: 2.7
X-MesageID: 23901120
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,386,1589256000"; d="scan'208";a="23901120"
Date: Thu, 23 Jul 2020 14:14:50 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Subject: Re: [PATCH] acpi: Fix access to PM1 control and status registers
Message-ID: <20200723131450.GB2866@perard.uk.xensource.com>
References: <20200701110549.148522-1-anthony.perard@citrix.com>
 <20200701075914-mutt-send-email-mst@kernel.org>
 <20200701124836.GD2030@perard.uk.xensource.com>
 <3eb33054-e9b0-58f2-8d50-9cc26314dcfb@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <3eb33054-e9b0-58f2-8d50-9cc26314dcfb@msgid.tls.msk.ru>
Received-SPF: pass client-ip=216.71.155.144;
 envelope-from=anthony.perard@citrix.com; helo=esa4.hc3370-68.iphmx.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/23 09:14:52
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jul 23, 2020 at 03:54:18PM +0300, Michael Tokarev wrote:
> 01.07.2020 15:48, Anthony PERARD wrote:
> 
> > I actually tried, but when reading `addr` or `addr+1` I had the same
> > value. So I guess `addr` wasn't taken into account.
> 
> AFAICS, these registers aren't actually supposed to be accessed like this
> as addr+1. ACPI and ISA spec states multiple times that `addr' should be
> accessible as 8/16/32 bits, but it does not mention `addr+1' or `addr+2'.

I guess that's why there's never been a "fix" for this before. Thanks
for the explanation.

> So far all now-rejected accesses we've seen (not that many but still) goes
> to `addr', not to any other variation of it.
> 
> /mjt

-- 
Anthony PERARD

