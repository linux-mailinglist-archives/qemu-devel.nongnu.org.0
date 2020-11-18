Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D4C92B7FD6
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 15:55:54 +0100 (CET)
Received: from localhost ([::1]:32866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfOsD-0002Xq-Gx
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 09:55:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kfOr4-0001fi-26
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 09:54:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59976)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kfOr2-0005in-9X
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 09:54:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605711279;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4wLUKnTH9mM07MbFABrmTWosO79GJCBxHfVpgd8GctU=;
 b=QhxmRjltPuV/rPJM/XqQEYeIdvqxm7GHsnlICk/e9MtU54Cv3GrxrgNe5t23jFVyUSaZAY
 xU7GzGLOkYcm8mq62ivq9jlky/N9pIi+jgzWHst3ka2ML7LVuR+GS52cUj+h1JmX3ayuDu
 xz+/7hITPsAyOQPDR7kGcr3aeIDmQmI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-412-6dG92q1CM_OvWcB280_bTQ-1; Wed, 18 Nov 2020 09:54:29 -0500
X-MC-Unique: 6dG92q1CM_OvWcB280_bTQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0CB858144E3;
 Wed, 18 Nov 2020 14:54:28 +0000 (UTC)
Received: from [10.3.112.188] (ovpn-112-188.phx2.redhat.com [10.3.112.188])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 532685D9CA;
 Wed, 18 Nov 2020 14:54:27 +0000 (UTC)
Subject: Re: [PATCH v2 0/7] UFFD write-tracking migration/snapshots
To: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>, qemu-devel@nongnu.org
References: <20201118132048.429092-1-andrey.gruzdev@virtuozzo.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <059d386a-d02f-db1a-8a2f-9359c6cfe17a@redhat.com>
Date: Wed, 18 Nov 2020 08:54:26 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201118132048.429092-1-andrey.gruzdev@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 19:41:43
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Den Lunev <den@openvz.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/18/20 7:20 AM, Andrey Gruzdev wrote:
> Currently the only way to make (external) live VM snapshot is using existing
> dirty page logging migration mechanism. The main problem is that it tends to
> produce a lot of page duplicates while running VM goes on updating already
> saved pages. That leads to the fact that vmstate image size is commonly several
> times bigger then non-zero part of virtual machine's RSS. Time required to
> converge RAM migration and the size of snapshot image severely depend on the
> guest memory write rate, sometimes resulting in unacceptably long snapshot
> creation time and huge image size.
> 
> This series propose a way to solve the aforementioned problems. This is done
> by using different RAM migration mechanism based on UFFD write protection
> management introduced in v5.7 kernel. The migration strategy is to 'freeze'
> guest RAM content using write-protection and iteratively release protection
> for memory ranges that have already been saved to the migration stream.
> At the same time we read in pending UFFD write fault events and save those
> pages out-of-order with higher priority.
> 
> How to use:
> 1. Enable write-tracking migration capability
>    virsh qemu-monitor-command <domain> --hmp migrate_set_capability.
> track-writes-ram on
> 
> 2. Start the external migration to a file
>    virsh qemu-monitor-command <domain> --hmp migrate exec:'cat > ./vm_state'
> 
> 3. Wait for the migration finish and check that the migration has completed.
> state.
> 
> Andrey Gruzdev (7):
>   Introduce 'track-writes-ram' migration capability.
>   Introduced UFFD-WP low-level interface helpers. Implemented support
>     for the whole RAM block memory protection/un-protection. Higher
>     level ram_write_tracking_start() and ram_write_tracking_stop() to
>     start/stop tracking memory writes on the whole VM memory.

Subject line is too long on that patch. You probably forgot a newline.
Also, it is more common to not include a trailing '.' in the subject line.

>   Support UFFD write fault processing in ram_save_iterate().
>   Implementation of write-tracking migration thread.
>   Implementation of vm_start() BH.
>   The rest of write tracking migration code.
>   Introduced simple linear scan rate limiting mechanism for write
>     tracking migration.
> 

How does v2 differ from v1?  It makes life easier for reviewers to know
what to look for in the respin that was fixed based on the problems in
the earlier version.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


