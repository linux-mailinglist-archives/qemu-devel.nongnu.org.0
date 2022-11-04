Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9986261A116
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 20:34:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1or2R3-0003R4-6Q; Fri, 04 Nov 2022 15:33:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1or2Qz-0003Qm-Bn
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 15:32:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1or2Qv-0003Gr-TK
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 15:32:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667590372;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pRiUeDO/hK7T267GcMyAqSILWp7T/JSJMYlHp8ReqM4=;
 b=HsAeuR76LNcze+uhbZUNm3vcEl+61ohEnfcYmYZI2g1GGCW+kIkjpeAPwPghc/dUq6V7cS
 CISv3mbNwMDmikyPVpr7NHgwrypKQjzrZRR7eNrWRCtyFDxGEPPPzBS1/cFqrD+lUvjViR
 3r8VdnrNWjLv3+5Oq3trpeusAKdXMBk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-557-XklV7K7lPteYm94OFFgL-A-1; Fri, 04 Nov 2022 15:32:49 -0400
X-MC-Unique: XklV7K7lPteYm94OFFgL-A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CE0FA833A0D;
 Fri,  4 Nov 2022 19:32:48 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.141])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3427B40C83EC;
 Fri,  4 Nov 2022 19:32:48 +0000 (UTC)
Date: Fri, 4 Nov 2022 14:32:46 -0500
From: Eric Blake <eblake@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, jsnow@redhat.com, michael.roth@amd.com,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-block@nongnu.org
Subject: Re: [PATCH v3 08/30] blockdev: Clean up abuse of DriveBackup member
 format
Message-ID: <20221104193246.bmsbgd3ax2t5wtsu@redhat.com>
References: <20221104160712.3005652-1-armbru@redhat.com>
 <20221104160712.3005652-9-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221104160712.3005652-9-armbru@redhat.com>
User-Agent: NeoMutt/20220429
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.045,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Nov 04, 2022 at 05:06:50PM +0100, Markus Armbruster wrote:
> drive-backup argument @format defaults to the format of the source
> unless @mode is "existing".
> 
> drive_backup_prepare() implements this by copying the source's
> @format_name to DriveBackup member @format.  It leaves @has_format
> false, violating the "has_format == !!format" invariant.  Unclean.
> Falls apart when we elide @has_format (commit after next): then QAPI
> passes @format, which is a string constant, to g_free().  iotest 056
> duly explodes.
> 
> Clean it up.  Since the value stored in member @format is not actually
> used outside this function, use a local variable instead of modifying
> the QAPI object.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> Cc: Kevin Wolf <kwolf@redhat.com>
> Cc: Hanna Reitz <hreitz@redhat.com>
> Cc: qemu-block@nongnu.org
> ---
>  blockdev.c | 17 +++++++++--------
>  1 file changed, 9 insertions(+), 8 deletions(-)
>

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


