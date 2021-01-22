Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73469300607
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 15:51:36 +0100 (CET)
Received: from localhost ([::1]:48520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2xmh-0008Lh-Im
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 09:51:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l2xje-000615-8p
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 09:48:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:44129)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l2xjb-0006T2-5c
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 09:48:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611326902;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jaOG906YtvkAr3Pamv6Su20EQtxOF1iHlLjqbPfbkLk=;
 b=MfkOzZ672w67e8UF1GPFlAB+NoDec9U8zLHN1or1yicldZ7f7QWfNsFL48LLqtK3ZChYhv
 KPh4AowODsduui+8e/dv56lNKGpKkOb8P1cn8P3Y1qbDpXQoG1waiteCoRsuEZ+IZSunTf
 88uJdgElWwBO1ggStwPAo1HvPpj43Gk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-486-poaw5pE8PROqqHFmE1mgPA-1; Fri, 22 Jan 2021 09:48:20 -0500
X-MC-Unique: poaw5pE8PROqqHFmE1mgPA-1
Received: by mail-wr1-f69.google.com with SMTP id j8so3239489wrx.17
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 06:48:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jaOG906YtvkAr3Pamv6Su20EQtxOF1iHlLjqbPfbkLk=;
 b=edfP7kO1flNzVv8JqN6/T4rIXHq9JpTBlE2QFt+4ifFNKYyrgOWCxbcXtmZnhDKt38
 OkRAlGsP5iODnPiKCDqGAqp6GxeeMm6QZNCX0HVhmu36FMzqDehPuxk0St3z52+LTwNK
 RIB4855LAZAuTc5rvQI3Rjcxn5CJ7pvGuRokST1/44bLbPqKXUH+3x+GPss8MVFf8uuT
 xX4l+9Kk9EqmhFwkzDbF62NcQAq9pDIU5wRvIV3agNKdrsAxALx4RtMxAdmhrVIyj2R2
 rIDAFjcoDxLVDyeDcx795fAnu4uFlSkH+ZwfF61sP1wV/D8HrWDniXVTC0QewydKL0du
 aL6Q==
X-Gm-Message-State: AOAM533ZpTfzT5Tu81UJECGHR+4jrxwfjTKlVaSycmGAWiL/qZ7vanut
 e8f2mA7LoW6wTTrPlhOEiid0AciEsodqaEcZhX/2O/0fnN3y/YWN3lht4qR2mW6K8Y0wMRP5TKb
 /LaxgavUsVvHqoGqKSmy8h6Jtk5z6tWgE1u4nD5gmFV8F3rAS6w2GRMrPsHdyqfc42X8=
X-Received: by 2002:a05:600c:228c:: with SMTP id
 12mr4336087wmf.101.1611326899195; 
 Fri, 22 Jan 2021 06:48:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxMzW6J3slh7G1gb4wm8RC169gyhCEPyb2VwsZ/soXBJaVQrjCl8ZQilVRq/TPOvt4jUZfYxA==
X-Received: by 2002:a05:600c:228c:: with SMTP id
 12mr4336074wmf.101.1611326898993; 
 Fri, 22 Jan 2021 06:48:18 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id n9sm12517353wrq.41.2021.01.22.06.48.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Jan 2021 06:48:18 -0800 (PST)
Subject: Re: [PATCH 06/25] tests: convert check-qom-proplist to keyval
To: Markus Armbruster <armbru@redhat.com>
References: <20210118163113.780171-1-pbonzini@redhat.com>
 <20210118163113.780171-7-pbonzini@redhat.com>
 <87y2gl2h4a.fsf@dusky.pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <09cf440a-72bc-854a-9fd4-20fc35d9b660@redhat.com>
Date: Fri, 22 Jan 2021 15:48:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <87y2gl2h4a.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.182,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.221, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: kwolf@redhat.com, imammedo@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/01/21 15:14, Markus Armbruster wrote:
>> +    dobj = DUMMY_OBJECT(object_resolve_path_component(object_get_objects_root(),
>> +                                                      "dev0"));
> Why does user_creatable_add_opts() return the object on success, null on
> failure, but user_creatable_add_dict() only a rather less useful bool?

I would guess that nobody needs it outside tests (I didn't look at the 
code).

>>       g_assert(dobj);
>>       g_assert_cmpstr(dobj->sv, ==, "Hiss hiss hiss");
>>       g_assert(dobj->bv == true);
>>       g_assert(dobj->av == DUMMY_PLATYPUS);
>>   
>> +    qdict = keyval_parse(params, "qom-type", &help, &err);
>
> Why parse again?

Besides the justification of the previous email, user_creatable_add_dict 
modifies its QDict argument, removing the "qom-type" and "id" keys. 
Wart fixed in patch 16.

Paolo


