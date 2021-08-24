Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADCE03F6162
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 17:17:04 +0200 (CEST)
Received: from localhost ([::1]:41304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIYAc-0000h3-Of
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 11:16:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mIY9O-0007nA-Ab
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 11:15:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53123)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mIY9M-00079V-Q3
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 11:15:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629818140;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=V0VBbtjJK/onCFso8YDctN7X1dO/cR97/nqIXJL/Ue8=;
 b=K+mrFpcF1LCBm61irBn9LcuDgluVWV1URHdW2ZjyvxmELUeyrNkt7oELG8ZUSfcVqz0bDQ
 SStm07Hv6D+72ncTTeyben7OVNqd/JXbBkDlnPyJyFmmrYECNqyGCJLa7L8NPxGaQBsJz3
 //PC5p3nb3hiofqyvNUN+Di68cjZqDc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-252-3y8tzbWtO-WQvTT6L7Tjfg-1; Tue, 24 Aug 2021 11:15:36 -0400
X-MC-Unique: 3y8tzbWtO-WQvTT6L7Tjfg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 97D7D875047;
 Tue, 24 Aug 2021 15:15:35 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-4.ams2.redhat.com [10.36.112.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5268A17D4E;
 Tue, 24 Aug 2021 15:15:26 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id DEB1F11380A9; Tue, 24 Aug 2021 17:15:24 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v2 2/3] hw/usb/hcd-xhci-pci: Abort if setting link
 property failed
References: <20210819171547.2879725-1-philmd@redhat.com>
 <20210819171547.2879725-3-philmd@redhat.com>
 <20210823183414.hmu4ly2y5zkbw3mg@habkost.net>
 <87ilzvntu1.fsf@dusky.pond.sub.org>
 <CAFEAcA-2ShxjS6YAb_xBk=v5YJ5nLaaKtOLVEn7Vjfe6rkpp2A@mail.gmail.com>
 <87tujfdp4c.fsf@dusky.pond.sub.org>
 <CAFEAcA9_HGCVYX8smuAWhUDJ8NbfQ76XgJjOLd2EoyiS2gKC0A@mail.gmail.com>
 <87bl5mdik9.fsf@dusky.pond.sub.org>
 <CAFEAcA_8yQu2nbyjhCXKPROP=LLr6iKw2bTg0sHCM0uamwGz5w@mail.gmail.com>
Date: Tue, 24 Aug 2021 17:15:24 +0200
In-Reply-To: <CAFEAcA_8yQu2nbyjhCXKPROP=LLr6iKw2bTg0sHCM0uamwGz5w@mail.gmail.com>
 (Peter Maydell's message of "Tue, 24 Aug 2021 15:30:12 +0100")
Message-ID: <87o89man77.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.747,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael
 S. Tsirkin" <mst@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Dau?= =?utf-8?Q?d=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Peter Maydell <peter.maydell@linaro.org> writes:

> On Tue, 24 Aug 2021 at 15:27, Markus Armbruster <armbru@redhat.com> wrote:
>>
>> Peter Maydell <peter.maydell@linaro.org> writes:
>>
>> > On Tue, 24 Aug 2021 at 13:05, Markus Armbruster <armbru@redhat.com> wrote:
>> >> When you know that all callers handle errors like &error_fatal does, use
>> >> of &error_fatal doesn't produce wrong behavior.  It's still kind of
>> >> wrong, because relying on such a non-local argument without a genuine
>> >> need is.
>> >
>> > Not using error_fatal results in quite a bit of extra boilerplate
>> > for all those extra explicit "check for failure, print the error
>> > message and exit" points. If the MachineState init function took
>> > an Error** that might be a mild encouragement to "pass an Error
>> > upward rather than exiting"; but it doesn't.
>> >
>> > Right now we have nearly a thousand instances of error_fatal
>> > in the codebase, incidentally.
>>
>> Use of &error_fatal is clearly superior to accomplishing the same
>> behavior the way you describe.
>>
>> My point was this behavior is usually wrong in functions with an Error
>> **errp parameter.
>
> Right, but as Eduardo has noted, only about 8% of our use of
> error_fatal is like that. The vast bulk is other cases, so
> if you want to call it "kind of wrong" we ought to have a view
> of how it could be done otherwise.

True, except when I called it "kind of wrong", I was still talking about
functions with an Error **errp parameter.

Many (most?) existing uses of &error_fatal are just fine.  Which pleases
me, having created it in commit a29a37b994c.


