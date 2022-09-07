Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1634E5AFA8E
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Sep 2022 05:24:42 +0200 (CEST)
Received: from localhost ([::1]:42390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVlg8-0008Uk-MY
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 23:24:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1oVlem-0006mN-3S
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 23:23:16 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:40800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1oVleg-0005vP-Cw
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 23:23:12 -0400
Received: by mail-pf1-x434.google.com with SMTP id b144so8521700pfb.7
 for <qemu-devel@nongnu.org>; Tue, 06 Sep 2022 20:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=on+Gv0Wxglob4hLyIJGtjePpxpxeTN5lB3GRoLEw2Qg=;
 b=Bm2PYAedCvMdaWGafUWJkCjGphvFF4m5GYnZlp6o/lIrMQes233qJdHw3v1fnD1jbi
 RwvomMxjn//8KH0F5/Naj01IZblBM3BtBGEUzyGemF+7ka6AxEZzp/EKA7/V/Fq+6ZBc
 QCzu/0P6Ay6ofWjNOVD1wITiV94tFWle+RscjvFgP+XHe78Mw7jhGmiAFyM5omTFJa9p
 rKAviMzwKaORy/JnaVBGiHNAYtnkOdlNjoikHW5zN8YRR5dcHJ+p+cyXRk12KR1YnikX
 TJdCFPTUCN71F3D7c+5C786Qe0hC6Tn8zuYL+lmDZVsWTVriirHx2YN8qmNeURBKqgcU
 tqsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=on+Gv0Wxglob4hLyIJGtjePpxpxeTN5lB3GRoLEw2Qg=;
 b=UiXo9I3JUUhp4JkD2jCVQBjmDKreEVJMENUfHZC8CIFbYIahU72nC6DDHJrO0fWFWf
 bpgPfJHP/i6vIgRM/uugappc85onacn7A6JK/kKayk6YeceCs/rf1QI5iAGU2TsoxAYi
 R1RpsMyLkn6y5lkNr/RGG/uMzEutoEjPaJVvxKcqgB2pkV6Fpc201LKEi0WuiiLlTcoY
 3/iB/3ex6GsWPcK16OR9/Y63rlk6pf6cUJyy/O7niYGH9bMQPxzvkcjRAKM8dbY8uP2C
 w93GTYB7pRjFyNhDugTsJwPORzS1eeH8bnBvHBgCjbKJYl2yDHW3v7SzClr3R7eS1Sw+
 kILg==
X-Gm-Message-State: ACgBeo1RWgkLuIsMCfsVbhazd0zCM0g52jivc97+1xsv1Gstp2+WqbAv
 v8thx1U/OWpK3hOHmDEQrC5C2Q==
X-Google-Smtp-Source: AA6agR59purIUPr64TgYWJbmAYIAxnW6vIxy041OArmXfrqaw4OKliCzeQoTgpaefAyTYM75jRGGJA==
X-Received: by 2002:a63:fa17:0:b0:430:9ec5:b62d with SMTP id
 y23-20020a63fa17000000b004309ec5b62dmr1604512pgh.575.1662520987805; 
 Tue, 06 Sep 2022 20:23:07 -0700 (PDT)
Received: from [10.76.15.169] ([61.120.150.74])
 by smtp.gmail.com with ESMTPSA id
 u10-20020a62d44a000000b0053653c6b9f9sm11135664pfl.204.2022.09.06.20.23.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Sep 2022 20:23:07 -0700 (PDT)
Message-ID: <d9d4b049-df33-b720-f40e-98cc39d77281@bytedance.com>
Date: Wed, 7 Sep 2022 11:22:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: PING: Re: [PATCH v4 1/1] monitor: Support specified vCPU registers
Content-Language: en-US
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, armbru@redhat.com
Cc: qemu-devel@nongnu.org, darren.kenny@oracle.com
References: <20220802073720.1236988-1-pizhenwei@bytedance.com>
 <20220802073720.1236988-2-pizhenwei@bytedance.com> <Yvo1UdBtKxyaFas8@work-vm>
From: zhenwei pi <pizhenwei@bytedance.com>
In-Reply-To: <Yvo1UdBtKxyaFas8@work-vm>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pf1-x434.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PING!

On 8/15/22 20:00, Dr. David Alan Gilbert wrote:
> * zhenwei pi (pizhenwei@bytedance.com) wrote:
>> Originally we have to get all the vCPU registers and parse the
>> specified one. To improve the performance of this usage, allow user
>> specified vCPU id to query registers.
>>
>> Run a VM with 16 vCPU, use bcc tool to track the latency of
>> 'hmp_info_registers':
>> 'info registers -a' uses about 3ms;
>> 'info registers 12' uses about 150us.
>>
>> Cc: Darren Kenny <darren.kenny@oracle.com>
>> Reviewed-by: Markus Armbruster <armbru@redhat.com>
>> Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
> 
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> 
>> ---
>>   hmp-commands-info.hx |  8 +++++---
>>   monitor/misc.c       | 10 ++++++++--
>>   2 files changed, 13 insertions(+), 5 deletions(-)
>>
>> diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
>> index 188d9ece3b..e012035541 100644
>> --- a/hmp-commands-info.hx
>> +++ b/hmp-commands-info.hx
>> @@ -100,9 +100,11 @@ ERST
>>   
>>       {
>>           .name       = "registers",
>> -        .args_type  = "cpustate_all:-a",
>> -        .params     = "[-a]",
>> -        .help       = "show the cpu registers (-a: all - show register info for all cpus)",
>> +        .args_type  = "cpustate_all:-a,vcpu:i?",
>> +        .params     = "[-a|vcpu]",
>> +        .help       = "show the cpu registers (-a: show register info for all cpus;"
>> +                      " vcpu: specific vCPU to query; show the current CPU's registers if"
>> +                      " no argument is specified)",
>>           .cmd        = hmp_info_registers,
>>       },
>>   
>> diff --git a/monitor/misc.c b/monitor/misc.c
>> index 3d2312ba8d..6436a8786b 100644
>> --- a/monitor/misc.c
>> +++ b/monitor/misc.c
>> @@ -307,6 +307,7 @@ int monitor_get_cpu_index(Monitor *mon)
>>   static void hmp_info_registers(Monitor *mon, const QDict *qdict)
>>   {
>>       bool all_cpus = qdict_get_try_bool(qdict, "cpustate_all", false);
>> +    int vcpu = qdict_get_try_int(qdict, "vcpu", -1);
>>       CPUState *cs;
>>   
>>       if (all_cpus) {
>> @@ -315,13 +316,18 @@ static void hmp_info_registers(Monitor *mon, const QDict *qdict)
>>               cpu_dump_state(cs, NULL, CPU_DUMP_FPU);
>>           }
>>       } else {
>> -        cs = mon_get_cpu(mon);
>> +        cs = vcpu >= 0 ? qemu_get_cpu(vcpu) : mon_get_cpu(mon);
>>   
>>           if (!cs) {
>> -            monitor_printf(mon, "No CPU available\n");
>> +            if (vcpu >= 0) {
>> +                monitor_printf(mon, "CPU#%d not available\n", vcpu);
>> +            } else {
>> +                monitor_printf(mon, "No CPU available\n");
>> +            }
>>               return;
>>           }
>>   
>> +        monitor_printf(mon, "\nCPU#%d\n", cs->cpu_index);
>>           cpu_dump_state(cs, NULL, CPU_DUMP_FPU);
>>       }
>>   }
>> -- 
>> 2.20.1
>>

-- 
zhenwei pi

