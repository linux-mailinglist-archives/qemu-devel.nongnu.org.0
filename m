Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7BF245BFA0
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 13:57:26 +0100 (CET)
Received: from localhost ([::1]:44560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mprq1-00086i-HA
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 07:57:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mpro9-0006xV-5P
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 07:55:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42825)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mpro4-00029z-52
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 07:55:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637758522;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C+0DyIlSXSBaZBuaz9TQCDz02dZKqoOjvgNtqoi6JmQ=;
 b=dKrITLPYenYKxnM1WqBlGDCSBmdrg8Dq+lv9rZiXR/HhvlGvku24nxI5CDPqZ8ID2Ho1EP
 dbaC5KtgareHI4h86vdhG18KtoGQhOzurSpxc9XtRDRIKChKVN1EwLrKsJCq9CD5hI6XCH
 xBGVvjNSTyjmygwWcbaMyDD0K8zRIOk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-148-JcHTQ3rzNqKRBVew0RP-Lg-1; Wed, 24 Nov 2021 07:55:21 -0500
X-MC-Unique: JcHTQ3rzNqKRBVew0RP-Lg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6EBBE81EE60;
 Wed, 24 Nov 2021 12:55:20 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 709336C351;
 Wed, 24 Nov 2021 12:55:11 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D78B711380A7; Wed, 24 Nov 2021 13:55:09 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH for-7.0 v2 1/2] ivshmem.c: change endianness to
 LITTLE_ENDIAN
References: <20211124092948.335389-1-danielhb413@gmail.com>
 <20211124092948.335389-2-danielhb413@gmail.com>
 <7d312ca5-82d1-ba63-535d-8024f2033215@redhat.com>
Date: Wed, 24 Nov 2021 13:55:09 +0100
In-Reply-To: <7d312ca5-82d1-ba63-535d-8024f2033215@redhat.com> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Wed, 24 Nov 2021 12:28:49
 +0100")
Message-ID: <87lf1dyaqa.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: thuth@redhat.com, Daniel Henrique Barboza <danielhb413@gmail.com>,
 qemu-devel@nongnu.org, clg@kaod.org, qemu-ppc@nongnu.org,
 Claudio Fontana <cfontana@suse.de>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> On 11/24/21 10:29, Daniel Henrique Barboza wrote:
>> The ivshmem device, as with most PCI devices, uses little endian byte
>> order. However, the endianness of its mmio_ops is marked as
>> DEVICE_NATIVE_ENDIAN. This presents not only the usual problems with big
>> endian hosts but also with PowerPC little endian hosts as well, since
>> the Power architecture in QEMU uses big endian hardware (XIVE controller=
,
>> PCI Host Bridges, etc) even if the host is in little endian byte order.
>
> Maybe mention commit f7a199b2b44 ("ivshmem: use little-endian
> int64_t for the protocol")?

"The protocol" is the interface between ivshmem-doorbell device (client)
and ivshmem server.  This commit is about the interface between
ivshmem-* device and the guest.  The two interfaces are about as related
as SSH and DNS: software exists that uses both.

Mentioning f7a199b2b44 feels superfluous to me.

[...]


