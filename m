Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C8B3F59BB
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 10:15:08 +0200 (CEST)
Received: from localhost ([::1]:50736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIRaN-0000Bm-2i
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 04:15:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mIRZM-0007yU-N2
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 04:14:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26378)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mIRZJ-0006RO-5A
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 04:14:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629792838;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8U9WFDQlGB6ECJZ8KRzTg00NZzc74wmQdkGrDTp1eKA=;
 b=Pr2TvU1AWm1EHq+ronXcvf36CL9MxCiU8rnhzI8L7T3WesP+pKWM+HfnAeTxBZD0FVGia5
 gcmrO9XKJDojbOpMqdP2n8aYR8qN8flJCrRYks1MkbZcf1cNxvpTNl1FLVP1cIidz9VrQW
 B5kS1PwZgx7xmvDXBOMNxV81wYW3vAw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-587-5qd62Y1TNAi1UfIRZIQRAw-1; Tue, 24 Aug 2021 04:13:55 -0400
X-MC-Unique: 5qd62Y1TNAi1UfIRZIQRAw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 83F461015186;
 Tue, 24 Aug 2021 08:13:54 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-4.ams2.redhat.com [10.36.112.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 167D0620DE;
 Tue, 24 Aug 2021 08:13:44 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A493911380A9; Tue, 24 Aug 2021 10:13:42 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH v2 2/3] hw/usb/hcd-xhci-pci: Abort if setting link
 property failed
References: <20210819171547.2879725-1-philmd@redhat.com>
 <20210819171547.2879725-3-philmd@redhat.com>
 <20210823183414.hmu4ly2y5zkbw3mg@habkost.net>
Date: Tue, 24 Aug 2021 10:13:42 +0200
In-Reply-To: <20210823183414.hmu4ly2y5zkbw3mg@habkost.net> (Eduardo Habkost's
 message of "Mon, 23 Aug 2021 14:34:14 -0400")
Message-ID: <87ilzvntu1.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.743,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eduardo Habkost <ehabkost@redhat.com> writes:

> +Markus
>
> On Thu, Aug 19, 2021 at 07:15:46PM +0200, Philippe Mathieu-Daud=C3=A9 wro=
te:
>> Do not ignore eventual error if we failed at setting the 'host'
>> property of the TYPE_XHCI model.
>>=20
>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>> ---
>>  hw/usb/hcd-xhci-pci.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>=20
>> diff --git a/hw/usb/hcd-xhci-pci.c b/hw/usb/hcd-xhci-pci.c
>> index e934b1a5b1f..71f6629ccde 100644
>> --- a/hw/usb/hcd-xhci-pci.c
>> +++ b/hw/usb/hcd-xhci-pci.c
>> @@ -115,7 +115,7 @@ static void usb_xhci_pci_realize(struct PCIDevice *d=
ev, Error **errp)
>>      dev->config[PCI_CACHE_LINE_SIZE] =3D 0x10;
>>      dev->config[0x60] =3D 0x30; /* release number */
>> =20
>> -    object_property_set_link(OBJECT(&s->xhci), "host", OBJECT(s), NULL)=
;
>> +    object_property_set_link(OBJECT(&s->xhci), "host", OBJECT(s), &erro=
r_fatal);
>
> If this fails, it's due to programmer error, isn't?  Shouldn't we
> use &error_abort on that case?

I think so.

In functions with an Error **errp parameter, use of &error_fatal is
almost always wrong.

>>      s->xhci.intr_update =3D xhci_pci_intr_update;
>>      s->xhci.intr_raise =3D xhci_pci_intr_raise;
>>      if (!qdev_realize(DEVICE(&s->xhci), NULL, errp)) {
>> --=20
>> 2.31.1
>>=20


