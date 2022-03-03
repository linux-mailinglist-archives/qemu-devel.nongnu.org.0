Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1004CBAD9
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 10:56:54 +0100 (CET)
Received: from localhost ([::1]:60918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPiCb-00020V-6i
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 04:56:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nPi9u-0007XQ-J4
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 04:54:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nPi9r-0008Rq-KG
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 04:54:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646301242;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1XMpx11FsgdqDSztpLGhU3nOvTThIpvFS5LunMBeh04=;
 b=cMEqg2gikHjHqIvvGaWocJBZKjDDDmMurr4s1FBZNRVlegCf2m3zLtUZM4rF0mU8PNfROg
 JBRV7qTTtBhu8qqsZljpV2izCKQckXbrInPDRzVV3Ow47oOEF9X821DSR9EbbDt+P5ave1
 Tx0RIOEjFmh23deEP3YaMf1mGH+B8TM=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-73-HxCuCzMbMCW_pugXHasDvg-1; Thu, 03 Mar 2022 04:53:59 -0500
X-MC-Unique: HxCuCzMbMCW_pugXHasDvg-1
Received: by mail-qk1-f200.google.com with SMTP id
 3-20020a370603000000b0060de5e49129so2958125qkg.2
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 01:53:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=1XMpx11FsgdqDSztpLGhU3nOvTThIpvFS5LunMBeh04=;
 b=0uzIu834SBf8Fnie219cCUrDYU/jpnytN0edVc6u1TitNq/NvXQFVeiFFWjdSiqMzT
 zgwRi4bkKl6DaptQDXz3sXw2iVXaW9I5DUftcvZ7viH2jizSI3Y6w2P6xC22yc/QPMkQ
 CJMLAaJ8RuZLIsLNvDXVq4VnPGnn/AbAqwN2GXyRjwDN/Mt8f8rZjWHOkqoQJsoMFA2K
 nVtcXr7IAhEAoxWszxvPulSRDYRXmE2LazaabjlyF5VUdPXwpdkcS/m4tRdFuq2pH7ZN
 FAkvxnWhRy5uhItqEBibU1XHK1lKX5E+TEzVpvcG/0VfFV+DoUjeBAgLK6BomdYc+0Sn
 hZoQ==
X-Gm-Message-State: AOAM533bWgKNifor68zVCxoChR0tcFh29LSvXK6PGViYzN/FVykzDVHl
 KeJBQxmhnJzoxb5pnCevTUxdHUI5ZetB8oIww/PrswJK59Ypt8Ys6QI3IbJ3OPHMUOrjWoxalOJ
 9Rt1r9rOnreN3gNaWaAYN0adRUpflIkE=
X-Received: by 2002:a05:622a:1301:b0:2de:82c5:8409 with SMTP id
 v1-20020a05622a130100b002de82c58409mr26283107qtk.403.1646301238869; 
 Thu, 03 Mar 2022 01:53:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyxxpT2e/bXZV0MX/56aj9fthO8POlzOClgiCnq1fhRAnaGRhVuSLyBZ6Gniid7Z08epghOrUW9SCtSCFKePJg=
X-Received: by 2002:a05:622a:1301:b0:2de:82c5:8409 with SMTP id
 v1-20020a05622a130100b002de82c58409mr26283079qtk.403.1646301238591; Thu, 03
 Mar 2022 01:53:58 -0800 (PST)
MIME-Version: 1.0
References: <20220302203012.3476835-1-eperezma@redhat.com>
 <20220302203012.3476835-15-eperezma@redhat.com>
 <87ee3jeff1.fsf@pond.sub.org>
In-Reply-To: <87ee3jeff1.fsf@pond.sub.org>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Thu, 3 Mar 2022 10:53:22 +0100
Message-ID: <CAJaqyWfKQKWMs-tLRyuJ=C7VrsFUS8KHiXQVZHqfj_T5_zeBXQ@mail.gmail.com>
Subject: Re: [PATCH v3 14/14] vdpa: Add x-svq to NetdevVhostVDPAOptions
To: Markus Armbruster <armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
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
 Parav Pandit <parav@mellanox.com>, Cindy Lu <lulu@redhat.com>,
 "Fangyi \(Eric\)" <eric.fangyi@huawei.com>, yebiaoxiang@huawei.com,
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

On Thu, Mar 3, 2022 at 7:09 AM Markus Armbruster <armbru@redhat.com> wrote:
>
> Eugenio P=C3=A9rez <eperezma@redhat.com> writes:
>
> > Finally offering the possibility to enable SVQ from the command line.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >  qapi/net.json    |  5 ++++-
> >  net/vhost-vdpa.c | 48 ++++++++++++++++++++++++++++++++++++++++--------
> >  2 files changed, 44 insertions(+), 9 deletions(-)
> >
> > diff --git a/qapi/net.json b/qapi/net.json
> > index 7fab2e7cd8..d243701527 100644
> > --- a/qapi/net.json
> > +++ b/qapi/net.json
> > @@ -445,12 +445,15 @@
> >  # @queues: number of queues to be created for multiqueue vhost-vdpa
> >  #          (default: 1)
> >  #
> > +# @x-svq: Start device with (experimental) shadow virtqueue. (Since 7.=
0)
> > +#
> >  # Since: 5.1
> >  ##
> >  { 'struct': 'NetdevVhostVDPAOptions',
> >    'data': {
> >      '*vhostdev':     'str',
> > -    '*queues':       'int' } }
> > +    '*queues':       'int',
> > +    '*x-svqs':        'bool' } }
>
> Experimental members *must* be tagged with feature @unstable.  Their
> name *may* start with 'x-' to help human users, at the cost of renames
> when the member becomes stable.
>

Hi Markus,

Thank you very much for the warning. I'll add the unstable feature tag.

If I understood correctly this needs to be done as x-perf at
BackupCommon struct. Could you confirm to me that it marks only the
x-perf member as unstable? Without reading the actual comment it might
seem as if it marks all the whole BackupCommon struct as unstable.

# ...
# @filter-node-name: the node name that should be assigned to the
#                    filter driver that the backup job inserts into the gra=
ph
#                    above node specified by @drive. If this option is
not given,
#                    a node name is autogenerated. (Since: 4.2)
#
# @x-perf: Performance options. (Since 6.0)
#
# Features:
# @unstable: Member @x-perf is experimental.
#
# Note: @on-source-error and @on-target-error only affect background
#       I/O.  If an error occurs during a guest write request, the device's
#       rerror/werror actions will be used.
#
# Since: 4.2
##
{ 'struct': 'BackupCommon',
  'data': { ...
            '*filter-node-name': 'str',
            '*x-perf': { 'type': 'BackupPerf',
                         'features': [ 'unstable' ] } } }


