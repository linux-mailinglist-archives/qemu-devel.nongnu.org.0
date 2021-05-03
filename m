Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B231371112
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 06:57:48 +0200 (CEST)
Received: from localhost ([::1]:48220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldQeR-0005NB-Ht
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 00:57:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ldQdD-0003kv-Fe
 for qemu-devel@nongnu.org; Mon, 03 May 2021 00:56:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ldQdB-0000pD-To
 for qemu-devel@nongnu.org; Mon, 03 May 2021 00:56:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620017789;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JwNIncxeUtdusVmTWlRP9JOZLEyeA5FVvFSpOWS48K4=;
 b=TzadCjHp6kulWX7bMv+foH5DdtaggLbrOD5T2vrysjvHKm3wKVZQ/z1x4Sw1hf4xEV8xNd
 aDxbnVf9bW7rddRsuh0IgWjdvRXxGoX+f8EV0Mjz50hF7onltKstIvKz0HyRfLzt8GG+fU
 EmOMtjGgpUlAtZvIBbrgTeQqsv6ANdk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-359-ErDcKnbZP76UxtsIALcbmg-1; Mon, 03 May 2021 00:56:27 -0400
X-MC-Unique: ErDcKnbZP76UxtsIALcbmg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 720496D249;
 Mon,  3 May 2021 04:56:26 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4194779929;
 Mon,  3 May 2021 04:56:26 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A0D9A113525D; Mon,  3 May 2021 06:56:24 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH 1/4] pc-bios/s390-ccw: Silence warning from Clang by
 marking panic() as noreturn
References: <20210502174836.838816-1-thuth@redhat.com>
 <20210502174836.838816-2-thuth@redhat.com>
 <04140977-282c-2579-3073-42b6bb4148ee@redhat.com>
Date: Mon, 03 May 2021 06:56:24 +0200
In-Reply-To: <04140977-282c-2579-3073-42b6bb4148ee@redhat.com> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Sun, 2 May 2021 20:57:02
 +0200")
Message-ID: <87v980fm9z.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>,
 Thomas Huth <thuth@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 qemu-s390x@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> On 5/2/21 7:48 PM, Thomas Huth wrote:
>> When compiling the s390-ccw bios with Clang, the compiler emits a warnin=
g:
>>=20
>>  pc-bios/s390-ccw/main.c:210:5: warning: variable 'found' is used uninit=
ialized
>>   whenever switch default is taken [-Wsometimes-uninitialized]
>>      default:
>>      ^~~~~~~
>>  pc-bios/s390-ccw/main.c:214:16: note: uninitialized use occurs here
>>      IPL_assert(found, "Boot device not found\n");
>>                 ^~~~~
>>=20
>> It's a false positive, it only happens because Clang is not smart enough
>> to see that the panic() function in the "default:" case can never return=
.
>>=20
>> Anyway, let's explicitely mark panic() with "noreturn" to shut up the
>> warning.
>
> Why not simply initialize the variable instead?

Because telling an optimizing compiler the truth is a good idea?


