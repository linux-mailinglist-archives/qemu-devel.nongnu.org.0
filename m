Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B614D45183D
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 23:53:39 +0100 (CET)
Received: from localhost ([::1]:59678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmkr4-0003nh-RN
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 17:53:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mmklU-0004DX-5t
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 17:47:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mmklM-0004IC-Je
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 17:47:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637016463;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=toQcFguJghihTlHdbzEa3FVNR9IDFpLArQlk0uC6kXk=;
 b=NbrkECYS5XhRcZXlbtAyWjaooAoZGZbMIiMZTUAi/rt7QsXIHvpYIbwganqnOieUNSlGzw
 JtGg4ZwMa92a7xCX5dEDRBCah7z2M+H8OQtSp0sZNBU9R82b7S6BAcG58jInKq3ZEiby6m
 D0cvH3rmDM6oTAPgBFf2usPQmcfDvzE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-384-BLKbRg-JOHKPMPzsXuR1HA-1; Mon, 15 Nov 2021 17:47:40 -0500
X-MC-Unique: BLKbRg-JOHKPMPzsXuR1HA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B52F515721;
 Mon, 15 Nov 2021 22:47:39 +0000 (UTC)
Received: from redhat.com (ovpn-114-146.phx2.redhat.com [10.3.114.146])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9CE9019729;
 Mon, 15 Nov 2021 22:47:29 +0000 (UTC)
Date: Mon, 15 Nov 2021 16:47:27 -0600
From: Eric Blake <eblake@redhat.com>
To: Tyler Fanelli <tfanelli@redhat.com>
Subject: Re: [PATCH] sev: allow capabilities to check for SEV-ES support
Message-ID: <20211115224727.p7g5ydntncvvm5k3@redhat.com>
References: <20211115193804.294529-1-tfanelli@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211115193804.294529-1-tfanelli@redhat.com>
User-Agent: NeoMutt/20211029-16-b680fe
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: pbonzini@redhat.com, mtosatti@redhat.com, qemu-devel@nongnu.org,
 kvm@vger.kernel.org, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Nov 15, 2021 at 02:38:04PM -0500, Tyler Fanelli wrote:
> Probe for SEV-ES and SEV-SNP capabilities to distinguish between Rome,
> Naples, and Milan processors. Use the CPUID function to probe if a
> processor is capable of running SEV-ES or SEV-SNP, rather than if it
> actually is running SEV-ES or SEV-SNP.
> 
> Signed-off-by: Tyler Fanelli <tfanelli@redhat.com>
> ---
>  qapi/misc-target.json | 11 +++++++++--
>  target/i386/sev.c     |  6 ++++--
>  2 files changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/qapi/misc-target.json b/qapi/misc-target.json
> index 5aa2b95b7d..c3e9bce12b 100644
> --- a/qapi/misc-target.json
> +++ b/qapi/misc-target.json
> @@ -182,13 +182,19 @@
>  # @reduced-phys-bits: Number of physical Address bit reduction when SEV is
>  #                     enabled
>  #
> +# @es: SEV-ES capability of the machine.
> +#
> +# @snp: SEV-SNP capability of the machine.
> +#

Missing '(since 7.0)' tags on the new members.

>  # Since: 2.12
>  ##
>  { 'struct': 'SevCapability',
>    'data': { 'pdh': 'str',
>              'cert-chain': 'str',
>              'cbitpos': 'int',
> -            'reduced-phys-bits': 'int'},
> +            'reduced-phys-bits': 'int',
> +            'es': 'bool',
> +            'snp': 'bool'},
>    'if': 'TARGET_I386' }
>  
>  ##
> @@ -205,7 +211,8 @@
>  #
>  # -> { "execute": "query-sev-capabilities" }
>  # <- { "return": { "pdh": "8CCDD8DDD", "cert-chain": "888CCCDDDEE",
> -#                  "cbitpos": 47, "reduced-phys-bits": 5}}
> +#                  "cbitpos": 47, "reduced-phys-bits": 5
> +#                  "es": false, "snp": false}}

Invalid JSON, as you missed the comma needed after 5.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


