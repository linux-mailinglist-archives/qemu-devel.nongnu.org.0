Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A685577BB
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 12:21:25 +0200 (CEST)
Received: from localhost ([::1]:33420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4Jxk-0003Y6-Pr
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 06:21:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1o4Jq7-00083p-Ms
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 06:13:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34938)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1o4Jq3-0003ck-6g
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 06:13:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655979206;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GJsov3FRHExvTrVt+NnDWqd4nVtfkI9+w+0xLT0hCHo=;
 b=RjKZgDUuK7ZMR/HMGN1pqBRgGiqPcCBMyOUa8gsf9bTsP6o6MNux3wQCDWIeoL47Vd/k7h
 ywDeonA0U26kdsx5WMauVJQrAvfebzwxzD4INUm0IOMDxaSbif9e+pbqGG4lWLFzHZLlqO
 bAZDEg3p8sZtpFpDIrzvdua5/y9hpOg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-251-kD77fO9fPdurIGvswOT3Aw-1; Thu, 23 Jun 2022 06:13:23 -0400
X-MC-Unique: kD77fO9fPdurIGvswOT3Aw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A316629DD9B8;
 Thu, 23 Jun 2022 10:13:22 +0000 (UTC)
Received: from localhost (unknown [10.39.194.10])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5EE66C2810D;
 Thu, 23 Jun 2022 10:13:22 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org, Christian
 Borntraeger <borntraeger@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH 2/2] pc-bios/s390-ccw/virtio: Read device config after
 feature negotiation
In-Reply-To: <749f88c5-379c-6284-f3c7-c8074191c8a9@redhat.com>
Organization: Red Hat GmbH
References: <20220623071131.412457-1-thuth@redhat.com>
 <20220623071131.412457-3-thuth@redhat.com> <87bkuj93b6.fsf@redhat.com>
 <749f88c5-379c-6284-f3c7-c8074191c8a9@redhat.com>
User-Agent: Notmuch/0.36 (https://notmuchmail.org)
Date: Thu, 23 Jun 2022 12:13:21 +0200
Message-ID: <878rpn8z7i.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 23 2022, Thomas Huth <thuth@redhat.com> wrote:

> On 23/06/2022 10.44, Cornelia Huck wrote:
>> On Thu, Jun 23 2022, Thomas Huth <thuth@redhat.com> wrote:
>> 
>>> Feature negotiation should be done first, since some fields in the
>>> config area can depend on the negotiated features and thus should
>>> rather be read afterwards.
>> 
>> I suppose we don't negotiate any features that might affect the size of
>> the config space? Anyway, restricting ourselves to the minimum length
>> should be fine.
>
> Actually, even the virtio spec 0.9.5 already talks about 
> VIRTIO_BLK_F_BLK_SIZE and VIRTIO_BLK_F_GEOMETRY being necessary to get the 
> corresponding values in the config space ... so we're currently depending on 
> the good will of QEMU to also provide the values without these feature bits. 

Eww. The bad thing about QEMU being so relaxed is that you don't catch
issues like that... but if it works for now, there's at least no
pressure.

> I'm already thinking about providing a patch to properly request these 
> feature bits in the s390-ccw bios ... but the whole code there is so ugly 
> that I need some time to think about the right steps to clean it up first.

It's not ugly, it has grown organically :) (just like that overgrown
spot in my garden ;)


