Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F7A3E0728
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 20:06:32 +0200 (CEST)
Received: from localhost ([::1]:57248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBLHj-0007xP-Ae
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 14:06:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mBJ8u-0000pw-Hm
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 11:49:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50349)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mBJ8p-00063y-0S
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 11:49:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628092149;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QqVq8bqv6XIsYVRhSwkzitF+fzrbjfynwJc+6U1eDyY=;
 b=DvDFDLc85mfZ7HsPNn/DA13Mq6zJbUNIkYOD7m/uRKb3ByfWFrTXUtVcYoLC7kLWEV8XVW
 VI1UCbXPv6SMiUOBGe/H2oB3rdUn/aE+/mszyYRq+HARKsInW3KLFja4yKisJfuvUI8LvW
 EZ6pBqcd4EIOC0G9p6LqtJtgbCSIy5k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-24-egn4j5IqOja2AqudhWNpHg-1; Wed, 04 Aug 2021 11:49:08 -0400
X-MC-Unique: egn4j5IqOja2AqudhWNpHg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 948B2EC1A0;
 Wed,  4 Aug 2021 15:49:07 +0000 (UTC)
Received: from redhat.com (ovpn-113-152.phx2.redhat.com [10.3.113.152])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C352769CBA;
 Wed,  4 Aug 2021 15:48:51 +0000 (UTC)
Date: Wed, 4 Aug 2021 10:48:50 -0500
From: Eric Blake <eblake@redhat.com>
To: Steve Sistare <steven.sistare@oracle.com>
Subject: Re: [PATCH V5 02/25] cpr: reboot mode
Message-ID: <20210804154850.3lfm5mgkz5kfg6w2@redhat.com>
References: <1625678434-240960-1-git-send-email-steven.sistare@oracle.com>
 <1625678434-240960-3-git-send-email-steven.sistare@oracle.com>
MIME-Version: 1.0
In-Reply-To: <1625678434-240960-3-git-send-email-steven.sistare@oracle.com>
User-Agent: NeoMutt/20210205-687-0ed190
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jul 07, 2021 at 10:20:11AM -0700, Steve Sistare wrote:
> Provide the cprsave and cprload functions for live update.  These save and
> restore VM state, with minimal guest pause time, so that qemu may be updated
> to a new version in between.
> 

> +++ b/migration/cpr.c
> @@ -0,0 +1,149 @@

> +
> +QEMUFile *qf_file_open(const char *path, int flags, int mode,
> +                              const char *name, Error **errp)

Indentation is off.

> +{
> +    QIOChannelFile *fioc;
> +    QIOChannel *ioc;
> +    QEMUFile *f;
> +
> +    if (flags & O_RDWR) {
> +        error_setg(errp, "qf_file_open %s: O_RDWR not supported", path);
> +        return 0;
> +    }
> +
> +    fioc = qio_channel_file_new_path(path, flags, mode, errp);

Good, you aren't using bare open(), but reusing existing wrappers,
which means you should be able to accept magic filenames like
"/dev/fdset/1" to open an fd passed in previously.  (I had to come
back to this patch to make sure after starting on patch 3)

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


