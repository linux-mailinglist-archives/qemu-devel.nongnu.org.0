Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C3D450236
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 11:17:25 +0100 (CET)
Received: from localhost ([::1]:45132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmZ3D-0002X3-Vp
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 05:17:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mmZ2K-0001gL-4u
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 05:16:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49769)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mmZ2H-00083k-3E
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 05:16:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636971383;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s2Df9YwZzqBBlev2jaRrZN6GE1RvRQbaBq7e44F9wvo=;
 b=CrZ7W17BOEKGq3c69PEcFha47qp3D5/PIQ4jGKVOoOSAavgSESQ41Cdbwq4b+N0dOMCNx8
 bunCDDIZkdhPdwcVRXyFLb/k6QHo+qUPnD8+c5BB9Q2xMHngjYs/0dJkFPL/AfwoIGIHNr
 PUR2ocojKk8z8j0+0SjA1mtCteM/E40=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-269-JI9YIIMAOE686GBA1MZ38A-1; Mon, 15 Nov 2021 05:16:21 -0500
X-MC-Unique: JI9YIIMAOE686GBA1MZ38A-1
Received: by mail-wr1-f72.google.com with SMTP id
 y4-20020adfd084000000b00186b16950f3so3358796wrh.14
 for <qemu-devel@nongnu.org>; Mon, 15 Nov 2021 02:16:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=s2Df9YwZzqBBlev2jaRrZN6GE1RvRQbaBq7e44F9wvo=;
 b=EVHt6RyYa0AfD+iXUqBIOIlHONXfA8vNw/v7L6aFQhi1dkkKZEn69+qqfStX9n1tIQ
 nI/rluf+W/JlQAwGpNCrIhCzPvUWkPMT4pOzT7Z9/otsr/RvxAJSsR+f50Z2eCPUgZNl
 Fkiop7mlv+RjP+ucN5cuix/gjGxM6uoAE2RgqXYoVzWtyyF24WFsKbMSGFySk7DagB8p
 UQM2UdQiQCiR/ci9F4W7KKMBQ7Pb3Nzd2MRh2a8QnsOr2XznNrGUtGb4zJR/DjWUS4Wy
 IadVhaAFXTxcVtMFRstv8/UCAZb2hpZlVCcmkdX3gaf6XfPBirQRPm7xZR5+SsOpUfyz
 OSIA==
X-Gm-Message-State: AOAM532OpvWtx4g5g2yGH3poHmLwyS4O0uJygebW6mYJWPti7KkT28Y+
 knlCjZuqeQdY7gC3wFS14U5oJmYxRA8u2fgxwhvZpVd6zEpt4g8fv1O8wFyEhx+m3ME/db5pjvY
 CeH9zJwMF5q2XXaI=
X-Received: by 2002:a5d:6e82:: with SMTP id k2mr46304299wrz.147.1636971380780; 
 Mon, 15 Nov 2021 02:16:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxizHx8xGpunp0F+lJ6/3DM9soP6nL5vhVBxFcmAi0EvNNL/5AJ1M9v90LE+zGr/3vNMCEvFA==
X-Received: by 2002:a5d:6e82:: with SMTP id k2mr46304254wrz.147.1636971380551; 
 Mon, 15 Nov 2021 02:16:20 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id 4sm17944354wrz.90.2021.11.15.02.16.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Nov 2021 02:16:20 -0800 (PST)
Message-ID: <2d5bb4d9-b34c-65dc-f0de-0f1c7af28c83@redhat.com>
Date: Mon, 15 Nov 2021 11:16:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH-for-6.2 v3 3/6] tests/unit/test-smp-parse: Explicit
 MachineClass name
To: "wangyanan (Y)" <wangyanan55@huawei.com>,
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
References: <20211111100351.2153662-1-philmd@redhat.com>
 <20211111100351.2153662-4-philmd@redhat.com>
 <fee6d60b-9070-7fbb-3275-cdd4aa7ee144@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <fee6d60b-9070-7fbb-3275-cdd4aa7ee144@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -57
X-Spam_score: -5.8
X-Spam_bar: -----
X-Spam_report: (-5.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.278, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Andrew Jones <drjones@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/12/21 03:28, wangyanan (Y) wrote:
> On 2021/11/11 18:03, Philippe Mathieu-Daudé wrote:
>> If the MachineClass::name pointer is not explicitly set, it is NULL.
>> Per the C standard, passing a NULL pointer to printf "%s" format is
>> undefined. Some implementations display it as 'NULL', other as 'null'.
>> Since we are comparing the formatted output, we need a stable value.
>> The easiest is to explicit a machine name string.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>   tests/unit/test-smp-parse.c | 8 ++++++--
>>   1 file changed, 6 insertions(+), 2 deletions(-)

>>   @@ -481,6 +483,8 @@ static void machine_class_init(ObjectClass *oc,
>> void *data)
>>         mc->smp_props.prefer_sockets = true;
>>       mc->smp_props.dies_supported = false;
>> +
>> +    mc->name = g_strdup(SMP_MACHINE_NAME);
> I'm not very familiar with Qom code, so it may be a stupid question.
> The mc->name will be automatically freed elsewhere when all the
> testing is finished and exits, right? :)

I'll defer that to Eduardo / Markus, but meanwhile my understanding
is QOM classes are loaded once (the first time an instance requires
it) and never unloaded. Only instances can be unloaded, their resources
being released.
The machine life time is tied to the process one, when we are done
using a machine, it is simpler to exit() the process -- the kernel
releases the resources for us -- and create another process for a new
machine, rather than re-creating a different machine within the same
process.
If there is a need for it (like releasing class resources), it is doable
but it seems we never worried about it.


