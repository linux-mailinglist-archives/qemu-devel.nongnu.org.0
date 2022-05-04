Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3085519F18
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 14:18:16 +0200 (CEST)
Received: from localhost ([::1]:54002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmDxP-0006gn-DF
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 08:18:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nmDRU-0003aL-In
 for qemu-devel@nongnu.org; Wed, 04 May 2022 07:45:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59407)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nmDRR-0005yg-Ne
 for qemu-devel@nongnu.org; Wed, 04 May 2022 07:45:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651664712;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5iFeVL0+DYVMSkeyB2I0ldQraj4Bk44Arqo+g5aS5O0=;
 b=TVOhohAZSLTYXLZ/5kkEYwfNV+g6OAGV/aE4Po/qlhzQ7FsBQLgs1ipmH9FQr8Jkgb6KBT
 SQCfbJ8f/gT3Bsnoizl/fHsELBS6uXsWJ2zYRqutmSUILQ23YeLOXxSsyPCklLfP4/YWSm
 xncstvSihxPqucaICKEBXLpUfypQHgo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-5-BlE_jNdTPqieaYPi1HL0Tg-1; Wed, 04 May 2022 07:45:09 -0400
X-MC-Unique: BlE_jNdTPqieaYPi1HL0Tg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BA82E904864;
 Wed,  4 May 2022 11:45:08 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 81CEF155973A;
 Wed,  4 May 2022 11:45:08 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 743EF21E68BC; Wed,  4 May 2022 13:45:07 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Jagannathan Raman <jag.raman@oracle.com>
Cc: qemu-devel@nongnu.org,  stefanha@redhat.com,  mst@redhat.com,
 f4bug@amsat.org,  pbonzini@redhat.com,  marcandre.lureau@redhat.com,
 thuth@redhat.com,  bleal@redhat.com,  berrange@redhat.com,
 eduardo@habkost.net,  marcel.apfelbaum@gmail.com,  eblake@redhat.com,
 quintela@redhat.com,  dgilbert@redhat.com,  imammedo@redhat.com,
 peterx@redhat.com,  john.levon@nutanix.com,  thanos.makatos@nutanix.com,
 elena.ufimtseva@oracle.com,  john.g.johnson@oracle.com,
 kanth.ghatraju@oracle.com
Subject: Re: [PATCH v9 07/17] vfio-user: define vfio-user-server object
References: <cover.1651586203.git.jag.raman@oracle.com>
 <48d0f7214036d48b1f70b90a8c4a6c2a46363ee9.1651586203.git.jag.raman@oracle.com>
Date: Wed, 04 May 2022 13:45:07 +0200
In-Reply-To: <48d0f7214036d48b1f70b90a8c4a6c2a46363ee9.1651586203.git.jag.raman@oracle.com>
 (Jagannathan Raman's message of "Tue, 3 May 2022 10:16:48 -0400")
Message-ID: <871qx97c8s.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Jagannathan Raman <jag.raman@oracle.com> writes:

> Define vfio-user object which is remote process server for QEMU. Setup
> object initialization functions and properties necessary to instantiate
> the object
>
> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> ---
>  qapi/qom.json               |  20 +++-
>  include/hw/remote/machine.h |   2 +
>  hw/remote/machine.c         |  27 +++++
>  hw/remote/vfio-user-obj.c   | 210 ++++++++++++++++++++++++++++++++++++
>  MAINTAINERS                 |   1 +
>  hw/remote/meson.build       |   1 +
>  hw/remote/trace-events      |   3 +
>  7 files changed, 262 insertions(+), 2 deletions(-)
>  create mode 100644 hw/remote/vfio-user-obj.c
>
> diff --git a/qapi/qom.json b/qapi/qom.json
> index eeb5395ff3..582def0522 100644
> --- a/qapi/qom.json
> +++ b/qapi/qom.json
> @@ -703,6 +703,20 @@
>  { 'struct': 'RemoteObjectProperties',
>    'data': { 'fd': 'str', 'devid': 'str' } }
>  
> +##
> +# @VfioUserServerProperties:
> +#
> +# Properties for x-vfio-user-server objects.
> +#
> +# @socket: socket to be used by the libvfio-user library
> +#
> +# @device: the id of the device to be emulated at the server

Suggest "the ID", because "id" is not a word.

What kind of ID is this?  The kind set with -device id=...?

> +#
> +# Since: 7.1
> +##
> +{ 'struct': 'VfioUserServerProperties',
> +  'data': { 'socket': 'SocketAddress', 'device': 'str' } }
> +
>  ##
>  # @RngProperties:
>  #
> @@ -842,7 +856,8 @@
>      'tls-creds-psk',
>      'tls-creds-x509',
>      'tls-cipher-suites',
> -    { 'name': 'x-remote-object', 'features': [ 'unstable' ] }
> +    { 'name': 'x-remote-object', 'features': [ 'unstable' ] },
> +    { 'name': 'x-vfio-user-server', 'features': [ 'unstable' ] }
>    ] }
>  
>  ##
> @@ -905,7 +920,8 @@
>        'tls-creds-psk':              'TlsCredsPskProperties',
>        'tls-creds-x509':             'TlsCredsX509Properties',
>        'tls-cipher-suites':          'TlsCredsProperties',
> -      'x-remote-object':            'RemoteObjectProperties'
> +      'x-remote-object':            'RemoteObjectProperties',
> +      'x-vfio-user-server':         'VfioUserServerProperties'
>    } }
>  
>  ##

[...]


