Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD601D8FD0
	for <lists+qemu-devel@lfdr.de>; Tue, 19 May 2020 08:10:31 +0200 (CEST)
Received: from localhost ([::1]:45184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1javSQ-0006t0-7w
	for lists+qemu-devel@lfdr.de; Tue, 19 May 2020 02:10:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1javRi-0006G0-0K
 for qemu-devel@nongnu.org; Tue, 19 May 2020 02:09:46 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:60678
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1javRh-0000Cn-4G
 for qemu-devel@nongnu.org; Tue, 19 May 2020 02:09:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589868584;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WaeQ33yR9ty9A0LdSsX2OONbYwk7THfeORlNOcoTOdM=;
 b=B1exQM/Q2NBV4Pu7G00mMs8Qt/NaYO0j4lEsKNGMo85l8BXfkFrNCESPbTds69FcBxnoeB
 S4taFChbRKNcF1Xyo0GxuKNc5YJvd/7SYq+EgPcuSY71AAp0HDzHcE4uh0MsG0oxe6Ozq3
 HD8QdNeBi30AOPBAcEGWpWPVxz14y8Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-232-gGaZ6HbJOuefSqnDumqV-Q-1; Tue, 19 May 2020 02:09:42 -0400
X-MC-Unique: gGaZ6HbJOuefSqnDumqV-Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 46B518005AA;
 Tue, 19 May 2020 06:09:41 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-32.ams2.redhat.com
 [10.36.112.32])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6BDDE10013D9;
 Tue, 19 May 2020 06:09:40 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id EE35011358BC; Tue, 19 May 2020 08:09:38 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: [PATCH 15/24] macio: Fix macio-bus to be a subtype of System bus
References: <20200518050408.4579-1-armbru@redhat.com>
 <20200518050408.4579-16-armbru@redhat.com>
 <8943ff5f-a52c-5cd7-e1e2-7ecc1c600e25@ilande.co.uk>
Date: Tue, 19 May 2020 08:09:38 +0200
In-Reply-To: <8943ff5f-a52c-5cd7-e1e2-7ecc1c600e25@ilande.co.uk> (Mark
 Cave-Ayland's message of "Mon, 18 May 2020 21:39:59 +0100")
Message-ID: <87d0705ucd.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=205.139.110.61; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/18 23:19:13
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: berrange@redhat.com, ehabkost@redhat.com, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, pbonzini@redhat.com,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk> writes:

> On 18/05/2020 06:03, Markus Armbruster wrote:
>
>> The devices we plug into the macio-bus are all sysbus devices
>> (DeviceClass member bus_type is TYPE_SYSTEM_BUS), but macio-bus does
>> not derive from TYPE_SYSTEM_BUS.  Fix that.
>> 
>> "info qtree" now shows the devices' mmio ranges, as it should
>> 
>> Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>> Cc: David Gibson <david@gibson.dropbear.id.au>
>> Cc: qemu-ppc@nongnu.org
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> ---
>>  hw/misc/macio/macio.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/hw/misc/macio/macio.c b/hw/misc/macio/macio.c
>> index ebc96cc8f6..53a9fd5696 100644
>> --- a/hw/misc/macio/macio.c
>> +++ b/hw/misc/macio/macio.c
>> @@ -492,7 +492,7 @@ static void macio_class_init(ObjectClass *klass, void *data)
>>  
>>  static const TypeInfo macio_bus_info = {
>>      .name = TYPE_MACIO_BUS,
>> -    .parent = TYPE_BUS,
>> +    .parent = TYPE_SYSTEM_BUS,
>>      .instance_size = sizeof(MacIOBusState),
>>  };
>
> Here I learned something new: a device that has a class TYPE_SYS_BUS_DEVICE should be
> attached to a bus that derives from TYPE_SYSTEM_BUS. I have a feeling that there are
> going to be quite a few instances of this around, particularly in places where
> existing sysbus devices have been borrowed from the PC world and reused.

Not that many.  I clean them up this series, and "[PATCH 22/24] qdev:
Assert devices are plugged into a bus that can take them" should ensure
we stay clean.


