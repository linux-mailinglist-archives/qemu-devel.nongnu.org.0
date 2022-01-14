Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C3C48E9CA
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 13:25:21 +0100 (CET)
Received: from localhost ([::1]:54994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8Ldw-0000DQ-67
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 07:25:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1n8LbV-0007y8-6k
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 07:22:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1n8LbR-0000xs-Qh
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 07:22:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642162964;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H6aoj48L9851WUaiBrBHUtzM8SjnDFRWqzzVE6AGFVw=;
 b=SIqebZdlQz2gBQqQA8QyiIOOaL01kCmjKOY4EkL1f5RLtGxNTgrbVZNnbumg4Bo7E8pIPm
 FQEihTzIe8X2sNOj2B7F3hZxJAHZF5mB+/uXNjYOpgyiOeeyu+QxRHeiA+ZApI/MnP/CwW
 9c/ISJi2rIAqfysYZoIP/4X97aGdZeE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-629-Ak3i0_IzO8iLHyWaJRb1MQ-1; Fri, 14 Jan 2022 07:22:43 -0500
X-MC-Unique: Ak3i0_IzO8iLHyWaJRb1MQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2322B104;
 Fri, 14 Jan 2022 12:22:42 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-9.ams2.redhat.com [10.36.112.9])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B028D78AAE;
 Fri, 14 Jan 2022 12:22:41 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 27AE111380A2; Fri, 14 Jan 2022 13:22:40 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH 1/1] softmmu: fix device deletion events with -device
 JSON syntax
References: <20220105123847.4047954-1-berrange@redhat.com>
 <20220105123847.4047954-2-berrange@redhat.com>
Date: Fri, 14 Jan 2022 13:22:40 +0100
In-Reply-To: <20220105123847.4047954-2-berrange@redhat.com> ("Daniel
 P. =?utf-8?Q?Berrang=C3=A9=22's?= message of "Wed, 5 Jan 2022 12:38:47
 +0000")
Message-ID: <87v8ym1p7z.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Peter Krempa <pkrempa@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> The -device JSON syntax impl leaks a reference on the created
> DeviceState instance. As a result when you hot-unplug the
> device, the device_finalize method won't be called and thus
> it will fail to emit the required DEVICE_DELETED event.
>
> A 'json-cli' feature was previously added against the
> 'device_add' QMP command QAPI schema to indicated to mgmt
> apps that -device supported JSON syntax. Given the hotplug
> bug that feature flag is no unusable for its purpose, so

As Laurent and Thomas pointed out, this should be "is not usable" or "is
unusable".

> we add a new 'json-cli-hotplug' feature to indicate the
> -device supports JSON without breaking hotplug.
>
> Fixes: https://gitlab.com/qemu-project/qemu/-/issues/802
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> ---
>  qapi/qdev.json                 |  5 ++++-
>  softmmu/vl.c                   |  4 +++-
>  tests/qtest/device-plug-test.c | 19 +++++++++++++++++++
>  3 files changed, 26 insertions(+), 2 deletions(-)
>
> diff --git a/qapi/qdev.json b/qapi/qdev.json
> index 69656b14df..26cd10106b 100644
> --- a/qapi/qdev.json
> +++ b/qapi/qdev.json
> @@ -44,6 +44,9 @@
>  # @json-cli: If present, the "-device" command line option supports JSON
>  #            syntax with a structure identical to the arguments of this
>  #            command.
> +# @json-cli-hotplug: If present, the "-device" command line option suppo=
rts JSON
> +#                    syntax without the reference counting leak that bro=
ke
> +#                    hot-unplug

For local consistency, please end the sentence with a period and wrap
lines like so:

   # @json-cli-hotplug: If present, the "-device" command line option suppo=
rts
   #                    JSON syntax without the reference counting leak tha=
t
   #                    broke hot-unplug.

>  #
>  # Notes:
>  #
> @@ -74,7 +77,7 @@
>  { 'command': 'device_add',
>    'data': {'driver': 'str', '*bus': 'str', '*id': 'str'},
>    'gen': false, # so we can get the additional arguments
> -  'features': ['json-cli'] }
> +  'features': ['json-cli', 'json-cli-hotplug'] }
> =20
>  ##
>  # @device_del:

Kevin, I hope you can apply these touch-ups in your tree.  Then, QAPI
schema
Acked-by: Markus Armbruster <armbru@redhat.com>

[...]


