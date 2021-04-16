Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BDBD3619AD
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 08:06:00 +0200 (CEST)
Received: from localhost ([::1]:52664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXHc7-0006lV-7g
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 02:05:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lXHb9-0006DG-LJ
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 02:04:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22426)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lXHb6-0006rb-Fs
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 02:04:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618553094;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iCuETk7+K07XrhLE8Qsg1Jv3m6/uLM9E94e/Ut6mZ2U=;
 b=UC0j4eNecz5L9RRpNRZWibO9G9IQ3jC8hUfNE+C3gCMqI8x/F9rFKw5lcs11JY5O4dEUaH
 9Csl/r/IUtTpe/h0MmolOkiHbFiWj5YC9vvNAAXYF/R/4zyzeWaBOXDoibrHP7gIBch0J0
 f58Jr3CMghlirYF6LMbJKMU9vZsrOx4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-251-72ydz0BNPDW7HrAyZfyXYQ-1; Fri, 16 Apr 2021 02:04:53 -0400
X-MC-Unique: 72ydz0BNPDW7HrAyZfyXYQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 087D81006C82;
 Fri, 16 Apr 2021 06:04:52 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C0A3360C24;
 Fri, 16 Apr 2021 06:04:51 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 493BE113525D; Fri, 16 Apr 2021 08:04:50 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v2 1/8] qapi/error: Repurpose QAPIError as a generic
 exception base class
References: <20210330171844.1197918-1-jsnow@redhat.com>
 <20210330171844.1197918-2-jsnow@redhat.com>
 <87mtu0gi6u.fsf@dusky.pond.sub.org>
 <662c4eae-f704-37b4-9d89-f3bbf9108ec2@redhat.com>
Date: Fri, 16 Apr 2021 08:04:50 +0200
In-Reply-To: <662c4eae-f704-37b4-9d89-f3bbf9108ec2@redhat.com> (John Snow's
 message of "Thu, 15 Apr 2021 11:28:33 -0400")
Message-ID: <87im4mrchp.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>, qemu-devel@nongnu.org,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

> On 4/15/21 2:44 AM, Markus Armbruster wrote:
>> John Snow <jsnow@redhat.com> writes:
>> 
>>> Rename QAPIError to QAPISourceError, and then create a new QAPIError
>>> class that serves as the basis for all of our other custom exceptions.
>> 
>> Isn't the existing QAPIError such a base class already?  Peeking
>> ahead...  aha, your new base class is abstract.  Can you explain why we
>> that's useful?
>> 
>
> Sure. The existing QAPIError class assumes that it's an error that has a 
> source location, but not all errors will. The idea is that an abstract 
> error class can be used as the ancestor for all other errors in a 
> type-safe way, such that:
>
> try:
>      qapi.something_or_other()
> except QAPIError as err:
>      err.some_sort_of_method()
>
> (1) This is a type-safe construct, and
> (2) This is sufficient to catch all errors that originate from within 
> the library, regardless of their exact type.
>
> Primarily, it's a ploy to get the SourceInfo stuff out of the 
> common/root exception for type safety reasons.
>
> (Later in the series, you'll see there's a few places where we try to 
> fake SourceInfo stuff in order to use QAPIError, by shuffling this 
> around, we allow ourselves to raise exceptions that don't need this 
> hackery.)

I think you're conflating a real issue with a non-issue.

The real issue: you want to get rid of fake QAPISourceInfo.  This isn't
terribly important, but small cleanups count, too.  I can't see the "few
places where we try to fake" in this series, though.  Is it in a later
part, or am I just blind?

The non-issue: wanting a common base class.  Yes, we want one, but we
already got one: QAPIError.

I think the commit message should explain the real issue more clearly,
without confusing readers with the non-issue.

Makes sense?


