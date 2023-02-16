Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD96699B4E
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 18:30:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSi5P-0007rh-M9; Thu, 16 Feb 2023 12:30:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1pSi5I-0007pP-Sl
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 12:30:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1pSi5G-0006JB-G6
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 12:30:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676568609;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a6vhfPC9iLZDFDVrE3a8fWLbQZznkkIIcfW6D4cCJsY=;
 b=FXdKDuFqUTFNhGTgT2VFJ6CeN7TV4zXtCxHDnmfG0GPMTPWM8QZL3HsQ0bIIeWoP66Nlop
 0iV3y7jSCU5x+wrjm6gQ+iEF+74Qtw548PBYHMvS88UhfsdIJx8ChL/cHU5md9o5+zIV20
 O/+SDEQls5QATkNLGtK2zxhV+7ZQekE=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-640-FtUmwejJNNu-wvJtzYQGsg-1; Thu, 16 Feb 2023 12:30:08 -0500
X-MC-Unique: FtUmwejJNNu-wvJtzYQGsg-1
Received: by mail-qk1-f200.google.com with SMTP id
 o24-20020a05620a22d800b007389d2f57f3so1607768qki.21
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 09:30:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=a6vhfPC9iLZDFDVrE3a8fWLbQZznkkIIcfW6D4cCJsY=;
 b=qZ8nqKvjnmb94QQR62VUOK1iSwFfGLHrK27T7VOXat8A4ToisWRNVrpgNTpRlFgnl/
 NRV9XqsLNbabOKjGy6HoRkolHl0UejHeZcFWLTxF8nH2lUAo/woMjlXM3zfGJS/lUlTx
 1YMbbM6ztSVKMwHoRFI25n6J0p/9swRLfPf/O9AWvdWepxahVL/x8bHkjC5CfZdQoNi9
 ngTaugl7YnGSTSaaQJLk9+FFl9CL76C3UvlN5bXeZRkkeiKQuilVohtIFOXQwdhY9uuK
 PuI7mw5xtJM1nflkZXvOeI4cXzJUZfrdR+iu5+/mM3Xf/thyn5jg2AR17NorUoI5kBSf
 Du6w==
X-Gm-Message-State: AO0yUKXBaqCLBIKl7Tg9XP8rzKlHA9vmNyuXEYH32LOw0atIDPVolDCK
 SUj+0+RhMHrhMwWneXEJGDADRKNhYauOdlsSqPUQrJpqXRqyLx54/Tz4F1kV+UVnTc8IsZt67Ob
 U5InqIbfVWBq6rzc=
X-Received: by 2002:ac8:7d07:0:b0:3ab:ceb9:10fd with SMTP id
 g7-20020ac87d07000000b003abceb910fdmr11329521qtb.25.1676568607737; 
 Thu, 16 Feb 2023 09:30:07 -0800 (PST)
X-Google-Smtp-Source: AK7set/RXqxYufSS98eBf9fAvzFVkJZ6G6zOY3tClRRFyhFCt0yJMI00Jb8V3g55XI8CToBOWpOw7w==
X-Received: by 2002:ac8:7d07:0:b0:3ab:ceb9:10fd with SMTP id
 g7-20020ac87d07000000b003abceb910fdmr11329487qtb.25.1676568607461; 
 Thu, 16 Feb 2023 09:30:07 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 c75-20020a379a4e000000b0073b6a06911asm1570977qke.95.2023.02.16.09.30.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Feb 2023 09:30:06 -0800 (PST)
Message-ID: <f993d409-8769-ac87-020f-cf8fd03cb496@redhat.com>
Date: Thu, 16 Feb 2023 18:30:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v5 3/3] qtests/arm: add some mte tests
Content-Language: en-US
To: Cornelia Huck <cohuck@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kvm@vger.kernel.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Gavin Shan <gshan@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20230203134433.31513-1-cohuck@redhat.com>
 <20230203134433.31513-4-cohuck@redhat.com>
 <a7904d6e-c8e5-055b-34f7-8ea2956ec65f@redhat.com> <874jrndwjm.fsf@redhat.com>
From: Eric Auger <eauger@redhat.com>
In-Reply-To: <874jrndwjm.fsf@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eauger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.351, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Hi Connie,

On 2/15/23 11:59, Cornelia Huck wrote:
> On Mon, Feb 06 2023, Eric Auger <eauger@redhat.com> wrote:
> 
>> Hi,
>>
>> On 2/3/23 14:44, Cornelia Huck wrote:
>>> @@ -517,6 +583,13 @@ static void test_query_cpu_model_expansion_kvm(const void *data)
>>>          assert_set_feature(qts, "host", "pmu", false);
>>>          assert_set_feature(qts, "host", "pmu", true);
>>>  
>>> +        /*
>>> +         * Unfortunately, there's no easy way to test whether this instance
>>> +         * of KVM supports MTE. So we can only assert that the feature
>>> +         * is present, but not whether it can be toggled.
>>> +         */
>>> +        assert_has_feature(qts, "host", "mte");
>> I know you replied in v4 but I am still confused:
>> What does
>>       (QEMU) query-cpu-model-expansion type=full model={"name":"host"}
>> return on a MTE capable host and and on a non MTE capable host?
> 
> FWIW, it's "auto" in both cases, but the main problem is actually
> something else...
> 
>>
>> If I remember correctly qmp_query_cpu_model_expansion loops over the
>> advertised features and try to set them explicitly so if the host does
>> not support it this should fail and the result should be different from
>> the case where the host supports it (even if it is off by default)
>>
>> Does assert_has_feature_enabled() returns false?
> 
> I poked around a bit with qmp on a system (well, model) with MTE where
> starting a guest with MTE works just fine. I used the minimal setup
> described in docs/devel/writing-monitor-commands.rst, and trying to do a
> cpu model expansion with mte=on fails because the KVM ioctl fails with
> -EINVAL (as we haven't set up proper memory mappings). The qtest setup
> doesn't do any proper setup either AFAICS, so enabling MTE won't work
> even if KVM and the host support it. (Trying to enable MTE on a host
> that doesn't support it would also report an error, but a different one,
> as KVM would not support the MTE cap at all.) We don't really know
> beforehand what to expect ("auto" is not yet expanded, see above), so
> I'm not sure how to test this in a meaningful way, even if we did set up
> memory mappings (which seems like overkill for a feature test.)
> 
> The comment describing this could be improved, though :)
> 

OK fair enough, don't make it a blocking issue for the series and simply
update the comment up to your knowledge.

Thanks

Eric


