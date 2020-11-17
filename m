Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4478A2B596D
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 06:43:00 +0100 (CET)
Received: from localhost ([::1]:55130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ketla-00058Y-SW
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 00:42:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ketk8-0004Vf-Sp
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 00:41:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48268)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ketk3-0004QT-T8
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 00:41:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605591682;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Plegi8mUN3rEv9EVmuAu08W29ParO1TI1xW6VIhvtJU=;
 b=ZeEGkjB6qtWML8/XqlJQv4eKxTL1BKiSJzFmtepviBAIHnhkURxaW8V0xWfW/gt4EPnTGC
 WuYIxDqtVUt29384F1E+QtfXgWK5x20JWBONup5A9seFq8o/JvGYd3DFzAR2ZgDTaWTOhY
 GYyNIuWPH7P48Veh1yTyaFN3MCyBD1Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-138-OieUa8xQNYOoWALgY0gNjg-1; Tue, 17 Nov 2020 00:41:19 -0500
X-MC-Unique: OieUa8xQNYOoWALgY0gNjg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 43F411868425;
 Tue, 17 Nov 2020 05:41:18 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A688A19D6C;
 Tue, 17 Nov 2020 05:41:17 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 35EB211358BA; Tue, 17 Nov 2020 06:41:16 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 13/13] bcm2835_cprman: put some peripherals of bcm2835
 cprman into the 'misc' category
References: <20201115184903.1292715-1-ganqixin@huawei.com>
 <20201115184903.1292715-14-ganqixin@huawei.com>
 <c2ca2185-4253-da71-eab4-f96b29067c96@amsat.org>
 <882df4ee-948c-7e00-d951-9b14ea40b2df@redhat.com>
 <877dqldyoh.fsf@dusky.pond.sub.org>
 <CAFEAcA-u3jZT2bU6snRL7BWXHUzXuVr9gByssOjoicGZ2-MLXQ@mail.gmail.com>
Date: Tue, 17 Nov 2020 06:41:16 +0100
In-Reply-To: <CAFEAcA-u3jZT2bU6snRL7BWXHUzXuVr9gByssOjoicGZ2-MLXQ@mail.gmail.com>
 (Peter Maydell's message of "Mon, 16 Nov 2020 17:15:25 +0000")
Message-ID: <873618czgj.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 00:41:22
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>,
 zhanghailiang <zhang.zhanghailiang@huawei.com>,
 QEMU Trivial <qemu-trivial@nongnu.org>,
 Philippe =?utf-8?Q?Mathieu-Dau?= =?utf-8?Q?d=C3=A9?= <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Gan Qixin <ganqixin@huawei.com>,
 "Chenqun \(kuhn\)" <kuhn.chenqun@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Peter Maydell <peter.maydell@linaro.org> writes:

> On Mon, 16 Nov 2020 at 17:09, Markus Armbruster <armbru@redhat.com> wrote:
>> But TYPE_CPRMAN_PLL is *not* a descendant of TYPE_SYS_BUS_DEVICE, it's a
>> bus-less device:
>>
>>     static const TypeInfo cprman_pll_info = {
>>         .name = TYPE_CPRMAN_PLL,
>> --->    .parent = TYPE_DEVICE,
>>         .instance_size = sizeof(CprmanPllState),
>>         .class_init = pll_class_init,
>>         .instance_init = pll_init,
>>     };
>
> I'm really dubious of devices that directly inherit from
> TYPE_DEVICE, because their reset method won't be automatically
> called. In this case it looks like the TYPE_BCM2835_CPRMAN
> device's reset method manually calls reset on these devices,
> though, so it isn't actually buggy, just confusing.

I guess this is a trap for unwary implementers, aggravated by our usual
dearth of qdev documentation.  I can see ~100 .parent = TYPE_DEVICE
lines.  Checking them all manually won't be fun.  Any automation ideas?

The concept "bus-less device" is sane.  We used not to have it, and the
resulting need for pseudo-busses was annoying enough to make us add
bus-less devices.


