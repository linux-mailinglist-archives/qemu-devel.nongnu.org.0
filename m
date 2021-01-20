Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42CB82FD8BA
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 19:48:02 +0100 (CET)
Received: from localhost ([::1]:54340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2IWP-0000do-CR
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 13:48:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l2IUd-0008RR-8i
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 13:46:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:46328)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l2IUb-0003ZN-Ek
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 13:46:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611168368;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5UbZFKJQjctEIxPaIm3Zdx+8RK5xoOL+e9bMJEd4tCE=;
 b=gV7IYI2NsFutYLK03tmXuGnEPSD1uylotbVvU+nMFksrrv80NQ69rcF7K+zJYkIQfM4hYv
 hCamARiJxWWVUtnDFJ3iqVRhfX5DBiwO1CQlVPcge+7+VSKXQHfV5Y4YZHYRoJbqelBWSG
 fTNICWMdAzBsxrDhW0Pyj3ZaKuiykdw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-282-PRKhxd86MSqYhVFxL-5AyQ-1; Wed, 20 Jan 2021 13:46:03 -0500
X-MC-Unique: PRKhxd86MSqYhVFxL-5AyQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4A40D9CC1A;
 Wed, 20 Jan 2021 18:46:02 +0000 (UTC)
Received: from [10.3.113.116] (ovpn-113-116.phx2.redhat.com [10.3.113.116])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5F6D8709A4;
 Wed, 20 Jan 2021 18:46:01 +0000 (UTC)
Subject: Re: [PATCH v9 02/11] migration: Make save_snapshot() return bool, not
 0/-1
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210120104411.3084801-1-berrange@redhat.com>
 <20210120104411.3084801-3-berrange@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <6db4a267-5ae1-6241-2b76-9fc6007208ad@redhat.com>
Date: Wed, 20 Jan 2021 12:46:00 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210120104411.3084801-3-berrange@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.094, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>,
 qemu-block@nongnu.org, Juan Quintela <quintela@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/20/21 4:44 AM, Daniel P. Berrangé wrote:
> From: Philippe Mathieu-Daudé <philmd@redhat.com>
> 
> Just for consistency, following the example documented since
> commit e3fe3988d7 ("error: Document Error API usage rules"),
> return a boolean value indicating an error is set or not.
> 
> Acked-by: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  include/migration/snapshot.h |  9 ++++++++-
>  migration/savevm.c           | 16 ++++++++--------
>  replay/replay-debugging.c    |  2 +-
>  replay/replay-snapshot.c     |  2 +-
>  4 files changed, 18 insertions(+), 11 deletions(-)


> +++ b/migration/savevm.c
> @@ -2729,7 +2729,7 @@ int qemu_load_device_state(QEMUFile *f)
>      return 0;
>  }
>  
> -int save_snapshot(const char *name, Error **errp)
> +bool save_snapshot(const char *name, Error **errp)
>  {

Missing a 'return -1' that must be changed to 'return false' (see patch
11; if not fixed here, you have a window where you are inadvertently
returning true on failure).

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


