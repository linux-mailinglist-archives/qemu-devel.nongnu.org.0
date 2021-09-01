Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31DDF400078
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 15:24:54 +0200 (CEST)
Received: from localhost ([::1]:42190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM9Bc-00049Y-8H
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 09:24:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mM8w1-0007LJ-9w
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 09:08:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55183)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mM8vw-0001Pt-Dq
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 09:08:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630674518;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8FXkM+EqyNCfuGl6q2Svlfzpm9mm0kruwO2BQpaToJY=;
 b=g3PnpU+CASme/XL3S7/E2FzdFzRVBq/AbfuaSHeQWOvH0hboPF8MVFCwdCG30ffWyZ+vT5
 NJkXX85oNBW1/PazYpAfQdljvFsC75v5n51iiWw5Lk5cLEo5tpLDTodUEVPOkSv9phWdle
 ggent5J+7tVqffuFg71O/gmOdP4oyZY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-599-WdxVfZ5WO0e-0J23dsXSmg-1; Fri, 03 Sep 2021 09:08:37 -0400
X-MC-Unique: WdxVfZ5WO0e-0J23dsXSmg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3A7411966320;
 Fri,  3 Sep 2021 13:08:36 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-13.ams2.redhat.com
 [10.36.112.13])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E65E57771A;
 Fri,  3 Sep 2021 13:08:31 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0785F11380CD; Wed,  1 Sep 2021 16:18:22 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Michael Roth <michael.roth@amd.com>
Subject: Re: [RFC PATCH v2 01/12] i386/sev: introduce "sev-common" type to
 encapsulate common SEV state
References: <20210826222627.3556-1-michael.roth@amd.com>
 <20210826222627.3556-2-michael.roth@amd.com>
Date: Wed, 01 Sep 2021 16:18:21 +0200
In-Reply-To: <20210826222627.3556-2-michael.roth@amd.com> (Michael Roth's
 message of "Thu, 26 Aug 2021 17:26:16 -0500")
Message-ID: <87pmtsqt02.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>,
 "Daniel P . =?utf-8?Q?Berran?= =?utf-8?Q?g=C3=A9?=" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 "Michael S . Tsirkin" <mst@redhat.com>, Connor Kuehl <ckuehl@redhat.com>,
 Eric Blake <eblake@redhat.com>, James Bottomley <jejb@linux.ibm.com>,
 qemu-devel@nongnu.org, "Dr . David Alan
 Gilbert" <dgilbert@redhat.com>, Dov Murik <dovmurik@linux.ibm.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Michael Roth <michael.roth@amd.com> writes:

> Currently all SEV/SEV-ES functionality is managed through a single
> 'sev-guest' QOM type. With upcoming support for SEV-SNP, taking this
> same approach won't work well since some of the properties/state
> managed by 'sev-guest' is not applicable to SEV-SNP, which will instead
> rely on a new QOM type with its own set of properties/state.
>
> To prepare for this, this patch moves common state into an abstract
> 'sev-common' parent type to encapsulate properties/state that is
> common to both SEV/SEV-ES and SEV-SNP, leaving only SEV/SEV-ES-specific
> properties/state in the current 'sev-guest' type. This should not
> affect current behavior or command-line options.
>
> As part of this patch, some related changes are also made:
>
>   - a static 'sev_guest' variable is currently used to keep track of
>     the 'sev-guest' instance. SEV-SNP would similarly introduce an
>     'sev_snp_guest' static variable. But these instances are now
>     available via qdev_get_machine()->cgs, so switch to using that
>     instead and drop the static variable.
>
>   - 'sev_guest' is currently used as the name for the static variable
>     holding a pointer to the 'sev-guest' instance. Re-purpose the name
>     as a local variable referring the 'sev-guest' instance, and use
>     that consistently throughout the code so it can be easily
>     distinguished from sev-common/sev-snp-guest instances.
>
>   - 'sev' is generally used as the name for local variables holding a
>     pointer to the 'sev-guest' instance. In cases where that now points
>     to common state, use the name 'sev_common'; in cases where that now
>     points to state specific to 'sev-guest' instance, use the name
>     'sev_guest'
>
> Signed-off-by: Michael Roth <michael.roth@amd.com>
> ---
>  qapi/qom.json     |  34 +++--
>  target/i386/sev.c | 329 +++++++++++++++++++++++++++-------------------
>  2 files changed, 214 insertions(+), 149 deletions(-)
>
> diff --git a/qapi/qom.json b/qapi/qom.json
> index a25616bc7a..211e083727 100644
> --- a/qapi/qom.json
> +++ b/qapi/qom.json
> @@ -735,12 +735,29 @@
>    'data': { '*filename': 'str' } }
>  
>  ##
> -# @SevGuestProperties:
> +# @SevCommonProperties:
>  #
> -# Properties for sev-guest objects.
> +# Properties common to objects that are derivatives of sev-common.
>  #
>  # @sev-device: SEV device to use (default: "/dev/sev")
>  #
> +# @cbitpos: C-bit location in page table entry (default: 0)
> +#
> +# @reduced-phys-bits: number of bits in physical addresses that become
> +#                     unavailable when SEV is enabled
> +#
> +# Since: 2.12
> +##
> +{ 'struct': 'SevCommonProperties',
> +  'data': { '*sev-device': 'str',
> +            '*cbitpos': 'uint32',
> +            'reduced-phys-bits': 'uint32' } }
> +
> +##
> +# @SevGuestProperties:
> +#
> +# Properties for sev-guest objects.
> +#
>  # @dh-cert-file: guest owners DH certificate (encoded with base64)
>  #
>  # @session-file: guest owners session parameters (encoded with base64)
> @@ -749,21 +766,14 @@
>  #
>  # @handle: SEV firmware handle (default: 0)
>  #
> -# @cbitpos: C-bit location in page table entry (default: 0)
> -#
> -# @reduced-phys-bits: number of bits in physical addresses that become
> -#                     unavailable when SEV is enabled
> -#
>  # Since: 2.12
>  ##
>  { 'struct': 'SevGuestProperties',
> -  'data': { '*sev-device': 'str',
> -            '*dh-cert-file': 'str',
> +  'base': 'SevCommonProperties',
> +  'data': { '*dh-cert-file': 'str',
>              '*session-file': 'str',
>              '*policy': 'uint32',
> -            '*handle': 'uint32',
> -            '*cbitpos': 'uint32',
> -            'reduced-phys-bits': 'uint32' } }
> +            '*handle': 'uint32' } }
>  
>  ##
>  # @ObjectType:

External interface remains unchanged, as far as I can tell.

For the QAPI schema:
Acked-by: Markus Armbruster <armbru@redhat.com>


