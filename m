Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0BAC32B786
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 12:36:37 +0100 (CET)
Received: from localhost ([::1]:58820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHPnw-0006EP-CP
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 06:36:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lHPn6-0005hj-Mr
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 06:35:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53760)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lHPn4-0001hR-8u
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 06:35:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614771341;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FNwC8prjj0gF4xQJs2MzAMH1nDBQ8/dC2fosf9X47FM=;
 b=ehOtS5gQMn5f785fTbZzIG1JvJZgAAljXpUYb+ztdM8zcbZgBuYyvPeL30ogR6wRTvlvNa
 psBpdBJKX1nlFmPs/PQziFSBSi6dOCLJ2z6KUFWjKep8jBcmm1EQ5nUTHHti2OG5LrGsHB
 bwdBMpHFk0J97/93XVYUKzp1YoocNvY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-300-ZXOfXohzM7KHGzRliUl-jg-1; Wed, 03 Mar 2021 06:35:38 -0500
X-MC-Unique: ZXOfXohzM7KHGzRliUl-jg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 42E57803F4A;
 Wed,  3 Mar 2021 11:35:36 +0000 (UTC)
Received: from gondolin (ovpn-113-85.ams2.redhat.com [10.36.113.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B79DB60DA1;
 Wed,  3 Mar 2021 11:35:19 +0000 (UTC)
Date: Wed, 3 Mar 2021 12:35:17 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1 7/9] memory: introduce RAM_NORESERVE and wire it up
 in qemu_ram_mmap()
Message-ID: <20210303123517.04729c1e.cohuck@redhat.com>
In-Reply-To: <91613148-9ade-c192-4b73-0cb5a54ada98@redhat.com>
References: <20210209134939.13083-1-david@redhat.com>
 <20210209134939.13083-8-david@redhat.com>
 <20210302173243.GM397383@xz-x1>
 <91613148-9ade-c192-4b73-0cb5a54ada98@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Received-SPF: pass client-ip=63.128.21.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>,
 Igor Kotrasinski <i.kotrasinsk@partner.samsung.com>,
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org, "Michael S.
 Tsirkin" <mst@redhat.com>, qemu-s390x@nongnu.org, Stefan Weil <sw@weilnetz.de>,
 Murilo Opsfelder Araujo <muriloo@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>, "Dr.
 David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 qemu-devel@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Greg Kurz <groug@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 2 Mar 2021 20:02:34 +0100
David Hildenbrand <david@redhat.com> wrote:

> On 02.03.21 18:32, Peter Xu wrote:
> > On Tue, Feb 09, 2021 at 02:49:37PM +0100, David Hildenbrand wrote:  
> >> @@ -899,13 +899,17 @@ int kvm_s390_mem_op_pv(S390CPU *cpu, uint64_t offset, void *hostbuf,
> >>    * to grow. We also have to use MAP parameters that avoid
> >>    * read-only mapping of guest pages.
> >>    */
> >> -static void *legacy_s390_alloc(size_t size, uint64_t *align, bool shared)
> >> +static void *legacy_s390_alloc(size_t size, uint64_t *align, bool shared,
> >> +                               bool noreserve)
> >>   {
> >>       static void *mem;
> >>   
> >>       if (mem) {
> >>           /* we only support one allocation, which is enough for initial ram */
> >>           return NULL;
> >> +    } else if (noreserve) {
> >> +        error_report("Skipping reservation of swap space is not supported.");
> >> +        return NULL  
> > 
> > Semicolon missing.  
> 
> Thanks for catching that!

Regardless of that (and this patch set), can we finally get rid of
legacy_s390_alloc? We already fence off running with a kernel prior to
3.15, and KVM_CAP_S390_COW depends on ESOP -- are non-ESOP kvm hosts
still relevant? This seems to be a generation 10 feature; do we
realistically expect anyone running this on e.g. a z/VM host that
doesn't provide ESOP?


