Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1847839FE43
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 19:56:55 +0200 (CEST)
Received: from localhost ([::1]:44520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqfyA-0003M0-5s
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 13:56:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lqfwF-0001nx-Lf
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 13:54:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46247)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lqfwC-0005iK-0u
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 13:54:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623174891;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3RDcqCOgB6OYb6COK4omgrAQzql0LV/nJPRsVWELdmM=;
 b=do8ghMMTfay19nzP0el0lw+tEYkK/AvPy0s+5bYkTCeyQgHaoRckiukp3mwwqL+lQ54WOE
 tkXfMrjdqQFDTZSEyw6lp1UnyRH9PjhzUu0ib+WnWAUiHqGNzaHRc81xhKpSl8XcW42mwG
 kbr9hziD8raXdrsfjJKtZ8mns9F2H4c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-315-TvBWaKN9NsuGQ9uqYYArXQ-1; Tue, 08 Jun 2021 13:54:48 -0400
X-MC-Unique: TvBWaKN9NsuGQ9uqYYArXQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8DA491362CC;
 Tue,  8 Jun 2021 17:53:46 +0000 (UTC)
Received: from redhat.com (ovpn-113-53.phx2.redhat.com [10.3.113.53])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 025DC60917;
 Tue,  8 Jun 2021 17:53:45 +0000 (UTC)
Date: Tue, 8 Jun 2021 12:53:44 -0500
From: Eric Blake <eblake@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v4 4/7] file-posix: try BLKSECTGET on block devices too,
 do not round to power of 2
Message-ID: <20210608175344.ttlbcqzwky3rgzid@redhat.com>
References: <20210608131634.423904-1-pbonzini@redhat.com>
 <20210608131634.423904-5-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210608131634.423904-5-pbonzini@redhat.com>
User-Agent: NeoMutt/20210205
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 08, 2021 at 03:16:31PM +0200, Paolo Bonzini wrote:
> bs->sg is only true for character devices, but block devices can also
> be used with scsi-block and scsi-generic.  Unfortunately BLKSECTGET
> returns bytes in an int for /dev/sgN devices, and sectors in a short
> for block devices, so account for that in the code.

Gotta love inconsistent and poorly-documented kernel interfaces! (on my
system, 'man -k BLKSECTGET' had no hits)

> 
> The maximum transfer also need not be a power of 2 (for example I have
> seen disks with 1280 KiB maximum transfer) so there's no need to pass
> the result through pow2floor.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  block/file-posix.c | 44 ++++++++++++++++++++++++--------------------
>  1 file changed, 24 insertions(+), 20 deletions(-)
>

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


