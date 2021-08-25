Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 851B83F70AE
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 09:50:46 +0200 (CEST)
Received: from localhost ([::1]:52412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIngL-0002QL-L8
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 03:50:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mIneb-0001KS-N5
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 03:48:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mIneZ-0007EA-CT
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 03:48:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629877733;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kWriyZdgTOJGa9lKKfY6lBGzVG4Y7IGDgEKRqprDatg=;
 b=fXZ3RWJL3L+QopQcSsUNSymEV7TTSqIdANyK8+rE4Rj+mpnIs0gtDB4dbLq3c1u2rcNRCa
 fIqYl84OwHOnq56XSDRzS5i1HiYQQBkfI+97dA/pyEQMo9CXZe2EFRL1FRNrOVQAlnKrfH
 GW271wVRYc2WXX2wV+WGgeq1U+wei38=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-304-1qLs6T_ONvWthbRt5bZTpQ-1; Wed, 25 Aug 2021 03:48:50 -0400
X-MC-Unique: 1qLs6T_ONvWthbRt5bZTpQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C15DF87180C;
 Wed, 25 Aug 2021 07:48:49 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-4.ams2.redhat.com [10.36.112.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E88F85D9C6;
 Wed, 25 Aug 2021 07:48:37 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7FD3F11380A9; Wed, 25 Aug 2021 09:48:36 +0200 (CEST)
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
 <87o89man77.fsf@dusky.pond.sub.org>
 <CAFEAcA-=TJm=0WFKbAc27NtL2VJroMHAURpzJRdYkg8LLKBagQ@mail.gmail.com>
Date: Wed, 25 Aug 2021 09:48:36 +0200
In-Reply-To: <CAFEAcA-=TJm=0WFKbAc27NtL2VJroMHAURpzJRdYkg8LLKBagQ@mail.gmail.com>
 (Peter Maydell's message of "Tue, 24 Aug 2021 16:19:19 +0100")
Message-ID: <874kbe7ynf.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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

> On Tue, 24 Aug 2021 at 16:15, Markus Armbruster <armbru@redhat.com> wrote:
>> True, except when I called it "kind of wrong", I was still talking about
>> functions with an Error **errp parameter.
>
> Oh yes, so you were. I even quoted your sentence starting
> "In functions with an Error **errp parameter ...".
> I must have been half-asleep still this morning.
>
> Apologies for starting an unnecessary thread after which we all
> turn out to be in complete agreement :-)

No problem at all :)


