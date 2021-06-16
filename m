Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 436163A9E6A
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 17:01:33 +0200 (CEST)
Received: from localhost ([::1]:40954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltX2p-0001ut-N7
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 11:01:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1ltX0r-00013g-LG
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 10:59:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45540)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1ltX0o-0007Wd-Bt
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 10:59:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623855565;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RK5nXyHRTKUljPfdIYcNgaIFX/9j1/5nSjP5RsukbDs=;
 b=D4yqoAYRWpkfPKvU0zIuviIKktNQcjUqEC6KwB8xRCj67ORt4ix/cMP4xDOBodyxjGzHb9
 JKsDcVaCgh2TrwPYtX9lsFFo5kp3+ZFpPWZmYiz3iKRpawRyX73w2ockvlq3Me2OCVoqab
 xquMQFfIcPCwdLu46i3ujmQFE5BX8/I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-588-9j_0_d1HO8Oqy3b5YeROGA-1; Wed, 16 Jun 2021 10:59:21 -0400
X-MC-Unique: 9j_0_d1HO8Oqy3b5YeROGA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9DFFF800685;
 Wed, 16 Jun 2021 14:59:20 +0000 (UTC)
Received: from localhost (ovpn-113-141.ams2.redhat.com [10.36.113.141])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C06065C1D0;
 Wed, 16 Jun 2021 14:59:16 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>, Alex =?utf-8?Q?Benn?=
 =?utf-8?Q?=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH 0/5] linux-user/s390x: Fix psw.mask handling in signals
In-Reply-To: <bdb3b491-600b-5f1f-52a4-20ca41d5f918@linaro.org>
Organization: Red Hat GmbH
References: <20210615030744.1252385-1-richard.henderson@linaro.org>
 <87sg1jiiku.fsf@linaro.org> <87lf7aw0un.fsf@redhat.com>
 <bdb3b491-600b-5f1f-52a4-20ca41d5f918@linaro.org>
User-Agent: Notmuch/0.32.1 (https://notmuchmail.org)
Date: Wed, 16 Jun 2021 16:59:15 +0200
Message-ID: <87czslx3cs.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: ruixin.bao@ibm.com, qemu-s390x@nongnu.org, david@redhat.com,
 jonathan.albrecht@linux.vnet.ibm.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 16 2021, Richard Henderson <richard.henderson@linaro.org> wrote=
:

> On 6/16/21 3:38 AM, Cornelia Huck wrote:
>> On Tue, Jun 15 2021, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote:
>>=20
>>> Richard Henderson <richard.henderson@linaro.org> writes:
>>>
>>>> The PSW_MASK_CC component of psw.mask was not handled properly
>>>> in the creation or restoration of signal frames.
>>>
>>> Still seeing issues running on s390x machine:
>>=20
>> (...)
>>=20
>>> However running on x86 backend everything seems to be fine.
>>=20
>> (...)
>>=20
>> So, in summary, this improves things, although there are some remaining
>> problems?
>>=20
>> Asking because I'm looking to queue this.
>
> Alex is seeing something that I believe is unrelated.
> And also, I have a patch set out for that as well.  :-)

Good to hear :)


