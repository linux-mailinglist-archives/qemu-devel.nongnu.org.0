Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 349773E2A0E
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 13:48:54 +0200 (CEST)
Received: from localhost ([::1]:42258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mByLN-0007LS-9k
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 07:48:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1mByKD-0006c4-Bk
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 07:47:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20524)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1mByKC-0004zw-1a
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 07:47:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628250459;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AmEOr47alLJcyhOXf3gC4Y26BNUP5tZ3JRp7h568QuE=;
 b=fLn6DG6Ed+17YHAfh/zR92P9u+jZOtRSGQWm+RgEADmiEWBtqStGTmHCPndVJZE7oNcH7P
 FwzqnxxdwTTCreVAZNxYeN1w12op9RZW8aiS4DDIzXMR0cfHdUeba9bVvLQyPtoDcnnCWy
 aC93ayvoMRv1ZOj4rse+gfI8cMKrtys=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-586-AGzoSVZaMqyJbYIdmcZ6cQ-1; Fri, 06 Aug 2021 07:47:36 -0400
X-MC-Unique: AGzoSVZaMqyJbYIdmcZ6cQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2A581100A67C;
 Fri,  6 Aug 2021 11:47:35 +0000 (UTC)
Received: from localhost (unknown [10.39.192.233])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C4F7660C59;
 Fri,  6 Aug 2021 11:47:31 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: David Hildenbrand <david@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH for-6.2 5/6] s390x: event-facility: Use SCLP_EVENT_BUS
 macro
In-Reply-To: <8380a8b5-b790-ede6-6d04-61945e58c38d@redhat.com>
Organization: Red Hat GmbH
References: <20210805193431.307761-1-ehabkost@redhat.com>
 <20210805193431.307761-6-ehabkost@redhat.com>
 <a6f20bc5-9639-0cfb-aa70-88e4a5e1d4af@redhat.com>
 <8380a8b5-b790-ede6-6d04-61945e58c38d@redhat.com>
User-Agent: Notmuch/0.32.1 (https://notmuchmail.org)
Date: Fri, 06 Aug 2021 13:47:29 +0200
Message-ID: <87tuk2yeum.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Aug 06 2021, David Hildenbrand <david@redhat.com> wrote:

> On 06.08.21 06:15, Thomas Huth wrote:
>> On 05/08/2021 21.34, Eduardo Habkost wrote:
>>> Use the SCLP_EVENT_BUS macro instead of manually calling
>>> OBJECT_CHECK.
>>>
>>> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
>>> ---
>>> Cc: Cornelia Huck <cohuck@redhat.com>
>>> Cc: Thomas Huth <thuth@redhat.com>
>>> Cc: Halil Pasic <pasic@linux.ibm.com>
>>> Cc: Christian Borntraeger <borntraeger@de.ibm.com>
>>> Cc: Richard Henderson <richard.henderson@linaro.org>
>>> Cc: David Hildenbrand <david@redhat.com>
>>> Cc: qemu-s390x@nongnu.org
>>> Cc: qemu-devel@nongnu.org
>>> ---
>>>    hw/s390x/event-facility.c | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>> I think this could be merged with the previous patch. Anyway:
>> Reviewed-by: Thomas Huth <thuth@redhat.com>
>> 
>
> +1
>
> Reviewed-by: David Hildenbrand <david@redhat.com>

+1 :)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>


