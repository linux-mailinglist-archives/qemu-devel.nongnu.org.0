Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F24326BF039
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Mar 2023 18:53:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pdEGg-0007pv-O0; Fri, 17 Mar 2023 13:53:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pdEGe-0007p2-Kj
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 13:53:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pdEGd-0002bo-16
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 13:53:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679075606;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Tj1cPUbd+iICQt2Abh1o7i6vwvoaq18gJULaXSAee/k=;
 b=A6CFRvz15AAFumQUu3ObaApkPyeEKhXmpCDYDbGlSGwlR95wDzF/PE6fDzTR0qZTMFkIbi
 D+1vnGRMfHxpTvqhl9QDF6WbWuSuZdgOTw4/392l3lVXIeqgtXm/pqyyKC9qqcswuRTBrV
 DChKgDXbxBShdVj1lB7dhKZEyLzjbjA=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-517-29LDehBZNlyS2ssdArQRzQ-1; Fri, 17 Mar 2023 13:53:25 -0400
X-MC-Unique: 29LDehBZNlyS2ssdArQRzQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 y24-20020aa7ccd8000000b004be3955a42eso9094141edt.22
 for <qemu-devel@nongnu.org>; Fri, 17 Mar 2023 10:53:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679075604;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Tj1cPUbd+iICQt2Abh1o7i6vwvoaq18gJULaXSAee/k=;
 b=FIeZEx7+NbfpHFoX19ywlinG/F4t4T/so0rRGwTDuFveWxSUHfeXwgjtUBC3KyN7hk
 T3X6eOEPfZcMhXh5asO/fDihpJ6QnclbzWOWczJmfGaDjOnxS/qWoY6E5Ob/zQfL2ZmM
 4wRlznJrHxdm4OfXc3Ej2H8MiBusrUyb4iPXSZ0Rzw9JuTgElqO0lZBwZKUJx8myBRtv
 1r5gVDoYpoL6c5NGNnQSfspj7nKJa+BaZT0NPOIpOtBHYHTjG476vZIHzeDwpxqtD8oW
 BzZ2tA9LWgkE1MCfGqwPsN6CJPhX5MMwvFJD28DTrcYDJ40czXPKq5CIo9M25aCzTkHl
 ws0A==
X-Gm-Message-State: AO0yUKUdV31OkFaP5/fWihda7UKmzNWI1Yg7dWgfQX0jPHoNZxfdQeHb
 pjVGTwupVEydPtRYodSV3uAJUaypED1+s5cLl4PFtBgdA1pbH5SU5Za2OrqcqBEGcUoI9Di1Xp+
 txxgjNpkMeCi44BA=
X-Received: by 2002:a17:906:364f:b0:931:bc69:8f94 with SMTP id
 r15-20020a170906364f00b00931bc698f94mr172739ejb.45.1679075603923; 
 Fri, 17 Mar 2023 10:53:23 -0700 (PDT)
X-Google-Smtp-Source: AK7set9AJSXv/nKpc1wJ6lVksXep+IniYmdKm5PAkLvbvLuQ2Kd0imkR2Bema3vb87SxLRbDSp/U2Q==
X-Received: by 2002:a17:906:364f:b0:931:bc69:8f94 with SMTP id
 r15-20020a170906364f00b00931bc698f94mr172720ejb.45.1679075603662; 
 Fri, 17 Mar 2023 10:53:23 -0700 (PDT)
Received: from ?IPV6:2003:cf:d72b:b3c3:84ec:cc63:3ddf:7d93?
 (p200300cfd72bb3c384eccc633ddf7d93.dip0.t-ipconnect.de.
 [2003:cf:d72b:b3c3:84ec:cc63:3ddf:7d93])
 by smtp.gmail.com with ESMTPSA id
 ml23-20020a170906cc1700b0092ce8344078sm1229825ejb.33.2023.03.17.10.53.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Mar 2023 10:53:23 -0700 (PDT)
Message-ID: <f1b1f5b4-cb0b-2799-6e61-c645571fad2c@redhat.com>
Date: Fri, 17 Mar 2023 18:53:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [Virtio-fs] [RFC 1/2] vhost-user: Add interface for virtio-fs
 migration
Content-Language: en-US
To: Anton Kuchin <antonkuchin@yandex-team.ru>
Cc: Juan Quintela <quintela@redhat.com>, "Michael S . Tsirkin"
 <mst@redhat.com>, qemu-devel@nongnu.org, virtio-fs@redhat.com,
 Stefan Hajnoczi <stefanha@redhat.com>
References: <20230313174833.28790-1-hreitz@redhat.com>
 <20230313174833.28790-2-hreitz@redhat.com>
 <8dc9cba8-b6fa-f0e7-8ec8-3d4152ad7a5e@yandex-team.ru>
From: Hanna Czenczek <hreitz@redhat.com>
In-Reply-To: <8dc9cba8-b6fa-f0e7-8ec8-3d4152ad7a5e@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
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

On 17.03.23 18:39, Anton Kuchin wrote:
> On 13/03/2023 19:48, Hanna Czenczek wrote:
>> Add a virtio-fs-specific vhost-user interface to facilitate migrating
>> back-end-internal state.  We plan to migrate the internal state simply
>> as a binary blob after the streaming phase, so all we need is a way to
>> transfer such a blob from and to the back-end.  We do so by using a
>> dedicated area of shared memory through which the blob is transferred in
>> chunks.
>>
>> This patch adds the following vhost operations (and implements them for
>> vhost-user):
>>
>> - FS_SET_STATE_FD: The front-end passes a dedicated shared memory area
>>    to the back-end.  This area will be used to transfer state via the
>>    other two operations.
>>    (After the transfer FS_SET_STATE_FD detaches the shared memory area
>>    again.)
>>
>> - FS_GET_STATE: The front-end asks the back-end to place a chunk of
>>    internal state into the shared memory area.
>>
>> - FS_SET_STATE: The front-end puts a chunk of internal state into the
>>    shared memory area, and asks the back-end to fetch it.
>>
>> On the source side, the back-end is expected to serialize its internal
>> state either when FS_SET_STATE_FD is invoked, or when FS_GET_STATE is
>> invoked the first time.  On subsequent FS_GET_STATE calls, it memcpy()s
>> parts of that serialized state into the shared memory area.
>>
>> On the destination side, the back-end is expected to collect the state
>> blob over all FS_SET_STATE calls, and then deserialize and apply it once
>> FS_SET_STATE_FD detaches the shared memory area.
>>
>> Signed-off-by: Hanna Czenczek <hreitz@redhat.com>
>> ---
>>   include/hw/virtio/vhost-backend.h |   9 ++
>>   include/hw/virtio/vhost.h         |  68 +++++++++++++++
>>   hw/virtio/vhost-user.c            | 138 ++++++++++++++++++++++++++++++
>>   hw/virtio/vhost.c                 |  29 +++++++
>>   4 files changed, 244 insertions(+)
>>

[...]

>> +static ssize_t vhost_user_fs_get_state(struct vhost_dev *dev,
>> +                                       uint64_t state_offset,
>> +                                       size_t size)
>> +{
>
> Am I right to assume that vrings are supposed to be stopped to get/set 
> state?
> If I am shouldn't we check it before sending message or do you believe 
> it is
> better to return error from backend in these cases?

Good point!  Yes, the vrings should be stopped.  I don’t verify this 
currently, but it makes sense to do so both on the qemu and the 
virtiofsd side.

Hanna


