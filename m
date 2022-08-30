Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E59C5A6714
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Aug 2022 17:14:30 +0200 (CEST)
Received: from localhost ([::1]:52474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oT2wf-0006hO-4Q
	for lists+qemu-devel@lfdr.de; Tue, 30 Aug 2022 11:14:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oT2rm-0003nx-R1
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 11:09:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30207)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oT2rj-0005qT-IG
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 11:09:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661872162;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rmiTtr6IAgphjzYhXyVya0P5JymekPDTgG9Am+1i3xI=;
 b=LYxAvx4ljWRDZG8TF1Z5KYIUDqEfpGgf8kcLAnNxXifjlU9tqd5luIPq2eizRi0Tuloxq5
 /Zu/5De6TG7eQB6EL7P/hDbaupcKsclrWC/bko3Px39Or1IU+ld7MhvtS+LBn3cHmhhD5D
 WD2VvXNdz2ZoSq81HMdLV15b5/wpqjs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-88-yLsELAtlMwKdfEyo7s6L9Q-1; Tue, 30 Aug 2022 11:09:18 -0400
X-MC-Unique: yLsELAtlMwKdfEyo7s6L9Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1A3A6101E9B7;
 Tue, 30 Aug 2022 15:09:17 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.166])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BE80F2026D4C;
 Tue, 30 Aug 2022 15:09:16 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4F01121E6900; Tue, 30 Aug 2022 17:09:15 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Sam Li <faithilikerun@gmail.com>
Cc: qemu-devel <qemu-devel@nongnu.org>,  Stefan Hajnoczi
 <stefanha@redhat.com>,  Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Dmitry Fomichev <Dmitry.Fomichev@wdc.com>,  Hannes Reinecke
 <hare@suse.de>,  qemu block <qemu-block@nongnu.org>,  Hanna Reitz
 <hreitz@redhat.com>,  Eric Blake <eblake@redhat.com>,  Fam Zheng
 <fam@euphon.net>,  Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH v8 3/7] block: add block layer APIs resembling Linux
 ZonedBlockDevice ioctls
References: <20220826161704.8076-1-faithilikerun@gmail.com>
 <87h71ugczz.fsf@pond.sub.org>
 <CAAAx-8Kc0UQDVXCTdFWz1E1K1xJTnUoGDko_khxEnHrPH6MYxw@mail.gmail.com>
Date: Tue, 30 Aug 2022 17:09:15 +0200
In-Reply-To: <CAAAx-8Kc0UQDVXCTdFWz1E1K1xJTnUoGDko_khxEnHrPH6MYxw@mail.gmail.com>
 (Sam Li's message of "Tue, 30 Aug 2022 23:05:31 +0800")
Message-ID: <8735ddg44k.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Sam Li <faithilikerun@gmail.com> writes:

> Markus Armbruster <armbru@redhat.com> =E4=BA=8E2022=E5=B9=B48=E6=9C=8830=
=E6=97=A5=E5=91=A8=E4=BA=8C 19:57=E5=86=99=E9=81=93=EF=BC=9A
>>
>> Sam Li <faithilikerun@gmail.com> writes:
>>
>> > By adding zone management operations in BlockDriver, storage controller
>> > emulation can use the new block layer APIs including Report Zone and
>> > four zone management operations (open, close, finish, reset).
>> >
>> > Add zoned storage commands of the device: zone_report(zrp), zone_open(=
zo),
>> > zone_close(zc), zone_reset(zrs), zone_finish(zf).
>> >
>> > For example, to test zone_report, use following command:
>> > $ ./build/qemu-io --image-opts driver=3Dzoned_host_device, filename=3D=
/dev/nullb0
>> > -c "zrp offset nr_zones"
>> >
>> > Signed-off-by: Sam Li <faithilikerun@gmail.com>
>> > Reviewed-by: Hannes Reinecke <hare@suse.de>

[...]

>> > diff --git a/qapi/block-core.json b/qapi/block-core.json
>> > index 2173e7734a..c6bbb7a037 100644
>> > --- a/qapi/block-core.json
>> > +++ b/qapi/block-core.json
>> > @@ -2942,6 +2942,7 @@
>> >  # @compress: Since 5.0
>> >  # @copy-before-write: Since 6.2
>> >  # @snapshot-access: Since 7.0
>> > +# @zoned_host_device: Since 7.2
>> >  #
>> >  # Since: 2.9
>> >  ##
>> > @@ -2955,7 +2956,8 @@
>> >              'luks', 'nbd', 'nfs', 'null-aio', 'null-co', 'nvme', 'par=
allels',
>> >              'preallocate', 'qcow', 'qcow2', 'qed', 'quorum', 'raw', '=
rbd',
>> >              { 'name': 'replication', 'if': 'CONFIG_REPLICATION' },
>> > -            'ssh', 'throttle', 'vdi', 'vhdx', 'vmdk', 'vpc', 'vvfat' =
] }
>> > +            'ssh', 'throttle', 'vdi', 'vhdx', 'vmdk', 'vpc', 'vvfat',
>> > +            { 'name': 'zoned_host_device', 'if': 'CONFIG_BLKZONED' } =
] }
>>
>> QAPI naming conventions ask for 'zoned-host-device'.  We may choose to
>> ignore them to stay closer to existing 'host_device'.
>
> I am not sure why should ignore zoned_host_device. Can you be more specif=
ic?

"them" =3D QAPI naming conventions.  Clear now?

[...]


