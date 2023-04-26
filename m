Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC3F56EFACA
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 21:14:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prkaQ-00074Q-I9; Wed, 26 Apr 2023 15:13:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1prkaM-0006wY-2k
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 15:13:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1prkaJ-0003eK-9X
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 15:13:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682536417;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZX9rt+RtJx90pIKjhRIRU4dxqNaprjxapQYCb0yT3lo=;
 b=hlSMHR5rjMGV4p5wZS0x46sua+pe/z1YwuSWhBBHqGn+uizi2h0aQSHNGPxAb2rCu25QqM
 jNIujThnl3g9RhoUkNoVVqa9h/MkvZPN0d7NitByvnN2uP4rA6hRo45W71LLeAxHH/cxtI
 GsF8A7rrvp8jjvS5ewviU6qaefE4ufg=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-589-GSPgRaiDNi2e76vEAdHv1Q-1; Wed, 26 Apr 2023 15:13:36 -0400
X-MC-Unique: GSPgRaiDNi2e76vEAdHv1Q-1
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-9576a365957so680239366b.2
 for <qemu-devel@nongnu.org>; Wed, 26 Apr 2023 12:13:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682536414; x=1685128414;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZX9rt+RtJx90pIKjhRIRU4dxqNaprjxapQYCb0yT3lo=;
 b=OBj2Py45Nf7SrqJNYPHJmXmFDzDDxL1SDLWLPSM/CVAJKOm/38s0jqogii1Md3Artf
 iCo6XLn1TwDBTdCwnidy31JUmQ63g+kvToa9WzCqZMfNLusPXmZh0CHY07TBnN7DS4gf
 HZYw/aUIIYlsjosCDDZ6kX74USPH5vofVSgtGWIVh6RlbqYrqbxttqkSFjT06AJNIrh1
 g4KeWE1h8h1il4pPKfxGlobxt+Zcbs7PAXOXjacIkJm//eUpK78WkILxwuINv45Gsp1I
 /UbwkphDxM9FpdRb4sT7MkNee3eXmFqY0dCi/ZOOqoK5uY6cEc5yDx+hmB43rODArWCk
 Oqpg==
X-Gm-Message-State: AAQBX9eiG4FCR6iDXmhhKUwvlh98GzOOiq1oiGJVduJ8E6c3ioiwfLY+
 CeWzYwDBRqoascqrHfDL5z+H2j1qX1ItQdgSB7mMqPwcTk8kp1AgkWm3NcfqaHv0UqEFhciiwJm
 3tzJGawXel13rpKNXCpRUsd7CcA==
X-Received: by 2002:a17:906:cc5b:b0:94e:ed5d:8777 with SMTP id
 mm27-20020a170906cc5b00b0094eed5d8777mr17314705ejb.25.1682536414388; 
 Wed, 26 Apr 2023 12:13:34 -0700 (PDT)
X-Google-Smtp-Source: AKy350a82Cb2LqaJBefV9l9YV4hUWc6IhxvRgLA8z+lzKzOhObSNw7f5LJ1ofs+GmzFN7e8Hce/emw==
X-Received: by 2002:a17:906:cc5b:b0:94e:ed5d:8777 with SMTP id
 mm27-20020a170906cc5b00b0094eed5d8777mr17314691ejb.25.1682536414032; 
 Wed, 26 Apr 2023 12:13:34 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 d23-20020a170906345700b0094ee99eeb01sm8627986ejb.150.2023.04.26.12.13.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Apr 2023 12:13:33 -0700 (PDT)
Message-ID: <a4e3cfba-bb35-5457-bbd6-8facff964ebf@redhat.com>
Date: Wed, 26 Apr 2023 21:13:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 1/2] Fix libvhost-user.c compilation.
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>,
 David 'Digit' Turner <digit@google.com>
Cc: qemu-devel@nongnu.org
References: <20230405125920.2951721-1-digit@google.com>
 <20230405125920.2951721-2-digit@google.com>
 <20230407035423-mutt-send-email-mst@kernel.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20230407035423-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.422, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 4/7/23 09:56, Michael S. Tsirkin wrote:
