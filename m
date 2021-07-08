Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F36C63C1AB5
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 22:51:38 +0200 (CEST)
Received: from localhost ([::1]:58760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1azi-0007Of-2z
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 16:51:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crobinso@redhat.com>)
 id 1m1axf-0005st-3e
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 16:49:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21457)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crobinso@redhat.com>)
 id 1m1axc-0001eM-KM
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 16:49:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625777368;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oCXI/iMfeuY38hud6279hhwEZEYp4NjhVKdO/58fb6Y=;
 b=g0ZKzBqlmKs7ZPbm2f9iRzkArx3R+RI/9NQIL114CEPyyM1OqzZJwG89rpb4H2AgQNnWe/
 RtgJQ47beJApqJNyfBQHEkV1LwSYm6sml5mEVOx/g5FLLgXrYwEXKgpzFnMAxGnlz06fkJ
 DYUnceTvcTPXhlf8mLPEtQz5agVncv8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-548-K5VVmn5rN_y6vu9bqA-1Dw-1; Thu, 08 Jul 2021 16:49:26 -0400
X-MC-Unique: K5VVmn5rN_y6vu9bqA-1Dw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F3D9FC73A0;
 Thu,  8 Jul 2021 20:49:25 +0000 (UTC)
Received: from [10.10.115.15] (ovpn-115-15.rdu2.redhat.com [10.10.115.15])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 468661036D03;
 Thu,  8 Jul 2021 20:49:25 +0000 (UTC)
Subject: Re: [PATCH] Move qemu.sasl to contrib/
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <d1a1e265dd846de6ca40406300d91cecfba69ef8.1625769570.git.crobinso@redhat.com>
 <YOdHyyEGzWzMWC0H@redhat.com>
 <CAFEAcA-NER3jDVoTnZN4T=gtzOTOmWvUMNOcPikjcj6Ay3NQJg@mail.gmail.com>
From: Cole Robinson <crobinso@redhat.com>
Message-ID: <c4b6187f-49df-b94a-cad9-2773392671f3@redhat.com>
Date: Thu, 8 Jul 2021 16:49:24 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-NER3jDVoTnZN4T=gtzOTOmWvUMNOcPikjcj6Ay3NQJg@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crobinso@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=crobinso@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/8/21 3:18 PM, Peter Maydell wrote:
> On Thu, 8 Jul 2021 at 20:14, Daniel P. Berrangé <berrange@redhat.com> wrote:
>>
>> On Thu, Jul 08, 2021 at 02:39:57PM -0400, Cole Robinson wrote:
>>> It's not installed in any way, so seems like contrib/ material
>>
>> Not really.
>>
>> Contrib is stuff that is included on an ad-hoc basis with no
>> commitment to support and no guarantee that it is working at
>> all.  Yes, there is some stuff in contrib/ that doesn't
>> belong there based on this definition, and should be moved
>> out.
> 
> More generally, I would like to see us get rid of contrib/
> entirely. We should either support stuff (and have it in
> sensible places in the source tree) or kick it out.
> 

qemu.sasl to ui/ dir then?

Do you think we should install qemu.sasl to /etc/sasl2/qemu.conf? Its
what Fedora/RHEL packaging does by hand for qemu. And what libvirt does
for its equivalent config file

Thanks,
Cole


