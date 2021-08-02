Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C85D13DCF17
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 06:04:17 +0200 (CEST)
Received: from localhost ([::1]:49396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAPBY-0004wO-Dr
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 00:04:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mAPAY-0004Gk-U3
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 00:03:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mAPAX-00072g-DB
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 00:03:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627876992;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QaZUZZWA1Agx+oSEtnA9WnZ98LelvBXxh46cRHe4GRU=;
 b=IEjn3LNWkgSL7urgkWeQxBu8IYKRmkgflx7frY/wA1maTSd+diL9vJZxoOHRosl+fqxS7J
 KAFy5wTXhfMQbA/jvpa7jThT5VOnHFQnaUFciZdflfiEo+M4Qd0Vbp9eD4m++2h+HAyxZa
 rFz3meO12eYRMOmxBSt5Pmk0EdYXK5E=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-368-5JCFcSLEMyORwJ91qNQ37A-1; Mon, 02 Aug 2021 00:03:10 -0400
X-MC-Unique: 5JCFcSLEMyORwJ91qNQ37A-1
Received: by mail-pj1-f70.google.com with SMTP id
 r23-20020a17090aa097b0290176fc47a8b7so260909pjp.6
 for <qemu-devel@nongnu.org>; Sun, 01 Aug 2021 21:03:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=QaZUZZWA1Agx+oSEtnA9WnZ98LelvBXxh46cRHe4GRU=;
 b=L+ydD9/NrpiAci2gWMjH9HN2RnP6LvHTtgUrpyaZkcLedEjxkhnmxbRoAzwhug715/
 0m5PwAMvtDYXcZjDSEDXJeAhfsq1lYTn6iuiZtS36HhfTqmgZ/kvGt/VsXzTpRpiPOsQ
 OU5YJaNF7N0Bx/9m3nm6OC0dSI85KUBdsm2WpzeD7uAYl1UdG9IxHBUD7zqKWtHarGFh
 kKBmjVH2fxo8rFWpwcypq9O0ztq4gEiUvSNN8fVjieBIbVt3B1BCvfxIEcLloHP4Gudh
 drMscyF9+KlFRGZGOvzAPazQ7vjwpl83vdFN7hEah5RUcYsy4rDq2KUub+YksDfCW8wt
 7Zjg==
X-Gm-Message-State: AOAM530SA+Lg4MrUBwK1EOMkZLrMfn07ihTrlSzBzR+gX748bYX66YV0
 l1JkYM3kAQoeUa7oPbJ2/4bJFVoP1wdl+e5y9DuzEc7X136uoa9s69joaBcKDbHaQujhwFTNjC/
 Vy5UcxZghYyB75L0=
X-Received: by 2002:a17:90a:930e:: with SMTP id
 p14mr15160069pjo.132.1627876989986; 
 Sun, 01 Aug 2021 21:03:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJydjZYMmLJRTptn8FOSXZ+ELT5lifmGIkv/8EPO0XIxs5PHpl9aGoOZUQIgNdY/8SA6e24nQw==
X-Received: by 2002:a17:90a:930e:: with SMTP id
 p14mr15160046pjo.132.1627876989735; 
 Sun, 01 Aug 2021 21:03:09 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id x26sm9732183pfm.77.2021.08.01.21.03.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 01 Aug 2021 21:03:09 -0700 (PDT)
Subject: Re: [PATCH v2] hw/net/can: sja1000 fix buff2frame_bas and
 buff2frame_pel when dlc is out of std CAN 8 bytes
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Pavel Pisa <pisa@cmp.felk.cvut.cz>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Qiang Ning <ningqiang1@huawei.com>
References: <20210729123327.14650-1-pisa@cmp.felk.cvut.cz>
 <5e493064-30d8-17b5-7760-bdf143ddf9a7@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <7bf75813-8155-d38e-27c1-d040313ba5c0@redhat.com>
Date: Mon, 2 Aug 2021 12:03:00 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <5e493064-30d8-17b5-7760-bdf143ddf9a7@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.08, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: qemu-stable@nongnu.org, Vikram Garhwal <fnu.vikram@xilinx.com>,
 Jan Charvat <charvj10@fel.cvut.cz>, Jin-Yang <jinyang.sia@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2021/7/29 下午8:48, Philippe Mathieu-Daudé 写道:
> "hw/net/can: sja1000 fix buff2frame* when dlc is out of std CAN 8 bytes"
>
> On 7/29/21 2:33 PM, Pavel Pisa wrote:
>> Problem reported by openEuler fuzz-sig group.
>>
>> The buff2frame_bas function (hw\net\can\can_sja1000.c)
>> infoleak(qemu5.x~qemu6.x) or stack-overflow(qemu 4.x).
> Cc: qemu-stable@nongnu.org
>
>> Reported-by: Qiang Ning <ningqiang1@huawei.com>
>> Signed-off-by: Pavel Pisa <pisa@cmp.felk.cvut.cz>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


Applied.

Thanks


>
>> ---
>>   hw/net/can/can_sja1000.c | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/hw/net/can/can_sja1000.c b/hw/net/can/can_sja1000.c
>> index 42d2f99dfb..34eea684ce 100644
>> --- a/hw/net/can/can_sja1000.c
>> +++ b/hw/net/can/can_sja1000.c
>> @@ -275,6 +275,10 @@ static void buff2frame_pel(const uint8_t *buff, qemu_can_frame *frame)
>>       }
>>       frame->can_dlc = buff[0] & 0x0f;
>>   
>> +    if (frame->can_dlc > 8) {
>> +        frame->can_dlc = 8;
>> +    }
>> +
>>       if (buff[0] & 0x80) { /* Extended */
>>           frame->can_id |= QEMU_CAN_EFF_FLAG;
>>           frame->can_id |= buff[1] << 21; /* ID.28~ID.21 */
>> @@ -311,6 +315,10 @@ static void buff2frame_bas(const uint8_t *buff, qemu_can_frame *frame)
>>       }
>>       frame->can_dlc = buff[1] & 0x0f;
>>   
>> +    if (frame->can_dlc > 8) {
>> +        frame->can_dlc = 8;
>> +    }
>> +
>>       for (i = 0; i < frame->can_dlc; i++) {
>>           frame->data[i] = buff[2 + i];
>>       }
>>


