Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (unknown [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D506C8205
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Mar 2023 17:00:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfbwv-0001dB-GU; Fri, 24 Mar 2023 03:34:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pfbwt-0001cz-9t
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 03:34:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pfbwi-0007r9-Fs
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 03:34:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679643261;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4QUs8km15tdSmBMJbq9oy+sA9Y6iMG5KI0R+7zzs2LU=;
 b=X1Y2QcLpU4JYK95c1Y1CYagzeIawVx6UD+0CaFx2bx/ZzqjCoKDMUMlu9i7p3JA+GIP+oT
 oIvzfaYr0YOhx8vEf+54/oay/Gzu8FXgIe64Cs9WYWVz/mxP2GuXaIlJc2K2Ec/ZQEvOPI
 zzWbhTw8VHeaQLQph3x+31R4M70GIAE=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-413-vZrQoQrQMzO0KcT1KbwB4Q-1; Fri, 24 Mar 2023 03:34:17 -0400
X-MC-Unique: vZrQoQrQMzO0KcT1KbwB4Q-1
Received: by mail-qt1-f200.google.com with SMTP id
 c14-20020ac87d8e000000b003e38726ec8bso556051qtd.23
 for <qemu-devel@nongnu.org>; Fri, 24 Mar 2023 00:34:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679643257;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4QUs8km15tdSmBMJbq9oy+sA9Y6iMG5KI0R+7zzs2LU=;
 b=kEjayIOHJCDfgRwuQheO4M8GxAMlQ+QyRim2Xn4rg6RNCgTizxr0+Lr5FougzmCipG
 G0Wf9Mi4QYg+T76rPuY13A6u5yU9rNkATnNGX0i5yTzvo5MZTcXC+vyyh+d7QCAshEM2
 ZDHnoqWlR4QQsDji4qxXQwJgpeBH4UUPHVuVVNwhVmT9ALVPR1AlScy9F8+LqsWQ29UZ
 5I41m+RyBDuKduwCsED9PZND8kl8tXSg7NsQPdcID+xBGClN14KnFQgP2XsBxoWIdfyF
 WghCKTF6y31ofS5On5n/WDMW66MkBaDmyiHKGH4r4TcJhachXPglWCxMuNtAPWJJnYBz
 9obA==
X-Gm-Message-State: AAQBX9cl+v9t9boEZBgzAJPS2B8McPVPc+QtI34WC4eggs5FeeCww1yC
 YsUkhRGA86WGXYmK4PZWQykeITkYIJPkPxI8bKM+EcWdAF+shhtuM0K0zGH9Whuz2AsgNydgkpb
 XB48dp7P+d2Mi69A=
X-Received: by 2002:a05:6214:c8d:b0:5be:a3e7:f24d with SMTP id
 r13-20020a0562140c8d00b005bea3e7f24dmr2223920qvr.29.1679643257375; 
 Fri, 24 Mar 2023 00:34:17 -0700 (PDT)
X-Google-Smtp-Source: AKy350b/GU6gPMdUmL1jsgDz0IDNbp/z4PZgXOybzhJ6DDzrMFuzsix4n5h0BdjqK/9qurV3UWG9bw==
X-Received: by 2002:a05:6214:c8d:b0:5be:a3e7:f24d with SMTP id
 r13-20020a0562140c8d00b005bea3e7f24dmr2223900qvr.29.1679643257139; 
 Fri, 24 Mar 2023 00:34:17 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-179-101.web.vodafone.de.
 [109.43.179.101]) by smtp.gmail.com with ESMTPSA id
 lf10-20020a0562142cca00b005dd8b9345e9sm496245qvb.129.2023.03.24.00.34.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Mar 2023 00:34:16 -0700 (PDT)
Message-ID: <8df76c27-89b5-baee-9738-9b7585ae01e0@redhat.com>
Date: Fri, 24 Mar 2023 08:34:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: quintela@redhat.com, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>
References: <20230317170553.592707-1-berrange@redhat.com>
 <871qlfmi9q.fsf@secure.mitica>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] qtests: avoid printing comments before g_test_init()
In-Reply-To: <871qlfmi9q.fsf@secure.mitica>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
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

On 23/03/2023 19.31, Juan Quintela wrote:
> Daniel P. Berrangé <berrange@redhat.com> wrote:
>> The TAP protocol version line must be the first thing printed on
>> stdout. The migration test failed that requirement in certain
>> scenarios:
>>
>>    # Skipping test: Userfault not available (builtdtime)
>>    TAP version 13
>>    # random seed: R02Sc120c807f11053eb90bfea845ba1e368
>>    1..32
>>    # Start of x86_64 tests
>>    # Start of migration tests
>>    ....
>>
>> The TAP version is printed by g_test_init(), so we need to make
>> sure that any methods which print are run after that.
>>
>> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
>> ---
> 
> Reviewed-by: Juan Quintela <quintela@redhat.com>
> 
>> -    const bool has_kvm = qtest_has_accel("kvm");
>> -    const bool has_uffd = ufd_version_check();
>> -    const char *arch = qtest_get_arch();
>> +    bool has_kvm;
>> +    bool has_uffd;
>> +    const char *arch;
> 
> Why don't you move also the declarations of the variables?
> I think that one of the biggest troubles of C is variables that are not
> initialized.
> 
> All compilers that we support are C99 or later, so we can do that (and
> we already do in lot of places.)

I think the coding style has been created before we switched to -std=gnu99 
for compiling QEMU, so a lot of GCCs were still using C89 by default?

> And yeap, I know that CodingStyle says otherwise, but I think that what
> is wrong is CodingStyle.
> 
> https://lists.gnu.org/archive/html/qemu-devel/2023-02/msg03836.html

Please use proper prefixes in the subject when sending patches 
("docs/devel:" here), otherwise your patches might not get the right 
attention (at least on my side, it was filtered away as a patch that was 
relevant to me) - and also put some recent contributors on CC:

  Thanks,
   Thomas


