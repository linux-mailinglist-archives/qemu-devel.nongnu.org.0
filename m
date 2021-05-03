Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49322371109
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 06:55:23 +0200 (CEST)
Received: from localhost ([::1]:38144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldQc5-0001Aa-Sf
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 00:55:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ldQaP-0000jI-J6
 for qemu-devel@nongnu.org; Mon, 03 May 2021 00:53:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26346)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ldQaN-00071b-6t
 for qemu-devel@nongnu.org; Mon, 03 May 2021 00:53:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620017614;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zYKa82aJvUTpyHWstU5ffS6cW9DlVbMuHJFmUxB6+Ng=;
 b=MH7tXXWaoehXWfrjtyrtEcQSZ8dlR95ThmFyXcs8FA58hfZ8ooP7GslncaUq3gmxSpEtcr
 mHZwknlpMzyXnPewZvPkScOVy+Gcu7/nP3smhDFmSQBV2oIICFWvL34/HfcWX7yvPMJ+Fe
 nrsF2elzMlS1g9mfQ5Y+JNSPQCMWtJU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-173-zex766QfOoKLxtMZm5ZRdg-1; Mon, 03 May 2021 00:53:32 -0400
X-MC-Unique: zex766QfOoKLxtMZm5ZRdg-1
Received: by mail-wm1-f70.google.com with SMTP id
 y184-20020a1ce1c10000b0290143299f39d7so1939984wmg.4
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 21:53:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zYKa82aJvUTpyHWstU5ffS6cW9DlVbMuHJFmUxB6+Ng=;
 b=gkBMOCXm1WwjM5TDMFBlbv0F0ndzlUeCBum5RYciGtEBJITekbmll+MlRzoJpKdN7h
 IuCefqkIT6BXLiv/iG1JP2bvV/uDviBuilPU+47SVQLLVTaiPvLIFEKMvHGHQJqfYImM
 ev9nesglWrXbxzQGRbpum51ZsjnWDq0XrRBKAPshura67D1pWFSnw9PjSyMrur1w7zf1
 rdaLZtP+8+E8hSb4RMatykHfGHVzAIhDQxSTSqj01qWq6Z3dFyI7hZnBWTo8ZBZgeWFV
 EeCVHGTTm6s492fA+6zzhZg+rLY3+/VD/eCv205YqmoNTGG/bxxsevb1bHsCTHjcWLQ4
 ofmg==
X-Gm-Message-State: AOAM533Iy29L7ClXGwZR3zglSvKcsZEhhVUOpca5N4po68V3qYcKUpjw
 nnHwaP7ifcVRkKpf5p1GBaqihJDQUxFeV4HqzlsRHcVucV0sKIfUcl3rZxqoIeb1SXlHLw7UVss
 zHF9K05lYj8Yz6e7yRDefWeXXkLI4yj4K5oYj4y6XSay6IR6bvLKb9Vvy57E8u+E=
X-Received: by 2002:adf:f1d2:: with SMTP id z18mr17008712wro.245.1620017611706; 
 Sun, 02 May 2021 21:53:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwd+FWYEY3kl4AP2V54bQ6OFjiPRjvy20xbl9lOLSsAWm4o4BHRMJASdncKvjmhHyxI9qMuFg==
X-Received: by 2002:adf:f1d2:: with SMTP id z18mr17008695wro.245.1620017611510; 
 Sun, 02 May 2021 21:53:31 -0700 (PDT)
Received: from thuth.remote.csb (p5791d0bc.dip0.t-ipconnect.de.
 [87.145.208.188])
 by smtp.gmail.com with ESMTPSA id f6sm12773503wru.72.2021.05.02.21.53.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 02 May 2021 21:53:31 -0700 (PDT)
Subject: Re: [PATCH 1/4] pc-bios/s390-ccw: Silence warning from Clang by
 marking panic() as noreturn
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-s390x@nongnu.org, Christian Borntraeger <borntraeger@de.ibm.com>
References: <20210502174836.838816-1-thuth@redhat.com>
 <20210502174836.838816-2-thuth@redhat.com>
 <04140977-282c-2579-3073-42b6bb4148ee@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <f2f4a4fa-9b0a-b1c7-66a1-4c83bc864a04@redhat.com>
Date: Mon, 3 May 2021 06:53:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <04140977-282c-2579-3073-42b6bb4148ee@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02/05/2021 20.57, Philippe Mathieu-Daudé wrote:
> On 5/2/21 7:48 PM, Thomas Huth wrote:
>> When compiling the s390-ccw bios with Clang, the compiler emits a warning:
>>
>>   pc-bios/s390-ccw/main.c:210:5: warning: variable 'found' is used uninitialized
>>    whenever switch default is taken [-Wsometimes-uninitialized]
>>       default:
>>       ^~~~~~~
>>   pc-bios/s390-ccw/main.c:214:16: note: uninitialized use occurs here
>>       IPL_assert(found, "Boot device not found\n");
>>                  ^~~~~
>>
>> It's a false positive, it only happens because Clang is not smart enough
>> to see that the panic() function in the "default:" case can never return.
>>
>> Anyway, let's explicitely mark panic() with "noreturn" to shut up the
>> warning.
> 
> Why not simply initialize the variable instead?

First, it's a false positive. If you only look at the code, someone might 
later wonder whether it's really necessary or not and try to remove it again 
(and since there is no warning with gcc, this patch would also have a good 
chance to get merged, bringing us back to where we are right now).

Second, declaring panic() as noreturn is certainly more sustainable, since 
it might prevent similar situations in other parts of the code in the future.

  Thomas


>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   pc-bios/s390-ccw/s390-ccw.h | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/pc-bios/s390-ccw/s390-ccw.h b/pc-bios/s390-ccw/s390-ccw.h
>> index 6cd92669e9..79db69ff54 100644
>> --- a/pc-bios/s390-ccw/s390-ccw.h
>> +++ b/pc-bios/s390-ccw/s390-ccw.h
>> @@ -89,6 +89,7 @@ bool menu_is_enabled_enum(void);
>>   
>>   #define MAX_BOOT_ENTRIES  31
>>   
>> +__attribute__ ((__noreturn__))
>>   static inline void panic(const char *string)
>>   {
>>       sclp_print(string);
>>
> 


