Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 088EA422C9A
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 17:36:33 +0200 (CEST)
Received: from localhost ([::1]:37468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXmUZ-0007Ua-QP
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 11:36:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1mXmFW-0001gj-Lx
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 11:20:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1mXmFS-00006P-7y
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 11:20:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633447250;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uacToDR1I0FxC1x9xJ+CimJRSu2bmxQDudmiV7tnB4E=;
 b=E+x4fP6qoIlVTL5rGH1atAObDmJ9L3v3QrGpJHfGRXJIhX+426ewpmd2netoNxmG2yPMMN
 NdwbR769YLhKSBuRId/reZ/PHQU5YRbltyt0HTSw0pndu71rs7a7mIZ72PDAkEfFcsoacw
 zlv8f+/Zuc9W/6+DdIhFkfBA8fUDWdc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-108-ZrHkHQnuPmuuqSH62acTrQ-1; Tue, 05 Oct 2021 11:20:49 -0400
X-MC-Unique: ZrHkHQnuPmuuqSH62acTrQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 529B81084683;
 Tue,  5 Oct 2021 15:20:48 +0000 (UTC)
Received: from localhost (unknown [10.39.192.167])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C6D8360BF4;
 Tue,  5 Oct 2021 15:20:30 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, Halil Pasic <pasic@linux.ibm.com>
Subject: Re: [virtio-dev] Re: [RFC PATCH 1/1] virtio: write back features
 before verify
In-Reply-To: <20211005072110-mutt-send-email-mst@kernel.org>
Organization: Red Hat GmbH
References: <20211003070030.658fc94e.pasic@linux.ibm.com>
 <20211003021027-mutt-send-email-mst@kernel.org>
 <20211003032253-mutt-send-email-mst@kernel.org>
 <87ee912e45.fsf@redhat.com>
 <20211004083455-mutt-send-email-mst@kernel.org>
 <878rz83lx0.fsf@redhat.com>
 <20211004110152-mutt-send-email-mst@kernel.org>
 <87zgro23r1.fsf@redhat.com>
 <20211004160005-mutt-send-email-mst@kernel.org>
 <20211005131751.53175b10.pasic@linux.ibm.com>
 <20211005072110-mutt-send-email-mst@kernel.org>
User-Agent: Notmuch/0.32.1 (https://notmuchmail.org)
Date: Tue, 05 Oct 2021 17:20:29 +0200
Message-ID: <87fstf1osi.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
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
Cc: linux-s390@vger.kernel.org, markver@us.ibm.com,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-devel@nongnu.org,
 Jason Wang <jasowang@redhat.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 Xie Yongji <xieyongji@bytedance.com>, virtio-dev@lists.oasis-open.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 05 2021, "Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Tue, Oct 05, 2021 at 01:17:51PM +0200, Halil Pasic wrote:
>> On Mon, 4 Oct 2021 16:01:12 -0400
>> "Michael S. Tsirkin" <mst@redhat.com> wrote:
>> 
>> > > 
>> > > Ok, so what about something like
>> > > 
>> > > "If FEATURES_OK is not set, the driver MAY change the set of features it
>> > > accepts."
>> > > 
>> > > in the device initialization section?  
>> > 
>> > Maybe "as long as". However Halil implied that some features are not
>> > turned off properly if that happens. Halil could you pls provide
>> > some examples?
>> 
>> 
>> 
>> static void virtio_net_set_features(VirtIODevice *vdev, uint64_t features)
>> {
>> ...
>>     if (virtio_has_feature(features, VIRTIO_NET_F_STANDBY)) {
>>         qapi_event_send_failover_negotiated(n->netclient_name);
>>         qatomic_set(&n->failover_primary_hidden, false);
>>         failover_add_primary(n, &err);
>>         if (err) {
>>             warn_report_err(err);
>>         }
>>     }
>> }
>> 
>> This is probably the only one in QEMU. Back then I stopped looking
>> after the first hit.

After some grepping, I agree that this seems to be the only one.

>> 
>> Regards,
>> Halil
>
> Hmm ok more failover issues :(
> This stuff really should be moved to set_status.

Yes, F_STANDBY does not exist for legacy, so performing those actions
when FEATURES_OK is set looks like the right thing to do.


