Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 584FA6010FF
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 16:21:33 +0200 (CEST)
Received: from localhost ([::1]:35492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okQzi-00061i-Ke
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 10:21:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1okQst-0001Q5-IA
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 10:14:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38105)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1okQsr-0002HJ-Tf
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 10:14:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666016064;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9lzk0FfClC3vbrWJdPefE/cbVkbC+r4BuB/QvzoFJOw=;
 b=bxDDgH38qP3Mb5877vMipxrnlyFGpARGe2nuam1CXJxR4EsKyyozkhjNostgoTSZrzZ1ae
 o8KnNB2v64dVq8llp95Ow5RLMERMJt/njtAb03Uzx8PyKsEfrqTc3cpkE2GMU42xGi7pdv
 csEoZqa9CqK8/oOMQGqt/vIeRoJt5qs=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-625--I4v_MhJNOSZyEEHcbWMDw-1; Mon, 17 Oct 2022 10:14:23 -0400
X-MC-Unique: -I4v_MhJNOSZyEEHcbWMDw-1
Received: by mail-ed1-f69.google.com with SMTP id
 m7-20020a056402430700b0045daff6ee5dso1331364edc.10
 for <qemu-devel@nongnu.org>; Mon, 17 Oct 2022 07:14:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9lzk0FfClC3vbrWJdPefE/cbVkbC+r4BuB/QvzoFJOw=;
 b=Gst2GUvpCtGMRhKQ99bD4sqUEwtF+QnOKOg8y5CzW7ccBDoiMGXuWJFM8krtQPmFt+
 5viP3SHhOspCzyaDAJW1g9hnkG8tecY3xCZ6pdPzCX5g2NO+S6oCKK0ffa+G/dnluYP1
 Ib4aeadYcawiK7IjNQbed2UptaxAUb7Jcgfzwfb6QS+j/XSI/aUXHaDxNGr2YHSAqiEg
 NW/w1xKwEKDFu+ua8Qk8asQnmWq8+P6MgGF38ZuuIZpzKX7BP8/Iyc/vkFq3/eGUs/zb
 jGkjtEKLW0Zd0N8WX5uStzcTu1IgdiGQegIPm81z2ZgTkVNNUpyfM4mIQiRX5bcyIXT1
 aBfA==
X-Gm-Message-State: ACrzQf06rIHQ4ESVmEDfzcUkSNbmrNkSlTOHl0X8pHWALg2jQul+UqiX
 LMzaCN+i9SapzgZTUXdfAxCBazMvr/RLecvmi7YTaeYcroak5RXZIi765THO5e0EkHuyYfb9Tnl
 mXQkPxAt1vagFfmg=
X-Received: by 2002:a17:907:9717:b0:78d:9fb4:16dd with SMTP id
 jg23-20020a170907971700b0078d9fb416ddmr9135357ejc.720.1666016062159; 
 Mon, 17 Oct 2022 07:14:22 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM47pnt8hK19Kc4+nUjb702DqSGIAAGV7P73/FtjsnWVMKQEedqyaZ38C2qfsUddpRitPKY6kw==
X-Received: by 2002:a17:907:9717:b0:78d:9fb4:16dd with SMTP id
 jg23-20020a170907971700b0078d9fb416ddmr9135330ejc.720.1666016061865; 
 Mon, 17 Oct 2022 07:14:21 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-178-160.web.vodafone.de.
 [109.43.178.160]) by smtp.gmail.com with ESMTPSA id
 a24-20020a1709063a5800b0078128c89439sm6269428ejf.6.2022.10.17.07.14.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Oct 2022 07:14:21 -0700 (PDT)
Message-ID: <581a5887-784d-6036-7a07-21e7b277d4fb@redhat.com>
Date: Mon, 17 Oct 2022 16:14:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 1/2] tests/qtest: migration-test: Fix
 [-Werror=format-overflow=] build warning
Content-Language: en-US
To: Bin Meng <bmeng.cn@gmail.com>, Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Bin Meng <bin.meng@windriver.com>,
 Shengjiang Wu <shengjiang.wu@windriver.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20221017114647.2226535-1-bmeng.cn@gmail.com>
 <878rle7hxl.fsf@pond.sub.org>
 <CAEUhbmWc2fwHKyW2ypMXVD51s3Uaf=AMb2_KK1NrMSQanHcfuA@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <CAEUhbmWc2fwHKyW2ypMXVD51s3Uaf=AMb2_KK1NrMSQanHcfuA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17/10/2022 15.56, Bin Meng wrote:
> On Mon, Oct 17, 2022 at 8:28 PM Markus Armbruster <armbru@redhat.com> wrote:
>>
>> Bin Meng <bmeng.cn@gmail.com> writes:
>>
>>> From: Bin Meng <bin.meng@windriver.com>
>>>
>>> When tmpfs is NULL, a build warning is seen with GCC 9.3.0.
>>> It's strange that GCC 11.2.0 on Ubuntu 22.04 does not catch this,
>>> neither did the QEMU CI.
>>>
>>> Reported-by: Shengjiang Wu <shengjiang.wu@windriver.com>
>>> Fixes: e5553c1b8d28 ("tests/qtest: migration-test: Avoid using hardcoded /tmp")
>>> Signed-off-by: Bin Meng <bin.meng@windriver.com>
>>> ---
>>>
>>>   tests/qtest/migration-test.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
>>> index ef4427ff4d..83a8998e40 100644
>>> --- a/tests/qtest/migration-test.c
>>> +++ b/tests/qtest/migration-test.c
>>> @@ -2481,7 +2481,7 @@ int main(int argc, char **argv)
>>>
>>>       tmpfs = g_dir_make_tmp("migration-test-XXXXXX", &err);
>>>       if (!tmpfs) {
>>> -        g_test_message("g_dir_make_tmp on path (%s): %s", tmpfs,
>>> +        g_test_message("g_dir_make_tmp on path (%s): %s", g_get_tmp_dir(),
>>>                          err->message);
>>>       }
>>>       g_assert(tmpfs);
>>
>> Thomas posted the same fix as "[PATCH] tests/qtest/migration-test: Do
>> not try to print NULL pointer string".  You guys figure out which one
>> you like better :)
>>
> 
> Oops, almost the same time :)
> 
> Will let Thomas decide.

The improvement of the error message in your v2 makes a lot of sense - I'll 
queue that version.

  Thomas



