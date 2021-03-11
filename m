Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A3D0336EAC
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 10:18:02 +0100 (CET)
Received: from localhost ([::1]:54344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKHSD-0004TW-2s
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 04:18:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lKHOl-0002D0-KH
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 04:14:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lKHOi-0005t3-Fy
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 04:14:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615454063;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h9jVNMXhWgcV0pRpQoYDU/9/R2t5WMafCotaQp2KZm4=;
 b=XEENFfMIzFvxyzpZytHCon5i/v1DWyAP5V7fpaSqSIXJCD/ENR0CZtD/efezd33wx1EzV5
 xESAVBVabIDgic5kNcLs6Pnh8CMLpcrwWfT4tNO2dgt03V0f1TLqh1bkxQ3fIph2SMQot3
 jiXgdXr2WpoeRE5WNM9+ZygZd4h5svI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-371-5ADIeP4COL24Cj2SB2Vd_g-1; Thu, 11 Mar 2021 04:14:21 -0500
X-MC-Unique: 5ADIeP4COL24Cj2SB2Vd_g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7ABDB100C660;
 Thu, 11 Mar 2021 09:14:20 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-33.ams2.redhat.com [10.36.112.33])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E015810429F0;
 Thu, 11 Mar 2021 09:14:15 +0000 (UTC)
To: Markus Armbruster <armbru@redhat.com>
References: <20210310173323.1422754-1-thuth@redhat.com>
 <20210310173323.1422754-4-thuth@redhat.com>
 <87y2euqe4j.fsf@dusky.pond.sub.org>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 3/4] usb: Un-deprecate -usbdevice (except for -usbdevice
 audio which gets removed)
Message-ID: <1f5ff060-5ec6-22bb-8b23-a558d6520894@redhat.com>
Date: Thu, 11 Mar 2021 10:14:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <87y2euqe4j.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2eBerrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/03/2021 09.38, Markus Armbruster wrote:
> Thomas Huth <thuth@redhat.com> writes:
> 
>> When trying to remove the -usbdevice option, there were complaints that
>> "-usbdevice braille" is still a very useful shortcut for some people.
>> Thus we never remove this option. Since it's not such a big burden to
>> keep it around, and it's also convenient in the sense that you don't
>> have to worry to enable a host controller explicitly with this option,
>> we should remove it from he deprecation list again.
>>
>> However, there is one exception: "-usbdevice audio" should go away, since
>> audio devices without "audiodev=..." parameter are also on the deprecation
>> list and you cannot use "-usbdevice audio" with "audiodev".
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
> 
> I accept the complaint that the replacement of "-usbdevice braille" is
> less convenient.  This is not the case for the -usbdevice tablet, mouse,
> keyboard, ccid, and wacom-tablet.

Well, if we keep "-usbdevice braille" (which we should unless somebody comes 
up with another easy to use replacement for blind people), then it also does 
not hurt too much to keep tablet, mouse, keyboard and wacom-tablet, since 
the code for these is rather simple and thus not a great burden to maintain. 
And these are mentioned in a lot of documents, scripts and howtos out there, 
so users are used to them.

However, searching for "-usbdevice ccid", I hardly get any results, so I 
guess we could also simply remove that one.

>  It is arguably the case for disk,
> serial, net, and host, yet we removed those anyway, to make the regular
> and more expressive interface the only one.

The problem with those devices was that they used their own parameter 
parsing code, including bugs we had to take care about, so there was a 
higher level of maintenance involved there. I think that alone justified 
their removal.

> However, "braille is special" is only an argument for *braille* sugar.
> It doesn't extend to -usbdevice tablet, mouse etc.  I am against
> undeprecating these.
> 
> If we decide we want braille sugar, we then need to decide whether it
> should be -usbdevice braille or something else, like -braille.

I've raised that question three years ago already. Nobody stepped forward to 
implement -braille, so I think we should keep -usbdevice braille for now.

> If we can't make up our minds, keep it deprecated until we do.

We didn't make up our minds for three years now. In my eyes that's a 
decision for keeping -usbdevice braille around.

  Thomas


