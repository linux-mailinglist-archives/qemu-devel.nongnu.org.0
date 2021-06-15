Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A98A3A79A5
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 10:56:50 +0200 (CEST)
Received: from localhost ([::1]:50872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lt4sL-0000ZW-B2
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 04:56:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lt4oF-0004y0-Go
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 04:52:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lt4oD-0006IK-B4
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 04:52:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623747152;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G2YZsqeukdC46/bN+Dw2UWlCqyuoccTROdQIu/iwPow=;
 b=FvoJkNy8nxxMt4OgyKu2TKoGFErzgoYmE583q0wR0qgRWnYceLzLKWXfVaOAhOap3lKyvB
 TDEcq83oGtFEapHDkzawPx/30KG8rdIjGqU57Lfc8gaVFnrrg0YYbi4m8g6jfVu/P/6+lT
 wmZdkhRx1PZgius+2DXlgV0wV22E8jY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-528-y4wrMDlyPVGQneb5Cu8RyA-1; Tue, 15 Jun 2021 04:52:31 -0400
X-MC-Unique: y4wrMDlyPVGQneb5Cu8RyA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 33F6380293F;
 Tue, 15 Jun 2021 08:52:30 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-104.ams2.redhat.com
 [10.36.112.104])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3B9ED60877;
 Tue, 15 Jun 2021 08:52:22 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C02DA113865F; Tue, 15 Jun 2021 10:52:20 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Stefan Berger <stefanb@linux.ibm.com>
Subject: Re: [PATCH v3 5/5] tpm: Return QMP error when TPM is disabled in build
References: <20210614200940.2056770-1-philmd@redhat.com>
 <20210614200940.2056770-6-philmd@redhat.com>
 <270e0d89-f074-0713-6871-6e4a21791494@redhat.com>
 <2745685d-c988-4838-24c3-829295aec2fb@linux.ibm.com>
Date: Tue, 15 Jun 2021 10:52:20 +0200
In-Reply-To: <2745685d-c988-4838-24c3-829295aec2fb@linux.ibm.com> (Stefan
 Berger's message of "Mon, 14 Jun 2021 17:57:29 -0400")
Message-ID: <87pmwnse63.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
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
Cc: Stefan Berger <stefanb@linux.vnet.ibm.com>, Eric Blake <eblake@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
 =?utf-8?Q?Marc-Andr?= =?utf-8?Q?=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Stefan Berger <stefanb@linux.ibm.com> writes:

> On 6/14/21 4:12 PM, Philippe Mathieu-Daud=C3=A9 wrote:
>>
>> Grrrr I forgot to commit:
>>
>> -- >8 --
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 7d9cd290426..636bf2f5365 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -2707,7 +2707,6 @@ TPM
>>   M: Stefan Berger <stefanb@linux.ibm.com>
>>   S: Maintained
>>   F: tpm.c
>> -F: stubs/tpm.c
>>   F: hw/tpm/*
>>   F: include/hw/acpi/tpm.h
>>   F: include/sysemu/tpm*
>> ---
>>
> Who is going to upstream the series? I could add this part ...

Please do.

Thank you!


