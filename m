Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D36455B56
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Nov 2021 13:14:15 +0100 (CET)
Received: from localhost ([::1]:47272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mngIw-0002kF-D9
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 07:14:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mngHL-0000er-Os
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 07:12:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57363)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mngHI-0005MW-K5
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 07:12:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637237549;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9RgOH9DLZbKocblZj8b9WXHYzWd3AUVenr+QPNGSH5I=;
 b=Gza+PqqSFuHnqxm+jVVZFkvh1hslCGA0IkAtXvIGmKwERwiQ7wOAplCvH+xfIHcd7Kfggm
 8t1CZHS6uMy23gLkLT+FZj0HBdhMihlvjG+3BQE1FuI8I7Co+N/WPaF7anDdwjkBM6b8im
 31PhQPXxK5mm5DXnNeTYiURjSgZlC/4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-553-C14ic32dPAOu5oVwe6WKnQ-1; Thu, 18 Nov 2021 07:12:28 -0500
X-MC-Unique: C14ic32dPAOu5oVwe6WKnQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 v62-20020a1cac41000000b0033719a1a714so2509667wme.6
 for <qemu-devel@nongnu.org>; Thu, 18 Nov 2021 04:12:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=9RgOH9DLZbKocblZj8b9WXHYzWd3AUVenr+QPNGSH5I=;
 b=zD3b6ZNTLTzi8lsNvDk4cmqSNh1iWgVbhkLTjhz6ar6bZ9dcFbOH2seyrv10Zox1Rc
 roKax7cIT7DY8tyXTWaC1OtMybPxY5prx1M5EXhy0nH3RhPt222TJVY6aJJDGN51wG75
 Qp7niSKm4E2uU6rydEVvLW8Hiy65wX0AlhIZbPho80N5CuC1H2ZfoGA2TTTKTgrtm2hX
 5/rDXyHqz6NmgGFZYQ3UnPPJQniVN4Gmd3miZBb42j3ST/EOpvx/cSpu2LIZGyBsAJGZ
 9LSTC2jOA2FshPVlwuh78WFtJfhzYMRzwFC/Z9Zsc9s86UEsp1Y6qtorDMm0TmcSSD0F
 lQvQ==
X-Gm-Message-State: AOAM532SHky37wntl1DJO3nkHnryQrHHDl8HFn3uBoMey4nfvxBWtSe9
 SkfnPT8lyL4RpM5ofQiEEZVVr012lIa60T1fpkpumVIOap53yJM0+40+kJq84SCFriaoz8BRSBD
 i3UB03Z77A07rjHY=
X-Received: by 2002:a5d:64c3:: with SMTP id f3mr31339616wri.377.1637237547426; 
 Thu, 18 Nov 2021 04:12:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx5YfLvDHuJPxmjLWnD7L/CpjO+eqqYKyF1AZIT0OriVThkbTWurhQ6XAXwoinrE3r2YlsYPg==
X-Received: by 2002:a5d:64c3:: with SMTP id f3mr31339569wri.377.1637237547140; 
 Thu, 18 Nov 2021 04:12:27 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id o12sm4621938wrc.85.2021.11.18.04.12.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Nov 2021 04:12:26 -0800 (PST)
Message-ID: <76394aee-bbae-9445-c106-0abf3780d291@redhat.com>
Date: Thu, 18 Nov 2021 13:12:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH-for-6.2? 1/3] docs/devel/style: Improve GLib functions rST
 rendering
To: "Daniel P . Berrange" <berrange@redhat.com>
References: <20211116151317.2691125-1-philmd@redhat.com>
 <20211116151317.2691125-2-philmd@redhat.com> <m2h7c9n31m.fsf@oracle.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <m2h7c9n31m.fsf@oracle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.084, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Darren Kenny <darren.kenny@oracle.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/18/21 11:58, Darren Kenny wrote:
> Hi Philippe,
> 
> There are some inconsistencies in the use of '()' when referring to
> functions or macros below...

Daniel, if you agree with Darren comments I can respin addressing them.

