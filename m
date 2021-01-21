Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36C8F2FF7E9
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 23:29:21 +0100 (CET)
Received: from localhost ([::1]:57256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2iS8-0004uH-3f
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 17:29:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l2iRP-0004Va-6W
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 17:28:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56846)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l2iRM-000731-IL
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 17:28:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611268110;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SIpnT17PQlCVeORyQyYH4y5MLMLQI88glytBWCJniBs=;
 b=NeW4rW9KgWsUEjWclkjv0c7hF8qd3R6eIOZ4Hi425fRpJEUc4wIbffppY8JKKZdKqNudV3
 OUIoOc07KG7MkmOn4EJVeHmWazxiF/Lw0uznqxh1wr6A9z3pRG13Y2tVjcUqXhfneYWTXW
 3eEE8Ativkw29CdwV/6ucjrncFS3imw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-256-fX0EHalPOlaUwfQLTSPp0Q-1; Thu, 21 Jan 2021 17:28:26 -0500
X-MC-Unique: fX0EHalPOlaUwfQLTSPp0Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4418159
 for <qemu-devel@nongnu.org>; Thu, 21 Jan 2021 22:28:25 +0000 (UTC)
Received: from [10.3.113.116] (ovpn-113-116.phx2.redhat.com [10.3.113.116])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C176B19CB1;
 Thu, 21 Jan 2021 22:28:15 +0000 (UTC)
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>,
 qemu-devel@nongnu.org, alex.williamson@redhat.com, laine@redhat.com,
 peterx@redhat.com
References: <20210121185113.66277-1-dgilbert@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Subject: Re: [PATCH] migration: Provide a test for migratability
Message-ID: <7f789817-6a2d-124f-57dc-a468f7f596ba@redhat.com>
Date: Thu, 21 Jan 2021 16:28:15 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210121185113.66277-1-dgilbert@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.168,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/21/21 12:51 PM, Dr. David Alan Gilbert (git) wrote:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> 
> Provide a simple way to see if there's currently a migration blocker in
> operation:
> 
> $ ./x86_64-softmmu/qemu-system-x86_64 -nographic -M pc,usb=on -chardev null,id=n -device usb-serial,chardev=n
> 
> (qemu) info migratable
> Error: State blocked by non-migratable device '0000:00:01.2/1/usb-serial'
> 
> $ ./x86_64-softmmu/qemu-system-x86_64 -nographic
> 
> (qemu) info migratable
> Migratable
> 
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> ---


> +++ b/qapi/migration.json
> @@ -366,6 +366,20 @@
>  ##
>  { 'command': 'query-migrate', 'returns': 'MigrationInfo' }
>  
> +##
> +# @query-migratable:
> +# Tests whether it will be possible to migrate the VM in the current state.
> +#
> +# Returns: nothing on success (i.e. if the VM is migratable)

Do we really need a new command?  Or can we get away with enhancing the
existing 'query-migrate' to add another bool field to 'MigrationInfo'?

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


