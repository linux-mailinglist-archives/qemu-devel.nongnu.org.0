Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62AC2367F8A
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 13:26:17 +0200 (CEST)
Received: from localhost ([::1]:50038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZXTM-0003qy-H4
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 07:26:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lZXRs-0003Jy-9w
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 07:24:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55920)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lZXRm-0001Ts-2x
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 07:24:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619090676;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fxXmYuf4PllNx8CZJ6ZaonM3TjslEmj/eeWGxScQONM=;
 b=FL6Yoc0n8YI675GhdBeOq8hwwevRuRcg3TpC5yD06qhBDXBjiQv1ScZjyWnLSngVCiyu/f
 LMRXUWtCBCVQQi4mqKFKZIyeucio+ULcUOn2mhrFkuZTMBMFrhCi4ZX4svSVhlZzE72pox
 3XwavcXSKQoUEBNJvFDOHRQJAaRD02k=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-187-Dl3lJykSNAO2vriPsJA5OA-1; Thu, 22 Apr 2021 07:24:33 -0400
X-MC-Unique: Dl3lJykSNAO2vriPsJA5OA-1
Received: by mail-wr1-f71.google.com with SMTP id
 f15-20020adffccf0000b02901028c7339ccso13697542wrs.1
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 04:24:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fxXmYuf4PllNx8CZJ6ZaonM3TjslEmj/eeWGxScQONM=;
 b=tKbJvKAc6bAQVSgwgN96AaVGMxCmd0xeCJZVeDPLtrtKtWtn76jzz8uvbyP0kCDkYV
 1+5ob6XDjwZ6Yxu0eLGwMX6auUHzUtvkIRcW5wW/q7iShrlSuFzHT/RlSUKHxLaEtrJn
 G/j3OMLty7K46gLQlhV7yBqr/gDWZ8BcrLa0W1ZK5WDHSsy6aAeHdixbc/kzSuHv0mla
 LFVVtkQ+hAwi9yoEhKBvHG873Rhnrx34puk2Q73JViNpgkLoJWlUeVEGOGpR1s3Zsyjp
 SSkfmLc5SkqqSygf8UPFdZN9YW7U9dxRGNSYpRHZQCH8g4cMBr1iDwfBYrgIlOYP84Rr
 sfYQ==
X-Gm-Message-State: AOAM530cuT/CwmHsk6Z6lBvtxPVunF3YBJIXNtXsO+CEs4bm+aocTdhz
 kZqd+vGsN0XueeZpeEtfwCwb+QhjapZDMxSrqn2zwBT7itgPBOuDaf95SRKHg/JwPJWwzod+jPx
 x/3qRzhN/USn3/7o=
X-Received: by 2002:a5d:564b:: with SMTP id j11mr3589328wrw.307.1619090672542; 
 Thu, 22 Apr 2021 04:24:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxnN5iO5GvKCoT4u3kVMqdaR9i4LZ7x6wE9bikDLrYwo+CigNmzzgX5O6WYjx5bqPMYb1S1SQ==
X-Received: by 2002:a5d:564b:: with SMTP id j11mr3589299wrw.307.1619090672343; 
 Thu, 22 Apr 2021 04:24:32 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id d10sm3034156wri.41.2021.04.22.04.24.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Apr 2021 04:24:31 -0700 (PDT)
Subject: Re: s390-ccw: warning: writing 1 byte into a region of size 0
 [-Wstringop-overflow=]
To: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, 
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>
References: <4e327c80-8f5d-c848-b524-7f2c75255da4@redhat.com>
 <485773db-fca2-03ca-c6e8-90ef313fb8f1@redhat.com>
 <YIFMt+xg+xH+M4rd@redhat.com>
 <CAFEAcA8r2k9f=XG6T_hYk542-dDJnR7Lr8DZnyc=SFgnzNYxxQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <089df242-8788-a162-4a75-4c9c9e04a64e@redhat.com>
