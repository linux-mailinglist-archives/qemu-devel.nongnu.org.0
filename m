Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB784292E36
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Oct 2020 21:10:14 +0200 (CEST)
Received: from localhost ([::1]:46988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kUaXt-0007Pf-R2
	for lists+qemu-devel@lfdr.de; Mon, 19 Oct 2020 15:10:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kUaQy-0008NI-VT
 for qemu-devel@nongnu.org; Mon, 19 Oct 2020 15:03:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:25177)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kUaQx-0000sC-69
 for qemu-devel@nongnu.org; Mon, 19 Oct 2020 15:03:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603134177;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DsHRqz/hw9A2wQ2KHjiY0gp6LVChFddrXfLATSRgJSg=;
 b=OzdSJdcT8VvaBM1fMQTNdDuImpPbnymIXEeMHDK9tF1cZRB2Gk5binKe+hN/6a2NIsl9hD
 lP0ed44zWj/vJCJ1Z7xkWiWUVj90aWInqjQ8rTbSOsmONOy7iVIwT1nTdJzvDI7EoSlEEv
 iCJ7K0g6Ss8Xmy/RvLmFmRxDV4nP46o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-14-Vvv_EOWSOByC453BXeBoOg-1; Mon, 19 Oct 2020 15:02:53 -0400
X-MC-Unique: Vvv_EOWSOByC453BXeBoOg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EB4B48030AD;
 Mon, 19 Oct 2020 19:02:51 +0000 (UTC)
Received: from [10.3.112.28] (ovpn-112-28.phx2.redhat.com [10.3.112.28])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 625C560C13;
 Mon, 19 Oct 2020 19:02:48 +0000 (UTC)
Subject: Re: [PATCH 2/2] qga: add ssh-{add,remove}-authorized-keys
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20201013202502.335336-1-marcandre.lureau@redhat.com>
 <20201013202502.335336-3-marcandre.lureau@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <d0f6e513-d890-5759-0a1e-de37a5ee241a@redhat.com>
Date: Mon, 19 Oct 2020 14:02:47 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201013202502.335336-3-marcandre.lureau@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/19 02:32:01
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: berrange@redhat.com, Michael Roth <mdroth@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/13/20 3:25 PM, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Add new commands to add and remove SSH public keys from
> ~/.ssh/authorized_keys.
> 

> +++ b/qga/qapi-schema.json
> @@ -1306,3 +1306,35 @@
>   ##
>   { 'command': 'guest-get-devices',
>     'returns': ['GuestDeviceInfo'] }
> +
> +##
> +# @guest-ssh-add-authorized-keys:
> +#
> +# @username: the user account to add the authorized key
> +# @keys: the public keys to add (in OpenSSH format)
> +#
> +# Append a public key to user $HOME/.ssh/authorized_keys on Unix systems (not

How is $HOME related to @username?

> +# implemented for other systems).
> +#
> +# Returns: Nothing on success.

Do we really need this line?

> +#
> +# Since: 5.2
> +##
> +{ 'command': 'guest-ssh-add-authorized-keys',
> +  'data': { 'username': 'str', 'keys': ['str'] } }

Should we use QAPI 'if' to avoid even having to compile a stub on 
Windows, and for better introspection (well, if we ever add a way to do 
qga introspection that parallels QMP's query-qmp-schema)?

> +
> +##
> +# @guest-ssh-remove-authorized-keys:
> +#
> +# @username: the user account to add the authorized key
> +# @keys: the public keys to remove (in OpenSSH format)
> +#
> +# Remove public keys from the user $HOME/.ssh/authorized_keys on Unix systems
> +# (not implemented for other systems).
> +#
> +# Returns: Nothing on success.
> +#
> +# Since: 5.2
> +##
> +{ 'command': 'guest-ssh-remove-authorized-keys',
> +  'data': { 'username': 'str', 'keys': ['str'] } }
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


