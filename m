Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D122DC6C9
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 19:55:22 +0100 (CET)
Received: from localhost ([::1]:47496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpbxJ-0003W6-95
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 13:55:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kpbw1-0002rz-68
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 13:54:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35468)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kpbvy-0005Mt-QO
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 13:54:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608144836;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1YGO8Fztcd+iO8PdJh/8UQ6whHCwMUGGAahaRHA4rbM=;
 b=C5s1LFU2qeiVDHXIsvhIJ4a2EjpbXa1qx8JyOD5KzbsCtLSvbFGmPKURde8JrjeadCSBXL
 7TujNUdWOFsR68LuWNMVdWqAwVKNa14ar0iYzjTKk/f6xxafM3Jjq8ewNv8iPgf0KyaLzI
 s+gaiRRPVYzm2U7dHjDBD8c3EsDpvN4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-473-8q1N2gk9PxCNNVh2Yb8l4Q-1; Wed, 16 Dec 2020 13:53:54 -0500
X-MC-Unique: 8q1N2gk9PxCNNVh2Yb8l4Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EA917107ACE6;
 Wed, 16 Dec 2020 18:53:53 +0000 (UTC)
Received: from work-vm (ovpn-115-143.ams2.redhat.com [10.36.115.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F3F855D9CD;
 Wed, 16 Dec 2020 18:53:52 +0000 (UTC)
Date: Wed, 16 Dec 2020 18:53:50 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH 01/20] hmp: Simplify how qmp_human_monitor_command() gets
 output
Message-ID: <20201216185350.GE3008@work-vm>
References: <20201211171152.146877-1-armbru@redhat.com>
 <20201211171152.146877-2-armbru@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201211171152.146877-2-armbru@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org, mdroth@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Markus Armbruster (armbru@redhat.com) wrote:
> Commit 48c043d0d1 "hmp: human-monitor-command: stop using the Memory
> chardev driver" left us "if string is non-empty, duplicate it, else
> duplicate the empty string".  Meh.  Duplicate it unconditionally.
> 
> Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  monitor/misc.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/monitor/misc.c b/monitor/misc.c
> index 398211a034..6c3e8506a9 100644
> --- a/monitor/misc.c
> +++ b/monitor/misc.c
> @@ -136,11 +136,7 @@ char *qmp_human_monitor_command(const char *command_line, bool has_cpu_index,
>      handle_hmp_command(&hmp, command_line);
>  
>      WITH_QEMU_LOCK_GUARD(&hmp.common.mon_lock) {
> -        if (qstring_get_length(hmp.common.outbuf) > 0) {
> -            output = g_strdup(qstring_get_str(hmp.common.outbuf));
> -        } else {
> -            output = g_strdup("");
> -        }
> +        output = g_strdup(qstring_get_str(hmp.common.outbuf));
>      }
>  
>  out:
> -- 
> 2.26.2
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


