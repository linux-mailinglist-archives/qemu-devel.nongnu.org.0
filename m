Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31FA8419329
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 13:33:41 +0200 (CEST)
Received: from localhost ([::1]:47530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUot9-0000TR-KH
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 07:33:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1mUopv-00072Y-1e
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 07:30:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55169)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1mUopt-0003lV-1Z
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 07:30:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632742215;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mBiC4gSLblU52wRnl2SlcIIrsce9D2zNrthbShcTwH4=;
 b=GDw5raK4p69q/kNlNTV33rnTFSEsC6aSttS5eC8cfe61KzLot5+6xZN4nnjNEVce4wMNGz
 /ofG1vbNoxPM0jhf8hSilx5qZ14a8ILnYgSrJ7ToCVTvSFPzpTanreJTYARP4SstADA4/f
 AjIED1MuLA2OddUzvnoBQB4oYTmfb7g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-386-LzwzMbznNgWGez09-hY4cg-1; Mon, 27 Sep 2021 07:30:14 -0400
X-MC-Unique: LzwzMbznNgWGez09-hY4cg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8DF2F5074E;
 Mon, 27 Sep 2021 11:30:13 +0000 (UTC)
Received: from localhost (unknown [10.39.192.245])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4E6BF60936;
 Mon, 27 Sep 2021 11:29:48 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Peter
 Maydell <peter.maydell@linaro.org>, Markus Armbruster <armbru@redhat.com>,
 Eric Blake <eblake@redhat.com>, "Daniel P . Berrange" <berrange@redhat.com>
Subject: Re: [PATCH v3 1/3] hw/virtio: Comment virtqueue_flush() must be
 called with RCU read lock
In-Reply-To: <fd0e791a-edc9-4b5b-fde5-673a2415acac@redhat.com>
Organization: Red Hat GmbH
References: <20210906104318.1569967-1-philmd@redhat.com>
 <20210906104318.1569967-2-philmd@redhat.com> <874ka6e2yw.fsf@redhat.com>
 <fd0e791a-edc9-4b5b-fde5-673a2415acac@redhat.com>
User-Agent: Notmuch/0.32.1 (https://notmuchmail.org)
Date: Mon, 27 Sep 2021 13:29:46 +0200
Message-ID: <871r5adzo5.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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
 Richard Henderson <richard.henderson@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Sep 27 2021, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:

> On 9/27/21 12:18, Cornelia Huck wrote:
>> On Mon, Sep 06 2021, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wro=
te:
>>=20
>>> Reported-by: Stefano Garzarella <sgarzare@redhat.com>
>>> Suggested-by: Stefan Hajnoczi <stefanha@redhat.com>
>>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>>> ---
>>>  include/hw/virtio/virtio.h | 7 +++++++
>>>  hw/virtio/virtio.c         | 1 +
>>>  2 files changed, 8 insertions(+)
>>>
>>> diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
>>> index 8bab9cfb750..c1c5f6e53c8 100644
>>> --- a/include/hw/virtio/virtio.h
>>> +++ b/include/hw/virtio/virtio.h
>>> @@ -186,6 +186,13 @@ void virtio_delete_queue(VirtQueue *vq);
>>> =20
>>>  void virtqueue_push(VirtQueue *vq, const VirtQueueElement *elem,
>>>                      unsigned int len);
>>> +/**
>>> + * virtqueue_flush:
>>> + * @vq: The #VirtQueue
>>> + * @count: Number of elements to flush
>>> + *
>>> + * Must be called within RCU critical section.
>>> + */
>>=20
>> Hm... do these doc comments belong into .h files, or rather into .c file=
s?
>
> Maybe we should restart this old thread, vote(?) and settle on a style?
>
> https://lore.kernel.org/qemu-devel/349cd87b-0526-30b8-d9cd-0eee537ab5a4@r=
edhat.com/

My vote would still go to putting this into .c files :) Not sure if we
want to go through the hassle of a wholesale cleanup; but if others
agree, we could at least start with putting new doc comments next to the
implementation.

Do we actually consume these comments in an automated way somewhere?


