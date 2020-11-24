Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E9D2C2AC3
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 16:05:04 +0100 (CET)
Received: from localhost ([::1]:59818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khZsM-0004QS-T8
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 10:05:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1khZqm-0003i7-0z
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 10:03:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57064)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1khZqe-0001QJ-73
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 10:03:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606230194;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=C4Zncs+qxT7eDpL2zR4RFX6EL8jRWfVouQAZPDbGhDY=;
 b=GpaWKnV/zGs7SqzAWoCzEza5H5P8ICPvFftap1ZvjX26g+1vwit2/BpeRVs/Uq9+VjnhSB
 wvBLNaEmRft+42YMRemfoBYR55WsSkPqqS/90wi3XgA/spMrmV7Ip7QZjw5ijs5Vva9SZy
 GOVyq2eeW1hv9QMKQDfIX94/6xSrSIE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-548-bWO8LIjqOiCgwXOoqgyy-A-1; Tue, 24 Nov 2020 10:03:12 -0500
X-MC-Unique: bWO8LIjqOiCgwXOoqgyy-A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3A8A980B70A
 for <qemu-devel@nongnu.org>; Tue, 24 Nov 2020 15:03:11 +0000 (UTC)
Received: from localhost (unknown [10.10.67.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AAF7A5C1A3;
 Tue, 24 Nov 2020 15:03:07 +0000 (UTC)
Date: Tue, 24 Nov 2020 10:03:06 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v3 10/19] qlit: Support all types of QNums
Message-ID: <20201124150306.GO2271382@habkost.net>
References: <20201123194818.2773508-1-ehabkost@redhat.com>
 <20201123194818.2773508-11-ehabkost@redhat.com>
 <87y2irnkol.fsf@dusky.pond.sub.org>
 <64059fc4-62e9-204d-c477-44f5165a240d@redhat.com>
 <87im9vkkr9.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87im9vkkr9.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 qemu-devel@nongnu.org,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 24, 2020 at 01:22:02PM +0100, Markus Armbruster wrote:
> Paolo Bonzini <pbonzini@redhat.com> writes:
> 
> > On 24/11/20 10:55, Markus Armbruster wrote:
> >>> +        /* Larger than UINT64_MAX: */
> >>> +        QLIT_QNUM_DOUBLE(18446744073709552e3),
> >>> +        /* Smaller than INT64_MIN: */
> >>> +        QLIT_QNUM_DOUBLE(-92233720368547758e2),
> >> Why "larger than UINT64_MAX" and "smaller than INT64_MIN"?
> >> 
> >
> > I guess the point is to test values that are only representable as a
> > double, so (double)((uint64_t)INT64_MAX+1) wouldn't be very useful for 
> > that: as the expression shows, it would not be a QNUM_VAL_INT but it
> > would be representable as QNUM_VAL_UINT.
> >
> > So these are the cases that matter the most, even though -1, 0 and
> > INT64_MAX+1 could be nice to have.
> 
> qnum_is_equal()'s contract:
> 
>  * Doubles are never considered equal to integers.

If that's part of the contract, it would be OK to include
0.0, -1.0, 1.0, INT64_MAX+1 in the list.  I incorrectly assumed
  qnum_is_equal(qnum_from_int(0), qnum_from_double(0.0))
was undefined.

However, if we really care about test coverage of
qnum_is_equal(), we probably should be extending check-qnum.c,
not check-qlit.c.

-- 
Eduardo


