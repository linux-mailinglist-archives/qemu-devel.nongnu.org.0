Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BBAC3267A4
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 21:07:30 +0100 (CET)
Received: from localhost ([::1]:33936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFjOb-0000XR-5E
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 15:07:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lFjMG-0007O3-Q8
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 15:05:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52714)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lFjMA-0001FZ-SI
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 15:05:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614369897;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KmgFK4jvhDAE42XNNFE8e4QptUOhO1YTag+jsSp9HxA=;
 b=YMtOpb//8BQHP+0zAkXLYcw29ACyDAD84VAc8xp9A5WDLl5v8ZkPIsudFia6mw72QRe1m2
 DU5glDlpiAsxg8vqniQXmMH86EtYAEpIPlYkOUGywYbRfMMSJrxyDP94jUpE8ZeBlomCEy
 xN5mJXFMpSNOzQ1PuKK1CVZWk9Q9cOo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-13-gXptTGIEOpWSdlXlWo6T4Q-1; Fri, 26 Feb 2021 15:04:55 -0500
X-MC-Unique: gXptTGIEOpWSdlXlWo6T4Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D32661005501;
 Fri, 26 Feb 2021 20:04:54 +0000 (UTC)
Received: from [10.3.113.12] (ovpn-113-12.phx2.redhat.com [10.3.113.12])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 38344163F2;
 Fri, 26 Feb 2021 20:04:46 +0000 (UTC)
Subject: Re: [PATCH v2 15/31] qapi/qom: Add ObjectOptions for pr-manager-helper
To: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
References: <20210224135255.253837-1-kwolf@redhat.com>
 <20210224135255.253837-16-kwolf@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <52e4a563-9aad-8875-d13f-70d82c300694@redhat.com>
Date: Fri, 26 Feb 2021 14:04:46 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210224135255.253837-16-kwolf@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.349, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: lvivier@redhat.com, thuth@redhat.com, pkrempa@redhat.com,
 berrange@redhat.com, ehabkost@redhat.com, qemu-block@nongnu.org,
 libvir-list@redhat.com, jasowang@redhat.com, armbru@redhat.com,
 mreitz@redhat.com, kraxel@redhat.com, pbonzini@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/24/21 7:52 AM, Kevin Wolf wrote:
> This adds a QAPI schema for the properties of the pr-manager-helper
> object.
> 
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>  qapi/qom.json | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/qapi/qom.json b/qapi/qom.json
> index e3357f5123..e7184122e9 100644
> --- a/qapi/qom.json
> +++ b/qapi/qom.json
> @@ -575,6 +575,18 @@
>              '*hugetlbsize': 'size',
>              '*seal': 'bool' } }
>  
> +##
> +# @PrManagerHelperProperties:
> +#
> +# Properties for pr-manager-helper objects.
> +#
> +# @path: the path to a Unix domain socket for connecting to the external helper
> +#
> +# Since: 2.11
> +##
> +{ 'struct': 'PrManagerHelperProperties',
> +  'data': { 'path': 'str' } }
> +

Matches scsi/pr-manager-helper.c:pr_manager_helper_class_init().

>  ##
>  # @RngProperties:
>  #
> @@ -649,6 +661,7 @@
>      'memory-backend-file',
>      'memory-backend-memfd',
>      'memory-backend-ram',
> +    'pr-manager-helper',
>      'rng-builtin',
>      'rng-egd',
>      'rng-random',
> @@ -697,6 +710,7 @@
>        'memory-backend-file':        'MemoryBackendFileProperties',
>        'memory-backend-memfd':       'MemoryBackendMemfdProperties',
>        'memory-backend-ram':         'MemoryBackendProperties',
> +      'pr-manager-helper':          'PrManagerHelperProperties',
>        'rng-builtin':                'RngProperties',
>        'rng-egd':                    'RngEgdProperties',
>        'rng-random':                 'RngRandomProperties',
> 

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


