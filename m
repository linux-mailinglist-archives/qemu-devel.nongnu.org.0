Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA383A9CC6
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 15:56:22 +0200 (CEST)
Received: from localhost ([::1]:36070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltW1l-0007Cq-NN
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 09:56:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1ltVzc-0004h2-8d
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 09:54:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24230)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1ltVza-0000rT-6q
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 09:54:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623851645;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MQWELMBDalRa48PABSkJSjo9/7c/tjOmhtKKdzHtXrM=;
 b=PgtS51irVmYpTT803opIWC5SK1YODkmWc605S0nK+la4/POyHu0+1IV+HM8lAZJzGnhMnh
 EvH8zt9hdyGb/cagwahCzhirM6b5X1TIsjaPDjiUPA3J71V51tAiJKrA4pQnfAcnPkKEDR
 mU0STLpH3NH3EC3fbi/MPyx4I0MbZQo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-469-EF0pO9Z_P72p05M8dO1KMg-1; Wed, 16 Jun 2021 09:54:01 -0400
X-MC-Unique: EF0pO9Z_P72p05M8dO1KMg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E38B21012581;
 Wed, 16 Jun 2021 13:53:59 +0000 (UTC)
Received: from localhost (ovpn-113-141.ams2.redhat.com [10.36.113.141])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 195255D6AD;
 Wed, 16 Jun 2021 13:53:52 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Eric Farman <farman@linux.ibm.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org
Subject: Re: [PATCH v3 4/4] s390x/css: Add passthrough IRB
In-Reply-To: <c9fac1cb32c16ea583367ea2320845eb78074f9c.camel@linux.ibm.com>
Organization: Red Hat GmbH
References: <20210616014749.2460133-1-farman@linux.ibm.com>
 <20210616014749.2460133-5-farman@linux.ibm.com>
 <87o8c6w2n4.fsf@redhat.com>
 <c9fac1cb32c16ea583367ea2320845eb78074f9c.camel@linux.ibm.com>
User-Agent: Notmuch/0.32.1 (https://notmuchmail.org)
Date: Wed, 16 Jun 2021 15:53:51 +0200
Message-ID: <87fsxhx6ds.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
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
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 16 2021, Eric Farman <farman@linux.ibm.com> wrote:

> On Wed, 2021-06-16 at 11:59 +0200, Cornelia Huck wrote:
>> On Wed, Jun 16 2021, Eric Farman <farman@linux.ibm.com> wrote:
>> 
>> > Wire in the subchannel callback for building the IRB
>> > ESW and ECW space for passthrough devices, and copy
>> > the hardware's ESW into the IRB we are building.
>> > 
>> > If the hardware presented concurrent sense, then copy
>> > that sense data into the IRB's ECW space.
>> > 
>> > Signed-off-by: Eric Farman <farman@linux.ibm.com>
>> > ---
>> >  hw/s390x/css.c         | 13 ++++++++++++-
>> >  hw/s390x/s390-ccw.c    |  1 +
>> >  hw/vfio/ccw.c          |  4 ++++
>> >  include/hw/s390x/css.h |  3 +++
>> >  4 files changed, 20 insertions(+), 1 deletion(-)
>> > 
>> 
>> (...)
>> 
>> > +void build_irb_passthrough(SubchDev *sch, IRB *irb)
>> > +{
>> > +    /* Copy ESW from hardware */
>> > +    irb->esw = sch->esw;
>> > +
>> > +    if (irb->esw.erw & ESW_ERW_SENSE) {
>> > +        /* Copy ECW from hardware */
>> > +        build_irb_sense_data(sch, irb);
>> > +    }
>> 
>> I'm wondering whether we should also copy "Model-dependent
>> information"
>> (scsw 5 + 14 set, erw 7 unset). Seems more correct, and IIUC the
>> guest
>> was tripped by the presence of erw 7 without valid sense data.
>> 
>
> This is true, but that's because the existing code in
> css_do_tsch_get_irb() set ERW 7 to go with the zeros it copied into the
> ECW. Since we're now copying the ESW.ERW from the passthrough device,
> that bit wouldn't be set in the first place.

That's what I meant to say :)

>
> But, to be more correct with the possibility of model-dependent
> information, I can unconditionally copy this data over too.

Yep. Not that I have any idea what that "Model-dependent information2
would be...

>
>> > +}
>> > +


