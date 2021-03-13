Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49BC4339E76
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 15:16:58 +0100 (CET)
Received: from localhost ([::1]:57182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lL54b-0003vm-AV
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 09:16:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lL4zX-0008LO-Sy
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 09:11:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27714)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lL4zT-0007lM-Jx
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 09:11:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615644698;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5Zl8gheff24T9yUzRpCsCbYLzZDWPIdX0zEVTnbaBcs=;
 b=ab0cGmcdHe/AjzTVjdx0QQ+dDAwtu+oZVNw8uYHbBWpRPdZDn9q8R0jyYlmIatGxe+sx7s
 0zzjG5JQmxN9s8uXQcgAeYa+/Xz25xQSnt855S1V/TJhbVSimdeuojWT/fS3YQ4geGjbxV
 jAmv8bibKBQVNmHdZPbGusoxvUfx2pE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-107-_vy1XJVCOZagB0KQAMR7Vg-1; Sat, 13 Mar 2021 09:11:36 -0500
X-MC-Unique: _vy1XJVCOZagB0KQAMR7Vg-1
Received: by mail-wm1-f69.google.com with SMTP id a65so2372137wmh.1
 for <qemu-devel@nongnu.org>; Sat, 13 Mar 2021 06:11:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5Zl8gheff24T9yUzRpCsCbYLzZDWPIdX0zEVTnbaBcs=;
 b=GzMC1KTYrrXFuoZIEDPvbEXjdkaT39AYNgAsRxK8c7jIVEdv/3lsbiNi7SAjy8JcwO
 kqB3aLBTmt+Q8Z/sGRjmFzsoROxQzbzn2J8UP77dB/LxGJym9C0TgErhTseimgJn2yt7
 vRj44SpOxPMJ047xckTnenMjc+yQdsCgqZwXdIg7h4Q6TC+KpXbEH46tO5yI1e5MrnV4
 2qemF0zTYP5GTZ56Q+Q7ODS3noEpe2mH55ul/3mUGGCwPJn/mfEARfXpgOvZttwS9/tN
 1N4Ozxwa/EhuX7ZZOVf5TwxeHIWojZPYOdh9I63u5Ma+CNps4HHgh+FoTh3eD6rBCQTH
 6x7w==
X-Gm-Message-State: AOAM531H8K9PGyOhfxND68yLIHOS7cagbVSglV5pNgm7zyL6Mdpzw5je
 y5i48pHtzUL87G3oA0liLGltJuOrKY4/jpfSo7KyZraC76iTh7CzQLF19gq0j6uCmIAIj2PdJ72
 j6ukf3QVEqGeppJU=
X-Received: by 2002:adf:ec83:: with SMTP id z3mr18933647wrn.59.1615644695186; 
 Sat, 13 Mar 2021 06:11:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx8XPZo7iI3XUAyt30ZGPVdUQp7bsZ6tv2kEjZe/VEkTuUjDXgzmGXnDRjmx7fYwX3DYng53w==
X-Received: by 2002:adf:ec83:: with SMTP id z3mr18933614wrn.59.1615644694880; 
 Sat, 13 Mar 2021 06:11:34 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id r11sm12822298wrm.26.2021.03.13.06.11.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 Mar 2021 06:11:34 -0800 (PST)
Subject: Re: [PATCH v3 27/30] hmp: QAPIfy object_add
To: Markus Armbruster <armbru@redhat.com>, Kevin Wolf <kwolf@redhat.com>
References: <20210308165440.386489-1-kwolf@redhat.com>
 <20210308165440.386489-28-kwolf@redhat.com>
 <87pn03rxmq.fsf@dusky.pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <cb9bee91-8d38-b232-44bd-b163d7081395@redhat.com>
Date: Sat, 13 Mar 2021 15:11:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <87pn03rxmq.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: lvivier@redhat.com, thuth@redhat.com, pkrempa@redhat.com,
 berrange@redhat.com, ehabkost@redhat.com, qemu-block@nongnu.org,
 libvir-list@redhat.com, jasowang@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, kraxel@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13/03/21 14:28, Markus Armbruster wrote:
> Kevin Wolf <kwolf@redhat.com> writes:
> 
>> This switches the HMP command object_add from a QemuOpts-based parser to
>> user_creatable_add_from_str() which uses a keyval parser and enforces
>> the QAPI schema.
>>
>> Apart from being a cleanup, this makes non-scalar properties and help
>> accessible. In order for help to be printed to the monitor instead of
>> stdout, the printf() calls in the help functions are changed to
>> qemu_printf().
>>
>> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
>> Acked-by: Peter Krempa <pkrempa@redhat.com>
>> Reviewed-by: Eric Blake <eblake@redhat.com>
>> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
>> ---
>>   monitor/hmp-cmds.c      | 17 ++---------------
>>   qom/object_interfaces.c | 11 ++++++-----
>>   hmp-commands.hx         |  2 +-
>>   3 files changed, 9 insertions(+), 21 deletions(-)
>>
>> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
>> index 3c88a4faef..652cf9ff21 100644
>> --- a/monitor/hmp-cmds.c
>> +++ b/monitor/hmp-cmds.c
>> @@ -1670,24 +1670,11 @@ void hmp_netdev_del(Monitor *mon, const QDict *qdict)
>>   
>>   void hmp_object_add(Monitor *mon, const QDict *qdict)
>>   {
>> +    const char *options = qdict_get_str(qdict, "object");
>>       Error *err = NULL;
>> -    QemuOpts *opts;
>> -    Object *obj = NULL;
>> -
>> -    opts = qemu_opts_from_qdict(qemu_find_opts("object"), qdict, &err);
>> -    if (err) {
>> -        goto end;
>> -    }
>>   
>> -    obj = user_creatable_add_opts(opts, &err);
>> -    qemu_opts_del(opts);
>> -
>> -end:
>> +    user_creatable_add_from_str(options, &err);
>>       hmp_handle_error(mon, err);
>> -
>> -    if (obj) {
>> -        object_unref(obj);
>> -    }
>>   }
> 
> Doesn't this break the list-valued properties (Memdev member host-nodes,
> NumaNodeOptions member cpus) exactly the same way that made us keep
> QemuOpts for qemu-system-FOO -object?

Yes, it does.  I guess it can just be documented, unlike for the command 
line?

Paolo


