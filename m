Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE96A326516
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 17:00:12 +0100 (CET)
Received: from localhost ([::1]:32914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFfXH-0003bB-UX
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 11:00:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lFfVt-00037R-8B
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 10:58:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:34682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lFfVp-0003BW-5B
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 10:58:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614355117;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5PFHvltxej26fhfHzFILVAIOg0sHnOaMIvmalTHix+w=;
 b=hxwgqFnOh8xAyNHEOU+7IuW4QKpc5BLv4vZERMtvFLupnjE8i+Fv6wtXUm5jVcJNTcHbpD
 YhSsGVY+D1W3dg4JxXRBIgo5CWpB3cnHORCX0CLikH/4y0PsZYywvZVeQSSqF1qKKzBGWR
 /6O9Rmtzu6ExNFWUdgeYb9lLYeuc9fQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-336-vqpOD1MUN2CZlFoPyTdT9w-1; Fri, 26 Feb 2021 10:58:34 -0500
X-MC-Unique: vqpOD1MUN2CZlFoPyTdT9w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 896411E562;
 Fri, 26 Feb 2021 15:58:33 +0000 (UTC)
Received: from [10.3.113.12] (ovpn-113-12.phx2.redhat.com [10.3.113.12])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8E91960BE5;
 Fri, 26 Feb 2021 15:58:26 +0000 (UTC)
To: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
References: <20210224135255.253837-1-kwolf@redhat.com>
 <20210224135255.253837-7-kwolf@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Subject: Re: [PATCH v2 06/31] qapi/qom: Add ObjectOptions for dbus-vmstate
Message-ID: <11a6a75b-2e84-9033-d15c-f30b40c45c07@redhat.com>
Date: Fri, 26 Feb 2021 09:58:26 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210224135255.253837-7-kwolf@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
> This adds a QAPI schema for the properties of the dbus-vmstate object.
> 
> A list represented as a comma separated string is clearly not very
> QAPI-like, but for now just describe the existing interface.

Does your alias proposal give us a path forward for improving that down
the road?  Or maybe it's not an alias we need, but a new field with
better QAPI-like semantics, deprecate the old one, and wait out the 2
release cycles?

> 
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>  qapi/qom.json | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/qapi/qom.json b/qapi/qom.json
> index 1dbc95fb53..a6a5049707 100644
> --- a/qapi/qom.json
> +++ b/qapi/qom.json
> @@ -232,6 +232,22 @@
>    'base': 'CryptodevBackendProperties',
>    'data': { 'chardev': 'str' } }
>  
> +##
> +# @DBusVMStateProperties:
> +#
> +# Properties for dbus-vmstate objects.
> +#
> +# @addr: the name of the DBus bus to connect to
> +#
> +# @id-list: a comma separated list of DBus IDs of helpers whose data should be
> +#           included in the VM state on migration
> +#
> +# Since: 5.0
> +##
> +{ 'struct': 'DBusVMStateProperties',
> +  'data': { 'addr': 'str' ,
> +            '*id-list': 'str' } }

Matches backends/dbus-vmstate.c:dbus_vmstate_class_init(), including
splitting id-list into a GHashTable with get_id_list_set().

Since there is benefit to documenting/converting our existing API in
this series without dragging it out by also trying to fix the warts,

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


