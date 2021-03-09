Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA426332E7C
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 19:47:09 +0100 (CET)
Received: from localhost ([::1]:42184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJhNs-0007uL-Pd
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 13:47:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lJfBm-000494-KM
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 11:26:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58883)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lJfBk-0003Ps-DP
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 11:26:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615307187;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BU5aYMfU3EAoxou6eFDVNYgsvd9ReFPCw74KK2kV8Hk=;
 b=bQTSvgzOencwXdSGuIEV5E4XeE5OUGczwgDQxmRkOY+yh1QSegJwXJGqmRM1Uf9v0tBeSy
 fAW6iC6uGz0nRUlBpVoyWbFTTQhyA21QUGDCVNrdEHte/dr2pWFZVlju2JdLZMnFvrFgSw
 VPGEb4+z/YK1plGLllsjNYmGr91zPAw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-391-qa7tFOfsMv2o8F322y90wg-1; Tue, 09 Mar 2021 11:26:25 -0500
X-MC-Unique: qa7tFOfsMv2o8F322y90wg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ED25F193410F;
 Tue,  9 Mar 2021 16:26:23 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-72.ams2.redhat.com [10.36.112.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8232460C13;
 Tue,  9 Mar 2021 16:26:19 +0000 (UTC)
Subject: Re: [PATCH] usb: Un-deprecate -usbdevice (except for -usbdevice audio
 which gets removed)
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>
References: <20210309142940.943831-1-thuth@redhat.com>
 <75f9eac2-9981-ee1f-b158-5d1136c993c6@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <cc8baef6-8e5c-aaee-f383-38e541a491a4@redhat.com>
Date: Tue, 9 Mar 2021 17:26:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <75f9eac2-9981-ee1f-b158-5d1136c993c6@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09/03/2021 15.45, Paolo Bonzini wrote:
> On 09/03/21 15:29, Thomas Huth wrote:
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
> It's missing an addition to docs/system/removed-features.rst for "-usbdevice 
> audio"; otherwise looks good.

Well, I guess hardly anybody ever used this since it was completely 
undocumented (try to google it - I just got one
result), but yeah, let's better document it that it's gone
now. I'll send a v2.

  Thomas


