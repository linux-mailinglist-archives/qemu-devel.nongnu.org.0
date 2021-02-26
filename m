Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B165326909
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 22:03:45 +0100 (CET)
Received: from localhost ([::1]:43434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFkH1-0002eV-7V
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 16:03:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lFkFW-00024m-5G
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 16:02:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59476)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lFkFU-0002uS-Ge
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 16:02:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614373327;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/z6x38LiJTxId599EidOjBFw6xeoCfJXANkfxZ6D2gM=;
 b=KEh8aZN96KnhDv8jPAQ2M+b4m/2oVZS3NWOay4YWCOLiVBCWbePaxoO+JltwyTBIu0aPSH
 2Knt4GqyXTUPGcGsQJ1P7dXxR4IkBXNVRR1x2pE5syEdLlfNYS7nOeFN+I2nEjVRMz9cFN
 67ERAOt0IaEsi8N2sC61I+pRabYlQ0I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-196-av2kkQpXPWaaAsC2Zw6evA-1; Fri, 26 Feb 2021 16:02:04 -0500
X-MC-Unique: av2kkQpXPWaaAsC2Zw6evA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 972D310066F2;
 Fri, 26 Feb 2021 21:02:03 +0000 (UTC)
Received: from [10.3.113.12] (ovpn-113-12.phx2.redhat.com [10.3.113.12])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 895225C3E6;
 Fri, 26 Feb 2021 21:01:56 +0000 (UTC)
Subject: Re: [PATCH v2 18/31] qapi/qom: Add ObjectOptions for x-remote-object
To: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
References: <20210224135255.253837-1-kwolf@redhat.com>
 <20210224135255.253837-19-kwolf@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <85697ee2-37c9-6614-8d64-7b406a9fff89@redhat.com>
Date: Fri, 26 Feb 2021 15:01:55 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210224135255.253837-19-kwolf@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.349, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
> This adds a QAPI schema for the properties of the x-remote-object
> object.
> 
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>  qapi/qom.json | 20 ++++++++++++++++++--
>  1 file changed, 18 insertions(+), 2 deletions(-)
> 
> diff --git a/qapi/qom.json b/qapi/qom.json
> index f8ff322df0..6793342e81 100644
> --- a/qapi/qom.json
> +++ b/qapi/qom.json
> @@ -641,6 +641,20 @@
>  { 'struct': 'PrManagerHelperProperties',
>    'data': { 'path': 'str' } }
>  
> +##
> +# @RemoteObjectProperties:
> +#
> +# Properties for x-remote-object objects.
> +#
> +# @fd: file descriptor name previously passed via 'getfd' command
> +#
> +# @devid: the id of the device to be associated with the file descriptor
> +#
> +# Since: 6.0
> +##
> +{ 'struct': 'RemoteObjectProperties',
> +  'data': { 'fd': 'str', 'devid': 'str' } }
> +

Matches hw/remote/remote-obj.c:remote_object_class_init().

>  ##
>  # @RngProperties:
>  #
> @@ -762,7 +776,8 @@
>      'tls-creds-anon',
>      'tls-creds-psk',
>      'tls-creds-x509',
> -    'tls-cipher-suites'
> +    'tls-cipher-suites',
> +    'x-remote-object'
>    ] }
>  
>  ##
> @@ -815,7 +830,8 @@
>        'tls-creds-anon':             'TlsCredsAnonProperties',
>        'tls-creds-psk':              'TlsCredsPskProperties',
>        'tls-creds-x509':             'TlsCredsX509Properties',
> -      'tls-cipher-suites':          'TlsCredsProperties'
> +      'tls-cipher-suites':          'TlsCredsProperties',
> +      'x-remote-object':            'RemoteObjectProperties'
>    } }
>  
>  ##
> 

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


