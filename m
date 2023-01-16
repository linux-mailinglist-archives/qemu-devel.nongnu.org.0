Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA7966B8F3
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 09:20:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHKiH-0000fV-8Q; Mon, 16 Jan 2023 03:19:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pHKiF-0000f9-2s
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 03:19:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pHKiD-0007Qk-C7
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 03:19:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673857164;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pNWYRBmtFD0BRsictS2mrmn843Agfa1+R1t45gw/cHc=;
 b=PCCmi6xdl1XjbuZQCYi3AO20uKuPmORlHbMlcKCxHOxilJs3MSBnIq4H8k7RQ5ZKHcTSMF
 BxDsspzQcMqaMvsc2j2/kTyO5zSS+Oi00KlLedy5rmtR2UdXu64jLHKOfnG7847dL/iHNN
 7vE73rsI/08PJz84TYCUqIQv1b5rIw4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-588-8ehD18QSNv-z8gnWfrJf2Q-1; Mon, 16 Jan 2023 03:19:23 -0500
X-MC-Unique: 8ehD18QSNv-z8gnWfrJf2Q-1
Received: by mail-wr1-f72.google.com with SMTP id
 i28-20020adfa51c000000b002ba26dfcd08so5095790wrb.18
 for <qemu-devel@nongnu.org>; Mon, 16 Jan 2023 00:19:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pNWYRBmtFD0BRsictS2mrmn843Agfa1+R1t45gw/cHc=;
 b=Yae6YXV276oFeto+TYPXYBUSnmD0sMqNycywP5RpcAsVY4xateDhuwFB2D7e5LljGQ
 MYXioFCBeEzloj4IAu8dHy1DhdbYY9kCqWPrudGVkcwiv5t8ne8ncja+nw4hsFI2wuU/
 /6sLgIHjLJ3q1OShqcTKxOBI+/2bI1X15ctXRWjUzOwzaSE6/6HaO7Reo3LeSzTxHknX
 18XAlDB3YF9Nc4/b7eR1ozXJ/e70pQfwbLFG8EWkS1L9gxd3cc1nBNa2r4Ap5Zlo87QR
 KUKLPyVFhJ9pB3DMoxyU36stdq9L4B1GJE6hIO0eKft0ufHEj+qu/0a42HNTbhm4IKAW
 0A3w==
X-Gm-Message-State: AFqh2koivqfg+uD50ETBrMAg/efITYIZIOh7TugRFlAH+cEA56o8KLmC
 bCJOre7mlaEkZMX6ARsalc23ds+vcXt7ShUWC2XkgY80AgkZ3z9PXunJNrlL87Q8mfhF4VYvBBR
 apAHmX/ddJ4csw9k=
X-Received: by 2002:adf:fb88:0:b0:269:65c0:79fd with SMTP id
 a8-20020adffb88000000b0026965c079fdmr54311935wrr.53.1673857162286; 
 Mon, 16 Jan 2023 00:19:22 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvhxXxDC5BX2NoLL393DI0fXYd6UMDLJxCKbITb9QFZVRg7gCxRa63ydYkKHaCoPKHZU7ZRXA==
X-Received: by 2002:adf:fb88:0:b0:269:65c0:79fd with SMTP id
 a8-20020adffb88000000b0026965c079fdmr54311921wrr.53.1673857162056; 
 Mon, 16 Jan 2023 00:19:22 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-177-109.web.vodafone.de.
 [109.43.177.109]) by smtp.gmail.com with ESMTPSA id
 e10-20020adfe38a000000b002bc7fcf08ddsm18284628wrm.103.2023.01.16.00.19.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jan 2023 00:19:21 -0800 (PST)
Message-ID: <0e4ad913-4ea3-c9a9-b58a-dc2174a2ef31@redhat.com>
Date: Mon, 16 Jan 2023 09:19:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] tests/vm: Update haiku test vm to R1/Beta3
Content-Language: en-US
To: Alexander von Gluck IV <kallisti5@unixzen.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org
References: <27512349-0007-11bd-07fb-5fd8c3dae879@linaro.org>
 <20220216154208.2985103-1-kallisti5@unixzen.com>
 <2d548e30-11eb-6f64-b082-25e5ff546309@redhat.com>
 <df446205-d3bc-5c1c-eb3c-bb475590e713@linaro.org>
 <ff214f477579f8e588ba42745c08e41d@unixzen.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <ff214f477579f8e588ba42745c08e41d@unixzen.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 14/01/2023 23.47, Alexander von Gluck IV wrote:
> January 13, 2023 7:30 AM, "Philippe Mathieu-Daudé" <philmd@linaro.org> wrote:
> 
>> On 13/1/23 12:05, Philippe Mathieu-Daudé wrote:
>>
>>> Per https://www.haiku-os.org/guides/daily-tasks/updating-system we
>>> can keep the box image in sync with its repo by using:
>>> # pkgman add https://eu.hpkg.haiku-os.org/haiku/r1beta3/$(getarch)/current
>>> I will try this:
>>> -- >8 --
>>> diff --git a/tests/vm/haiku.x86_64 b/tests/vm/haiku.x86_64
>>> index 29668bc272..9cbb46cfc1 100755
>>> --- a/tests/vm/haiku.x86_64
>>> +++ b/tests/vm/haiku.x86_64
>>> @@ -112,2 +112,4 @@ class HaikuVM(basevm.BaseVM):
>>> # Install packages
>>> +        self.ssh_root("pkgman add > https://eu.hpkg.haiku-os.org/haiku/r1beta3/x86_64/current")
>>> +        self.ssh_root("pkgman full-sync")
>>> self.ssh_root("pkgman install -y %s" % " > ".join(self.requirements))
>>> ---
>>
>> OS installed but is not usable...:
>>
>> runtime_loader: /boot/system/lib/libncurses.so.6.3.0: Could not resolve symbol '__ctype_b_loc'
>> resolve symbol "__ctype_b_loc" returned: -2147478780
>> runtime_loader: /boot/system/lib/libncurses.so.6.3.0: Troubles relocating: Symbol not found
>> Connection to 127.0.0.1 closed.
> 
> Ok. I updated the vagrant image to the latest release.  r1beta2 is getting a bit too old, and
> r1beta3 instances should really be upgraded to r1beta4.
> 
> https://app.vagrantup.com/haiku-os/boxes/r1beta4-x86_64
> 
> Let me know if this works for you.
Thank you very much, I gave it a try and it seems to work! I'll send a patch 
for QEMU's VM file to switch to the new image.

  Thomas


