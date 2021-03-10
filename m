Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC228333A15
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 11:33:32 +0100 (CET)
Received: from localhost ([::1]:42184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJw9j-0006iX-PS
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 05:33:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lJvk3-0005qs-US
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 05:06:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lJvjx-0003xU-Bl
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 05:06:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615370810;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Qb/q/LHcTO4A47a7gdD/MjbQKIY0+Vj6l6LCAHvE6lM=;
 b=Qrh2B7pBLkoXStCS/qnchYBVExx9AlwwgwUWKlTHpftAiLyjQgmpSmk3/SqlFj8F+Oj1cB
 ELELfWRqio/3qc3O0PlDjJrOZXdERrtBBKcoOw4sZ1PV9hsM2NFipEqUS4t+W0o8wDZeD2
 tShv3A1tyRMcPytNzK9yd2wTgNwPE18=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-126-lhiBF_SBPb-gYUcL2HuSdw-1; Wed, 10 Mar 2021 05:06:49 -0500
X-MC-Unique: lhiBF_SBPb-gYUcL2HuSdw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 11206804330;
 Wed, 10 Mar 2021 10:06:48 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-19.ams2.redhat.com [10.36.112.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 64E1B690F9;
 Wed, 10 Mar 2021 10:06:43 +0000 (UTC)
Subject: Re: [PATCH v2] usb: Un-deprecate -usbdevice (except for -usbdevice
 audio which gets removed)
To: Gerd Hoffmann <kraxel@redhat.com>
References: <20210309165035.967853-1-thuth@redhat.com>
 <20210310100256.ythe5a7smjwrozrf@sirius.home.kraxel.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <ba6eb5ad-a4a7-0d2d-9f63-d3753667d071@redhat.com>
Date: Wed, 10 Mar 2021 11:06:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210310100256.ythe5a7smjwrozrf@sirius.home.kraxel.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Samuel Thibault <samuel.thibault@ens-lyon.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/03/2021 11.02, Gerd Hoffmann wrote:
> On Tue, Mar 09, 2021 at 05:50:35PM +0100, Thomas Huth wrote:
>> When trying to remove the -usbdevice option, there were complaints that
>> "-usbdevice braille" is still a very useful shortcut for some people.
>> Thus we never remove this option. Since it's not such a big burden to
>> keep it around, and it's also convenient in the sense that you don't
>> have to worry to enable a host controller explicitly with this option,
>> we should remove it from he deprecation list again, and rather properly
>> document the possible device for this option instead.
>>
>> However, there is one exception: "-usbdevice audio" should go away, since
>> audio devices without "audiodev=..." parameter are also on the deprecation
>> list and you cannot use "-usbdevice audio" with "audiodev".
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
> 
> Want me pick this up or send a pull yourself?

Yes, please take it through your USB branch (with or without the 
modification that Paolo suggested, I don't mind).

  Thanks,
   Thomas


