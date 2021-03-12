Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16CBE3388E3
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 10:48:13 +0100 (CET)
Received: from localhost ([::1]:51382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKeOy-0002Wg-3B
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 04:48:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lKeMZ-0001Dl-Mz
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 04:45:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55063)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lKeMV-0001M7-Jk
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 04:45:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615542336;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ljsJTrRA9YqvbFj1M9EZoFtWRBNNMlt3X2gqO6m+W00=;
 b=YQ9pMXOORrVDtWncemjLjgQIoZWyVClvqAHXlD2eTopgj328CiSTSrM1Czn5dJma6Br2OW
 bMBaBWWakqXdD1Tmi7SgHffw/wbLsXvd7P7EsXrDuczzoK3LmfcIy5+MhdL7/iXt/8/lHA
 nBa8ufr3sm8Jtp2u56hKq6dqvL9c4FA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-297-KMRucLhwMcmCLY2y5IL_SQ-1; Fri, 12 Mar 2021 04:45:35 -0500
X-MC-Unique: KMRucLhwMcmCLY2y5IL_SQ-1
Received: by mail-wr1-f69.google.com with SMTP id x9so10812950wro.9
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 01:45:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ljsJTrRA9YqvbFj1M9EZoFtWRBNNMlt3X2gqO6m+W00=;
 b=DbGrRQRoQkbO5Zq2KBfVMtEJ8gjUaUnpDG6iZf87q0xlVtbBuML/QMVd6eTjS222t7
 Qja3yn7G++lPeC+nS7b1joriEiY1Rm+jnqv1ZZnP/sQfgjb0RUwAaFMNwWY3eA36eB4m
 UsQSYBdVKxAUQh/BToa2vrKYg5ZB7K56X8zdA/MYA+39OTzEveBpZxr1BhBzXeE5U7cX
 r6dRMPlBMXkgmCPe/WZb1pPBiM2rarYdQFcGlCwguKV6ML6n/ypc2OgAbIwHrZE7PD/N
 p0jJSJB3i650Th9cL+vCw26hppUDGCQcp01AHmMlI/ADek/v4aozsYHqEb9wR3C5YBEU
 ImJw==
X-Gm-Message-State: AOAM533XMsy1rkqK3oC8lpktWgqFH6R6OfaLYqBRi+M6dOzQQID8NR3I
 HCo6IRqsTd2qWqP6g4HgZHEA5jOERLdQL/233+9wDfa7bCj5xQaN4Q0FhXN+NCZ6EEnT3Hy+8pQ
 DQBwpnyYMGZPkTyy0Ye9Oj3Can2FMdHVHNT0nvh7Ggv2HmvIduFbqd52BikniicJM
X-Received: by 2002:adf:a406:: with SMTP id d6mr13215730wra.141.1615542333834; 
 Fri, 12 Mar 2021 01:45:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyyK5PII/dJbWG6Tc1MFt+2Kee8QrjxA/bLambyb3UXh7RW6Mt7eQCzO9A4+nSVxmuNBKhuQw==
X-Received: by 2002:adf:a406:: with SMTP id d6mr13215712wra.141.1615542333635; 
 Fri, 12 Mar 2021 01:45:33 -0800 (PST)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id a5sm7073858wrs.35.2021.03.12.01.45.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Mar 2021 01:45:33 -0800 (PST)
Subject: Re: all class init functions for all types in QEMU are called in
 select_machine(). Expected?
To: Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>
References: <bdc8dbaf-8d63-833a-3e57-7e823a321486@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <a81c0a8d-af3c-4b40-bcb4-9b120b5eee93@redhat.com>
Date: Fri, 12 Mar 2021 10:45:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <bdc8dbaf-8d63-833a-3e57-7e823a321486@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/12/21 10:31 AM, Claudio Fontana wrote:
> Hello Paolo and all,
> 
> while debugging a class init ordering issue, I noticed that
> 
> _all_ class init functions for all types registered in the QEMU QOM are called in select_machine().
> Expected?
> 
> In particular it happens here:
> 
> static MachineClass *select_machine(void)
> {
>     GSList *machines = object_class_get_list(TYPE_MACHINE, false);
> 
> 
> object_class_get_list() ->
>   object_class_foreach() ->
>     g_hash_table_foreach() ->
>       object_class_foreach_tramp ->
>         type_initialize(type);
> 
> 
> Is this really desired? It looks suspect to me.
> 
> (gdb) bt
> #0  0x0000555555db613f in arm_v7m_class_init (oc=0x555556dca320, data=0x555556a926e0 <arm_tcg_cpus+288>)
>     at ../target/arm/tcg/tcg-cpu-models.c:849
> #1  0x0000555555f1deba in type_initialize (ti=0x555556d5b2f0) at ../qom/object.c:364
> #2  0x0000555555f1f62a in object_class_foreach_tramp (key=0x555556d5b470, value=0x555556d5b2f0, opaque=0x7fffffffda20)
>     at ../qom/object.c:1069
> #3  0x00007ffff6562000 in g_hash_table_foreach () at /usr/lib64/libglib-2.0.so.0
> #4  0x0000555555f1f709 in object_class_foreach (fn=
>     0x555555f1f866 <object_class_get_list_tramp>, implements_type=0x555556381b09 "machine", include_abstract=false, opaque=0x7fffffffda70)
>     at ../qom/object.c:1091
> #5  0x0000555555f1f8e4 in object_class_get_list (implements_type=0x555556381b09 "machine", include_abstract=false) at ../qom/object.c:1148
> #6  0x0000555555debe94 in select_machine () at ../softmmu/vl.c:1607
> 
> 
> If not here, where should be the right place, for example, for CPU class inits to be called?
> 
> At the very least I would put a comment there around the beginning of select_machine() saying:
> 
> /* all types, all classes in QOM are initialized here, as a result of the object_class_get_list call */
> 
> Wdyt?

Are you trying to register types conditionally?


