Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B3A4AC557
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 17:19:58 +0100 (CET)
Received: from localhost ([::1]:57198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH6kA-0006DT-01
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 11:19:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1nH5pw-0004hN-2Y
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 10:21:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1nH5pj-0007vZ-5z
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 10:21:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644247298;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=p6CH5JaVG3VPXs+qRmqp1CqADqgeEr1u/Dg8sWrW15Q=;
 b=PW2U0Oc1h6zDtEUyAdN5vf73BUgT0l4Igm6zB0966P4qdFh83f9zWfqVn4RzNvMsdF/4+7
 qbW/7FjWSr9Cd5TKnsHDVkXaiZLahuRfL14O8bZa2p7NLcmNEsr7aN0hOyKGG1qDezyhBm
 LRtx+IjZnGo69QQhxuFdscRD/ndKlaQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-263-pZ4U-MCCPg2xDJQn6QopWA-1; Mon, 07 Feb 2022 10:21:35 -0500
X-MC-Unique: pZ4U-MCCPg2xDJQn6QopWA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EE47C1091DA3;
 Mon,  7 Feb 2022 15:21:33 +0000 (UTC)
Received: from localhost (unknown [10.39.193.241])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8B6712BCDB;
 Mon,  7 Feb 2022 15:21:33 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Halil Pasic <pasic@linux.ibm.com>
Subject: Re: [RFC PATCH 1/1] virtio: fix feature negotiation for
 ACCESS_PLATFORM
In-Reply-To: <20220207160516.2aead931.pasic@linux.ibm.com>
Organization: Red Hat GmbH
References: <20220203164556.2666565-1-pasic@linux.ibm.com>
 <7df172fe-008a-0b98-2780-5155c98a71ba@gmail.com>
 <874k5ax07t.fsf@redhat.com> <20220207160516.2aead931.pasic@linux.ibm.com>
User-Agent: Notmuch/0.34 (https://notmuchmail.org)
Date: Mon, 07 Feb 2022 16:21:31 +0100
Message-ID: <87v8xqvh1g.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Brijesh Singh <brijesh.singh@amd.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org,
 Halil Pasic <pasic@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 07 2022, Halil Pasic <pasic@linux.ibm.com> wrote:

> On Mon, 07 Feb 2022 14:41:58 +0100
> Cornelia Huck <cohuck@redhat.com> wrote:

>> OTOH, the decision to make it mandatory is certainly sound, and covered
>> by the spec. As the driver must be prepared for the device failing to
>> accept FEATURES_OK, we can make it mandatory here -- we should just not
>> say that it is considered mandatory from a spec standpoint. The spec
>> allows to make it mandatory, and we make it mandatory in our
>> implementation.
>
> Right. Was never my intention to say that it is considered mandatory
> by the spec. I guess the spec considers it less optional than the
> run of the mill features.
>
> Should I change the first sentence to something like "Unlike most virtio
> features ACCESS_PATFORM is considered mandatory by QEMU, i.e. the driver
> must accept it if offered by the device."

If you do s/PATFORM/PLATFORM/ :), yes. That's a much shorter way of
expressing what I had been trying to argue in my reply :)


