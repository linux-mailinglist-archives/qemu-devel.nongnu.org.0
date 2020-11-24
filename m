Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A3602C2594
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 13:23:40 +0100 (CET)
Received: from localhost ([::1]:57838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khXMB-0000Kf-1X
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 07:23:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1khXKp-0008Ja-0N
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 07:22:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30200)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1khXKn-0002dn-04
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 07:22:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606220531;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+hUvkwRVpEZ9GTjuetynUNXXinTk0Ofp/fks6lpRu5U=;
 b=cj5paHTpIM9Xcb4kgN0JhOoGVvYOEkpioAkOFxM2jxvqn4IP579H7KQ1Gx7zXLxFb4RLC9
 l8vhYvsbVU289bUiLr/WoEKF18qGZogRYyvezvwf2EluAo6i+/rGlCA8wZxeKQ3QJ2Uv04
 IOPWjq1KmtIq+xmFyCDcag63sg+oKgk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-504-wcperBQgM822z3aKX7CuGg-1; Tue, 24 Nov 2020 07:22:09 -0500
X-MC-Unique: wcperBQgM822z3aKX7CuGg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 489871005E5D
 for <qemu-devel@nongnu.org>; Tue, 24 Nov 2020 12:22:08 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7B3F9620DE;
 Tue, 24 Nov 2020 12:22:04 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E156D113864E; Tue, 24 Nov 2020 13:22:02 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v3 10/19] qlit: Support all types of QNums
References: <20201123194818.2773508-1-ehabkost@redhat.com>
 <20201123194818.2773508-11-ehabkost@redhat.com>
 <87y2irnkol.fsf@dusky.pond.sub.org>
 <64059fc4-62e9-204d-c477-44f5165a240d@redhat.com>
Date: Tue, 24 Nov 2020 13:22:02 +0100
In-Reply-To: <64059fc4-62e9-204d-c477-44f5165a240d@redhat.com> (Paolo
 Bonzini's message of "Tue, 24 Nov 2020 11:56:13 +0100")
Message-ID: <87im9vkkr9.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
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
Cc: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Paolo Bonzini <pbonzini@redhat.com> writes:

> On 24/11/20 10:55, Markus Armbruster wrote:
>>> +        /* Larger than UINT64_MAX: */
>>> +        QLIT_QNUM_DOUBLE(18446744073709552e3),
>>> +        /* Smaller than INT64_MIN: */
>>> +        QLIT_QNUM_DOUBLE(-92233720368547758e2),
>> Why "larger than UINT64_MAX" and "smaller than INT64_MIN"?
>> 
>
> I guess the point is to test values that are only representable as a
> double, so (double)((uint64_t)INT64_MAX+1) wouldn't be very useful for 
> that: as the expression shows, it would not be a QNUM_VAL_INT but it
> would be representable as QNUM_VAL_UINT.
>
> So these are the cases that matter the most, even though -1, 0 and
> INT64_MAX+1 could be nice to have.

qnum_is_equal()'s contract:

 * Doubles are never considered equal to integers.


