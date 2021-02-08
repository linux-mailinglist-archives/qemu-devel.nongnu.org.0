Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB2A313764
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 16:26:06 +0100 (CET)
Received: from localhost ([::1]:58234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l98QO-0006np-MS
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 10:26:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jfreimann@redhat.com>)
 id 1l92AA-0003i7-HR
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 03:44:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:41701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jfreimann@redhat.com>)
 id 1l929l-00069f-No
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 03:44:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612773862;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=f7oC+3RHGUxaBRrbhAMOR11p57t03HLiY34SOl0hCz0=;
 b=M8gTywe/mvUKiKajK0fNuR4Nv0sZLlDIQbC9UGJ22WRTvA9a8eYOo04Jn+gPruu0WgpMTg
 rRcSvUYuW97ZpoUCrdRxLoKUraDT5KDcbKDYpXPBh6AVdXsiqbC10HstyQhKiub/k39pSz
 EP1HTokn1unYYFhIyCDNgmNRPoz7SfU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-312-nUnH38ICMzCI5GXpCPFS2g-1; Mon, 08 Feb 2021 03:43:00 -0500
X-MC-Unique: nUnH38ICMzCI5GXpCPFS2g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1C42A835E21;
 Mon,  8 Feb 2021 08:42:59 +0000 (UTC)
Received: from localhost (ovpn-112-179.ams2.redhat.com [10.36.112.179])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 82B0510016F6;
 Mon,  8 Feb 2021 08:42:58 +0000 (UTC)
Date: Mon, 8 Feb 2021 09:42:56 +0100
From: Jens Freimann <jfreimann@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH 1/2] pci: cleanup failover sanity check
Message-ID: <20210208084256.GD4035@linux.fritz.box>
References: <20210206123955.2196514-1-lvivier@redhat.com>
 <20210206123955.2196514-2-lvivier@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210206123955.2196514-2-lvivier@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jfreimann@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jfreimann@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: qemu-trivial@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 qemu-devel@nongnu.org, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Feb 06, 2021 at 01:39:54PM +0100, Laurent Vivier wrote:
>Commit a1190ab628 has added a "allow_unplug_during_migration = true" at
>the end of the main "if" block, so it is not needed to set it anymore
>in the previous checking.
>
>Remove it, to have only sub-ifs that check for needed conditions and exit
>if one fails.
>
>Fixes: 4f5b6a05a4e7 ("pci: add option for net failover")
>Fixes: a1190ab628c0 ("migration: allow unplug during migration for failover devices")
>Cc: jfreimann@redhat.com
>Signed-off-by: Laurent Vivier <lvivier@virtlab415.virt.lab.eng.bos.redhat.com>
>---
> hw/pci/pci.c | 6 ++----
> 1 file changed, 2 insertions(+), 4 deletions(-)
>

Reviewed-by: Jens Freimann <jfreimann@redhat.com>

Thank you Laurent!

regards,
Jens 


