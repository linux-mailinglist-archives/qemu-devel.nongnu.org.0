Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61DDB3EDF47
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 23:24:26 +0200 (CEST)
Received: from localhost ([::1]:36540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFk5p-0005o1-C2
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 17:24:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mFk4x-00057U-Nw
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 17:23:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48985)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mFk4t-0008C7-9U
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 17:23:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629149005;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vzaXs+GwPXQ3GQVxI8ZjHLrHrM+BXcmlyODPhL0Bihc=;
 b=htiKIQ2AWVfgTp7N8TOl0M1hkDiZIZibYynWn5MeYHOb1WmjbZmaPl9yQ6+s6RoysaKZh2
 CWQjMmBbg3yBCXO5fVZ+sNSkWE4+nXQOHskB7+ELgI6iqBFqn3JZFwdRwk7zNC2DJjd/TH
 LwsOWMkucJlM6FzPClRiAy5KKqfebJQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-122-4tZq8Bt7P1WR7GkucxfLDA-1; Mon, 16 Aug 2021 17:23:22 -0400
X-MC-Unique: 4tZq8Bt7P1WR7GkucxfLDA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B9E6D100806E;
 Mon, 16 Aug 2021 21:23:20 +0000 (UTC)
Received: from redhat.com (ovpn-113-125.phx2.redhat.com [10.3.113.125])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4BD5D179B3;
 Mon, 16 Aug 2021 21:23:16 +0000 (UTC)
Date: Mon, 16 Aug 2021 16:23:14 -0500
From: Eric Blake <eblake@redhat.com>
To: Ashish Kalra <Ashish.Kalra@amd.com>
Subject: Re: [RFC PATCH 01/13] machine: Add mirrorvcpus=N suboption to -smp
Message-ID: <20210816212314.kxpbo2sfoxkzliwt@redhat.com>
References: <cover.1629118207.git.ashish.kalra@amd.com>
 <235c91b1b09f11c75bfc60597938c97d3ebb0861.1629118207.git.ashish.kalra@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <235c91b1b09f11c75bfc60597938c97d3ebb0861.1629118207.git.ashish.kalra@amd.com>
User-Agent: NeoMutt/20210205-719-68949a
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
Cc: thomas.lendacky@amd.com, brijesh.singh@amd.com, ehabkost@redhat.com,
 kvm@vger.kernel.org, mst@redhat.com, tobin@ibm.com, jejb@linux.ibm.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, dgilbert@redhat.com,
 frankeh@us.ibm.com, dovmurik@linux.vnet.ibm.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Aug 16, 2021 at 01:26:45PM +0000, Ashish Kalra wrote:
> From: Dov Murik <dovmurik@linux.vnet.ibm.com>
> 
> Add a notion of mirror vcpus to CpuTopology, which will allow to
> designate a few vcpus (normally 1) for running the guest
> migration handler (MH).
> 
> Example usage for starting a 4-vcpu guest, of which 1 vcpu is marked as
> mirror vcpu.
> 
>     qemu-system-x86_64 -smp 4,mirrorvcpus=1 ...
> 
> Signed-off-by: Dov Murik <dovmurik@linux.vnet.ibm.com>
> Co-developed-by: Ashish Kalra <ashish.kalra@amd.com>
> Signed-off-by: Ashish Kalra <ashish.kalra@amd.com>
> ---

> +++ b/qapi/machine.json
> @@ -1303,6 +1303,8 @@
>  #
>  # @maxcpus: maximum number of hotpluggable virtual CPUs in the virtual machine
>  #
> +# @mirrorvcpus: maximum number of mirror virtual CPUs in the virtual machine
> +#

Needs a '(since 6.2)' tag.

>  # Since: 6.1
>  ##
>  { 'struct': 'SMPConfiguration', 'data': {
> @@ -1311,4 +1313,5 @@
>       '*dies': 'int',
>       '*cores': 'int',
>       '*threads': 'int',
> -     '*maxcpus': 'int' } }
> +     '*maxcpus': 'int',
> +     '*mirrorvcpus': 'int' } }

Is this really the right place to be adding it?  The rest of this
struct feels like things that advertise what bare metal can do, and
therefore what we are emulating.  But bare metal can't do mirrors -
that's something that is completely in the realm of emulation only.
If I understand the cover letter, the guest shouldn't be able to
detect that mirroring exists, which is different from how the guest
DOES detect how many dies, cores, and threads are available to use.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


