Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD07143B08E
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 12:54:21 +0200 (CEST)
Received: from localhost ([::1]:54476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfK60-0004qS-Vs
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 06:54:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mfJrg-0005yE-8m
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 06:39:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54227)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mfJrc-0006vC-8o
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 06:39:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635244767;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n/8A5Foy90RJ9HErhfXgUNqG+H4rJgbqNcSvDLPgogI=;
 b=a4jkJsZJGw0/VK3jFLsyr0JavqAkmQjvWn6kvEPgG7DCIafwRzEr7ZeSFc+aPdWiUxvOQO
 WzaW+dQhJJ9dJCFky6scO8+/IX3NljM8vzv7I74CEBLScAJf+6Ff8YoQhJmUjUwpvX4tlp
 5nRaRSuBrxUzVh8XxmPp4scyEFyh7do=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-589-rk8Oi5RLOoWUH1gwvQg72A-1; Tue, 26 Oct 2021 06:39:26 -0400
X-MC-Unique: rk8Oi5RLOoWUH1gwvQg72A-1
Received: by mail-wr1-f71.google.com with SMTP id
 t6-20020a5d6906000000b0016d956560d3so347602wru.9
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 03:39:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=n/8A5Foy90RJ9HErhfXgUNqG+H4rJgbqNcSvDLPgogI=;
 b=Ym9htgjs/JEm6g+bKC6oLrCJgbTuqpOY4YeUWTtOwce6rEjCbS4tJ6LZP4abCh+90D
 yN7HlWoOEgzHIa4a7xG2rZ3tkCrzsaTQlbCyHfjZcq9CaJbISW3HYJhOV/ikRy5N+7Kq
 95QUzIUpWiQSxKToD636VL4eeaIRRMjsikTh2IILHkk1cImlYPpMJv/vEGhfFeGPjdnn
 I5rpTzjlCyU4qTVBX7dckeKuJZWIBb04v1Ojkgvmj88S5x31z1xbrBZn9x2lG/VrzDaY
 WLKLBj5cGUYo80zgzvvVQH/0HvU7//dyeM0UpnAaSCPao8SjGHRi62L81umNbRRMIBTh
 R1yg==
X-Gm-Message-State: AOAM5311o3Sw6Y7Mn//rfJPlBZsr6HajclS2MJL6ik2ihr7jQjvEAHI3
 USOTZBzvcBXlUsDTL3+A9JmOh8+XjZwaOKmG8EuphPPTCweoKhu4ky7Yvd5cEx9xXBRtp9/g5tT
 IyUU1xbR0DOb7QCI=
X-Received: by 2002:adf:fe84:: with SMTP id l4mr30735508wrr.177.1635244765175; 
 Tue, 26 Oct 2021 03:39:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwWfLKxaqqztRSyYENmvxCPQALs1FVwQmF4V4lQfu2fSA378da9KZK6+CZPBVKz341W0tc62w==
X-Received: by 2002:adf:fe84:: with SMTP id l4mr30735472wrr.177.1635244764971; 
 Tue, 26 Oct 2021 03:39:24 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id q14sm227538wmq.4.2021.10.26.03.39.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Oct 2021 03:39:24 -0700 (PDT)
Message-ID: <fe045a5c-94ab-97f2-eeb2-3e624b1bd400@redhat.com>
Date: Tue, 26 Oct 2021 12:39:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 8/9] qapi: Factor out compat_policy_input_ok()
To: Markus Armbruster <armbru@redhat.com>
References: <20211025052532.3859634-1-armbru@redhat.com>
 <20211025052532.3859634-9-armbru@redhat.com>
 <308cdd2b-fb99-74ed-8a93-52897d21d25e@redhat.com>
 <87czns3yqo.fsf@dusky.pond.sub.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <87czns3yqo.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.215, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: kwolf@redhat.com, pkrempa@redhat.com, berrange@redhat.com,
 ehabkost@redhat.com, qemu-block@nongnu.org, quintela@redhat.com,
 libvir-list@redhat.com, jsnow@redhat.com, qemu-devel@nongnu.org,
 mdroth@linux.vnet.ibm.com, libguestfs@redhat.com, marcandre.lureau@redhat.com,
 pbonzini@redhat.com, eblake@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/26/21 11:46, Markus Armbruster wrote:
> Philippe Mathieu-Daudé <philmd@redhat.com> writes:
> 
>> On 10/25/21 07:25, Markus Armbruster wrote:
>>> The code to check policy for handling deprecated input is triplicated.
>>> Factor it out into compat_policy_input_ok() before I mess with it in
>>> the next commit.
>>>
>>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>>> ---
>>>  include/qapi/compat-policy.h |  7 +++++
>>>  qapi/qapi-visit-core.c       | 18 +++++--------
>>>  qapi/qmp-dispatch.c          | 51 +++++++++++++++++++++++++++---------
>>>  qapi/qobject-input-visitor.c | 19 +++-----------
>>>  4 files changed, 55 insertions(+), 40 deletions(-)
>>
>>> diff --git a/qapi/qmp-dispatch.c b/qapi/qmp-dispatch.c
>>> index 8cca18c891..e29ade134c 100644
>>> --- a/qapi/qmp-dispatch.c
>>> +++ b/qapi/qmp-dispatch.c
>>> @@ -28,6 +28,40 @@
>>>  
>>>  CompatPolicy compat_policy;
>>>  
>>> +static bool compat_policy_input_ok1(const char *adjective,
>>> +                                    CompatPolicyInput policy,
>>> +                                    ErrorClass error_class,
>>> +                                    const char *kind, const char *name,
>>> +                                    Error **errp)
>>> +{
>>> +    switch (policy) {
>>> +    case COMPAT_POLICY_INPUT_ACCEPT:
>>> +        return true;
>>> +    case COMPAT_POLICY_INPUT_REJECT:
>>> +        error_set(errp, error_class, "%s %s %s disabled by policy",
>>> +                  adjective, kind, name);
>>> +        return false;
>>> +    case COMPAT_POLICY_INPUT_CRASH:
>>> +    default:
>>> +        abort();
>>
>> g_assert_not_reached() provides a nicer user experience.
> 
> I find it hard to care for making the experience of a crash that should
> never ever happen nicer :)

Well COMPAT_POLICY_INPUT_CRASH can happen... What about:

   case COMPAT_POLICY_INPUT_CRASH:
       error_printf("%s %s %s disabled by policy",
                    adjective, kind, name);
       abort();
   default:
       g_assert_not_reached();


