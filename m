Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B83153A3CAC
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Jun 2021 09:13:14 +0200 (CEST)
Received: from localhost ([::1]:46104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrbLt-0006xG-BS
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 03:13:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lrbL5-0006Eq-TV
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 03:12:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40916)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lrbL3-0006wJ-QS
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 03:12:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623395541;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RqhQLQPdO3zBUzxh6OEXEyzOXnMrkkpdzSAumCztOE8=;
 b=YG5dIOikIpEjhw7v10NvHTXrpzmqKUn40DKghsh8RsHMkpzMuPSOyqXOlFyWsrWntchPrB
 TIequPcG7eHelTEjdMMOu8XjhvTO8fYf+rSlRJRFRJnkPltRPr0MOiN9GOSQ1/Iya8uOWc
 LEoMBdl5nXK3GfGEJ/qDQk/GePtmgHM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-497-E0fCyqHsN0i1BwWNzmiREA-1; Fri, 11 Jun 2021 03:12:19 -0400
X-MC-Unique: E0fCyqHsN0i1BwWNzmiREA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 60648BBEE3;
 Fri, 11 Jun 2021 07:12:18 +0000 (UTC)
Received: from localhost (ovpn-113-95.ams2.redhat.com [10.36.113.95])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9D42B5C1CF;
 Fri, 11 Jun 2021 07:12:11 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Eric Farman <farman@linux.ibm.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org
Subject: Re: [PATCH 0/1] vfio-ccw: Fix garbage sense data on I/O error
In-Reply-To: <20210610202011.391029-1-farman@linux.ibm.com>
Organization: Red Hat GmbH
References: <20210610202011.391029-1-farman@linux.ibm.com>
User-Agent: Notmuch/0.32.1 (https://notmuchmail.org)
Date: Fri, 11 Jun 2021 09:12:10 +0200
Message-ID: <87o8cczxh1.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
 Eric Farman <farman@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 10 2021, Eric Farman <farman@linux.ibm.com> wrote:

> Hi Conny,
>
> Per our offline discussion, here's a fix for the error when a guest
> issues "dasdfmt -M quick". It basically reverts commit 334e76850bbb
> ("vfio/ccw: update sense data if a unit check is pending")
> and modifies the check that builds sense data in the TSCH handler.
>
> I opted to NOT disable PMCW.CSENSE, because doing so prevents
> vfio-ccw devices from coming online at all (didn't pursue deep
> enough to explain why). Turning it off in reaction to a unit
> check (in this now-reverted codepath) works, but only because of
> the corresponding PMCW.CSENSE check in the TSCH code.

It's a bit puzzling why fencing it off in msch doesn't work; but maybe
it would not be the right thing to do anyway, if we can support some
concurrent sense operations. I'm still reading the PoP.

>
> I don't know if anything is needed for the (unaltered) ECW data
> that commit b498484ed49a ("s390x/css: sense data endianness")
> addressed for the copied sense_data bytes, but figure we can
> use this as a starting point. Thoughts?
>
> Eric Farman (1):
>   vfio-ccw: Keep passthrough sense data intact
>
>  hw/s390x/css.c | 3 ++-
>  hw/vfio/ccw.c  | 6 ------
>  2 files changed, 2 insertions(+), 7 deletions(-)
>


