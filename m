Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC4C376712
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 16:33:18 +0200 (CEST)
Received: from localhost ([::1]:56852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lf1XZ-0004Ik-3u
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 10:33:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lf1WU-0003sD-6v
 for qemu-devel@nongnu.org; Fri, 07 May 2021 10:32:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28448)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lf1WQ-00020c-OX
 for qemu-devel@nongnu.org; Fri, 07 May 2021 10:32:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620397925;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oeUia1exX74HRcUR3HIHXsZN/1G8uTAF7cU4nBEvdmM=;
 b=RrnAo0A5gWOGp0GwDx3HNTXdTez0EtVtm/q8sv9dwhzrajt9cU/ym1fwyWAN54djwbY/Hk
 rLmvrEkB9bXRbT01uNwIWq7nd+Ajx8UhjDZ7m5MgTGwnffL7j5lxRfgAWlj0dPk4XUi9KI
 2VBaN0jO5Einz/hw9R3kK+V+N1PQugw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-342-7RwRE2vfNJ-0_PmJhWmbuA-1; Fri, 07 May 2021 10:32:03 -0400
X-MC-Unique: 7RwRE2vfNJ-0_PmJhWmbuA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 829C1C7441;
 Fri,  7 May 2021 14:32:02 +0000 (UTC)
Received: from [10.3.113.56] (ovpn-113-56.phx2.redhat.com [10.3.113.56])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5C5565D9CC;
 Fri,  7 May 2021 14:31:43 +0000 (UTC)
Subject: Re: [PATCH V3 06/22] vl: add helper to request re-exec
To: Steve Sistare <steven.sistare@oracle.com>, qemu-devel@nongnu.org
References: <1620390320-301716-1-git-send-email-steven.sistare@oracle.com>
 <1620390320-301716-7-git-send-email-steven.sistare@oracle.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <e1a9e3ff-6708-f0a0-6f04-d3756aa84c15@redhat.com>
Date: Fri, 7 May 2021 09:31:42 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <1620390320-301716-7-git-send-email-steven.sistare@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/7/21 7:25 AM, Steve Sistare wrote:
> Add a qemu_exec_requested() hook that causes the main loop to exit and
> re-exec qemu using the same initial arguments.  If /usr/bin/qemu-exec
> exists, exec that instead.  This is an optional site-specific trampoline
> that may alter the environment before exec'ing the qemu binary.
> 
> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
> ---

> +static void qemu_exec(void)
> +{
> +    const char *helper = "/usr/bin/qemu-exec";
> +    const char *bin = !access(helper, X_OK) ? helper : argv_main[0];

Reads awkwardly; I would have used '...= access(helper, X_OK) == 0 ?...'

> +
> +    execvp(bin, argv_main);
> +    error_report("execvp failed, errno %d.", errno);

error_report should not be used with a trailing dot.  Also, %d for errno
is awkward, better is:

error_report("execvp failed: %s", strerror(errno));

> +    exit(1);

We aren't consistent about use of EXIT_FAILED.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


