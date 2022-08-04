Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E0D589D7D
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 16:30:26 +0200 (CEST)
Received: from localhost ([::1]:58764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJbrk-0001jY-Li
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 10:30:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oJbpI-0006jr-Ap
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 10:27:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41551)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oJbpE-0006ZW-Bh
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 10:27:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659623265;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CkBjU/Pi3F3P/ipGo4v2YQ4nW8bb9bX6H9UbI7RauGM=;
 b=QoZD5tav6xqbTtPVn9NAY0PipBfsfCVwrA4VILmbFHl3/ewKYd8ZZ251MvXkAFBHXsLky7
 hjiZGlDTah/J9J+46ACifEzGXnv5URZxKbS6BO2LkxFfs1IbgAjf7IQw+dT/ZSFKW3cfE6
 HO1X5T557d36HMOAW41qbBTzGsmrtQY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-467-LgXrtpKnMAi3OVzaQWcbLg-1; Thu, 04 Aug 2022 10:27:44 -0400
X-MC-Unique: LgXrtpKnMAi3OVzaQWcbLg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 83FB43C02189;
 Thu,  4 Aug 2022 14:27:43 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.194.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 22A422166B26;
 Thu,  4 Aug 2022 14:27:43 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D566B21E6930; Thu,  4 Aug 2022 16:27:41 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Kevin Wolf <kwolf@redhat.com>,  Hao Wu <wuhaotsh@google.com>,
 richard.henderson@linaro.org,  qemu-arm@nongnu.org,
 qemu-devel@nongnu.org,  venture@google.com,  Avi.Fishman@nuvoton.com,
 kfting@nuvoton.com,  hskinnemoen@google.com,  f4bug@amsat.org,
 bin.meng@windriver.com,  qemu-block@nongnu.org,  thuth@redhat.com,  Hanna
 Reitz <hreitz@redhat.com>
Subject: Re: [PATCH v5 5/8] blockdev: Add a new IF type IF_OTHER
References: <20220714182836.89602-1-wuhaotsh@google.com>
 <20220714182836.89602-6-wuhaotsh@google.com>
 <87ilnuda33.fsf@pond.sub.org> <YuGMFRDj3tLOIJK7@redhat.com>
 <CAFEAcA-_TkDW4tPxvmwEt-Rr6VAr_7aWNX2++CE+1G5cBPtiBg@mail.gmail.com>
 <YuKPVi9UjmZVqw5a@redhat.com> <878rodxpeq.fsf@pond.sub.org>
 <CAFEAcA_=PPJO5K8r5QFKJRhX4j9jwPPSceAUPjhK0z_bmLdyrA@mail.gmail.com>
Date: Thu, 04 Aug 2022 16:27:41 +0200
In-Reply-To: <CAFEAcA_=PPJO5K8r5QFKJRhX4j9jwPPSceAUPjhK0z_bmLdyrA@mail.gmail.com>
 (Peter Maydell's message of "Thu, 28 Jul 2022 15:58:51 +0100")
Message-ID: <874jysf5ia.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
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

Peter Maydell <peter.maydell@linaro.org> writes:

> On Thu, 28 Jul 2022 at 15:50, Markus Armbruster <armbru@redhat.com> wrote:
>> Kevin Wolf <kwolf@redhat.com> writes:
>> >
>> > But if you have more than one device, it becomes hard to predict which
>> > device gets which backend - it depends on the initialisation order in
>> > the code then,
>>
>> Really?  Board code should use IF_OTHER devices just like it uses the
>> other interface types, namely connecting each frontend device to a
>> backend device with a well-known and fixed interface type and index (or
>> bus and unit instead, where appropriate).
>
> I think part of the problem is that unlike the typical disk
> interface, where there is some idea of bus-and-unit-number or
> index number that it makes sense to expose to users, these
> "miscellaneous storage" devices don't have any particular index
> concept -- in the real hardware there are just a random set of
> devices that are connected in various places. So you're requiring
> users to look up the documentation for "index 0 is this eeprom,
> index 1 is that other eeprom, index 2 is ...".

"Unit number on a bus" makes perfect sense for SCSI and PATA.  For SATA,
the only valid unit number is 0, which may or may not make sense to
users.  Not a problem in practice, though.

Bus numbers are arbitrary, though.  Harmless enough when you have to
deal only with very few of them, e.g. a single SCSI HBA (one bus, number
0), a single PATA HBA (two buses, number 0 and 1), a single SATA HBA
(typically six buses, numbers 0..5).

For anything else, we use "index" rather than "bus" and "unit", and the
indexes are completely arbitrary.  Again, harmless enough when you have
to deal only with a few of each interface type.

*Names* rather than arbitrary index or bus numbers would arguably be a
better interface.

Nothing of this is new with IF_OTHER.


