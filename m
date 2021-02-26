Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC5D32664E
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 18:28:24 +0100 (CET)
Received: from localhost ([::1]:59692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFguc-00020l-Kf
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 12:28:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lFgst-00014i-E1
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 12:26:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46110)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lFgsr-00089F-8N
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 12:26:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614360391;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m1TR24bsrJQ3JSTavZzYBF2gkB+0VLj2dvr3pa+O20M=;
 b=X78tMPZcThf/ZCIG99pXY92Uc75hdVDExozmS/z+/Tt5HtQ+iFn1LX9uOk/hDug8/mp8jW
 MUXZj96lm0nVsDz2bt180eO7D51uM/uxkgXXa3WmeH6F2g2mw92AIDZ1o+rx+uD7E2Nie8
 gW5pZXq9j/hA9QUnz+KERv+orV45YSk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-325-RNC7OaGrNOmNTlVXXw71ew-1; Fri, 26 Feb 2021 12:26:28 -0500
X-MC-Unique: RNC7OaGrNOmNTlVXXw71ew-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 69C5E803F47;
 Fri, 26 Feb 2021 17:26:27 +0000 (UTC)
Received: from [10.3.113.12] (ovpn-113-12.phx2.redhat.com [10.3.113.12])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6946E60875;
 Fri, 26 Feb 2021 17:26:20 +0000 (UTC)
To: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
References: <20210224135255.253837-1-kwolf@redhat.com>
 <20210224135255.253837-10-kwolf@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Subject: Re: [PATCH v2 09/31] qapi/qom: Add ObjectOptions for throttle-group
Message-ID: <4cde0059-def8-4a12-f6b5-823ab8514702@redhat.com>
Date: Fri, 26 Feb 2021 11:26:19 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210224135255.253837-10-kwolf@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
> This adds a QAPI schema for the properties of the throttle-group object.
> 
> The only purpose of the x-* properties is to make the nested options in
> 'limits' available for a command line parser that doesn't support
> structs. Any parser that will use the QAPI schema will supports structs,
> though, so they will not be needed in the schema in the future.
> 
> To keep the conversion straightforward, add them to the schema anyway.
> We can then remove the options and adjust documentation, test cases etc.
> in a separate patch.
> 
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>  qapi/block-core.json | 27 +++++++++++++++++++++++++++
>  qapi/qom.json        |  7 +++++--
>  2 files changed, 32 insertions(+), 2 deletions(-)
> 
> diff --git a/qapi/block-core.json b/qapi/block-core.json
> index 9f555d5c1d..a67fa0cc59 100644
> --- a/qapi/block-core.json
> +++ b/qapi/block-core.json
> @@ -2504,6 +2504,33 @@
>              '*bps-write-max' : 'int', '*bps-write-max-length' : 'int',
>              '*iops-size' : 'int' } }
>  
> +##
> +# @ThrottleGroupProperties:
> +#
> +# Properties for throttle-group objects.

Corresponds to block/throttle-groups.c:throttle_group_obj_class_init()
with its ThrottleParamInfo struct for the x- fields, and limits as-is.

> +#
> +# The options starting with x- are aliases for the same key without x- in
> +# the @limits object. As indicated by the x- prefix, this is not a stable
> +# interface and may be removed or changed incompatibly in the future. Use
> +# @limits for a supported stable interface.
> +#
> +# @limits: limits to apply for this throttle group

And I did check that qapi/block-core.json:ThrottleLimits has the same
fields as the ThrottleParamInfo x- fields.  All this duplication!  But
we're getting to a state where it will be easier to clean up the cruft.

> +#
> +# Since: 2.11
> +##
> +{ 'struct': 'ThrottleGroupProperties',
> +  'data': { '*limits': 'ThrottleLimits',
> +            '*x-iops-total' : 'int', '*x-iops-total-max' : 'int',
> +            '*x-iops-total-max-length' : 'int', '*x-iops-read' : 'int',
> +            '*x-iops-read-max' : 'int', '*x-iops-read-max-length' : 'int',
> +            '*x-iops-write' : 'int', '*x-iops-write-max' : 'int',
> +            '*x-iops-write-max-length' : 'int', '*x-bps-total' : 'int',
> +            '*x-bps-total-max' : 'int', '*x-bps-total-max-length' : 'int',
> +            '*x-bps-read' : 'int', '*x-bps-read-max' : 'int',
> +            '*x-bps-read-max-length' : 'int', '*x-bps-write' : 'int',
> +            '*x-bps-write-max' : 'int', '*x-bps-write-max-length' : 'int',
> +            '*x-iops-size' : 'int' } }
> +
>  ##
>  # @block-stream:
>  #
> diff --git a/qapi/qom.json b/qapi/qom.json
> index 73f28f9608..449dca8ec5 100644
> --- a/qapi/qom.json
> +++ b/qapi/qom.json
> @@ -5,6 +5,7 @@
>  # See the COPYING file in the top-level directory.
>  
>  { 'include': 'authz.json' }
> +{ 'include': 'block-core.json' }
>  { 'include': 'common.json' }
>  
>  ##
> @@ -447,7 +448,8 @@
>      'memory-backend-ram',
>      'rng-builtin',
>      'rng-egd',
> -    'rng-random'
> +    'rng-random',
> +    'throttle-group'
>    ] }
>  
>  ##
> @@ -480,7 +482,8 @@
>        'memory-backend-ram':         'MemoryBackendProperties',
>        'rng-builtin':                'RngProperties',
>        'rng-egd':                    'RngEgdProperties',
> -      'rng-random':                 'RngRandomProperties'
> +      'rng-random':                 'RngRandomProperties',
> +      'throttle-group':             'ThrottleGroupProperties'
>    } }
>  
>  ##
> 

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


