Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E6BB648311
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 14:55:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3dpz-00042e-0g; Fri, 09 Dec 2022 08:54:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p3dpw-00042F-H4
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 08:54:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p3dpv-0006D2-4h
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 08:54:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670594085;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Eg9g1hTZdOk99I+T/o3bvkFGJZdl4ntGDx2/NLbNH74=;
 b=e2xo67DoDYdC0vuYnw3+lj96KPGnJ50eWOLd+BbmDm5mDvZDLxGC/3PwZjJXLHHBnliwQb
 YhGXAvZpLhDRL8hkPBrjIjrS0BxlOXqVB+Nxsk0wUDbDA61KtZc7SYGA+1ZIIcXEPzYqLM
 58p57kmmVIIw++RhZEu6Aze7JGri+B8=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-608-Rfsz7A4pMKaoqtAQlNTaPg-1; Fri, 09 Dec 2022 08:54:44 -0500
X-MC-Unique: Rfsz7A4pMKaoqtAQlNTaPg-1
Received: by mail-ej1-f71.google.com with SMTP id
 jg25-20020a170907971900b007c0e98ad898so3134787ejc.15
 for <qemu-devel@nongnu.org>; Fri, 09 Dec 2022 05:54:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Eg9g1hTZdOk99I+T/o3bvkFGJZdl4ntGDx2/NLbNH74=;
 b=BOpzRxHruM8OTkf4rNKV/L4eJjDCB5USOvhFcGRZLPF5LIZ7yx+igLVyEH3cdt/7HC
 I7kQIxjZ26Z7F0SIqvOQpVk199Cklgb3BINsl+whzS0zQZUtBloCwAw0LUlgibBgDVHY
 pduqQSqLBJJYu0F7lQfE/U0S+3LXedML68/P1g/Oy9ldqHTcJ70Kf0Mtlh4ROWi4GVuQ
 c4B3hzZDjcu2shwEVC7+T77al/GdSwHakiyzdN4UuvbC7EvbBzMSuNvG4f3ozeKLMBqq
 hUObLO2Q8X3GF85LPdoYoZasxAPP8RbNpqObEFUY2WbSH/W0uxGxr68T4PSaBr+iyvNS
 El6A==
X-Gm-Message-State: ANoB5pnmrDGNSi3QIUXP0+GcyuiwdQ56DAPWWGVOjtI4uv8hrxG+tb2X
 3Mi/ttqDQjg2iqN/sz2OnjIcYhW6G2WcDyfsg6HVUCSLB0FC6GYpo9b+04dXyOicocjSMwnmTpE
 tpv2ur3sFBnLYIdc=
X-Received: by 2002:a17:906:2a85:b0:7b2:7181:2489 with SMTP id
 l5-20020a1709062a8500b007b271812489mr6785768eje.13.1670594082878; 
 Fri, 09 Dec 2022 05:54:42 -0800 (PST)
X-Google-Smtp-Source: AA0mqf53nIs+QSeyYVeUDMVPvMNE4WYBJ7KCmYV5DsGlIQ/+N8w8CkgCFV1z3SSt/owUiTzgd500SQ==
X-Received: by 2002:a17:906:2a85:b0:7b2:7181:2489 with SMTP id
 l5-20020a1709062a8500b007b271812489mr6785754eje.13.1670594082659; 
 Fri, 09 Dec 2022 05:54:42 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:1c09:f536:3de6:228c?
 ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.googlemail.com with ESMTPSA id
 27-20020a170906309b00b007806c1474e1sm572084ejv.127.2022.12.09.05.54.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Dec 2022 05:54:42 -0800 (PST)
Message-ID: <be63447e-ba8e-6876-78a8-0cdb875b98c3@redhat.com>
Date: Fri, 9 Dec 2022 14:54:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 19/30] configure, meson: move --enable-debug-info to Meson
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
References: <20221209112409.184703-1-pbonzini@redhat.com>
 <20221209112409.184703-20-pbonzini@redhat.com>
 <bc114971-ee1f-b48b-cee7-ebcdae4d572c@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <bc114971-ee1f-b48b-cee7-ebcdae4d572c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.288, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 12/9/22 13:55, Philippe Mathieu-Daudé wrote:
>>
>> +  printf "%s\n" '  --disable-debug-info     Enable debug symbols and 
>> other information'
> 
> We should get '--enable-debug-info' here, ...
> 
>>     printf "%s\n" '  --disable-install-blobs  install provided 
>> firmware blobs'
> 
> ... and here. Do we have a bug in meson-buildoptions.py?

No, for boolean options it only includes the non-default setting.  This 
behavior was copied from the prior handcrafted help output:

   --with-devices-ARCH=NAME override default configs/devices
   --enable-debug           enable common debug build options
   --enable-sanitizers      enable default sanitizers
   --enable-tsan            enable thread sanitizer
   --disable-strip          disable stripping binaries
   --disable-werror         disable compilation abort on warning
   --disable-stack-protector disable compiler-provided stack protection
   --audio-drv-list=LIST    set audio drivers list

etc.

Paolo


