Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C06C44C5A1
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 18:01:49 +0100 (CET)
Received: from localhost ([::1]:55324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkqyq-0005rz-G2
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 12:01:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mkqtB-0008Bo-PK
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 11:55:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21155)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mkqt8-0000aL-Jl
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 11:55:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636563352;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PRp+nppZXiFjPGmhZ2Qz5iw8ZyOW+hTXco7CFt2D/eY=;
 b=f0816B/JquqvpJ5h8i5k1ByCIsgb+cjzghclSJJgC5V8WfvxPTKjQ0Dg1RXU0pfJrKCE/S
 EnycABnQzo0ZHCywXcU611Gku+xmEEcupsQSkjh8DFWZY196SJtfqI6Jr+BtU7QC6K3CE4
 Pg7coTOHzfbDnjcJsqMWBwGHjVwXRow=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-529-X-gkMVRjMluuSO8VdpHA5g-1; Wed, 10 Nov 2021 11:55:49 -0500
X-MC-Unique: X-gkMVRjMluuSO8VdpHA5g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 22159189ED2D;
 Wed, 10 Nov 2021 16:55:43 +0000 (UTC)
Received: from redhat.com (ovpn-113-115.phx2.redhat.com [10.3.113.115])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8136419C59;
 Wed, 10 Nov 2021 16:55:42 +0000 (UTC)
Date: Wed, 10 Nov 2021 10:55:40 -0600
From: Eric Blake <eblake@redhat.com>
To: Yang Zhong <yang.zhong@intel.com>
Subject: Re: [PATCH v3 3/5] numa: Support SGX numa in the monitor and Libvirt
 interfaces
Message-ID: <20211110165540.souq5vgqtfn2hsft@redhat.com>
References: <20211101162009.62161-1-yang.zhong@intel.com>
 <20211101162009.62161-4-yang.zhong@intel.com>
MIME-Version: 1.0
In-Reply-To: <20211101162009.62161-4-yang.zhong@intel.com>
User-Agent: NeoMutt/20211029-16-b680fe
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
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
Cc: pbonzini@redhat.com, jarkko@kernel.org, philmd@redhat.com,
 qemu-devel@nongnu.org, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Nov 01, 2021 at 12:20:07PM -0400, Yang Zhong wrote:
> Add the SGXEPCSection list into SGXInfo to show the multiple
> SGX EPC sections detailed info, not the total size like before.
> This patch can enable numa support for 'info sgx' command and
> QMP interfaces. The new interfaces show each EPC section info
> in one numa node. Libvirt can use QMP interface to get the
> detailed host SGX EPC capabilities to decide how to allocate
> host EPC sections to guest.
> 
> (qemu) info sgx
>  SGX support: enabled
>  SGX1 support: enabled
>  SGX2 support: enabled
>  FLC support: enabled
>  NUMA node #0: size=67108864
>  NUMA node #1: size=29360128
> 
> The QMP interface show:
> (QEMU) query-sgx
> {"return": {"sgx": true, "sgx2": true, "sgx1": true, "sections": \
> [{"node": 0, "size": 67108864}, {"node": 1, "size": 29360128}], "flc": true}}
> 
> (QEMU) query-sgx-capabilities
> {"return": {"sgx": true, "sgx2": true, "sgx1": true, "sections": \
> [{"node": 0, "size": 17070817280}, {"node": 1, "size": 17079205888}], "flc": true}}

Other than the different "size" values, how do these commands differ?

> 
> Signed-off-by: Yang Zhong <yang.zhong@intel.com>
> ---
>  qapi/misc-target.json | 19 ++++++++++++++--
>  hw/i386/sgx.c         | 51 +++++++++++++++++++++++++++++++++++--------
>  2 files changed, 59 insertions(+), 11 deletions(-)
> 
> diff --git a/qapi/misc-target.json b/qapi/misc-target.json
> index 5aa2b95b7d..1022aa0184 100644
> --- a/qapi/misc-target.json
> +++ b/qapi/misc-target.json
> @@ -337,6 +337,21 @@
>    'if': 'TARGET_ARM' }
>  
>  
> +##
> +# @SGXEPCSection:
> +#
> +# Information about intel SGX EPC section info
> +#
> +# @node: the numa node
> +#
> +# @size: the size of epc section
> +#
> +# Since: 6.2

Are we still trying to cram this into 6.2, or is now slipping into 7.0?

> +##
> +{ 'struct': 'SGXEPCSection',
> +  'data': { 'node': 'int',
> +            'size': 'uint64'}}
> +
>  ##
>  # @SGXInfo:
>  #
> @@ -350,7 +365,7 @@
>  #
>  # @flc: true if FLC is supported
>  #
> -# @section-size: The EPC section size for guest
> +# @sections: The EPC sections info for guest
>  #
>  # Since: 6.2
>  ##
> @@ -359,7 +374,7 @@
>              'sgx1': 'bool',
>              'sgx2': 'bool',
>              'flc': 'bool',
> -            'section-size': 'uint64'},
> +            'sections': ['SGXEPCSection']},

This would be an incompatible change.  As long as 6.2 isn't released,
we can do that; but once it is, we need to be more careful about
changing the QMP spec.

>     'if': 'TARGET_I386' }
>  
>  ##
> diff --git a/hw/i386/sgx.c b/hw/i386/sgx.c
> index 9a77519609..b5b710a556 100644
> --- a/hw/i386/sgx.c
> +++ b/hw/i386/sgx.c
> @@ -76,11 +76,13 @@ static uint64_t sgx_calc_section_metric(uint64_t low, uint64_t high)
>             ((high & MAKE_64BIT_MASK(0, 20)) << 32);
>  }
>  
> -static uint64_t sgx_calc_host_epc_section_size(void)
> +static SGXEPCSectionList *sgx_calc_host_epc_sections(void)
...

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


