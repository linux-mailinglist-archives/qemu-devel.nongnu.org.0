Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C73936D851
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 15:31:42 +0200 (CEST)
Received: from localhost ([::1]:36842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbkI1-0003eM-KE
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 09:31:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lbkGF-0003Az-Tk
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 09:29:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31250)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lbkGA-00005i-VX
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 09:29:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619616585;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LgKrhGaOM41Wbk/Cgdnku3WLtg5qEcP+00IrEkZNny0=;
 b=OuX/sI5NL6Av8Ye588rOwPrwEbDSMf0ieguIuAuLWeEdhHcCFoO8VR+vuq+EN2wnl+WAd2
 Q38NgOZ9V9dAsZHhpxsITNFtCJiHirVCVneRhBEsqom/1HW8V5OpW4/ylQEuCngUBSpMEn
 NdALZiA8DbJOYaMYj9cGgNFcJ0Yqugg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-463-9bsmERnwOSOE0MqE-d-Ucw-1; Wed, 28 Apr 2021 09:29:44 -0400
X-MC-Unique: 9bsmERnwOSOE0MqE-d-Ucw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 409B41926DA2;
 Wed, 28 Apr 2021 13:29:42 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A241860C05;
 Wed, 28 Apr 2021 13:29:41 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0FA85113525D; Wed, 28 Apr 2021 15:29:40 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v8 08/11] hw/core: deprecate old reset functions and
 introduce new ones
References: <20200123132823.1117486-1-damien.hedde@greensocs.com>
 <20200123132823.1117486-9-damien.hedde@greensocs.com>
 <9fb8a6ed-137b-7269-91f1-69c11c6d876a@redhat.com>
 <20210427212707.3tckau5r3kraciam@habkost.net>
 <87lf93q9ul.fsf@dusky.pond.sub.org>
 <CAFEAcA9u1ftq94B1HQhAb0=909VfvcU1d5FVUwkbJ9orexBt=Q@mail.gmail.com>
Date: Wed, 28 Apr 2021 15:29:40 +0200
In-Reply-To: <CAFEAcA9u1ftq94B1HQhAb0=909VfvcU1d5FVUwkbJ9orexBt=Q@mail.gmail.com>
 (Peter Maydell's message of "Wed, 28 Apr 2021 13:51:17 +0100")
Message-ID: <87sg3ailkr.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, Luc Michel <luc@lmichel.fr>,
 Eduardo Habkost <ehabkost@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Greg Kurz <groug@kaod.org>,
 Edgar Iglesias <edgari@xilinx.com>, "Daniel P. Berrange" <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-?= =?utf-8?Q?Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Peter Maydell <peter.maydell@linaro.org> writes:

> On Wed, 28 Apr 2021 at 06:03, Markus Armbruster <armbru@redhat.com> wrote:
>> For what it's worth, Damien further explained the two helpers in
>> docs/devel/reset.rst:
>>
>>     For Devices and Buses, the following helper functions exist:
>>
>>     - ``device_cold_reset()``
>>     - ``bus_cold_reset()``
>>
>>     These are simple wrappers around resettable_reset() function; they only cast the
>>     Device or Bus into an Object and pass the cold reset type. When possible
>>     prefer to use these functions instead of ``resettable_reset()``.
>>
>> I figure what's missing is guidance on how to transition code from
>> legacy reset to multi-phase reset.  Ideally with a working example
>> people can study.  Damien, can you help us out?
>
> These are two separate things:
>  1) callsites which want to reset some other device, and currently
>     mostly use eg device_legacy_reset() -- the transition to be done
>     is to move them to use device_cold_reset(). Similarly, callsites
>     which currently reset a bus with qbus_reset_all() and should move
>     to bus_cold_reset().
>  2) devices which implement reset and currently do so with a
>     single reset method -- the transition to be done is to have
>     them implement however many phases of 3-phase reset they need
>
> (1) is easier than (2) because there are many fewer callsites
> trying to manually reset devices or buses than there are
> devices that implement reset.

My ignorance on "these are two separate things" is further evidence that
working examples are needed.  Damien?  Peter?  Pretty-please?