> On Wed, Apr 05, 2023 at 02:59:19PM +0200, David 'Digit' Turner wrote:
>> The source file uses VIRTIO_F_VERSION_1 which is
>> not defined by <linux/virtio_config.h> on Debian 10.
>>
>> The system-provided <linux/virtio_config.h> which
>> does not include the macro definition is included
>> through <linux/vhost.h>, so fix the issue by including
>> the standard-headers version before that.
>>
>> Signed-off-by: David 'Digit' Turner <digit@google.com>
> 
> I don't get it. ./linux-headers/linux/vhost.h does not seem
> to use <linux/virtio_config.h> for me.

The issue is that subprojects/libvhost-user/libvhost-user.c includes 
linux/vhost.h.  Probably should be changed to 
linux-headers/linux/vhost.h, but David's patch makes sense because 
libvhost-user.c does use a symbol from virtio_config.h.

Paolo

> $ git grep linux/virtio_config.h
> include/hw/virtio/virtio.h:#include "standard-headers/linux/virtio_config.h"
> include/standard-headers/linux/vhost_types.h:#include "standard-headers/linux/virtio_config.h"
> include/standard-headers/linux/virtio_9p.h:#include "standard-headers/linux/virtio_config.h"
> include/standard-headers/linux/virtio_balloon.h:#include "standard-headers/linux/virtio_config.h"
> include/standard-headers/linux/virtio_blk.h:#include "standard-headers/linux/virtio_config.h"
> include/standard-headers/linux/virtio_console.h:#include "standard-headers/linux/virtio_config.h"
> include/standard-headers/linux/virtio_crypto.h:#include "standard-headers/linux/virtio_config.h"
> include/standard-headers/linux/virtio_fs.h:#include "standard-headers/linux/virtio_config.h"
> include/standard-headers/linux/virtio_mem.h:#include "standard-headers/linux/virtio_config.h"
> include/standard-headers/linux/virtio_net.h:#include "standard-headers/linux/virtio_config.h"
> include/standard-headers/linux/virtio_pmem.h:#include "standard-headers/linux/virtio_config.h"
> include/standard-headers/linux/virtio_rng.h:#include "standard-headers/linux/virtio_config.h"
> include/standard-headers/linux/virtio_vsock.h:#include "standard-headers/linux/virtio_config.h"
> linux-headers/linux/virtio_config.h:#include "standard-headers/linux/virtio_config.h"
> scripts/update-linux-headers.sh:cat <<EOF >$output/linux-headers/linux/virtio_config.h
> scripts/update-linux-headers.sh:#include "standard-headers/linux/virtio_config.h"
> subprojects/libvduse/libvduse.c:#include "linux-headers/linux/virtio_config.h"
> tests/qtest/fuzz/virtio_net_fuzz.c:#include "standard-headers/linux/virtio_config.h"
> tests/qtest/libqos/virtio-gpio.c:#include "standard-headers/linux/virtio_config.h"
> tests/qtest/libqos/virtio-pci-modern.c:#include "standard-headers/linux/virtio_config.h"
> tests/qtest/libqos/virtio.c:#include "standard-headers/linux/virtio_config.h"
> 
> 
> 
> 
>> ---
>>   subprojects/libvhost-user/libvhost-user.c | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libvhost-user/libvhost-user.c
>> index 0200b78e8e..0a5768cb55 100644
>> --- a/subprojects/libvhost-user/libvhost-user.c
>> +++ b/subprojects/libvhost-user/libvhost-user.c
>> @@ -32,6 +32,12 @@
>>   #include <sys/mman.h>
>>   #include <endian.h>
>>   
>> +/* Necessary to provide VIRTIO_F_VERSION_1 on system
>> + * with older linux headers. Must appear before
>> + * <linux/vhost.h> below.
>> + */
>> +#include "standard-headers/linux/virtio_config.h"
>> +
>>   #if defined(__linux__)
>>   #include <sys/syscall.h>
>>   #include <fcntl.h>
>> -- 
>> 2.40.0.348.gf938b09366-goog
> 
> 


