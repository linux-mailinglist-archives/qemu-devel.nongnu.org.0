Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 930D8606EE2
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 06:27:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oljcg-0006gN-U7
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 00:27:08 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oljYp-0008Vh-EE
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 00:23:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oljYh-0008H9-U4
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 00:22:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oljYg-00062p-4r
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 00:22:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666326177;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=79BGXd9ukZ3gVIAAED5YXpsgXdgNuyDFzBNvjnWmmkg=;
 b=V/sihG9T9IBeqZKAPrpUwl5f+Z+sGfeBMxVcBsTp0JkFz7EzvfeifcxCjEoN/bjl2tcSt1
 X1qSnSiu6GrZHTbmTyfiPihEad9njwJkahU1Kqe+lyv2YJUl/3Iw2RITf10XLYSMAgCMlD
 tAJYOCkTMSlgEOX+SnTIAg15w9iiMB4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-668-NMXmZTRmPXKbS9Ev2cng1Q-1; Fri, 21 Oct 2022 00:22:52 -0400
X-MC-Unique: NMXmZTRmPXKbS9Ev2cng1Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AE5063C01D99;
 Fri, 21 Oct 2022 04:22:51 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.118])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 79D45111D7AD;
 Fri, 21 Oct 2022 04:22:51 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3034721E6686; Fri, 21 Oct 2022 06:22:50 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: "Christian A. Ehrhardt" <lk@c--e.de>
Cc: qemu-devel@nongnu.org,  Eric DeVolder <eric.devolder@oracle.com>,
 qemu-stable@nongnu.org,  "Michael S. Tsirkin" <mst@redhat.com>,  Igor
 Mammedov <imammedo@redhat.com>,  Ani Sinha <ani@anisinha.ca>
Subject: Re: [PATCH] hw/acpi/erst.c: Fix memset argument order
References: <20221019191522.1004804-1-lk@c--e.de>
 <87r0z3dnsn.fsf@pond.sub.org> <Y1God1/x+A71ID7+@cae.in-ulm.de>
Date: Fri, 21 Oct 2022 06:22:50 +0200
In-Reply-To: <Y1God1/x+A71ID7+@cae.in-ulm.de> (Christian A. Ehrhardt's message
 of "Thu, 20 Oct 2022 21:58:47 +0200")
Message-ID: <8735bh6c11.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

"Christian A. Ehrhardt" <lk@c--e.de> writes:

> Hi Markus,
>
> On Thu, Oct 20, 2022 at 08:14:32AM +0200, Markus Armbruster wrote:
>> "Christian A. Ehrhardt" <lk@c--e.de> writes:
>> 
>> > Fix memset argument order: The second argument is
>> > the value, the length goes last.
>> 
>> Impact of the bug?
>
> Well, this is a memory error, i.e. the potential impact is
> anything from silent data corruption to arbitrary code execution.
> Phillipe described this accurately as "Ouch".
>
>> > Cc: Eric DeVolder <eric.devolder@oracle.com>
>> > Cc: qemu-stable@nongnu.org
>> > Fixes: f7e26ffa590 ("ACPI ERST: support for ACPI ERST feature")
>> > Signed-off-by: Christian A. Ehrhardt <lk@c--e.de>
>> >          /* Write the record into the slot */
>
> [ ... ]
>
>> This first copies @record_length bytes into the exchange buffer.
>> 
>> > -        memset(nvram + record_length, exchange_length - record_length, 0xFF);
>> > +        memset(nvram + record_length, 0xFF, exchange_length - record_length);
>> 
>> The new code pads it to the full exchange buffer size.
>> 
>> The old code writes 0xFF bytes.
>> 
>> If 0xFF < exchange_length - record_length, the padding doesn't extend to
>> the end of the buffer.  Impact?
>
> Incorrect and insufficient data is written.
>
>> If 0xFF > exchange_length - record_length, we write beyond the end of
>> the buffer.  Impact?
>
> Buffer overrun with well known potentially catastrophic consequences.
> Additionally, incorrect data is used for the padding.

Is record_length controlled by the guest?


