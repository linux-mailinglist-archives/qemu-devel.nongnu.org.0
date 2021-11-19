Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B734576E7
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 20:12:44 +0100 (CET)
Received: from localhost ([::1]:42608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo9JT-0003aP-BG
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 14:12:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mo9EU-0002lF-2p
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 14:07:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26263)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mo9EQ-00072y-KS
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 14:07:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637348848;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A6Q073wi+jev9h6dJ+IaU36AmwmdkoWGivlj6o2glwI=;
 b=AHF6YFATmZigA8v1F/iBcK8JOf1sGbZ9U0KkPkTESoljIpzfHKa12sDc9uPk35VElYCgPY
 RHDfnEIDkt5ILPvLDlJON8IJ3E19XFQ7ko+6SHaSt6DeWrSFalxyWLXz3oNorF5uyRbt0T
 B+/1MB3rUJyFIJo9T5aMzkc2AehVCL0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-414-G85TtoJFMJSyWFbaXMoP5Q-1; Fri, 19 Nov 2021 14:07:26 -0500
X-MC-Unique: G85TtoJFMJSyWFbaXMoP5Q-1
Received: by mail-wm1-f71.google.com with SMTP id
 l6-20020a05600c4f0600b0033321934a39so5190374wmq.9
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 11:07:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=A6Q073wi+jev9h6dJ+IaU36AmwmdkoWGivlj6o2glwI=;
 b=6o0HrPaeDHJgarQzCOg6EO5oZwXwotQRob8tmLijkgxbT+EnkRUxN7h7K+uVd+SrZe
 2pjFHmcdyb1RfRE8qiWaEJLLkrhwqkp6lNVi133HfnPS+dunigVOboYmsoWNYg7gL5BV
 hmCAllhrAvfxa8IrNnnbOyOwc7aCnLFab/pPDJVIYtwW+3xxUGocPuuGRiZeTd4fF0mF
 CnBYBpAkXJ7TGym/NEypTok+LfcPuxYG2xCxJKwXuAUiV7HWd9xK3GpX3DVHQ/66lBYC
 P2TBYWpYuK7cwsM585JlDr3L7RhkIPaAZdRuXmCb1YkInMxwaaTc1uKh2ZjW8TsfFrmg
 6Z2Q==
X-Gm-Message-State: AOAM532iULVzC/Rb4LFcpFv42XPZlxh7d5VrsXcTBMTTYSsfPJMIMupX
 t4cxaEG5DBPpVCBSRVS7+08+55w95FdTqrerFhuxN59wrVuG97VndNDG/2GEU/H5gsHqyr++H1b
 kz9QP1OK8F2hD45Y=
X-Received: by 2002:adf:f5ce:: with SMTP id k14mr9948889wrp.100.1637348845306; 
 Fri, 19 Nov 2021 11:07:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx2xNmk/sogDObBmSh/fjNoM9uPCV4QmfZ+6fuYtnSD9NYz7Yt3NnqfgxPdEK1k0UyhMh2KEw==
X-Received: by 2002:adf:f5ce:: with SMTP id k14mr9948853wrp.100.1637348845084; 
 Fri, 19 Nov 2021 11:07:25 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id m125sm12819546wmm.39.2021.11.19.11.07.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Nov 2021 11:07:24 -0800 (PST)
Message-ID: <23766d94-96da-d2c7-eb12-2e830e178d0c@redhat.com>
Date: Fri, 19 Nov 2021 20:07:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [RFC PATCH-for-6.2 v3] qdev-monitor: Only allow full --global
 <driver>.<property>=<val> option
To: BALATON Zoltan <balaton@eik.bme.hu>
References: <20211119182644.480115-1-philmd@redhat.com>
 <a83d167f-60b8-6991-2f5-ab6ab8a6beac@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <a83d167f-60b8-6991-2f5-ab6ab8a6beac@eik.bme.hu>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.727, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/19/21 19:46, BALATON Zoltan wrote:
> On Fri, 19 Nov 2021, Philippe Mathieu-Daudé wrote:
>> When not all fields of the --global option are provided,
>> QEMU might crash:
>>
>>  $ qemu-system-x86_64 -global driver=isa-fdc
>>  qemu-system-x86_64: ../../devel/qemu/qapi/string-input-visitor.c:394:
>>  string_input_visitor_new: Assertion `str' failed.
>>  Aborted (core dumped)
>>
>> Fix by only allowing --global with all 3 fields:
>>
>>  $ qemu-system-x86_64 -global driver=isa-fdc
>>  Invalid 'global' option format. It must be provided as:
>>    --global <driver>.<property>=<value>
>>
>> Reported-by: Thomas Huth <thuth@redhat.com>
>> Suggested-by: Markus Armbruster <armbru@redhat.com>
>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/604
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>> v3: Change qemu_global_option (Markus)
>>
>> Supersedes: <20211119122911.365036-1-philmd@redhat.com>
>> ---
>> softmmu/qdev-monitor.c | 9 +++------
>> 1 file changed, 3 insertions(+), 6 deletions(-)
>>
>> diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
>> index 01f3834db57..558272b147c 100644
>> --- a/softmmu/qdev-monitor.c
>> +++ b/softmmu/qdev-monitor.c
>> @@ -1029,13 +1029,10 @@ int qemu_global_option(const char *str)
>>         qemu_opt_set(opts, "value", str + offset + 1, &error_abort);
>>         return 0;
>>     }
>> +    printf("Invalid 'global' option format. It must be provided as:\n");
>> +    printf("  --global <driver>.<property>=<value>\n");
> 
> Should these be something else tnan plain printf? (Such as qemu_prinf or
> qdev_printf or similar? Not sure how these work but plain printf in QEMU
> is usually not what's meant.)

I thought so first, but qemu_opts_print_help() calls plain printf()...

> Regards,
> BALATON Zoltan
> 
>> -    opts = qemu_opts_parse_noisily(&qemu_global_opts, str, false);
>> -    if (!opts) {
>> -        return -1;
>> -    }


