Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D69530C2C4
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 15:59:44 +0100 (CET)
Received: from localhost ([::1]:35798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6x9b-0005ul-N6
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 09:59:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l6wp7-0005iI-CL
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 09:38:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25811)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l6wp5-00080a-Ks
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 09:38:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612276710;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cewT72B3XdtqHZoD6nrqVygSlSgW1V6sLVFXQu8h63Q=;
 b=OBA/dlJIy23HtUeZb5x5ArAmSCG8nXw7QZRsKVAITyZpazNog+HQh1T0rRb0PaFxUBqR7I
 FV3RVgAJBMFGfZu+RPWY/6UAWhcHpNKK62sMMwixMekQStq9sXURZpy1Z/nK5dlASMdqbu
 fkCkitcPqDzz1A/AmDBaTwQwx19tn5I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-71-4cWC4GmBNKG2GKYbg_N15Q-1; Tue, 02 Feb 2021 09:38:28 -0500
X-MC-Unique: 4cWC4GmBNKG2GKYbg_N15Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B0ED610CE781
 for <qemu-devel@nongnu.org>; Tue,  2 Feb 2021 14:38:27 +0000 (UTC)
Received: from [10.3.112.103] (ovpn-112-103.phx2.redhat.com [10.3.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B3BA960C66;
 Tue,  2 Feb 2021 14:38:14 +0000 (UTC)
Subject: Re: [PATCH 2/2] migration: Display the migration blockers
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>,
 qemu-devel@nongnu.org, peterx@redhat.com, alex.williamson@redhat.com,
 laine@redhat.com
References: <20210202135522.127380-1-dgilbert@redhat.com>
 <20210202135522.127380-3-dgilbert@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <1e37e294-7ce4-ae70-862c-5afa16ff7617@redhat.com>
Date: Tue, 2 Feb 2021 08:38:13 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210202135522.127380-3-dgilbert@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.155, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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

On 2/2/21 7:55 AM, Dr. David Alan Gilbert (git) wrote:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> 
> Update 'info migrate' to display migration blocking information.
> If the outbound migration is not blocked, there is no change, however
> if it is blocked a message is displayed with a list of reasons why,
> e.g.
> 
> qemu-system-x86_64 -nographic  -smp 4 -m 4G -M pc,usb=on \
>  -chardev null,id=n -device usb-serial,chardev=n \
>  -virtfs local,path=/home,mount_tag=fs,security_model=none \
>  -drive if=virtio,file=myimage.qcow2
> 
> (qemu) info migrate
> globals:
> store-global-state: on
> only-migratable: off
> send-configuration: on
> send-section-footer: on
> decompress-error-check: on
> clear-bitmap-shift: 18
> Outgoing migration blocked:
>   Migration is disabled when VirtFS export path '/home' is mounted in the guest using mount_tag 'fs'
>   non-migratable device: 0000:00:01.2/1/usb-serial
> 
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> ---
>  monitor/hmp-cmds.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 

> +++ b/monitor/hmp-cmds.c
> @@ -224,6 +224,15 @@ void hmp_info_migrate(Monitor *mon, const QDict *qdict)
>  
>      migration_global_dump(mon);
>  
> +    if (info->blocked) {

Would be slightly more accurate to gate on info->has_blocked_reasons (as
written, you are depending on the fact that patch 1 always sets blocked
and has_blocked_reasons to the same value); which again highlights the
redundancy of a bool duplicating the presence of the optional ['str']
member.  But since the code works as written,

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


