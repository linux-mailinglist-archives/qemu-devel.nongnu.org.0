Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AE86302872
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 18:09:42 +0100 (CET)
Received: from localhost ([::1]:46396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l45My-0002Xb-If
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 12:09:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l45J4-0007EO-RI
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 12:05:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35344)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l45J1-0006EF-BA
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 12:05:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611594332;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lq4VvC6z4P48Btd+MzZSULZBJxN1002xSsc8jn6eEWo=;
 b=CyUOeVxp5JT9EloyqmogTzUnGpmd0UH5edZsCsjB5LSVyJam293c9qdc7YIU90I6x9qqD7
 RDbrLlpJpQwViIhTXAmpt7TxbdXBVJj9AF0N7RCMdY+Kj7+90gE3cZb9iTnMIXy6iJLW48
 yk/UU239PnJ4oG/Ku3f/A8pwmzj3ijQ=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-495-qVUiYZ56MYuFCzxkS2Zicg-1; Mon, 25 Jan 2021 12:05:30 -0500
X-MC-Unique: qVUiYZ56MYuFCzxkS2Zicg-1
Received: by mail-ed1-f70.google.com with SMTP id m16so7779627edd.21
 for <qemu-devel@nongnu.org>; Mon, 25 Jan 2021 09:05:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lq4VvC6z4P48Btd+MzZSULZBJxN1002xSsc8jn6eEWo=;
 b=TKGQD0NB1iBoAuhQGKrYbaF6L4ucugG1WaRDlmJfPqi0YVoFastmSyJlboQo5qlDji
 01E6DX3cCjXqLcC5nx5AtH65fZ26kIpVqwt0Bc7XTUwynMbRoH8VkfbBOn8eV4E3BFLv
 3ynxlId+vylbukG41LkAv+oEktjKR+h4mBFl2OEmWzSqmnATb7j0SNa54oHYOsOL/4/t
 182CpEG8iC7Rjkb3N080VKt7E+vdBuqAsd4Fm5Whb1vpVXD8qcS/zJ/RoszZwLmjfngZ
 4K/EekgxfOjJ0INkXVyfwaO+u4d79SRFoW95GI1OpHiyoZJBT8gLtRRhXkTTJLihGlOs
 QU8g==
X-Gm-Message-State: AOAM532/nehZcSCxZ35Q/0Rn0II9uMNaMWcVEZMIIkp9BkjZzSXoLzpX
 fvQnIjV1bqUPovCGyTUvGX9zmYpQUwWIkmmJ8ZTZThNwrUIYabjdllh8HZJacY2lnl/ETHMIKp2
 3DI8ioR2oEarsALA=
X-Received: by 2002:a50:e008:: with SMTP id e8mr1234051edl.339.1611594328873; 
 Mon, 25 Jan 2021 09:05:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwfUQbdmYO5/qJWP8lci57zkqFe3VpAXnS4w1iLJ+K/4JrdsBrp7rnDnXFB/aU2LYl506LGuw==
X-Received: by 2002:a50:e008:: with SMTP id e8mr1234023edl.339.1611594328662; 
 Mon, 25 Jan 2021 09:05:28 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id d9sm8614321ejy.123.2021.01.25.09.05.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Jan 2021 09:05:27 -0800 (PST)
Subject: Re: [PATCH v4 4/4] meson: Warn when TCI is selected but TCG backend
 is available
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210125144530.2837481-1-philmd@redhat.com>
 <20210125144530.2837481-5-philmd@redhat.com>
 <20210125164746.GE3538803@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <992cbe66-dfae-7950-0d92-516b2f0c9717@redhat.com>
Date: Mon, 25 Jan 2021 18:05:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210125164746.GE3538803@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
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
Cc: Stefan Weil <sw@weilnetz.de>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/25/21 5:47 PM, Daniel P. Berrangé wrote:
> On Mon, Jan 25, 2021 at 03:45:30PM +0100, Philippe Mathieu-Daudé wrote:
>> Some new users get confused with 'TCG' and 'TCI', and enable TCI
>> support expecting to enable TCG.
>>
>> Emit a warning when native TCG backend is available on the
>> host architecture, mentioning this is a suboptimal configuration.
>>
>> Reviewed-by: Stefan Weil <sw@weilnetz.de>
>> Reviewed-by: Thomas Huth <thuth@redhat.com>
> 
> Nitpick, the text printed is completely rewritten from what they
> reviewed, so I would probably have dropped their R-b for that
> scenario.

I thought about it, and assumed their review tag was for the logical
change of adding a warning, not particularly the warning content.

I agree this it would have been better to ask them to review again.
Next time I will reset the tags.

>> Suggested-by: Daniel Berrangé <berrange@redhat.com>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  meson.build | 7 +++++++
>>  1 file changed, 7 insertions(+)
>>
>> diff --git a/meson.build b/meson.build
>> index 16b2560e7e7..f675c54e636 100644
>> --- a/meson.build
>> +++ b/meson.build
>> @@ -228,6 +228,13 @@
>>      else
>>        error('Unsupported CPU @0@, try --enable-tcg-interpreter'.format(cpu))
>>      endif
>> +  elif get_option('tcg_interpreter')
>> +    warning('Use of the TCG interpretor is not recommended on this host')
>> +    warning('architecture. There is a native TCG execution backend available')
>> +    warning('which provides substantially better performance and reliability.')
>> +    warning('It is strongly recommended to remove the --enable-tcg-interpreter')
>> +    warning('configuration option on this architecture to use the native')
>> +    warning('backend.')
>>    endif
>>    if get_option('tcg_interpreter')
>>      tcg_arch = 'tci'
>> -- 
>> 2.26.2
>>
> 
> Regards,
> Daniel
> 


