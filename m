Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 666A92FD4B0
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 16:59:38 +0100 (CET)
Received: from localhost ([::1]:55036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2FtR-00013w-GX
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 10:59:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l2FpW-0007hR-Ni
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 10:55:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:20647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l2FpU-00030c-SP
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 10:55:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611158131;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=36GgeSr2jMK7BU6rIbF1ZaJXAV3Tgdsi10/VfLxUYMc=;
 b=BsEDglrrB/XtigwfyOUJAalGZaTWVD3EL7WRDhCgUddyU3CJqcsVTGmSI8jn6wCO9/dMt4
 kbwN7j1sbmDiIF71tod+v0ruMHf3CCEGx1t4x4IMkXRnvCYHz7Yi2JG8PEIRDG7pRj7cWa
 oSgZ9CUgBqnWQYAtPhDaZ2L2bdrPNPg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-46-V868lgg0O7e8gia14YK1tQ-1; Wed, 20 Jan 2021 10:55:28 -0500
X-MC-Unique: V868lgg0O7e8gia14YK1tQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A6F1E107ACF8;
 Wed, 20 Jan 2021 15:55:27 +0000 (UTC)
Received: from [10.3.113.116] (ovpn-113-116.phx2.redhat.com [10.3.113.116])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 630785D9C2;
 Wed, 20 Jan 2021 15:55:27 +0000 (UTC)
Subject: Re: [PATCH] runstate: cleanup reboot and panic actions
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210120143706.345821-1-pbonzini@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <73368783-b35e-8363-b027-b210cbc3ec23@redhat.com>
Date: Wed, 20 Jan 2021 09:55:26 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210120143706.345821-1-pbonzini@redhat.com>
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
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.094, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Alejandro Jimenez <alejandro.j.jimenez@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/20/21 8:37 AM, Paolo Bonzini wrote:
> The possible choices for panic, reset and watchdog actions are inconsistent.
> 
> "-action panic=poweroff" should be renamed to "-action panic=shutdown"
> on the command line.  This is because "-action panic=poweroff" and
> "-action watchdog=poweroff" have slightly different semantics, the first
> does an unorderly exit while the second goes through qemu_cleanup().  With
> this change, -no-shutdown would not have to change "-action panic=pause"
> "pause", just like it does not have to change the reset action.
> 
> "-action reboot=none" should be renamed to "-action reboot=reset".
> This should be self explanatory, since for example "-action panic=none"
> lets the guest proceed without taking any action.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  qapi/run-state.json       | 10 ++++++----
>  qemu-options.hx           |  8 ++++----
>  softmmu/runstate-action.c |  4 ++--
>  softmmu/runstate.c        |  7 ++++---
>  softmmu/vl.c              |  2 +-
>  5 files changed, 17 insertions(+), 14 deletions(-)
> 
> diff --git a/qapi/run-state.json b/qapi/run-state.json
> index 1f3b329f05..43d66d700f 100644
> --- a/qapi/run-state.json
> +++ b/qapi/run-state.json
> @@ -330,14 +330,14 @@
>  #
>  # Possible QEMU actions upon guest reboot
>  #
> -# @none: Reset the VM
> +# @reset: Reset the VM
>  #
> -# @shutdown: Shutdown the VM and exit
> +# @shutdown: Shutdown the VM and exit, according to the shutdown action
>  #
>  # Since: 6.0
>  ##
>  { 'enum': 'RebootAction',
> -  'data': [ 'none', 'shutdown' ] }
> +  'data': [ 'reset', 'shutdown' ] }

Given that the enum is new, we are not locked into back-compat, so
changing the names to be consistent is reasonable.

Reviewed-by: Eric Blake <eblake$redhat.com>


> +++ b/softmmu/runstate.c
> @@ -471,14 +471,15 @@ void qemu_system_guest_panicked(GuestPanicInformation *info)
>      }
>      /*
>       * TODO:  Currently the available panic actions are: none, pause, and
> -     * poweroff, but in principle debug and reset could be supported as well.
> +     * shutdown, but in principle debug and reset could be supported as well.
>       * Investigate any potential use cases for the unimplemented actions.
>       */
> -    if (panic_action == PANIC_ACTION_PAUSE) {
> +    if (panic_action == PANIC_ACTION_PAUSE
> +        || (panic_action == PANIC_ACTION_SHUTDOWN && shutdown_action == SHUTDOWN_ACTION_PAUSE)) {

Long line.


-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


