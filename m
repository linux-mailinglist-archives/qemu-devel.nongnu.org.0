Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B45C44040C
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 22:26:48 +0200 (CEST)
Received: from localhost ([::1]:57972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgYSd-0001YR-Fk
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 16:26:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mgXuh-0002Ks-6v
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 15:51:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mgXuf-0004JI-Fk
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 15:51:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635537100;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dJfSlRBxhyniqYK5lJrFAQhbMFgKZqdQv1mB3Vt7mlg=;
 b=VHDpYQD5UfaRtQMALwwPpnbGLNRKJDG8RS6unA/nDWXkrkCCUJyrBcix3Ysb8AIvuufeac
 pNd/qvbCqJn6jqkp4TB2bm1wrw8sdZVWjyig6cWERqJOAriW/KRxIjGJV1igfT6l5BLPRL
 Sam9Eo3u7NdEbw85dbiGUYFpOZ/qakY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-503-j2_QfdbBPKam9i7OeBJCGw-1; Fri, 29 Oct 2021 15:51:37 -0400
X-MC-Unique: j2_QfdbBPKam9i7OeBJCGw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1530FA40DB;
 Fri, 29 Oct 2021 19:51:36 +0000 (UTC)
Received: from redhat.com (ovpn-112-232.phx2.redhat.com [10.3.112.232])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 240EE60854;
 Fri, 29 Oct 2021 19:51:35 +0000 (UTC)
Date: Fri, 29 Oct 2021 14:51:33 -0500
From: Eric Blake <eblake@redhat.com>
To: Stefan Reiter <s.reiter@proxmox.com>
Subject: Re: [PATCH v7 1/4] monitor/hmp: add support for flag argument with
 value
Message-ID: <20211029195133.fhjdznp2vi63xi6e@redhat.com>
References: <20211021100135.4146766-1-s.reiter@proxmox.com>
 <20211021100135.4146766-2-s.reiter@proxmox.com>
MIME-Version: 1.0
In-Reply-To: <20211021100135.4146766-2-s.reiter@proxmox.com>
User-Agent: NeoMutt/20211022
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Wolfgang Bumiller <w.bumiller@proxmox.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Thomas Lamprecht <t.lamprecht@proxmox.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Oct 21, 2021 at 12:01:32PM +0200, Stefan Reiter wrote:
> Adds support for the "-xV" parameter type, where "-x" denotes a flag
> name and the "V" suffix indicates that this flag is supposed to take an
> arbitrary string parameter.
> 
> These parameters are always optional, the entry in the qdict will be
> omitted if the flag is not given.
> 
> Signed-off-by: Stefan Reiter <s.reiter@proxmox.com>
> ---

[so my late v6 reply doesn't get lost...]

> +++ b/monitor/monitor-internal.h
> @@ -63,7 +63,8 @@
>   * '.'          other form of optional type (for 'i' and 'l')
>   * 'b'          boolean
>   *              user mode accepts "on" or "off"
> - * '-'          optional parameter (eg. '-f')
> + * '-'          optional parameter (eg. '-f'); if followed by an 'V', it

s/an/a/

Reviewed-by: Eric Blake <eblake@redhat.com>

> + *              specifies an optional string param (e.g. '-fV' allows '-f foo')
>   *
>   */
>  
> -- 
> 2.30.2
> 
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


