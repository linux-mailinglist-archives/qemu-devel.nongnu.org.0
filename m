Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C240215245
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jul 2020 07:54:05 +0200 (CEST)
Received: from localhost ([::1]:41336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jsK4q-0000nf-4P
	for lists+qemu-devel@lfdr.de; Mon, 06 Jul 2020 01:54:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jsK3Y-0000FL-I9
 for qemu-devel@nongnu.org; Mon, 06 Jul 2020 01:52:44 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:24751
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jsK3W-0006Uv-Lo
 for qemu-devel@nongnu.org; Mon, 06 Jul 2020 01:52:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594014761;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dkw2M+agDsyb6+Imx8Z9V0Lev8fU61znU7uYOtQ6zS4=;
 b=gqcDnUPTJSU280VaawtFwL6EwiVrdw5vDZQZzUgeJvBS9OczjNBAl7LmvK/nbV8xh6SkpC
 3/46DzePbZkL/dmGukb3+XAw3aaYJe5/vAaJcDvISnxoW3wF2rqOr4n/fL6hriVGBd1GlC
 wxaVfFDfh2CFNva49Rxfu85P+SZVoNs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-185-VQjCbYqGM6-GQo0RjsDnhQ-1; Mon, 06 Jul 2020 01:52:39 -0400
X-MC-Unique: VQjCbYqGM6-GQo0RjsDnhQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1187B8F50B;
 Mon,  6 Jul 2020 05:52:38 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-143.ams2.redhat.com
 [10.36.112.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A54AB1A888;
 Mon,  6 Jul 2020 05:52:37 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 2F5051138648; Mon,  6 Jul 2020 07:52:36 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v7 09/17] hw/sd/sdcard: Special case the -ENOMEDIUM error
References: <20200630133912.9428-1-f4bug@amsat.org>
 <20200630133912.9428-10-f4bug@amsat.org>
 <CAFEAcA_dhbr6cjK40H0=e39sD2r8ERTZYrY5nhJtx81Rk+RmUg@mail.gmail.com>
Date: Mon, 06 Jul 2020 07:52:36 +0200
In-Reply-To: <CAFEAcA_dhbr6cjK40H0=e39sD2r8ERTZYrY5nhJtx81Rk+RmUg@mail.gmail.com>
 (Peter Maydell's message of "Fri, 3 Jul 2020 14:23:10 +0100")
Message-ID: <875zb1i40r.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/06 01:52:41
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Qemu-block <qemu-block@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Peter Maydell <peter.maydell@linaro.org> writes:

> On Tue, 30 Jun 2020 at 14:39, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>>
>> As we have no interest in the underlying block geometry,
>> directly call blk_getlength(). We have to care about machines
>> creating SD card with not drive attached (probably incorrect
>> API use). Simply emit a warning when such Frankenstein cards
>> of zero size are reset.
>
> Which machines create SD cards without a backing block device?
>
> I have a feeling that also the monitor "change" and "eject"
> commands can remove the backing block device from the SD card
> object.

Correct:

    static const BlockDevOps sd_block_ops =3D {
        .change_media_cb =3D sd_cardchange,
    };

This is TYPE_SD_CARD's ("sd-card").  What exactly does that device
model?

If it's the sd-card, then the modelling is odd.  A physical SD card gets
plugged and unplugged as a whole.  This model can't.  Instead, you
change "media".  Isn't the SD card the medium?

The other device models with removable media (IDE & SCSI CD drives,
floppy drives) model the receptacle for media.  On media change, the
drive stays put, and only the medium changes, both in the physical world
and in our virtual world.

Our "sd-card" seems to be an "SD card drive".  But then I wonder what
the thing at the other end of TYPE_SD_BUS ("sd-bus") actually models.
Any ideas?


