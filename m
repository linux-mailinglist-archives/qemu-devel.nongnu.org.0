Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE51944003A
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 18:22:39 +0200 (CEST)
Received: from localhost ([::1]:41070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgUeM-0003KL-O9
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 12:22:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mgUVf-0002So-O2
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 12:13:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26348)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mgUVd-0005SK-Iz
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 12:13:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635524014;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+MQjPh5hoESUhQd8rqJg5C6Cylv7RUjgpD9XTSAeCms=;
 b=cN5Ty+JzD1IeKIiBT9N/odykd3LyX5AMg6RAsfMuv9T2L2TYFA0Cf8wF/fuIX0SPppJ4/1
 NvhZ74IGXPb+UQ9Vd3TKATkgdiTYG7bSS5+YtBxFYm3/7zpdnwt/oB/xoPI7EBPayDwUDz
 A0s2VZ6bL71YrlqQGtQQEercDsoZHIE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-517-9V4bGMnsPpeSMYFOHy8xTQ-1; Fri, 29 Oct 2021 12:13:33 -0400
X-MC-Unique: 9V4bGMnsPpeSMYFOHy8xTQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 u15-20020a5d514f000000b001687ebddea3so3505554wrt.8
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 09:13:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+MQjPh5hoESUhQd8rqJg5C6Cylv7RUjgpD9XTSAeCms=;
 b=yOVbmovh8a7DOClUR1p3E+b126+bMIuk+HLi7wVaOqaaq2TMhF9FUexcy7DCjQb1Lc
 23ShevpjKwdwIxpYe1g6OK8myqidhGFJL2HD1Udub6gIhoe302/OQYK6vdgCToQ1MzwM
 Aa9J3I0rY4FQAAi2PhlKOByhMfBV9DF8p0bX2B1deUO4akWDTK68wE0yg1kpZdAGxZ5j
 CvO52tfiUe3p8dOebLgmFKk9/xftYmJ7VfXoueo+VNgGqv4QmWdGH/GO2KJvlbE4DBil
 MYV1OdOl2/7OZpE1Q1EoX44zzGmAorzpH5Z2d4ameUwrBUXxKgsl3DA28L7phYBh6n1V
 8JAw==
X-Gm-Message-State: AOAM530kDLRFXnxsQK+VWNh7k/fNbQaAyfNcVLdzC4VIDAnTNTyUVZO3
 HyHgtQFdc4SzHmuH3LkKW58LohR9t3jGa0/bqMSnScQn48EgtKf7FrldkdFvT3+ItS6u+xFmPH7
 uI7KlCLbty7tnISw=
X-Received: by 2002:a1c:2b85:: with SMTP id
 r127mr20453087wmr.134.1635524011718; 
 Fri, 29 Oct 2021 09:13:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxCtvTmb4wEyt0jm04FlCfMdroyj/lAOPCdGUrcg5gkax+rGqNJL6tcvt7s/ifIJHuef69KpA==
X-Received: by 2002:a1c:2b85:: with SMTP id
 r127mr20453065wmr.134.1635524011545; 
 Fri, 29 Oct 2021 09:13:31 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id w1sm9029885wmc.19.2021.10.29.09.13.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Oct 2021 09:13:31 -0700 (PDT)
Message-ID: <4be222bd-e863-b58f-fdea-c562903f1eaa@redhat.com>
Date: Fri, 29 Oct 2021 18:13:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 5/9] qapi: Generalize struct member policy checking
To: Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>
References: <20211028102520.747396-1-armbru@redhat.com>
 <20211028102520.747396-6-armbru@redhat.com>
 <20211029152024.7x2tiizzswurimdf@redhat.com>
 <87fssjc0a7.fsf@dusky.pond.sub.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <87fssjc0a7.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.512, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
 libvir-list@redhat.com, kchamart@redhat.com, qemu-devel@nongnu.org,
 mdroth@linux.vnet.ibm.com, dgilbert@redhat.com, pbonzini@redhat.com,
 marcandre.lureau@redhat.com, jsnow@redhat.com, libguestfs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/29/21 17:34, Markus Armbruster wrote:
> Eric Blake <eblake@redhat.com> writes:
> 
>> On Thu, Oct 28, 2021 at 12:25:16PM +0200, Markus Armbruster wrote:
>>> The generated visitor functions call visit_deprecated_accept() and
>>> visit_deprecated() when visiting a struct member with special feature
>>> flag 'deprecated'.  This makes the feature flag visible to the actual
>>> visitors.  I want to make feature flag 'unstable' visible there as
>>> well, so I can add policy for it.
>>>
>>> To let me make it visible, replace these functions by
>>> visit_policy_reject() and visit_policy_skip(), which take the member's
>>> special features as an argument.  Note that the new functions have the
>>> opposite sense, i.e. the return value flips.
>>>
>>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>>> ---
>>
>>> +++ b/qapi/qapi-forward-visitor.c
>>> @@ -246,25 +246,27 @@ static void forward_field_optional(Visitor *v, const char *name, bool *present)
>>>      visit_optional(ffv->target, name, present);
>>>  }
>>>  
>>> -static bool forward_field_deprecated_accept(Visitor *v, const char *name,
>>> -                                            Error **errp)
>>> +static bool forward_field_policy_reject(Visitor *v, const char *name,
>>> +                                        unsigned special_features,
>>> +                                        Error **errp)
>>>  {
>>>      ForwardFieldVisitor *ffv = to_ffv(v);
>>>  
>>>      if (!forward_field_translate_name(ffv, &name, errp)) {
>>>          return false;
>>
>> Should this return value be flipped?
>>
>>>      }
>>> -    return visit_deprecated_accept(ffv->target, name, errp);
>>> +    return visit_policy_reject(ffv->target, name, special_features, errp);
>>>  }
>>>  
>>> -static bool forward_field_deprecated(Visitor *v, const char *name)
>>> +static bool forward_field_policy_skip(Visitor *v, const char *name,
>>> +                                      unsigned special_features)
>>>  {
>>>      ForwardFieldVisitor *ffv = to_ffv(v);
>>>  
>>>      if (!forward_field_translate_name(ffv, &name, NULL)) {
>>>          return false;
>>
>> and here too?
> 
> Good catch!

Ouch. I admit this patch logic is hard to review, but couldn't come
with a nice way to split it further.

> These functions are called indirectly like
> 
>     if (visit_policy_reject(v, "values", 1u << QAPI_DEPRECATED, errp)) {
>         return false;
>     }
>     if (!visit_policy_skip(v, "values", 1u << QAPI_DEPRECATED)) {
>         if (!visit_type_strList(v, "values", &obj->values, errp)) {
>             return false;
>         }
>     }
> 
> visit_policy_reject() must return true when it sets an error, or else we
> call visit_policy_skip() with @errp pointing to non-null.
> 
> Same argument for visit_policy_skip().
> 
>>>      }
>>> -    return visit_deprecated(ffv->target, name);
>>> +    return visit_policy_skip(ffv->target, name, special_features);
>>>  }
>>>  
>>
>> Otherwise, the rest of the logic changes for flipped sense look right.
> 


