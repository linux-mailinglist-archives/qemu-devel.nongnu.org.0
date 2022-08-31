Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF14E5A78E6
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 10:21:55 +0200 (CEST)
Received: from localhost ([::1]:37430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTIyw-00035Z-ES
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 04:21:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oTIvr-0000l5-G3
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 04:18:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52675)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oTIvo-00046k-0M
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 04:18:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661933911;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=B1ApHMyNcR8l6cmhGppzVS345Vzpi8LgO32+LHSG7c0=;
 b=TugcjYt71GxiBIqvZx4zqKcYSb1q4Op/3vgJSlBC0+T78T1a4hTlp9mSK1Nma84cyt/D+B
 0b3ZXFq/+7Wkd9EDIa7CYffDJ01Bzq3qTqRPqPW8PRJN6vaYTbIkrvt9UmJwKaUBi2ZrPC
 nqtY/EqSUxD3BZhYgKrPQ90Rprxx1AU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-591-hGSD1Co3PAK_-6tYgZpbdA-1; Wed, 31 Aug 2022 04:18:26 -0400
X-MC-Unique: hGSD1Co3PAK_-6tYgZpbdA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1451E8039B5;
 Wed, 31 Aug 2022 08:18:26 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.166])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1A7B11415117;
 Wed, 31 Aug 2022 08:18:24 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A0B6721E6900; Wed, 31 Aug 2022 10:18:22 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Alex Williamson <alex.williamson@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>,  =?utf-8?B?5bCP55Sw5Zac6Zm95b2m?=
 <akihiko.odaki@daynix.com>,  qemu-devel@nongnu.org,
 qemu-block@nongnu.org,  qemu-arm@nongnu.org,  "Michael S. Tsirkin"
 <mst@redhat.com>,  Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,  Gerd
 Hoffmann <kraxel@redhat.com>,  Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,  Eduardo Habkost
 <eduardo@habkost.net>,  John Snow <jsnow@redhat.com>,  Dmitry Fleytman
 <dmitry.fleytman@gmail.com>,  Jason Wang <jasowang@redhat.com>,  Stefan
 Weil <sw@weilnetz.de>,  Keith Busch <kbusch@kernel.org>,  Klaus Jensen
 <its@irrelevant.dk>,  Peter Maydell <peter.maydell@linaro.org>,  Andrey
 Smirnov <andrew.smirnov@gmail.com>,  Paul Burton <paulburton@kernel.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Subject: Re: [PATCH] pci: Abort if pci_add_capability fails
References: <20220829084417.144739-1-akihiko.odaki@daynix.com>
 <874jxuhshs.fsf@pond.sub.org>
 <20220830120014.55f55b24.alex.williamson@redhat.com>
Date: Wed, 31 Aug 2022 10:18:22 +0200
In-Reply-To: <20220830120014.55f55b24.alex.williamson@redhat.com> (Alex
 Williamson's message of "Tue, 30 Aug 2022 12:00:14 -0600")
Message-ID: <87y1v4ddwx.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Alex Williamson <alex.williamson@redhat.com> writes:

> On Tue, 30 Aug 2022 13:37:35 +0200
> Markus Armbruster <armbru@redhat.com> wrote:
>>        if (!offset) {
>>            offset = pci_find_space(pdev, size);
>>            /* out of PCI config space is programming error */
>>            assert(offset);
>>        } else {
>>            /* Verify that capabilities don't overlap.  Note: device assignment
>>             * depends on this check to verify that the device is not broken.
>>             * Should never trigger for emulated devices, but it's helpful
>>             * for debugging these. */
>> 
>> The comment makes me suspect that device assignment of a broken device
>> could trigger the error.  It goes back to
>> 
>> commit c9abe111209abca1b910e35c6ca9888aced5f183
>> Author: Jan Kiszka <jan.kiszka@siemens.com>
>> Date:   Wed Aug 24 14:29:30 2011 +0200
>> 
>>     pci: Error on PCI capability collisions
>>     
>>     Nothing good can happen when we overlap capabilities. This may happen
>>     when plugging in assigned devices or when devices models contain bugs.
>>     Detect the overlap and report it.
>>     
>>     Based on qemu-kvm commit by Alex Williamson.
>>     
>>     Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
>>     Acked-by: Don Dutile <ddutile@redhat.com>
>>     Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
>> 
>> If this is still correct, then your patch is a regression: QEMU is no
>> longer able to gracefully handle assignment of a broken device.  Does
>> this matter?  Alex, maybe?
>
> Ok, that was a long time ago.  I have some vague memories of hitting

Indeed!

> something like this with a Broadcom NIC, but a google search for the
> error string doesn't turn up anything recently.  So there's a fair
> chance this wouldn't break anyone initially.

I like your careful phrasing.

> Even back when the above patch was proposed, there were some
> suggestions to turn the error path into an abort, which I pushed back
> on since clearly enumerating capabilities of a device can occur due to
> a hot-plug and we don't necessarily have control of the device being
> added.  This is only more true with the possibility of soft-devices out
> of tree, through things like vfio-user.

Valid point.

When an compiled-in device model asks for overlapping PCI capabilities,
it's a programming error.

When an assigned device (be it physical or virtual) has overlapping PCI
capabilities, it's bad input.

Abort on programming error is okay.  Abort on bad input isn't.

I think callers of the former sort should pass &error_abort to
pci_add_capability(), and callers of the latter sort should handle the
error.

> Personally I think the right approach is to support an error path such
> that we can abort when triggered by a cold-plug device, while simply
> rejecting a broken hot-plug device, but that seems to be the minority
> opinion among QEMU developers afaict.  Thanks,

I'm in the "aborting on programming errors is okay" camp.

Recovery from certain programming errors is possible.  However,
different programming errors can manifest themselves the same way, and
not all need permit safe recovery.

Say we detect overlapping PCI capabilities when hot-plugging a virtual
device model.

If this is because the programmer passed an incorrect literal offset, we
can recover safely by failing the hot plug.

But perhaps the offset comes from a table, and some other bug scribbled
over it.  Continuing the process is *unsafe*, and may increase the
damage and/or obstruct the root cause.

The former kind of bug is unlikely to survive even cursory testing.