> On Tuesday, 2021-11-16 at 16:13:15 +01, Philippe Mathieu-Daudé wrote:
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  docs/devel/style.rst | 31 ++++++++++++++++---------------
>>  1 file changed, 16 insertions(+), 15 deletions(-)
>>
>> diff --git a/docs/devel/style.rst b/docs/devel/style.rst
>> index 260e3263fa0..415a6b9d700 100644
>> --- a/docs/devel/style.rst
>> +++ b/docs/devel/style.rst
>> @@ -413,13 +413,14 @@ multiple exist paths you can also improve the readability of the code
>>  by using ``g_autofree`` and related annotations. See :ref:`autofree-ref`
>>  for more details.
>>  
>> -Calling ``g_malloc`` with a zero size is valid and will return NULL.
>> +Calling ``g_malloc`` with a zero size is valid and will return ``NULL``.
>>
> 
> g_malloc() ?
> 
>>  
>>  Prefer ``g_new(T, n)`` instead of ``g_malloc(sizeof(T) * n)`` for the following
>>  reasons:
>>  
>> -* It catches multiplication overflowing size_t;
>> -* It returns T ``*`` instead of void ``*``, letting compiler catch more type errors.
>> +* It catches multiplication overflowing ``size_t``;
>> +* It returns ``T *`` instead of ``void *``, letting compiler catch more type
>> +  errors.
>>  
>>  Declarations like
>>  
>> @@ -444,14 +445,14 @@ use this similar function when possible, but note its different signature:
>>  
>>      void pstrcpy(char *dest, int dest_buf_size, const char *src)
>>  
>> -Don't use strcat because it can't check for buffer overflows, but:
>> +Don't use ``strcat`` because it can't check for buffer overflows, but:
>>
> 
> strcat() ?
> 
>>  
>>  .. code-block:: c
>>  
>>      char *pstrcat(char *buf, int buf_size, const char *s)
>>  
>> -The same limitation exists with sprintf and vsprintf, so use snprintf and
>> -vsnprintf.
>> +The same limitation exists with ``sprintf`` and ``vsprintf``, so use
> 
> sprintf() and vsprintf()?
> 
>> +``snprintf`` and ``vsnprintf``.
>>
> 
> snprintf() and vsnprintf()?
> 
>>  
>>  QEMU provides other useful string functions:
>>  
>> @@ -464,8 +465,8 @@ QEMU provides other useful string functions:
>>  There are also replacement character processing macros for isxyz and toxyz,
>>  so instead of e.g. isalnum you should use qemu_isalnum.
>>
> 
> Should this be isalnum() and qemu_isalnum()?
> 
>>  
>> -Because of the memory management rules, you must use g_strdup/g_strndup
>> -instead of plain strdup/strndup.
>> +Because of the memory management rules, you must use ``g_strdup/g_strndup``
>>
> 
> Wonder should this be ``g_strdup()``/``g_strndup()``
> 
>> +instead of plain ``strdup/strndup``.
>>
> 
> And ``strdup()``/``strndup()``
> 
>>  
>>  Printf-style functions
>>  ======================
>> @@ -524,10 +525,10 @@ automatic cleanup:
>>  
>>  Most notably:
>>  
>> -* g_autofree - will invoke g_free() on the variable going out of scope
>> +* ``g_autofree`` - will invoke ``g_free()`` on the variable going out of scope
>>
> 
> g_autofree() ?
> 
>>  
>> -* g_autoptr - for structs / objects, will invoke the cleanup func created
>> -  by a previous use of G_DEFINE_AUTOPTR_CLEANUP_FUNC. This is
>> +* ``g_autoptr`` - for structs / objects, will invoke the cleanup func created
>>
> 
> g_autoptr() ?
> 
>> +  by a previous use of ``G_DEFINE_AUTOPTR_CLEANUP_FUNC``. This is
>>    supported for most GLib data types and GObjects
>>  
>>  For example, instead of
>> @@ -551,7 +552,7 @@ For example, instead of
>>          return ret;
>>      }
>>  
>> -Using g_autofree/g_autoptr enables the code to be written as:
>> +Using ``g_autofree/g_autoptr`` enables the code to be written as:
>>
> 
> ``g_autofree()``/``g_autoptr()`` ?
> 
>>  
>>  .. code-block:: c
>>  
>> @@ -569,13 +570,13 @@ Using g_autofree/g_autoptr enables the code to be written as:
>>  While this generally results in simpler, less leak-prone code, there
>>  are still some caveats to beware of
>>  
>> -* Variables declared with g_auto* MUST always be initialized,
>> +* Variables declared with ``g_auto*`` MUST always be initialized,
>>
> 
> g_auto*() ?
> 
>>    otherwise the cleanup function will use uninitialized stack memory
>>  
>> -* If a variable declared with g_auto* holds a value which must
>> +* If a variable declared with ``g_auto*`` holds a value which must
>>
> 
> g_auto*() ?
> 
>>    live beyond the life of the function, that value must be saved
>>    and the original variable NULL'd out. This can be simpler using
>> -  g_steal_pointer
>> +  ``g_steal_pointer``
>>
> 
> g_steal_pointer() ?
> 
> Thanks,
> 
> Darren.
> 


