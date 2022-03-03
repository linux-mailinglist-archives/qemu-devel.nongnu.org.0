Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1DB34CB6BB
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 07:11:18 +0100 (CET)
Received: from localhost ([::1]:50680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPegH-0004m1-IU
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 01:11:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nPeee-000465-N7
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 01:09:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38065)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nPeec-0005RI-HH
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 01:09:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646287773;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dLasci9JOrEKbzUW3Fox6Qblvgrx4sGIJsftySO+bEs=;
 b=LVTGFscx2S2JxBTbjP+uuSoaKUzJ8ztdfcm7jN/9L2FSI36Bctefx8CSIJZXWtqm0JmGv+
 liCNvw4GX6u+cRgfuo+bFhgNJ3mAWm2lE1vXpTLeEWuWPsIkhe2BZd/mpLta8HtMLvCAlh
 u3feJ3hzgP+glVKbzJyehHENtfIkX7I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-581-C00zChpsPwO9cToDwlELNw-1; Thu, 03 Mar 2022 01:09:30 -0500
X-MC-Unique: C00zChpsPwO9cToDwlELNw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 07B4E1006AA7;
 Thu,  3 Mar 2022 06:09:28 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BFF2E5DBBB;
 Thu,  3 Mar 2022 06:08:51 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4BA5A21E6A00; Thu,  3 Mar 2022 07:08:50 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Eugenio =?utf-8?Q?P=C3=A9rez?= <eperezma@redhat.com>
Subject: Re: [PATCH v3 14/14] vdpa: Add x-svq to NetdevVhostVDPAOptions
References: <20220302203012.3476835-1-eperezma@redhat.com>
 <20220302203012.3476835-15-eperezma@redhat.com>
Date: Thu, 03 Mar 2022 07:08:50 +0100
In-Reply-To: <20220302203012.3476835-15-eperezma@redhat.com> ("Eugenio
 =?utf-8?Q?P=C3=A9rez=22's?= message of "Wed, 2 Mar 2022 21:30:12 +0100")
Message-ID: <87ee3jeff1.fsf@pond.sub.org>
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 virtualization@lists.linux-foundation.org, Eli Cohen <eli@mellanox.com>,
 Eric Blake <eblake@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Cindy Lu <lulu@redhat.com>, "Fangyi
 \(Eric\)" <eric.fangyi@huawei.com>, yebiaoxiang@huawei.com,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gautam Dawar <gdawar@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eugenio P=C3=A9rez <eperezma@redhat.com> writes:

> Finally offering the possibility to enable SVQ from the command line.
>
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> ---
>  qapi/net.json    |  5 ++++-
>  net/vhost-vdpa.c | 48 ++++++++++++++++++++++++++++++++++++++++--------
>  2 files changed, 44 insertions(+), 9 deletions(-)
>
> diff --git a/qapi/net.json b/qapi/net.json
> index 7fab2e7cd8..d243701527 100644
> --- a/qapi/net.json
> +++ b/qapi/net.json
> @@ -445,12 +445,15 @@
>  # @queues: number of queues to be created for multiqueue vhost-vdpa
>  #          (default: 1)
>  #
> +# @x-svq: Start device with (experimental) shadow virtqueue. (Since 7.0)
> +#
>  # Since: 5.1
>  ##
>  { 'struct': 'NetdevVhostVDPAOptions',
>    'data': {
>      '*vhostdev':     'str',
> -    '*queues':       'int' } }
> +    '*queues':       'int',
> +    '*x-svq':        'bool' } }

Experimental members *must* be tagged with feature @unstable.  Their
name *may* start with 'x-' to help human users, at the cost of renames
when the member becomes stable.

Documentation is in docs/devel/qapi-code-gen.rst:

    Features
    --------

    Syntax::

        FEATURES =3D [ FEATURE, ... ]
        FEATURE =3D STRING
                | { 'name': STRING, '*if': COND }

    Sometimes, the behaviour of QEMU changes compatibly, but without a
    change in the QMP syntax (usually by allowing values or operations
    that previously resulted in an error).  QMP clients may still need to
    know whether the extension is available.

    For this purpose, a list of features can be specified for a command or
    struct type.  Each list member can either be ``{ 'name': STRING, '*if':
    COND }``, or STRING, which is shorthand for ``{ 'name': STRING }``.

    The optional 'if' member specifies a conditional.  See `Configuring
    the schema`_ below for more on this.

    Example::

     { 'struct': 'TestType',
       'data': { 'number': 'int' },
       'features': [ 'allow-negative-numbers' ] }

    The feature strings are exposed to clients in introspection, as
    explained in section `Client JSON Protocol introspection`_.

    Intended use is to have each feature string signal that this build of
    QEMU shows a certain behaviour.


    Special features
    ~~~~~~~~~~~~~~~~

    [...]

    Feature "unstable" marks a command, event, enum value, or struct
    member as unstable.  It is not supported elsewhere so far.  Interfaces
    so marked may be withdrawn or changed incompatibly in future releases.


    Naming rules and reserved names
    -------------------------------

    [...]

    Names beginning with ``x-`` used to signify "experimental".  This
    convention has been replaced by special feature "unstable".

Rationale is in the commit message:

commit a3c45b3e62962f99338716b1347cfb0d427cea44
Author: Markus Armbruster <armbru@redhat.com>
Date:   Thu Oct 28 12:25:12 2021 +0200

    qapi: New special feature flag "unstable"
   =20
    By convention, names starting with "x-" are experimental.  The parts
    of external interfaces so named may be withdrawn or changed
    incompatibly in future releases.
   =20
    The naming convention makes unstable interfaces easy to recognize.
    Promoting something from experimental to stable involves a name
    change.  Client code needs to be updated.  Occasionally bothersome.
   =20
    Worse, the convention is not universally observed:
   =20
    * QOM type "input-barrier" has properties "x-origin", "y-origin".
      Looks accidental, but it's ABI since 4.2.
   =20
    * QOM types "memory-backend-file", "memory-backend-memfd",
      "memory-backend-ram", and "memory-backend-epc" have a property
      "x-use-canonical-path-for-ramblock-id" that is documented to be
      stable despite its name.
   =20
    We could document these exceptions, but documentation helps only
    humans.  We want to recognize "unstable" in code, like "deprecated".
   =20
    So support recognizing it the same way: introduce new special feature
    flag "unstable".  It will be treated specially by the QAPI generator,
    like the existing feature flag "deprecated", and unlike regular
    feature flags.
   =20
    This commit updates documentation and prepares tests.  The next commit
    updates the QAPI schema.  The remaining patches update the QAPI
    generator and wire up -compat policy checking.
   =20
    Management applications can then use query-qmp-schema and -compat to
    manage or guard against use of unstable interfaces the same way as for
    deprecated interfaces.
   =20
    docs/devel/qapi-code-gen.txt no longer mandates the naming convention.
    Using it anyway might help writers of programs that aren't
    full-fledged management applications.  Not using it can save us
    bothersome renames.  We'll see how that shakes out.
   =20
    Signed-off-by: Markus Armbruster <armbru@redhat.com>
    Reviewed-by: Juan Quintela <quintela@redhat.com>
    Reviewed-by: John Snow <jsnow@redhat.com>
    Message-Id: <20211028102520.747396-2-armbru@redhat.com>


> =20
>  ##
>  # @NetClientDriver:

[...]


