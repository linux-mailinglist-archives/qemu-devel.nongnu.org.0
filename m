Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 452346E44B8
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Apr 2023 12:03:59 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poLh6-0000Qa-36; Mon, 17 Apr 2023 06:02:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1poLh3-0000QK-OR
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 06:02:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1poLh2-00019y-3L
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 06:02:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681725758;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j7TEown2p8B05w+IV52XsuNVfXfW9Mt2cPM4NQG0vB4=;
 b=caQX4DbKLb9LzW1q10fugG4AezYIgNO7qFZosRvRY7JPrwYhkO3y+9DQewlbKmG4X++naC
 6njAC6+JOYg0fsdAqHrb+R9/mVUCyEfiIa6O4NZiSVDeRF1upo0NyDQqnUF0M3mc+d6m+D
 qf3QJo0h9CkN8K7BNVKUm+4vDtcF9mI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-562-9KPxZQa5MomP0PZEaJfAZQ-1; Mon, 17 Apr 2023 06:02:35 -0400
X-MC-Unique: 9KPxZQa5MomP0PZEaJfAZQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 76473185A7A4;
 Mon, 17 Apr 2023 10:02:34 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.60])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 164732166B29;
 Mon, 17 Apr 2023 10:02:34 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 11F8421E5A0D; Mon, 17 Apr 2023 12:02:33 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org,  "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>,  "Michael S. Tsirkin"
 <mst@redhat.com>,  virtio-fs@redhat.com,  Erik Schilling
 <erik.schilling@linaro.org>,  =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>,  Eduardo Habkost <eduardo@habkost.net>,
 Stefan Hajnoczi <stefanha@redhat.com>,  Eric Blake <eblake@redhat.com>,
 Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  Jason Wang
 <jasowang@redhat.com>,  Viresh Kumar <viresh.kumar@linaro.org>,  Mathieu
 Poirier <mathieu.poirier@linaro.org>,  Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH 08/12] qom: allow for properties to become "fixed"
References: <20230414160433.2096866-1-alex.bennee@linaro.org>
 <20230414160433.2096866-9-alex.bennee@linaro.org>
Date: Mon, 17 Apr 2023 12:02:33 +0200
In-Reply-To: <20230414160433.2096866-9-alex.bennee@linaro.org> ("Alex
 =?utf-8?Q?Benn=C3=A9e=22's?= message of "Fri, 14 Apr 2023 17:04:29 +0100")
Message-ID: <87bkjmddxi.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> When specialising general purpose objects it is sometimes useful to
> "fix" some of the properties that were configurable by the base
> classes. We will use this facility when specialising
> vhost-user-device.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  qapi/qom.json           |  2 ++
>  include/qom/object.h    | 16 +++++++++++++++-
>  qom/object.c            | 14 ++++++++++++++
>  qom/object_interfaces.c |  9 ++++++---
>  qom/qom-qmp-cmds.c      |  1 +
>  softmmu/qdev-monitor.c  |  1 +
>  6 files changed, 39 insertions(+), 4 deletions(-)
>
> diff --git a/qapi/qom.json b/qapi/qom.json
> index a877b879b9..4cda191f00 100644
> --- a/qapi/qom.json
> +++ b/qapi/qom.json
> @@ -33,12 +33,14 @@
>  # @description: if specified, the description of the property.
>  #
>  # @default-value: the default value, if any (since 5.0)
> +# @fixed: if specified if value has been fixed (since 8.1)

Wat?

>  #
>  # Since: 1.2
>  ##
>  { 'struct': 'ObjectPropertyInfo',
>    'data': { 'name': 'str',
>              'type': 'str',
> +            'fixed': 'bool',
>              '*description': 'str',
>              '*default-value': 'any' } }
>=20=20

qom-list and qom-list-properties return a list of this.  Use cases for
the new member?

[...]


