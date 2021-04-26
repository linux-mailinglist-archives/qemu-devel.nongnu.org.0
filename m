Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F44C36ABD1
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 07:20:54 +0200 (CEST)
Received: from localhost ([::1]:46604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1latfw-0004lz-Vx
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 01:20:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1laten-0004Kx-QT
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 01:19:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23434)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1latel-0007Q4-06
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 01:19:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619414377;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LWdelH5TMbLDs46XXbhwaSiVoKkMYcfMwfECD5hsn6U=;
 b=BqArjP83v1ohDlxAJ+mn9lhzKQiIPK/lbKRKqMNeRPvu3vt1FS36RBel6iMDP5eKN0+pqh
 rykDxl0KcAiBEomw7DoLscSfZNTWdGmCIt+t1oSVNFxxLd1+pL4yg0ZxeGoolcGWxPKeDo
 63135BD6Y+rlpk5ZaLUm0LBJQhFbOM8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-389-aF0t65NTOEWLp7d_APr9Mw-1; Mon, 26 Apr 2021 01:19:35 -0400
X-MC-Unique: aF0t65NTOEWLp7d_APr9Mw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6A96218397A3;
 Mon, 26 Apr 2021 05:19:34 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9B27110016FD;
 Mon, 26 Apr 2021 05:19:30 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 20BE3113525D; Mon, 26 Apr 2021 07:19:29 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: Resetting non-qdev children in a 3-phase reset device
References: <CAFEAcA8k+RUNhAOzCeefBs+vcyAgrtHwHMH9KfQb6OJg0su_7w@mail.gmail.com>
 <fc080508-9b82-8a2b-79bb-ab4e9f812cce@amsat.org>
 <CAFEAcA8hs3Uw=8-_CFa_GoMhmqxCcHw5t751oKzicd0_+Dh8kA@mail.gmail.com>
 <87y2datpyw.fsf@dusky.pond.sub.org>
 <5570bf5a-3cab-c30c-2c21-0ab02543199e@amsat.org>
 <2f4155ca-ee84-75f0-8b35-aac6b18ee4f0@amsat.org>
 <3dcb8efa-8f6b-0f45-a753-cc58d3bf9855@amsat.org>
 <87im4cb6ag.fsf@dusky.pond.sub.org>
 <b7f6752b-6f4c-a3d2-074c-0b41094d7dfa@amsat.org>
 <CAFEAcA__LbLXA3b8U_-wHrxcET7OwCTOoL_8kYAYsd3LTKEOZQ@mail.gmail.com>
Date: Mon, 26 Apr 2021 07:19:29 +0200
In-Reply-To: <CAFEAcA__LbLXA3b8U_-wHrxcET7OwCTOoL_8kYAYsd3LTKEOZQ@mail.gmail.com>
 (Peter Maydell's message of "Sun, 25 Apr 2021 19:33:25 +0100")
Message-ID: <878s5539ni.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.219,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Peter Maydell <peter.maydell@linaro.org> writes:

> On Sat, 24 Apr 2021 at 14:04, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>> I now understand better the diag288 case, but I still don't understand
>> the TYPE_APIC one. It has no DeviceClass::reset(), its abstract parent
>> TYPE_APIC_COMMON register apic_reset_common() but being TYPE_DEVICE it
>> is not on a qbus. It is somehow connected to the X86CPU object, but the
>> single call to apic_init_reset() is from do_cpu_init() - not a reset
>> method -.
>
> pc_machine_reset() calls device_legacy_reset(cpu->apic_state)
> which is to say it invokes the DeviceState::reset method,
> which is either kvm_apic_reset or apic_reset_common.

device_legacy_reset() is deprecated:

    /**
     * device_legacy_reset:
     *
     * Reset a single device (by calling the reset method).
     * Note: This function is deprecated and will be removed when it become=
s unused.
     * Please use device_cold_reset() now.
     */
    void device_legacy_reset(DeviceState *dev);

Good to know, but how do we get from here to there?  If we could simply
replace one call by the other, surely we'd have done it already.


