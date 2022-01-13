Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF90548DB88
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 17:18:25 +0100 (CET)
Received: from localhost ([::1]:44032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n82nw-0003o4-NU
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 11:18:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1n82l6-0007dK-OA
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 11:15:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1n82l5-00071g-17
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 11:15:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642090526;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=znkjWPkYk6RLNx8rZU28L8EwN/2Mrq0GFOLOBEz31d0=;
 b=HTCPdJOhUL5VITx23Qvr25axN5AiLJH/gkXYbRjHb0N5SepSpt2pO9YbqMoHyLBn8jCkn8
 bPCO7sQlfK6y040CAchF4FsO96H4JINESv159tIwruJcZBQI+s+r7tpX39QLTSY9K6tVPQ
 fF5KUYZIO7oo5TRz+6mhWw9VxryD85E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-416-F_dfizLDOSKAJs_e3QWn3Q-1; Thu, 13 Jan 2022 11:15:20 -0500
X-MC-Unique: F_dfizLDOSKAJs_e3QWn3Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B77DB801B2D;
 Thu, 13 Jan 2022 16:15:18 +0000 (UTC)
Received: from redhat.com (unknown [10.33.37.41])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B9EB67953E;
 Thu, 13 Jan 2022 16:15:13 +0000 (UTC)
Date: Thu, 13 Jan 2022 16:15:10 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Peter Krempa <pkrempa@redhat.com>
Subject: Re: [PULL 11/13] numa: Support SGX numa in the monitor and Libvirt
 interfaces
Message-ID: <YeBQDnavNT3ZE5mf@redhat.com>
References: <20211215202515.91586-1-pbonzini@redhat.com>
 <20211215202515.91586-12-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211215202515.91586-12-pbonzini@redhat.com>
User-Agent: Mutt/2.1.3 (2021-09-10)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.594,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Yang Zhong <yang.zhong@intel.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Dec 15, 2021 at 09:25:13PM +0100, Paolo Bonzini wrote:
> From: Yang Zhong <yang.zhong@intel.com>
> 
> Add the SGXEPCSection list into SGXInfo to show the multiple
> SGX EPC sections detailed info, not the total size like before.
> This patch can enable numa support for 'info sgx' command and
> QMP interfaces. The new interfaces show each EPC section info
> in one numa node. Libvirt can use QMP interface to get the
> detailed host SGX EPC capabilities to decide how to allocate
> host EPC sections to guest.



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

This is wrong because it was merged for 7.0 not 6.2

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

This is a non-backwards compatible schema change.

"@section-size" must not be removed without going
through a deprecation period, so this needs to be
re-instated.

The "@sections" addition needs a "Since 7.0" annotation too.


Yong, can you submit a followup patch to correct these mistakes


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


