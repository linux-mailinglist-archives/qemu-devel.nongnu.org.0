Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D1342567D
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 17:19:23 +0200 (CEST)
Received: from localhost ([::1]:39590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYVB4-0000Rr-JV
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 11:19:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mYV9x-0008A7-1W
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 11:18:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45007)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mYV9t-0003Ir-JI
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 11:18:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633619887;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A6vtXIkicFt7VVQ5NHVntrnPXhTSxCgEIYm8aJeHGxA=;
 b=bUeQnNJik1s3/d8p6LQEot5eTbcdeC7big9mwPxGHlMBRqxIJ9tM/c2dL//K+ToTtcra/x
 egRUSAf8mLgEg6zsOUJiR8Jn+Tp06YdPngf4+Zr5Mai/TQsgqOTlMfB/SxZ7EH6UJgMxGO
 d0tDWXQwvYRNFz3QR3IuD6utx7Fsaw0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-99-gWrcO6_VOw-DzVXWTvhwfw-1; Thu, 07 Oct 2021 11:18:06 -0400
X-MC-Unique: gWrcO6_VOw-DzVXWTvhwfw-1
Received: by mail-wr1-f72.google.com with SMTP id
 h11-20020adfa4cb000000b00160c791a550so4802976wrb.6
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 08:18:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=A6vtXIkicFt7VVQ5NHVntrnPXhTSxCgEIYm8aJeHGxA=;
 b=Y9Byvm3C5K7m5hfeF7YHrNVtnZ5iKEq//UJouDE2y3d0MUyqqWisXenRC/9mBCopNL
 dS/1BdrFtn1u5W5pF2qSo/YdGDWU1CbZBGGt8BUn/PBYHwGWfWfyXjoCJ56gexo7c0Cb
 dcGmz3p8yGO1Jllt6eJhIVG6hjV9+kAT3E2FpYwvDLkV/kVbtrXfD4tPytcpDsf6ghkf
 Hub8reQ38leegduVWK0T/M2yuzpiHkvBuq1yY/w7SgH9FPDNGLdlvv4plOhswgl6wJUE
 2KFgX0J6tXr0zE6aM2PNRp48VG7ivoWRwH812N3CTCR38B7bpnhhrzZ6tnTBrKTo39/7
 pbUg==
X-Gm-Message-State: AOAM533UTlYeOoxXz7+Z5whz/spBQT0LaZsuRa1auZtspkiaDBmdhkMP
 ON0XY0iWHXrNYBSvl994SFmjystY8Y0zOLGzkBGmX7ar9u2ZcRnurO+TkdDCDu17QymPIINbBnC
 4H5zKga72j34b6sI=
X-Received: by 2002:a5d:59ad:: with SMTP id p13mr6208244wrr.253.1633619885174; 
 Thu, 07 Oct 2021 08:18:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy1chPAauVcmvAUGIu2PpmeGC1NzHHEZTsM8AxFTeGNU0jLdg6eBriMmhAOBKsfKtxtw9g1Zw==
X-Received: by 2002:a5d:59ad:: with SMTP id p13mr6208209wrr.253.1633619884958; 
 Thu, 07 Oct 2021 08:18:04 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id n15sm25386369wrg.58.2021.10.07.08.18.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Oct 2021 08:18:04 -0700 (PDT)
Message-ID: <9f36432b-b1b7-139e-085d-c8af430772fc@redhat.com>
Date: Thu, 7 Oct 2021 17:18:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3 19/22] monitor: Restrict 'info sev' to x86 targets
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20211002125317.3418648-1-philmd@redhat.com>
 <20211002125317.3418648-20-philmd@redhat.com>
 <5c1652ac-8a71-8d23-ed31-b84ce07596e8@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <5c1652ac-8a71-8d23-ed31-b84ce07596e8@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.964, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Brijesh Singh <brijesh.singh@amd.com>, kvm@vger.kernel.org,
 Sergio Lopez <slp@redhat.com>, James Bottomley <jejb@linux.ibm.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/4/21 10:26, Paolo Bonzini wrote:
