Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6624B2777
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 14:57:39 +0100 (CET)
Received: from localhost ([::1]:58414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIWQb-0003aY-Sd
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 08:57:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nIWGy-0006J3-Ps
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 08:47:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43986)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nIWGu-0005Qb-FS
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 08:47:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644587255;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cZL/WW2lUtszw9ENo3hi++j6ZCrv5P7QlbtYPwQYCfM=;
 b=M8yACIi10Ih9UDP4omrVIlg8QdRrKGWo1SWQX0RNq+86Wn5bRVzOUt/u/DBvxzlFTUAXWB
 nc42kKU3dpivY7mexgXY477cID/j6VKmiwEfTo7bdwfzf6ygoeGAbDt1jNK7X0svOr7hxv
 MkGsOD7VzBGZNrsnhLBbGwBGftquiBw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-299-x9TuS4vpM7-oNss4SdNZ3g-1; Fri, 11 Feb 2022 08:47:32 -0500
X-MC-Unique: x9TuS4vpM7-oNss4SdNZ3g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DA4E384DA48;
 Fri, 11 Feb 2022 13:47:30 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B93B06E20B;
 Fri, 11 Feb 2022 13:46:48 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 38A1C21E6A00; Fri, 11 Feb 2022 14:46:47 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Subject: Re: [RFC 4/8] ioregionfd: Introduce IORegionDFObject type
References: <cover.1644302411.git.elena.ufimtseva@oracle.com>
 <fa5bc2e2773966fd209a2c866eb95ac8ac60a928.1644302411.git.elena.ufimtseva@oracle.com>
Date: Fri, 11 Feb 2022 14:46:47 +0100
In-Reply-To: <fa5bc2e2773966fd209a2c866eb95ac8ac60a928.1644302411.git.elena.ufimtseva@oracle.com>
 (Elena Ufimtseva's message of "Mon, 7 Feb 2022 23:22:18 -0800")
Message-ID: <874k55o6rc.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: eduardo@habkost.net, john.g.johnson@oracle.com, cohuck@redhat.com,
 jag.raman@oracle.com, john.levon@nutanix.com, eblake@redhat.com,
 david@redhat.com, qemu-devel@nongnu.org, peterx@redhat.com, mst@redhat.com,
 berrange@redhat.com, stefanha@redhat.com, pbonzini@redhat.com,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Elena Ufimtseva <elena.ufimtseva@oracle.com> writes:

> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>

[...]

> diff --git a/qapi/qom.json b/qapi/qom.json
> index eeb5395ff3..439fb94c93 100644
> --- a/qapi/qom.json
> +++ b/qapi/qom.json
> @@ -689,6 +689,29 @@
>          'data': { 'chardev': 'str',
>                    '*log': 'str' } }
> =20
> +##
> +# @IORegionFDObjectProperties:
> +#
> +# Describes ioregionfd for the device
> +#
> +# @devid: the id of the device to be associated with the ioregionfd
> +#
> +# @iofd: File descriptor
> +#
> +# @bar: BAR number to use with ioregionfd
> +#
> +# @start: offset from the BAR start address of ioregionfd
> +#
> +# @size: size of the ioregionfd
> +##
> +# Since: 2.9
> +{ 'struct': 'IORegionFDObjectProperties',
> +  'data': { 'devid': 'str',
> +            'iofd': 'str',
> +            'bar': 'int',
> +            '*start': 'int',
> +            '*size':'int' } }

Should these three be 'uint32' to match struct IORegionFD?

> +
>  ##
>  # @RemoteObjectProperties:
>  #
> @@ -842,8 +865,10 @@
>      'tls-creds-psk',
>      'tls-creds-x509',
>      'tls-cipher-suites',
> -    { 'name': 'x-remote-object', 'features': [ 'unstable' ] }
> -  ] }
> +    { 'name': 'x-remote-object', 'features': [ 'unstable' ] },
> +    { 'name' :'ioregionfd-object',
> +      'if': 'CONFIG_IOREGIONFD' }
> + ] }
> =20
>  ##
>  # @ObjectOptions:
> @@ -905,7 +930,8 @@
>        'tls-creds-psk':              'TlsCredsPskProperties',
>        'tls-creds-x509':             'TlsCredsX509Properties',
>        'tls-cipher-suites':          'TlsCredsProperties',
> -      'x-remote-object':            'RemoteObjectProperties'
> +      'x-remote-object':            'RemoteObjectProperties',
> +      'ioregionfd-object':          'IORegionFDObjectProperties'
>    } }
> =20
>  ##
> diff --git a/include/hw/remote/ioregionfd.h b/include/hw/remote/ioregionf=
d.h
> new file mode 100644
> index 0000000000..c8a8b32ee0
> --- /dev/null
> +++ b/include/hw/remote/ioregionfd.h
> @@ -0,0 +1,40 @@
> +/*
> + * Ioregionfd headers
> + *
> + * Copyright =C2=A9 2018, 2022 Oracle and/or its affiliates.
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or la=
ter.
> + * See the COPYING file in the top-level directory.
> + *
> + */
> +
> +#ifndef IOREGIONFD_H
> +#define IOREGIONFD_H
> +
> +#define PCI_BARS_NR 6
> +
> +typedef struct {
> +    uint64_t val;
> +    bool memory;
> +} IORegionFDOp;
> +
> +typedef struct {
> +    int fd;
> +    char *devid;
> +    uint32_t bar;
> +    uint32_t start;
> +    uint32_t size;
> +    bool memory;
> +} IORegionFD;
> +
> +struct IORegionFDObject {
> +    /* private */
> +    Object parent;
> +
> +    IORegionFD ioregfd;
> +    QTAILQ_ENTRY(IORegionFDObject) next;
> +};
> +
> +typedef struct IORegionFDObject IORegionFDObject;
> +
> +#endif /* IOREGIONFD_H */

[...]


