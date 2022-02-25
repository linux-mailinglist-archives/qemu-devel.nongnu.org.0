Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D4094C4A3A
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 17:13:54 +0100 (CET)
Received: from localhost ([::1]:56522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNdE9-00065G-Du
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 11:13:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nNd7C-0000nj-Pf
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 11:06:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nNd78-0001ey-Aq
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 11:06:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645805194;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OWOU0S1ts+HfQEulEFqtbS/atrNSBIj40Uwq6HFOvVE=;
 b=iaR9FwuEQBqRr5ZW5JIfGnSA98Sntnw48qCG0Sm7mV4LQboiDNmGAdLAnEyA1kJVCK8s9T
 pRO/24r1jeSboZMANlysfpNJ/4nZmAOc4hiuyQRXSocPV3ZWmrqYbt92v4YoMeHG1jUPN/
 Zqr6gbpWn7dIIOBBxvKO3mIiwgYo5Hg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-336-ynXaZOUDNHODMSoNP8jAzw-1; Fri, 25 Feb 2022 11:06:29 -0500
X-MC-Unique: ynXaZOUDNHODMSoNP8jAzw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 306411854E21;
 Fri, 25 Feb 2022 16:06:27 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.240])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BA7A97C02A;
 Fri, 25 Feb 2022 16:06:24 +0000 (UTC)
Date: Fri, 25 Feb 2022 10:06:22 -0600
From: Eric Blake <eblake@redhat.com>
To: Jagannathan Raman <jag.raman@oracle.com>
Subject: Re: [PATCH v6 10/19] vfio-user: run vfio-user context
Message-ID: <20220225160622.e7nwnsdkhcsfc4gf@redhat.com>
References: <cover.1645079934.git.jag.raman@oracle.com>
 <1735f90d6a5784a93cad5e46ebc6bb1a40ba1f5f.1645079934.git.jag.raman@oracle.com>
MIME-Version: 1.0
In-Reply-To: <1735f90d6a5784a93cad5e46ebc6bb1a40ba1f5f.1645079934.git.jag.raman@oracle.com>
User-Agent: NeoMutt/20211029-364-42e4ad
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: eduardo@habkost.net, elena.ufimtseva@oracle.com, john.g.johnson@oracle.com,
 berrange@redhat.com, bleal@redhat.com, john.levon@nutanix.com, mst@redhat.com,
 armbru@redhat.com, quintela@redhat.com, f4bug@amsat.org, qemu-devel@nongnu.org,
 alex.williamson@redhat.com, kanth.ghatraju@oracle.com, dgilbert@redhat.com,
 stefanha@redhat.com, thanos.makatos@nutanix.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 17, 2022 at 02:48:57AM -0500, Jagannathan Raman wrote:
> Setup a handler to run vfio-user context. The context is driven by
> messages to the file descriptor associated with it - get the fd for
> the context and hook up the handler with it
> 
> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> ---
>  qapi/misc.json            | 23 ++++++++++
>  hw/remote/vfio-user-obj.c | 96 ++++++++++++++++++++++++++++++++++++++-
>  2 files changed, 118 insertions(+), 1 deletion(-)
> 
> diff --git a/qapi/misc.json b/qapi/misc.json
> index e8054f415b..9d7f12ab04 100644
> --- a/qapi/misc.json
> +++ b/qapi/misc.json
> @@ -527,3 +527,26 @@
>   'data': { '*option': 'str' },
>   'returns': ['CommandLineOptionInfo'],
>   'allow-preconfig': true }
> +
> +##
> +# @VFU_CLIENT_HANGUP:
> +#
> +# Emitted when the client of a TYPE_VFIO_USER_SERVER closes the
> +# communication channel
> +#
> +# @id: ID of the TYPE_VFIO_USER_SERVER object
> +#
> +# @device: ID of attached PCI device
> +#
> +# Since: 6.3

7.0

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


