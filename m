Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E4EA3A401E
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Jun 2021 12:22:45 +0200 (CEST)
Received: from localhost ([::1]:52582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lreJH-0000cY-PE
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 06:22:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lreI2-0008Jj-KY
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 06:21:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55139)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lreHx-0007GY-Bj
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 06:21:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623406879;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dmYNem7A76dCQTqMliF3l8KoaPnvKgv1BXXbdF1d8GA=;
 b=gSJ6ea7NL3NvVQZduaerZpnyBwZBRmwHyL4yNph0B+aTAa3tXBzv62MaRACV6KnoE9pEpz
 ktBqHi2VgUSINBk1F4Ei43bnKGLOGxrFC6txOZnT5xzZl2DmmChExq/p9MVALgQtBCUpet
 +dNCt9DMa9mHrYzB2CbSsc3Ph4Jf2qI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-92-ppapntnFPyeaTwMpTOc5Yw-1; Fri, 11 Jun 2021 06:21:16 -0400
X-MC-Unique: ppapntnFPyeaTwMpTOc5Yw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8A1CC1846100;
 Fri, 11 Jun 2021 10:21:15 +0000 (UTC)
Received: from localhost (ovpn-113-95.ams2.redhat.com [10.36.113.95])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CB6175D71D;
 Fri, 11 Jun 2021 10:21:08 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Eric Farman <farman@linux.ibm.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org
Subject: Re: [PATCH 1/1] vfio-ccw: Keep passthrough sense data intact
In-Reply-To: <87lf7gzxbh.fsf@redhat.com>
Organization: Red Hat GmbH
References: <20210610202011.391029-1-farman@linux.ibm.com>
 <20210610202011.391029-2-farman@linux.ibm.com> <87lf7gzxbh.fsf@redhat.com>
User-Agent: Notmuch/0.32.1 (https://notmuchmail.org)
Date: Fri, 11 Jun 2021 12:21:07 +0200
Message-ID: <87fsxozoq4.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eric Farman <farman@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jun 11 2021, Cornelia Huck <cohuck@redhat.com> wrote:

> On Thu, Jun 10 2021, Eric Farman <farman@linux.ibm.com> wrote:
>> diff --git a/hw/s390x/css.c b/hw/s390x/css.c
>> index bed46f5ec3..29234daa27 100644
>> --- a/hw/s390x/css.c
>> +++ b/hw/s390x/css.c
>> @@ -1661,7 +1661,8 @@ int css_do_tsch_get_irb(SubchDev *sch, IRB *target_irb, int *irb_len)
>>          }
>>          /* If a unit check is pending, copy sense data. */
>>          if ((schib->scsw.dstat & SCSW_DSTAT_UNIT_CHECK) &&
>> -            (schib->pmcw.chars & PMCW_CHARS_MASK_CSENSE)) {
>> +            (schib->pmcw.chars & PMCW_CHARS_MASK_CSENSE) &&
>> +            (sch->sense_data[0] != 0)) {
>>              int i;
>>  
>>              irb.scsw.flags |= SCSW_FLAGS_MASK_ESWF |
>>              SCSW_FLAGS_MASK_ECTL;

This function is where we build the esw/ecw...

>> diff --git a/hw/vfio/ccw.c b/hw/vfio/ccw.c
>> index 139a3d9d1b..a4dc4acb34 100644
>> --- a/hw/vfio/ccw.c
>> +++ b/hw/vfio/ccw.c
>> @@ -371,12 +371,6 @@ static void vfio_ccw_io_notifier_handler(void *opaque)
>>      copy_scsw_to_guest(&s, &irb.scsw);
>>      schib->scsw = s;
>>  
>> -    /* If a uint check is pending, copy sense data. */
>> -    if ((schib->scsw.dstat & SCSW_DSTAT_UNIT_CHECK) &&
>> -        (schib->pmcw.chars & PMCW_CHARS_MASK_CSENSE)) {

...and here we actually do have the esw/ecw provided by the hardware.

>
> If I'm reading the PoP correctly, turning on concurrent sense only means
> that we may have sense data already available, but not that it's
> guaranteed. Would it be enough to look at the relevant bit in the erw
> and only copy sense data if it is actually set (here and/or above)?

Maybe the root of the problem is that we actually try to build the esw
ourselves? If we copy it from the irb received by the hardware, we
should already have the correct data, I think.

>
>> -        memcpy(sch->sense_data, irb.ecw, sizeof(irb.ecw));
>> -    }
>> -
>>  read_err:
>>      css_inject_io_interrupt(sch);
>>  }


