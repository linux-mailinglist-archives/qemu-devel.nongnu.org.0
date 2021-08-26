Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3891C3F8ACB
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 17:14:59 +0200 (CEST)
Received: from localhost ([::1]:39324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJH5m-0001EP-14
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 11:14:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mJH51-0000Zk-C1
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 11:14:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mJH4z-0000a1-62
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 11:14:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629990848;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XaJ33W+0KXzwWgSHvJ5wqivbA3NRCYaI+PDep1AhJCE=;
 b=RYlwCvdhvFvzZ5eipugGKznOe4wiq3Xyxee6UQIT9R+f39OoX2bkUfvrEvwuloc9tPitI3
 4UlNSTUrbsvJ7JPsvFIvypEbtZj+YpUghxXpF5l03FkMV2JiiZte14SFeTLwceShr+Ll+f
 dZIKJWP83+6dxOXAHjugn6iTpjNTltw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-334-IuSBh38jMFG5I2GFGoOXjw-1; Thu, 26 Aug 2021 11:14:06 -0400
X-MC-Unique: IuSBh38jMFG5I2GFGoOXjw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4EF891853026;
 Thu, 26 Aug 2021 15:14:05 +0000 (UTC)
Received: from redhat.com (ovpn-112-96.phx2.redhat.com [10.3.112.96])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 392ED60583;
 Thu, 26 Aug 2021 15:14:00 +0000 (UTC)
Date: Thu, 26 Aug 2021 10:13:58 -0500
From: Eric Blake <eblake@redhat.com>
To: isaku.yamahata@gmail.com
Subject: Re: [RFC PATCH v2 31/44] target/i386/tdx: Allows
 mrconfigid/mrowner/mrownerconfig for TDX_INIT_VM
Message-ID: <20210826151358.zjlpyd4ldkq3k75s@redhat.com>
References: <cover.1625704980.git.isaku.yamahata@intel.com>
 <9f1e7fd7678900791d2094d2f0def53fe0afc658.1625704981.git.isaku.yamahata@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9f1e7fd7678900791d2094d2f0def53fe0afc658.1625704981.git.isaku.yamahata@intel.com>
User-Agent: NeoMutt/20210205-739-420e15
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.742,
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
Cc: isaku.yamahata@intel.com, cohuck@redhat.com, ehabkost@redhat.com,
 kvm@vger.kernel.org, mst@redhat.com, seanjc@google.com, alistair@alistair23.me,
 xiaoyao.li@intel.com, qemu-devel@nongnu.org, mtosatti@redhat.com,
 erdemaktas@google.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jul 07, 2021 at 05:55:01PM -0700, isaku.yamahata@gmail.com wrote:
> From: Isaku Yamahata <isaku.yamahata@intel.com>
> 
> When creating VM with TDX_INIT_VM, three sha384 hash values are accepted
> for TDX attestation.
> So far they were hard coded as 0. Now allow user to specify those values
> via property mrconfigid, mrowner and mrownerconfig.
> string for those property are hex string of 48 * 2 length.
> 
> example
> -device tdx-guest, \
>   mrconfigid=0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef, \
>   mrowner=fedcba9876543210fedcba9876543210fedcba9876543210fedcba9876543210fedcba9876543210fedcba9876543210, \
>   mrownerconfig=0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef
> 
> Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
> ---
>  qapi/qom.json         | 11 ++++++++++-
>  target/i386/kvm/tdx.c | 17 +++++++++++++++++
>  target/i386/kvm/tdx.h |  3 +++
>  3 files changed, 30 insertions(+), 1 deletion(-)
> 
> diff --git a/qapi/qom.json b/qapi/qom.json
> index 70c70e3efe..8f8b7828b3 100644
> --- a/qapi/qom.json
> +++ b/qapi/qom.json
> @@ -767,10 +767,19 @@
>  #
>  # @debug: enable debug mode (default: off)
>  #
> +# @mrconfigid: MRCONFIGID SHA384 hex string of 48 * 2 length (default: 0)
> +#
> +# @mrowner: MROWNER SHA384 hex string of 48 * 2 length (default: 0)
> +#
> +# @mrownerconfig: MROWNERCONFIG SHA384 hex string of 48 * 2 length (default: 0)
> +#
>  # Since: 6.0

As these are additions in a later release, they'll need a '(since 6.2)' tag.

>  ##
>  { 'struct': 'TdxGuestProperties',
> -  'data': { '*debug': 'bool' } }
> +  'data': { '*debug': 'bool',
> +            '*mrconfigid': 'str',
> +            '*mrowner': 'str',
> +            '*mrownerconfig': 'str' } }

Do we really want hex-encoded strings?  Elsewhere in QMP, we've
favored the more compact base64 encoding; if you have a strong
argument why hex representation is worth the break in consistency,
it's worth calling out in the commit message.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


