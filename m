Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A53434CBD52
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 13:04:11 +0100 (CET)
Received: from localhost ([::1]:52834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPkBm-0005Mg-7s
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 07:04:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nPk7t-00027c-K9
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 07:00:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58248)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nPk7p-0003L6-Q7
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 07:00:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646308803;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pmMcfWY17idQ1ohLoyYQ5VFlBA6g9K5zLlRbNyqkFEE=;
 b=IGVJJ8MWcdvBxLp0nbAmwYCIfYvmucBmufq55i9gEfrPIYsoHHV5t5ZtpMiCCmcpWrYnge
 3nUjgNxF8kqM23NIHeLLanU8ZlNNByHlh3/7PNQwY0NETG5a0Li0me8Did5MR54U/GaNW7
 e7tzWe+Qa4YC5sEnLV7+y3mZkH/z2Jw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-643-27k8PgKZNnGxeOj9X-dK4w-1; Thu, 03 Mar 2022 07:00:00 -0500
X-MC-Unique: 27k8PgKZNnGxeOj9X-dK4w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6BC1E18009C5;
 Thu,  3 Mar 2022 11:59:58 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6251B84951;
 Thu,  3 Mar 2022 11:59:44 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8122621E6A00; Thu,  3 Mar 2022 12:59:42 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Eugenio Perez Martin <eperezma@redhat.com>
Subject: Re: [PATCH v3 14/14] vdpa: Add x-svq to NetdevVhostVDPAOptions
References: <20220302203012.3476835-1-eperezma@redhat.com>
 <20220302203012.3476835-15-eperezma@redhat.com>
 <87ee3jeff1.fsf@pond.sub.org>
 <CAJaqyWfKQKWMs-tLRyuJ=C7VrsFUS8KHiXQVZHqfj_T5_zeBXQ@mail.gmail.com>
Date: Thu, 03 Mar 2022 12:59:42 +0100
In-Reply-To: <CAJaqyWfKQKWMs-tLRyuJ=C7VrsFUS8KHiXQVZHqfj_T5_zeBXQ@mail.gmail.com>
 (Eugenio Perez Martin's message of "Thu, 3 Mar 2022 10:53:22 +0100")
Message-ID: <87bkyncklt.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
 qemu-level <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 virtualization <virtualization@lists.linux-foundation.org>,
 Eli Cohen <eli@mellanox.com>, Eric Blake <eblake@redhat.com>,
 Parav Pandit <parav@mellanox.com>, Cindy Lu <lulu@redhat.com>, "Fangyi
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

Eugenio Perez Martin <eperezma@redhat.com> writes:

> On Thu, Mar 3, 2022 at 7:09 AM Markus Armbruster <armbru@redhat.com> wrot=
e:
>>
>> Eugenio P=C3=A9rez <eperezma@redhat.com> writes:
>>
>> > Finally offering the possibility to enable SVQ from the command line.
>> >
>> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
>> > ---
>> >  qapi/net.json    |  5 ++++-
>> >  net/vhost-vdpa.c | 48 ++++++++++++++++++++++++++++++++++++++++-------=
-
>> >  2 files changed, 44 insertions(+), 9 deletions(-)
>> >
>> > diff --git a/qapi/net.json b/qapi/net.json
>> > index 7fab2e7cd8..d243701527 100644
>> > --- a/qapi/net.json
>> > +++ b/qapi/net.json
>> > @@ -445,12 +445,15 @@
>> >  # @queues: number of queues to be created for multiqueue vhost-vdpa
>> >  #          (default: 1)
>> >  #
>> > +# @x-svq: Start device with (experimental) shadow virtqueue. (Since 7=
.0)
>> > +#
>> >  # Since: 5.1
>> >  ##
>> >  { 'struct': 'NetdevVhostVDPAOptions',
>> >    'data': {
>> >      '*vhostdev':     'str',
>> > -    '*queues':       'int' } }
>> > +    '*queues':       'int',
>> > +    '*x-svqs':        'bool' } }
>>
>> Experimental members *must* be tagged with feature @unstable.  Their
>> name *may* start with 'x-' to help human users, at the cost of renames
>> when the member becomes stable.
>>
>
> Hi Markus,
>
> Thank you very much for the warning. I'll add the unstable feature tag.
>
> If I understood correctly this needs to be done as x-perf at
> BackupCommon struct. Could you confirm to me that it marks only the
> x-perf member as unstable? Without reading the actual comment it might
> seem as if it marks all the whole BackupCommon struct as unstable.
>
> # ...
> # @filter-node-name: the node name that should be assigned to the
> #                    filter driver that the backup job inserts into the g=
raph
> #                    above node specified by @drive. If this option is
> not given,
> #                    a node name is autogenerated. (Since: 4.2)
> #
> # @x-perf: Performance options. (Since 6.0)
> #
> # Features:
> # @unstable: Member @x-perf is experimental.
> #
> # Note: @on-source-error and @on-target-error only affect background
> #       I/O.  If an error occurs during a guest write request, the device=
's
> #       rerror/werror actions will be used.
> #
> # Since: 4.2
> ##
> { 'struct': 'BackupCommon',
>   'data': { ...
>             '*filter-node-name': 'str',
>             '*x-perf': { 'type': 'BackupPerf',
>                          'features': [ 'unstable' ] } } }

This tacks features to member @x-perf, i.e. they apply just to member
@x-perf.

Features can also be tacked to the struct type, like this:

  { 'struct': 'BackupCommon',
    'data': { ...
              '*filter-node-name': 'str',
              '*x-perf': 'BackupPerf' },
    'features': [ 'unstable' ] }

Now they apply to type BackupCommon as a whole.

BlockdevOptionsFile in block-core.json actually makes use of both ways:

{ 'struct': 'BlockdevOptionsFile',
  'data': { 'filename': 'str',
            '*pr-manager': 'str',
            '*locking': 'OnOffAuto',
            '*aio': 'BlockdevAioOptions',
            '*aio-max-batch': 'int',
            '*drop-cache': {'type': 'bool',
                            'if': 'CONFIG_LINUX'},
            '*x-check-cache-dropped': { 'type': 'bool',
                                        'features': [ 'unstable' ] } },
  'features': [ { 'name': 'dynamic-auto-read-only',
                  'if': 'CONFIG_POSIX' } ] }

Feature @dynamic-auto-read-only applies to the type, and feature
@unstable applies to member @x-check-cache-dropped.

Questions?


