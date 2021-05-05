Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0F637357E
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 09:20:32 +0200 (CEST)
Received: from localhost ([::1]:60772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leBpf-0004Nw-Lb
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 03:20:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1leBng-0003K8-IM
 for qemu-devel@nongnu.org; Wed, 05 May 2021 03:18:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59280)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1leBnd-0007w3-Cj
 for qemu-devel@nongnu.org; Wed, 05 May 2021 03:18:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620199103;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lcJBx5/+oT6AjUvfJBCJWV6stmSIaCf7lZuS7+KkG64=;
 b=jFhY9mcnuoncxUc/L1S3jpwb9ah4sdoUQv1NArFkRCNLQHJNShlkjukaQIe+NDr/Of6n6F
 jf2EMJA8lbUrRO1g+e8YiA2MQDWLUN60ZHs+cuSi7uLSbGQ6t4lKAh+65WQ5O2b8BQCqF3
 hGGQ6he/NWixXJjYEiYdfIYAbJGrn30=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-63-6OnkcauGNIGR_ZucnKNwuA-1; Wed, 05 May 2021 03:18:20 -0400
X-MC-Unique: 6OnkcauGNIGR_ZucnKNwuA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7F6EFC7404;
 Wed,  5 May 2021 07:18:18 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DEB6A610DF;
 Wed,  5 May 2021 07:18:17 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4C2251138529; Wed,  5 May 2021 09:18:16 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v2 1/3] hw/block/nand: Register machine reset handler
References: <20210502203121.630944-1-f4bug@amsat.org>
 <20210502203121.630944-2-f4bug@amsat.org>
 <CAFEAcA_pCcM70-OMaPhaAiW=-V5OK6KbBWSEK8y6AVNxpAtyMA@mail.gmail.com>
Date: Wed, 05 May 2021 09:18:16 +0200
In-Reply-To: <CAFEAcA_pCcM70-OMaPhaAiW=-V5OK6KbBWSEK8y6AVNxpAtyMA@mail.gmail.com>
 (Peter Maydell's message of "Sun, 2 May 2021 21:38:59 +0100")
Message-ID: <87k0odvebr.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Max Reitz <mreitz@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 =?utf-8?Q?Herv=C3=A9?= Poussineau <hpoussin@reactos.org>,
 qemu-ppc <qemu-ppc@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Peter Maydell <peter.maydell@linaro.org> writes:

> On Sun, 2 May 2021 at 21:31, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
>>
>> The TYPE_NAND device is bus-less, thus isn't reset automatically.
>> Register a reset handler to get reset with the machine.
>>
>> Fixed: 7426aa72c36 ("nand: Don't inherit from Sysbus")
>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>> ---
>
> Personally I would just revert 7426aa72c36 rather than introduce
> a new use of qemu_register_reset()...

I think this depends on what you dislike more, qemu_register_reset() or
sysbus.  Neither is deprecated, both have more than a hundred users.
One more user doesn't matter all that much for either.

I happen to dislike sysbus more, but my opinion on this is yet another
thin that doesn't matter all that much :)


