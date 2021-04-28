Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 039E536DEB2
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 19:58:04 +0200 (CEST)
Received: from localhost ([::1]:35790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lboRn-0006tq-Jg
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 13:58:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lboQX-0006TH-Ey
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 13:56:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44038)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lboQU-0003qd-Hg
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 13:56:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619632600;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KP06tgjnCEjoRCAI954AHuaOl7FEXPa7ukmhkBkNLWs=;
 b=Y4ytwI4G+UU5balN/TB9/RBIW+yok+el5zRBJHZSBWTaytFSfOPDkPWUboit0TPgJU1+tp
 YJJZDzSW3JKrN3ux7XjHepJBFtz5AEsw6O28V7jZag88kK4QCd3PVz5j7DGmkncLH25Rrr
 X6V0pJOrCvVUd/G26tkH+ZcBYaX4fsA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-209-6WGbWLB6MyqcmaBXNHz7Mg-1; Wed, 28 Apr 2021 13:56:38 -0400
X-MC-Unique: 6WGbWLB6MyqcmaBXNHz7Mg-1
Received: by mail-wr1-f70.google.com with SMTP id
 o14-20020a5d474e0000b029010298882dadso22669893wrs.2
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 10:56:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KP06tgjnCEjoRCAI954AHuaOl7FEXPa7ukmhkBkNLWs=;
 b=XtO5ekCQOHHmqjqVul9nndNj8fLdzk1bOTVfGvCBorwWUWKnW0c0la3GdLLo3WMjJ1
 5oNbIY8wYb5H99YxHqqnWcY/TNYECW/mPBPNIaEzT6LsWDpo9iexiW8F8lD+sLQq39Qt
 ba8x8DPxTsV54nQEwKRRUg+WUDK4/HH923Kf1eGq//hEH8NqLKCnJo/w1ePOIp2/hIr6
 ENeIqclcL0BQTmkg45w/4FQxKuBDere+p9/GYBL/9HHEv9iRbB3MshNtUd4JAM6BSH04
 SDVknNH2IDyap+qr/FS4Qtzb+Q4AlaMmrlUEIqA5wRT43xI4m8/RVdWYAqkJuJI39lJE
 1WbQ==
X-Gm-Message-State: AOAM531y8lkoxPaMWe990jXntUuKwi5Kh/+yII8oL3eOjUWAt7BzW7HX
 e0M2FTNAvecsCoo3GiijvX8t1tNJDlU/FK5pzgOpLDW1X02eJfXTZbBq7/gU2DtGK4TwOdHX2DP
 4aTLenEYDNPvoPbI=
X-Received: by 2002:a1c:1f8e:: with SMTP id f136mr32713530wmf.17.1619632597355; 
 Wed, 28 Apr 2021 10:56:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwYwjEa2we8Fnxj7u5WMdQgpFY8QAT0loTJC3yp+wicuACf08zf12ZO/zYiLMKa1nU37DCajg==
X-Received: by 2002:a1c:1f8e:: with SMTP id f136mr32713505wmf.17.1619632597172; 
 Wed, 28 Apr 2021 10:56:37 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id l25sm542865wmi.17.2021.04.28.10.56.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Apr 2021 10:56:36 -0700 (PDT)
Subject: Re: [PATCH 2/2] util/meson: Build iov/hexdump/buffer_is_zero with
 virtiofsd
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210428144813.417170-1-philmd@redhat.com>
 <20210428144813.417170-3-philmd@redhat.com>
 <e06f3f24-9ff2-bf3c-91c4-178af60c6c59@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <160e4c85-e8c0-304d-7151-1040f8d310ba@redhat.com>
Date: Wed, 28 Apr 2021 19:56:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <e06f3f24-9ff2-bf3c-91c4-178af60c6c59@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
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
Cc: Thomas Huth <thuth@redhat.com>, "Daniel P . Berrange" <berrange@redhat.com>,
 Connor Kuehl <ckuehl@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, virtio-fs@redhat.com,
 Stefan Hajnoczi <stefanha@redhat.com>, Mahmoud Mandour <ma.mandourr@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/28/21 6:38 PM, Richard Henderson wrote:
> On 4/28/21 7:48 AM, Philippe Mathieu-Daudé wrote:
>> diff --git a/util/meson.build b/util/meson.build
>> index 510765cde46..c2eda2d1374 100644
>> --- a/util/meson.build
>> +++ b/util/meson.build
>> @@ -59,12 +59,10 @@
>>     util_ss.add(files('aiocb.c', 'async.c', 'aio-wait.c'))
>>     util_ss.add(files('base64.c'))
>>     util_ss.add(files('buffer.c'))
>> -  util_ss.add(files('bufferiszero.c'))
>>    
>> util_ss.add(files('coroutine-@0@.c'.format(config_host['CONFIG_COROUTINE_BACKEND'])))
>>
>>     util_ss.add(files('hbitmap.c'))
>> -  util_ss.add(files('hexdump.c'))
>>     util_ss.add(files('iova-tree.c'))
>> -  util_ss.add(files('iov.c', 'qemu-sockets.c', 'uri.c'))
>> +  util_ss.add(files('qemu-sockets.c', 'uri.c'))
>>     util_ss.add(files('lockcnt.c'))
>>     util_ss.add(files('main-loop.c'))
>>     util_ss.add(files('nvdimm-utils.c'))
>> @@ -83,3 +81,9 @@
>>                                           if_false:
>> files('filemonitor-stub.c'))
>>     util_ss.add(when: 'CONFIG_LINUX', if_true: files('vfio-helpers.c'))
>>   endif
>> +
>> +if have_block or config_host.has_key('CONFIG_VHOST_USER_FS')
>> +  util_ss.add(files('hexdump.c'))
>> +  util_ss.add(files('bufferiszero.c'))
>> +  util_ss.add(files('iov.c'))
>> +endif
> 
> Isn't util a static library, built once?  Why are we avoiding building
> these unconditionally?  Surely symbols will be included in any linked
> binaries only as needed.

Yes, in this case built once for $ configure
--target-list=i386-linux-user --disable-tools --enable-virtiofsd.

Are you suggesting to remove the 'if have_block' check? This makes build
a the files pointlessly for user-mode-only builds...