> On 02/10/21 14:53, Philippe Mathieu-Daudé wrote:
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>   include/monitor/hmp-target.h  | 1 +
>>   include/monitor/hmp.h         | 1 -
>>   target/i386/sev-sysemu-stub.c | 2 +-
>>   target/i386/sev.c             | 2 +-
>>   4 files changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/include/monitor/hmp-target.h b/include/monitor/hmp-target.h
>> index dc53add7eef..96956d0fc41 100644
>> --- a/include/monitor/hmp-target.h
>> +++ b/include/monitor/hmp-target.h
>> @@ -49,6 +49,7 @@ void hmp_info_tlb(Monitor *mon, const QDict *qdict);
>>   void hmp_mce(Monitor *mon, const QDict *qdict);
>>   void hmp_info_local_apic(Monitor *mon, const QDict *qdict);
>>   void hmp_info_io_apic(Monitor *mon, const QDict *qdict);
>> +void hmp_info_sev(Monitor *mon, const QDict *qdict);
>>   void hmp_info_sgx(Monitor *mon, const QDict *qdict);
>>     #endif /* MONITOR_HMP_TARGET_H */
>> diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
>> index 3baa1058e2c..6bc27639e01 100644
>> --- a/include/monitor/hmp.h
>> +++ b/include/monitor/hmp.h
>> @@ -124,7 +124,6 @@ void hmp_info_ramblock(Monitor *mon, const QDict
>> *qdict);
>>   void hmp_hotpluggable_cpus(Monitor *mon, const QDict *qdict);
>>   void hmp_info_vm_generation_id(Monitor *mon, const QDict *qdict);
>>   void hmp_info_memory_size_summary(Monitor *mon, const QDict *qdict);
>> -void hmp_info_sev(Monitor *mon, const QDict *qdict);
>>   void hmp_info_replay(Monitor *mon, const QDict *qdict);
>>   void hmp_replay_break(Monitor *mon, const QDict *qdict);
>>   void hmp_replay_delete_break(Monitor *mon, const QDict *qdict);
>> diff --git a/target/i386/sev-sysemu-stub.c
>> b/target/i386/sev-sysemu-stub.c
>> index 1836b32e4fc..b2a4033a030 100644
>> --- a/target/i386/sev-sysemu-stub.c
>> +++ b/target/i386/sev-sysemu-stub.c
>> @@ -13,7 +13,7 @@
>>     #include "qemu/osdep.h"
>>   #include "monitor/monitor.h"
>> -#include "monitor/hmp.h"
>> +#include "monitor/hmp-target.h"
>>   #include "qapi/qapi-commands-misc-target.h"
>>   #include "qapi/qmp/qerror.h"
>>   #include "qapi/error.h"
>> diff --git a/target/i386/sev.c b/target/i386/sev.c
>> index 7caaa117ff7..c6d8fc52eb2 100644
>> --- a/target/i386/sev.c
>> +++ b/target/i386/sev.c
>> @@ -32,7 +32,7 @@
>>   #include "migration/blocker.h"
>>   #include "qom/object.h"
>>   #include "monitor/monitor.h"
>> -#include "monitor/hmp.h"
>> +#include "monitor/hmp-target.h"
>>   #include "qapi/qapi-commands-misc-target.h"
>>   #include "qapi/qmp/qerror.h"
>>   #include "exec/confidential-guest-support.h"
>>
> 
> 
> This is only a cleanup, isn't it?  The #ifdef is already in
> hmp-commands-info.hx.

IIUC the prototype is exposed to all targets, while with
this patch, only to the files including "monitor/hmp-target.h".

You are right the command is only added for TARGET_I386 in
hmp-commands-info.hx.

> 
> Anyway,
> 
> Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
> 
> but please adjust the commit message in v4.

OK, thanks.


