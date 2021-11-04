Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E3D2445B60
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 21:57:43 +0100 (CET)
Received: from localhost ([::1]:51260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mijnq-00010x-NL
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 16:57:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mijmN-0008Vh-0r
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 16:56:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60687)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mijmK-0002c8-5N
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 16:56:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636059367;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IfcsgPcnlI/5XKJkTvjUo3gZAIv46LvfuSL2K44V28E=;
 b=E+GlgoTrurMjNLoiwiLBJwIJuYPeIDB2ruTvzl0HVcx6KajwxG/564tnS4AjeH6IvvJdpz
 wJBb8E24V0+yMu1jhxOZ0q9LH+b0zJID47Z/U6s07ikeJvCdNLKCGx7PMTeOUYDBp3J64O
 JClb2WVMj7vs4oObf3xdqzSemONGMXY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-593-E_i9VflPPPOlxP1i9h_oYw-1; Thu, 04 Nov 2021 16:56:06 -0400
X-MC-Unique: E_i9VflPPPOlxP1i9h_oYw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5A3121006AA3;
 Thu,  4 Nov 2021 20:56:03 +0000 (UTC)
Received: from redhat.com (ovpn-112-104.phx2.redhat.com [10.3.112.104])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6D6EB1017CF5;
 Thu,  4 Nov 2021 20:54:30 +0000 (UTC)
Date: Thu, 4 Nov 2021 15:54:28 -0500
From: Eric Blake <eblake@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Subject: Re: [PULL 04/20] migration/dirtyrate: introduce struct and adjust
 DirtyRateStat
Message-ID: <20211104205428.stcjcd54moksfep2@redhat.com>
References: <20211101220912.10039-1-quintela@redhat.com>
 <20211101220912.10039-5-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211101220912.10039-5-quintela@redhat.com>
User-Agent: NeoMutt/20211029-10-fe244a
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.648,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 David Hildenbrand <david@redhat.com>,
 Hyman =?utf-8?B?SHVhbmcow6nCu+KAnsOl4oC54oChKQ==?= <huangy81@chinatelecom.cn>,
 Paul Durrant <paul@xen.org>, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Nov 01, 2021 at 11:08:56PM +0100, Juan Quintela wrote:
> From: Hyman Huang(é»„å‹‡) <huangy81@chinatelecom.cn>
> 
> introduce "DirtyRateMeasureMode" to specify what method should be
> used to calculate dirty rate, introduce "DirtyRateVcpu" to store
> dirty rate for each vcpu.
> 
> use union to store stat data of specific mode
> 
> Signed-off-by: Hyman Huang(é»„å‹‡) <huangy81@chinatelecom.cn>
> Message-Id: <661c98c40f40e163aa58334337af8f3ddf41316a.1624040308.git.huangy81@chinatelecom.cn>
> Reviewed-by: Peter Xu <peterx@redhat.com>
> Reviewed-by: Juan Quintela <quintela@redhat.com>
> Signed-off-by: Juan Quintela <quintela@redhat.com>
> ---
>  qapi/migration.json   | 30 +++++++++++++++++++++++++++
>  migration/dirtyrate.h | 21 +++++++++++++++----
>  migration/dirtyrate.c | 48 +++++++++++++++++++++++++------------------
>  3 files changed, 75 insertions(+), 24 deletions(-)
> 
> diff --git a/qapi/migration.json b/qapi/migration.json
> index 9aa8bc5759..94eece16e1 100644
> --- a/qapi/migration.json
> +++ b/qapi/migration.json
> @@ -1731,6 +1731,21 @@
>  { 'event': 'UNPLUG_PRIMARY',
>    'data': { 'device-id': 'str' } }
>  
> +##
> +# @DirtyRateVcpu:
> +#
> +# Dirty rate of vcpu.
> +#
> +# @id: vcpu index.
> +#
> +# @dirty-rate: dirty rate.
> +#
> +# Since: 6.1

I'm a bit late on the review, since this pull request is already in.
We'll want a followup patch that changes this to mention 6.2, to
correctly match the release that will first have it.  Such a followup
is safe during freeze, since it is doc-only.

> +#
> +##
> +{ 'struct': 'DirtyRateVcpu',
> +  'data': { 'id': 'int', 'dirty-rate': 'int64' } }
> +
>  ##
>  # @DirtyRateStatus:
>  #

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


