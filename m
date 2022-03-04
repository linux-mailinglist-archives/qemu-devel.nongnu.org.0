Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B79554CCE25
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 07:57:34 +0100 (CET)
Received: from localhost ([::1]:33658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ1sb-00034n-Ie
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 01:57:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nQ1SR-0003FD-7P
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 01:30:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32251)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nQ1SN-0003TU-6n
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 01:30:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646375425;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GWxGUsY4PPQ9m1CGOES0SrqMgYRSoI+abgXtV3H/UOg=;
 b=XfdG/gEtSmGXSNBk1A6ioikt7bECQlR/PJBjCXBNdNh7o6hIlmsHx6RSR04uU3KSM6YsK7
 nX+0vCSC8tT4EBieD39cCKhbHJ4v0UGYlBoXRIi8U6hN3vZp/0b5/iG03mcazhJNk8chyC
 Oqpa3vuoOQ+mj5V20+WrKR93ME1BvAE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-601-lL-GzrxhMyqacAjGUM1Hhw-1; Fri, 04 Mar 2022 01:30:22 -0500
X-MC-Unique: lL-GzrxhMyqacAjGUM1Hhw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A929D800423;
 Fri,  4 Mar 2022 06:30:20 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 90DBC4F848;
 Fri,  4 Mar 2022 06:29:48 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 9DA0E21E6A00; Fri,  4 Mar 2022 07:29:46 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Eugenio Perez Martin <eperezma@redhat.com>
Subject: Re: [PATCH v3 14/14] vdpa: Add x-svq to NetdevVhostVDPAOptions
References: <20220302203012.3476835-1-eperezma@redhat.com>
 <20220302203012.3476835-15-eperezma@redhat.com>
 <87ee3jeff1.fsf@pond.sub.org>
 <CAJaqyWfKQKWMs-tLRyuJ=C7VrsFUS8KHiXQVZHqfj_T5_zeBXQ@mail.gmail.com>
 <87bkyncklt.fsf@pond.sub.org>
 <CAJaqyWfSkfV_FDOMD326SWBQAzK3=bxG+xfUZEmXeYudTG5cgQ@mail.gmail.com>
Date: Fri, 04 Mar 2022 07:29:46 +0100
In-Reply-To: <CAJaqyWfSkfV_FDOMD326SWBQAzK3=bxG+xfUZEmXeYudTG5cgQ@mail.gmail.com>
 (Eugenio Perez Martin's message of "Thu, 3 Mar 2022 18:23:15 +0100")
Message-ID: <877d9a8c2t.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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

> Yes, that's right. I expressed my point poorly actually, I'll go the reverse.
>
> qapi-gen.py forces me to write a comment in the doc:
> qapi/block-core.json:2971: feature 'unstable' lacks documentation
>
> When I add the documentation line, it's enough to add @unstable. But
> there is no way to tell if this tag is because the whole struct is
> unstable or if it's because individual members are unstable unless the
> reader either checks the tag or the struct code.
>
> I was mostly worried about doc generators, I would not like to make
> NetdevVhostVDPAOptions unstable at this point. But I see that there is
> no problem with that.
>
> Thanks!

Yes, the doc generator insists on features being documented, and it
doesn't provide for documenting them next to members, only top-level.
The common solution is to phrase the comment like we do in
BlockdevOptionsFile:

    # @unstable: Member x-check-cache-dropped is meant for debugging.

If there were multiple members so flagged, we'd enumerate them all.

The generator doesn't check you do this right.  The existing check
guards against *forgetting* to do it, not against doing it wrong.

More questions?


