Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB423259F8
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 23:57:03 +0100 (CET)
Received: from localhost ([::1]:52990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFPZ8-0004aQ-An
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 17:57:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lFPY3-0003w6-Su
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 17:55:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38301)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lFPY0-0003S6-9W
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 17:55:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614293750;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S+O7sXbbFtGp3PnCa9y60nAUM2UPNFKLu4WqM5wAQ3A=;
 b=DUUpFfU4L6QLfmRL1wd9O9v2maACgn0YtEnhFgYDWvHAKtSE/yb12noPOXeowGmz/J/mw8
 xgKkNgw1oM/NFQgZ/orvsQ/EdJU0tq8CLTlF4AwIEEpJvknTd7ouNANC/E5ZLZ4Eq/hP8D
 gufn82xl56BDmGudYwNE9QSdVPKPH1M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-179-e7Ns4UTSMHink8Quh1iMvw-1; Thu, 25 Feb 2021 17:55:48 -0500
X-MC-Unique: e7Ns4UTSMHink8Quh1iMvw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 55D281868406;
 Thu, 25 Feb 2021 22:55:47 +0000 (UTC)
Received: from [10.3.113.12] (ovpn-113-12.phx2.redhat.com [10.3.113.12])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 38FD410013D6;
 Thu, 25 Feb 2021 22:55:40 +0000 (UTC)
To: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
References: <20210224135255.253837-1-kwolf@redhat.com>
 <20210224135255.253837-4-kwolf@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Subject: Re: [PATCH v2 03/31] qapi/qom: Add ObjectOptions for iothread
Message-ID: <c71ca8da-8def-e4f4-4c72-fd87b1334017@redhat.com>
Date: Thu, 25 Feb 2021 16:55:39 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210224135255.253837-4-kwolf@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.435, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
> Add an ObjectOptions union that will eventually describe the options of
> all user creatable object types. As unions can't exist without any
> branches, also add the first object type.
> 
> This adds a QAPI schema for the properties of the iothread object.
> 
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>  qapi/qom.json | 53 +++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 53 insertions(+)
> 
> diff --git a/qapi/qom.json b/qapi/qom.json
> index 96c91c1faf..bf2ecb34be 100644
> --- a/qapi/qom.json
> +++ b/qapi/qom.json
> @@ -202,6 +202,59 @@
>    'returns': [ 'ObjectPropertyInfo' ],
>    'allow-preconfig': true }
>  
> +##
> +# @IothreadProperties:
> +#
> +# Properties for iothread objects.
> +#
> +# @poll-max-ns: the maximum number of nanoseconds to busy wait for events.
> +#               0 means polling is disabled (default: 32768 on POSIX hosts,
> +#               0 otherwise)
> +#
> +# @poll-grow: the multiplier used to increase the polling time when the
> +#             algorithm detects it is missing events due to not polling long
> +#             enough. 0 selects a default behaviour (default: 0)
> +#
> +# @poll-shrink: the divisor used to decrease the polling time when the
> +#               algorithm detects it is spending too long polling without
> +#               encountering events. 0 selects a default behaviour (default: 0)

Matches PollParamInfo declarations in iothread.c.

> +#
> +# Since: 2.0

How did you determine this value?  (I'm not questioning it being
something other than 6.0, because we have indeed supported QMP
configuration of these values via the untyped magic previously present
in add-object).

> +##
> +{ 'struct': 'IothreadProperties',
> +  'data': { '*poll-max-ns': 'int',
> +            '*poll-grow': 'int',
> +            '*poll-shrink': 'int' } }

These are correctly typed per the code in iothread.c, but it does raise
the question of whether a signed 64-bit value is the best choice, or if
we might later want to revisit things to pick more constrained types.  I
don't think such an audit should hold up this series, though.

> +
> +##
> +# @ObjectType:
> +#
> +# Since: 6.0
> +##
> +{ 'enum': 'ObjectType',
> +  'data': [
> +    'iothread'
> +  ] }

Will be fun to watch this grow over the series.

> +
> +##
> +# @ObjectOptions:
> +#
> +# Describes the options of a user creatable QOM object.
> +#
> +# @qom-type: the class name for the object to be created
> +#
> +# @id: the name of the new object
> +#
> +# Since: 6.0
> +##
> +{ 'union': 'ObjectOptions',
> +  'base': { 'qom-type': 'ObjectType',
> +            'id': 'str' },
> +  'discriminator': 'qom-type',
> +  'data': {
> +      'iothread':                   'IothreadProperties'
> +  } }
> +
>  ##
>  # @object-add:
>  #
> 


Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