Date: Thu, 22 Apr 2021 13:24:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8r2k9f=XG6T_hYk542-dDJnR7Lr8DZnyc=SFgnzNYxxQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Janosch Frank <frankja@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, qemu-s390x <qemu-s390x@nongnu.org>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/22/21 12:30 PM, Peter Maydell wrote:
> On Thu, 22 Apr 2021 at 11:18, Daniel P. Berrangé <berrange@redhat.com> wrote:
>>
>> On Thu, Apr 22, 2021 at 06:47:30AM +0200, Thomas Huth wrote:
>>> On 22/04/2021 06.18, Philippe Mathieu-Daudé wrote:
>>>> Hi Thomas, Daniel, Stefano,
>>>>
>>>> Regarding the following warning (GCC 11 on Fedora 34):
>>>>
>>>> In file included from pc-bios/s390-ccw/main.c:11:
>>>>
>>>> In function ‘memset’,
>>>>
>>>>      inlined from ‘boot_setup’ at pc-bios/s390-ccw/main.c:185:5,
>>>>
>>>>      inlined from ‘main’ at pc-bios/s390-ccw/main.c:288:5:
>>>>
>>>> pc-bios/s390-ccw/libc.h:28:14: warning: writing 1 byte into a region of
>>>> size 0 [-Wstringop-overflow=]
>>>>
>>>>     28 |         p[i] = c;
>>>>
>>>>        |         ~~~~~^~~
>>>>
>>>> Daniel were right on IRC:
>>>>
>>>> danpb: it is from a call  memset((char *)S390EP, 0, 6)     where  S390EP
>>>> is just a constant address 0x10008
>>>> danpb: the compiler doesn't now how big that is, so it seems to assume
>>>> it is zero length
>>>>
>>>> This is a known GCC issue:
>>>> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=99578
>>>> "gcc-11 -Warray-bounds or -Wstringop-overread warning when accessing a
>>>> pointer from integer literal"
>>>
>>>  Hi Philippe,
>>>
>>> thanks for following up with the gcc bugzilla!
>>>
>>> ... so the problem is that GCC thinks we're in fact dereferencing a NULL
>>> pointer at offset 0x10008 here? Wow, that's ... crazy.
>>>
>>> Not sure what to do now - wait for the bug to get resolved? Compile the
>>> s390-ccw bios with -Wno-stringop-overread ? Add "volatiles" here and there
>>> to hope that these silence the compiler warnings? ... I tend to wait for the
>>> bug ticket to see whether the GCC folks change the behavior of the compiler
>>> again, but I'm open for other suggestions.
>>
>> Assuming it is just this one place in the code ,then we should just
>> use "pragma" to temporarily disable/re-enable that single warning flag
>> either side of the problem.
> 
> The gcc bug report suggests that use of 'volatile' also sidesteps
> the warning. Is that a sensible approach here ?

I'm not sure I got it right... I tried:

-    memset((char *)S390EP, 0, 6);
+    memset((char *)(volatile char *)S390EP, 0, 6);

But no change (still -Wstringop-overflow=).

If I use:

-    memset((char *)S390EP, 0, 6);
+    memset((volatile char *)S390EP, 0, 6);

I still have -Wstringop-overflow=, but also:

pc-bios/s390-ccw/main.c:185:12: warning: passing argument 1 of ‘memset’
discards ‘volatile’ qualifier from pointer target type
[-Wdiscarded-qualifiers]
pc-bios/s390-ccw/libc.h:22:34: note: expected ‘void *’ but argument is
of type ‘volatile char *’

This silents the warning however:

-- >8 --
diff --git a/pc-bios/s390-ccw/libc.h b/pc-bios/s390-ccw/libc.h
index bcdc45732d..2dea399904 100644
--- a/pc-bios/s390-ccw/libc.h
+++ b/pc-bios/s390-ccw/libc.h
@@ -19,6 +19,8 @@ typedef unsigned short     uint16_t;
 typedef unsigned int       uint32_t;
 typedef unsigned long long uint64_t;

+#pragma GCC diagnostic push
+#pragma GCC diagnostic ignored "-Wstringop-overflow"
 static inline void *memset(void *s, int c, size_t n)
 {
     size_t i;
@@ -30,6 +32,7 @@ static inline void *memset(void *s, int c, size_t n)

     return s;
 }
+#pragma GCC diagnostic pop

 static inline void *memcpy(void *s1, const void *s2, size_t n)
 {
---

Oddly this code doesn't emit any warning:

  if (!memcmp((char *)S390EP, "S390EP", 6)) {
  ...

Regards,

Phil.


