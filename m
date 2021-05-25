Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE467390445
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 16:47:12 +0200 (CEST)
Received: from localhost ([::1]:45302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llYKt-0005GV-V0
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 10:47:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1llYJz-0004V3-Hw
 for qemu-devel@nongnu.org; Tue, 25 May 2021 10:46:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54438)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1llYJv-00022o-Sh
 for qemu-devel@nongnu.org; Tue, 25 May 2021 10:46:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621953970;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FcikB48rV0t9McZmxrBb7hdCOZ4MSCZjQvCkguBJ5WQ=;
 b=GoEm/8uCcghvpQ+HRTw4cHmVRdzyy5/fL4uUbmsQ5kQ89IGOKa/t+I5EzfX2u8NU34TkQE
 vWf64tKjhYSSUcyVfrfe2whdZAwwr7BGpVr3si5WkE6Tk3ceFanX6UQpUI5UWspG2e6v+V
 da131IDM/uThsSGeioB5SIThOvs50Es=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-309-DdS6kvaENRudCc-grRz3mQ-1; Tue, 25 May 2021 10:46:07 -0400
X-MC-Unique: DdS6kvaENRudCc-grRz3mQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 38253107ACE3;
 Tue, 25 May 2021 14:46:06 +0000 (UTC)
Received: from redhat.com (ovpn-112-191.phx2.redhat.com [10.3.112.191])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DA15F14103;
 Tue, 25 May 2021 14:46:05 +0000 (UTC)
Date: Tue, 25 May 2021 09:46:04 -0500
From: Eric Blake <eblake@redhat.com>
To: Kit Westneat <kit.westneat@gmail.com>
Subject: Re: [PATCH 1/3] block/blkdebug: add blocksize parameter
Message-ID: <20210525144604.vcbujj6tlpjp3qr2@redhat.com>
Mail-Followup-To: Kit Westneat <kit.westneat@gmail.com>,
 qemu-devel@nongnu.org, pbonzini@redhat.com
References: <20210525124753.528516-1-kit.westneat@gmail.com>
 <20210525124753.528516-2-kit.westneat@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210525124753.528516-2-kit.westneat@gmail.com>
User-Agent: NeoMutt/20210205
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, May 25, 2021 at 12:47:51PM +0000, Kit Westneat wrote:
> Allow users to specify the block size of the qdev for testing purposes.
> 
> Signed-off-by: Kit Westneat <kit.westneat@gmail.com>
> ---
>  block/blkdebug.c | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)

Should this also be selectable when using QAPI to create a blkdebug
device over QMP?

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


