Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C76F83CF60E
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 10:22:20 +0200 (CEST)
Received: from localhost ([::1]:50254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5l19-0005om-Sw
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 04:22:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1m5kzn-0004R8-TS
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 04:20:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37903)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1m5kzm-0001mT-IQ
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 04:20:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626769254;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=43sM2JqxweMdlek8Ae+XqDe9z8rlft8xutHCcDEZftE=;
 b=bLn+jr1MnkkEOQpRt5Ml61aicmA0kyiHhvO0M6RHq36GiDsB1G43cP+ymubrhgFJrJa7Q+
 5fptYAKwaC+OehAsi7Z3Wgyr110nfOWskZyWdyAhfOiVYLWPK8lHIozQAyD402wzCHPSAn
 UoNsO8N5uW8V6svl+2r/OCQRfXt/pZw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-155-0iyDSou9PsqpZPMV6ArNww-1; Tue, 20 Jul 2021 04:20:53 -0400
X-MC-Unique: 0iyDSou9PsqpZPMV6ArNww-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8C3F2804300;
 Tue, 20 Jul 2021 08:20:51 +0000 (UTC)
Received: from localhost (ovpn-112-105.ams2.redhat.com [10.36.112.105])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 82A1F60CC9;
 Tue, 20 Jul 2021 08:20:47 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Pierre Morel <pmorel@linux.ibm.com>, =?utf-8?Q?Daniel_P=2E_Berrang?=
 =?utf-8?Q?=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH v1 2/9] s390x: toplogy: adding drawers and books to smp
 parsing
In-Reply-To: <ecb2932e-7595-c4a4-5480-9c77ecf3e34d@linux.ibm.com>
Organization: Red Hat GmbH
References: <1626281596-31061-1-git-send-email-pmorel@linux.ibm.com>
 <1626281596-31061-3-git-send-email-pmorel@linux.ibm.com>
 <87y2a8cda7.fsf@dusky.pond.sub.org>
 <0801e122-0e9c-e266-42e8-d5cddb16c237@linux.ibm.com>
 <87bl73df9y.fsf@dusky.pond.sub.org> <87y2a6bp5f.fsf@redhat.com>
 <YPFO/NPdyHjf1Cyu@redhat.com> <87pmvibkri.fsf@redhat.com>
 <YPFkJUgbE9ku0tI7@redhat.com> <87czre9uar.fsf@redhat.com>
 <ecb2932e-7595-c4a4-5480-9c77ecf3e34d@linux.ibm.com>
User-Agent: Notmuch/0.32.1 (https://notmuchmail.org)
Date: Tue, 20 Jul 2021 10:20:45 +0200
Message-ID: <87wnpl8kgy.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) DKIMWL_WL_HIGH=-1.469, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: thuth@redhat.com, ehabkost@redhat.com, david@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, qemu-s390x@nongnu.org, pbonzini@redhat.com,
 eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jul 20 2021, Pierre Morel <pmorel@linux.ibm.com> wrote:

> On 7/19/21 5:50 PM, Cornelia Huck wrote:
>> On Fri, Jul 16 2021, Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote=
:
>>> Is the book/drawer thing architecture specific, or is it machine
>>> type / CPU specific. ie do /all/ the s390x machine types / CPUS
>>> QEMU support the book/drawer concept, or only a subset.
>>=20
>> Should not be by machine type, but might be by cpu model (e.g. older
>> hardware lacking the needed support for exposing this to the guest.) IBM
>> folks, please correct me if I'm wrong.
>
>
> Looks correct to me this is an information indicated by a facility=20
> introduced with Z10 if I do not make an error.

Hm. Would that become a problem if we made availability of parameters
dependent upon a value in the machine (see the other thread I cc:ed you
on?)


