Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD24324A36
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 06:36:44 +0100 (CET)
Received: from localhost ([::1]:35858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lF9KN-000714-Bq
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 00:36:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lF9J1-0006QH-QO
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 00:35:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40210)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lF9Iz-0007Zq-2F
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 00:35:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614231315;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ge61v39YcjEZUQI+Puvuuax6P36ikiDABbWeix/uol8=;
 b=EOsAMMPg31LdsjfgjEQlElXvecQXfvLpeuY7kkrcgQoWIB6SrXrggZEgj6Eudk+u3D5ujT
 oCK7PwiuLeQgPUvwr+ADN3l5Udlf14y9/hrlul7CalG3Q9BVF1W1UmdOwkTUR2Dqmn1HnP
 hIWsztnULfCYWYHinPcTnJhRMMNN0NU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-355-ipnPV-C1OzKU5MZw5imTpg-1; Thu, 25 Feb 2021 00:35:11 -0500
X-MC-Unique: ipnPV-C1OzKU5MZw5imTpg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B2E3F1009634;
 Thu, 25 Feb 2021 05:35:08 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-58.ams2.redhat.com [10.36.112.58])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0030B62A25;
 Thu, 25 Feb 2021 05:34:46 +0000 (UTC)
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210224131142.1952027-1-berrange@redhat.com>
 <20210224131142.1952027-5-berrange@redhat.com>
 <d746eab0-5870-d709-50c2-74ed3b3b3264@redhat.com>
 <YDZecSZr3HBvlHwY@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 04/14] softmmu: remove '-usbdevice' command line option
Message-ID: <d1688f5a-7f9b-5e3d-d855-43118d298ab7@redhat.com>
Date: Thu, 25 Feb 2021 06:34:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YDZecSZr3HBvlHwY@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, "Michael S. Tsirkin" <mst@redhat.com>,
 libvir-list@redhat.com, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 qemu-block@nongnu.org, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Greg Kurz <groug@kaod.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Max Reitz <mreitz@redhat.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24/02/2021 15.10, Daniel P. Berrangé wrote:
> On Wed, Feb 24, 2021 at 02:58:19PM +0100, Thomas Huth wrote:
>> On 24/02/2021 14.11, Daniel P. Berrangé wrote:
>>> This was replaced by the '-device usb-DEV' option.
>>>
>>> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
>>> ---
>>>    docs/system/deprecated.rst       |  9 -------
>>>    docs/system/removed-features.rst |  9 +++++++
>>>    softmmu/vl.c                     | 42 --------------------------------
>>>    3 files changed, 9 insertions(+), 51 deletions(-)
>>
>> Last time I tried to remove -usbdevice, there was some concerns that
>> -usbdevice braille might still be useful for some people, see the thread
>> that started here:
>>
>>   https://lists.nongnu.org/archive/html/qemu-devel/2018-01/msg00651.html
>>
>> (and Gerd's summary here:
>> https://lists.nongnu.org/archive/html/qemu-devel/2018-01/msg01520.html )
> 
> Urgh, so the current deprecation docs are a bit misleading by saying
> -usbdevice is directly mapped to -device.
> 
>> So we might need a new "sugared" option like "-braille" instead before we
>> can fully remove -usbdevice? ... or we just keep -usbdevice as a bittersweet
>> remainder?
> 
> I'm not going to implement new CLI options, and if that's needed, we
> ought to re-start the clock on the deprecation at that point. So this
> points towards just removing the deprecation warning that exists
> today. Or alternatively drop support for -usbdevice, except for the
> braille type.

After that discussion in 2018, I've removed all of the "annoying" -usbdevice 
parameters already (see commit 99761176eeaf8525). I then more or less waited 
for someone to step up and implement "-braille", but it never happened and I 
forgot about the removal of the remaining -usbdevice parameters. Thinking 
about this again, replacing "-usbdevice braille" with a "-braille usb" does 
indeed not buy us much, so I think the best is maybe to keep the simple 
devices and braille around, update our documentation and remove the 
deprecation warning instead.

  Thomas


