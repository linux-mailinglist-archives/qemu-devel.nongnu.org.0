Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0797F5F2EF9
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Oct 2022 12:43:58 +0200 (CEST)
Received: from localhost ([::1]:59152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofIvV-00088D-5L
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 06:43:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ofIqp-0002wO-F0
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 06:39:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ofIqh-0002gk-6s
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 06:39:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664793538;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9udo0lZU8k2JVUUajgGpYSUEIvzy1k9ik8eRYnGYrYI=;
 b=b6AHyJwRQpcY60YcldvhLFIOAL3njbvKSA6IT71MFM552mi9go0hhcs5Dmk8lldDDCUnem
 UJGixYBWCjR+KrxjCCavUogzDm+l6EF7DWr0JSjL6QdPwh1hXxzuFwyxcjJ7+6aveha4RD
 +9TSeMXb68rGHFc7LD3ysqw1Y0kimh0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-367-TJD9dDsOOJGSUBiZm3QrCw-1; Mon, 03 Oct 2022 06:38:57 -0400
X-MC-Unique: TJD9dDsOOJGSUBiZm3QrCw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C2B0B87B2A3
 for <qemu-devel@nongnu.org>; Mon,  3 Oct 2022 10:38:56 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.10])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 431512027061;
 Mon,  3 Oct 2022 10:38:56 +0000 (UTC)
Date: Mon, 3 Oct 2022 11:38:53 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH v2 1/3] io/command: use glib GSpawn, instead of
 open-coding fork/exec
Message-ID: <Yzq7vemQN5k44qNK@redhat.com>
References: <20220902111900.3029260-1-marcandre.lureau@redhat.com>
 <20220902111900.3029260-2-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220902111900.3029260-2-marcandre.lureau@redhat.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Sep 02, 2022 at 03:18:58PM +0400, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Simplify qio_channel_command_new_spawn() with GSpawn API. This will
> allow to build for WIN32 in the following patches.

There a change in semantics here too. The current code only touches
stdin/stdout/stderr. Any other  FDs which do NOT have O_CLOEXEC set
will be inherited.  With the new code, all FDs except stdin/out/err
will be explicitly closed, because we don't set the flag
G_SPAWN_LEAVE_DESCRIPTORS_OPEN.

The only place we use QIOChannelCommand today is the migration
exec: protocol, and that is only declared to use stdin/stdout.

IOW, this is a good improvement, but we should call this out in
the commit message as a behaviour change.

> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>  include/io/channel-command.h |   2 +-
>  io/channel-command.c         | 105 ++++++-----------------------------
>  2 files changed, 19 insertions(+), 88 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


