Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8884224D3
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 13:17:53 +0200 (CEST)
Received: from localhost ([::1]:45780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXiSG-0004UD-G8
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 07:17:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1mXiOT-00035l-Aj
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 07:13:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54073)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1mXiOR-0007K4-SY
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 07:13:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633432435;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=l9NIjeIAQCFxtj6GGh0Whhg4tP/fsFPSi3algChPtGc=;
 b=MQr7hp8zB8W55b6ANOCl0DCKrGIAwn3eJN415O+lwsL3juWdkuEHsKX1jnN0I5zXUFECeU
 ngnXFjU8hOe8HYVDN9JTUnxOZoJ2IuoHNX1Ao7lWYuD4e55BpLtzHuSbawKhn7gtEbORq8
 ZP20suMnu416OdipnnlMrW+45yaDoZQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-164-SJRXkDwFOOWPwxdT0Az79Q-1; Tue, 05 Oct 2021 07:13:54 -0400
X-MC-Unique: SJRXkDwFOOWPwxdT0Az79Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C86271006AA2;
 Tue,  5 Oct 2021 11:13:52 +0000 (UTC)
Received: from localhost (unknown [10.39.192.167])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CA34B1036B32;
 Tue,  5 Oct 2021 11:13:38 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Halil Pasic <pasic@linux.ibm.com>, "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [RFC PATCH 1/1] virtio: write back features before verify
In-Reply-To: <20211005124303.3abf848b.pasic@linux.ibm.com>
Organization: Red Hat GmbH
References: <20210930012049.3780865-1-pasic@linux.ibm.com>
 <87r1d64dl4.fsf@redhat.com> <20210930130350.0cdc7c65.pasic@linux.ibm.com>
 <87ilyi47wn.fsf@redhat.com> <20211001162213.18d7375e.pasic@linux.ibm.com>
 <87v92g3h9l.fsf@redhat.com>
 <20211002082128-mutt-send-email-mst@kernel.org>
 <20211004042323.730c6a5e.pasic@linux.ibm.com>
 <20211004040937-mutt-send-email-mst@kernel.org>
 <20211005124303.3abf848b.pasic@linux.ibm.com>
User-Agent: Notmuch/0.32.1 (https://notmuchmail.org)
Date: Tue, 05 Oct 2021 13:13:31 +0200
Message-ID: <87lf372084.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
 Xie Yongji <xieyongji@bytedance.com>, linux-kernel@vger.kernel.org,
 qemu-devel@nongnu.org, virtualization@lists.linux-foundation.org,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, stefanha@redhat.com,
 Raphael Norwitz <raphael.norwitz@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 05 2021, Halil Pasic <pasic@linux.ibm.com> wrote:

> On Mon, 4 Oct 2021 05:07:13 -0400
> "Michael S. Tsirkin" <mst@redhat.com> wrote:
>> Well we established that we can know. Here's an alternative explanation:
>
>
> I thin we established how this should be in the future, where a transport
> specific mechanism is used to decide are we operating in legacy mode or
> in modern mode. But with the current QEMU reality, I don't think so.
> Namely currently the switch native-endian config -> little endian config
> happens when the VERSION_1 is negotiated, which may happen whenever
> the VERSION_1 bit is changed, or only when FEATURES_OK is set
> (vhost-user).
>
> This is consistent with device should detect a legacy driver by checking
> for VERSION_1, which is what the spec currently says.
>
> So for transitional we start out with native-endian config. For modern
> only the config is always LE.
>
> The guest can distinguish between a legacy only device and a modern
> capable device after the revision negotiation. A legacy device would
> reject the CCW.
>
> But both a transitional device and a modern only device would accept
> a revision > 0. So the guest does not know for ccw.

Well, for pci I think the driver knows that it is using either legacy or
modern, no?

And for ccw, the driver knows at that point in time which revision it
negotiated, so it should know that a revision > 0 will use LE (and the
device will obviously know that as well.)

Or am I misunderstanding what you're getting at?


