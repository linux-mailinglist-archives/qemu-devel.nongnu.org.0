Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 198D6478A44
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 12:43:35 +0100 (CET)
Received: from localhost ([::1]:42140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myBe9-0001xM-MT
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 06:43:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1myBcg-0000gC-9t
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 06:42:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58333)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1myBcd-0003Uj-Ff
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 06:42:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639741316;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7Of/7oYRLwHhYbrlIjiYP46//38AzAYhkD2VOSQCvmI=;
 b=XvCBSq5cTrA4NyC92HIoegrsiOBPBwHBHh7UTlrTTqnmsANwiZIHJ0MW3VGKVY6av4YLH2
 uUxXf5aRoyXqmzJot/kcV4tH6XO2WFAfTXJE7vYm3IWNd07esGv6aM6vXVooOVeUGXB2OG
 nk0xV8tjaI1HkJrx/yHdOeOGBFX+e8Y=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-206-zs61ZT6cNVCDkFOT348Fww-1; Fri, 17 Dec 2021 06:41:53 -0500
X-MC-Unique: zs61ZT6cNVCDkFOT348Fww-1
Received: by mail-qt1-f199.google.com with SMTP id
 g2-20020ac87d02000000b002b277218d03so2240652qtb.16
 for <qemu-devel@nongnu.org>; Fri, 17 Dec 2021 03:41:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7Of/7oYRLwHhYbrlIjiYP46//38AzAYhkD2VOSQCvmI=;
 b=yRk8Ws7gYdSdG9MtYUdsuWVfqFDry8I9Eyz/vTDiiLrQBPPsMHJtmCPOEyN654EEht
 LPiK/FQB9abugJ5y6ilSycvXSkVlOm2dsBZYG8oAwWlH1q3tgtlq42vSxPkSwutzIbEM
 VG3oYzDI/sPMGHYbMRjEpH8HFY51P3j5YQVS7e9aks/Bv8niq/wGfQdh3RWniaWl2hrc
 hkulh5vXt3ysO/L6S3FBOKAAnBzmqkmWOyfdRjT0vR+uo4t34WE8O66SvMYu4UBSoj5O
 URwzFUxylxtvZXPq28Xy+JWpptxbnbbLkYJtN20fdvGXJzfTWOsRRclWVKy1IwagDabB
 oPVA==
X-Gm-Message-State: AOAM5338YgFotlSZS7Vu7rVTFj45/ny3CQ+jsru+E92bzeukzRI4MpLg
 FSMCyYlLU03TyoZg1Ym1mIDJKlffmZb1FVoSmUdPBWVv13gOS2XxipuorDjkY5+MQ4lR6ttmWfh
 fDOmdtLyhaGJj+pA=
X-Received: by 2002:a05:6214:1d0c:: with SMTP id
 e12mr1640283qvd.105.1639741313054; 
 Fri, 17 Dec 2021 03:41:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxYD00xfdQxORjz6VdgPVN1/6uVGBeDLbKU8qUAoljgIMAXlNrEq9464oULjYW8Ppc7IYdkFA==
X-Received: by 2002:a05:6214:1d0c:: with SMTP id
 e12mr1640267qvd.105.1639741312787; 
 Fri, 17 Dec 2021 03:41:52 -0800 (PST)
Received: from [192.168.100.42] ([82.142.30.186])
 by smtp.gmail.com with ESMTPSA id l2sm6756907qtk.41.2021.12.17.03.41.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Dec 2021 03:41:52 -0800 (PST)
Message-ID: <c2ac9145-25a3-8b66-2039-64229247c403@redhat.com>
Date: Fri, 17 Dec 2021 12:41:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v3 02/28] glib-compat: Introduce g_memdup2() wrapper
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20210903174510.751630-1-philmd@redhat.com>
 <20210903174510.751630-3-philmd@redhat.com> <875yrofxki.fsf@linaro.org>
 <34bd86db-a213-bb3a-9c72-8c48bd138835@redhat.com> <87v8zneap1.fsf@linaro.org>
From: Laurent Vivier <lvivier@redhat.com>
In-Reply-To: <87v8zneap1.fsf@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.716, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-block@nongnu.org, David Hildenbrand <david@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 John Snow <jsnow@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "Daniel P . Berrange" <berrange@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Alex,

I've added this patch to my trivial patches branch, do you want I drop it?

Thanks,
Laurent

On 17/12/2021 12:10, Alex Bennée wrote:
> Philippe Mathieu-Daudé <philmd@redhat.com> writes:
>
>> On 12/16/21 15:11, Alex Bennée wrote:
>>> Philippe Mathieu-Daudé <philmd@redhat.com> writes:
>>>
>>>> When experimenting raising GLIB_VERSION_MIN_REQUIRED to 2.68
>>>> (Fedora 34 provides GLib 2.68.1) we get:
>>>>
>>>>    hw/virtio/virtio-crypto.c:245:24: error: 'g_memdup' is deprecated: Use 'g_memdup2' instead [-Werror,-Wdeprecated-declarations]
>>>>    ...
>>>>
>>>> g_memdup() has been updated by g_memdup2() to fix eventual security
>>>> issues (size argument is 32-bit and could be truncated / wrapping).
>>>> GLib recommends to copy their static inline version of g_memdup2():
>>>> https://discourse.gnome.org/t/port-your-module-from-g-memdup-to-g-memdup2-now/5538
>>>>
>>>> Our glib-compat.h provides a comment explaining how to deal with
>>>> these deprecated declarations (see commit e71e8cc0355
>>>> "glib: enforce the minimum required version and warn about old APIs").
>>>>
> <snip>
>>>> +#define g_memdup2(m, s) g_memdup2_qemu(m, s)
>>>> +
>>> As per our style wouldn't it make sense to just call it qemu_memdup(m,
>>> s)?
>> I followed the documentation in include/glib-compat.h:
>>
>> /*
>>   * Note that because of the GLIB_VERSION_MAX_ALLOWED constant above,
>> allowing
>>   * use of functions from newer GLib via this compat header needs a little
>>   * trickery to prevent warnings being emitted.
>>   *
>>   * Consider a function from newer glib-X.Y that we want to use
>>   *
>>   *    int g_foo(const char *wibble)
>>   *
>>   * We must define a static inline function with the same signature that does
>>   * what we need, but with a "_qemu" suffix e.g.
>>   *
>>   * static inline void g_foo_qemu(const char *wibble)
>>   * {
>>   *     #if GLIB_CHECK_VERSION(X, Y, 0)
>>   *        g_foo(wibble)
>>   *     #else
>>   *        g_something_equivalent_in_older_glib(wibble);
>>   *     #endif
>>   * }
>>   *
>>   * The #pragma at the top of this file turns off -Wdeprecated-declarations,
>>   * ensuring this wrapper function impl doesn't trigger the compiler warning
>>   * about using too new glib APIs. Finally we can do
>>   *
>>   *   #define g_foo(a) g_foo_qemu(a)
>>   *
>>   * So now the code elsewhere in QEMU, which *does* have the
>>   * -Wdeprecated-declarations warning active, can call g_foo(...) as normal,
>>   * without generating warnings.
>>   */
>>
>> which is how g_unix_get_passwd_entry_qemu() is implemented.
> Yet later we have qemu_g_test_slow following the style guide. Also I'm
> confused by the usage of g_unix_get_passwd_entry_qemu because the only
> place I see it in qga/commands-posix-ssh.c right before it does:
>
> #define g_unix_get_passwd_entry_qemu(username, err) \
>     test_get_passwd_entry(username, err)
>
> although I think that only hold when the file is built with
> QGA_BUILD_UNIT_TEST.
>
>> Should we reword the documentation first?
> The original wording in glib-compat.h was added by Daniel in 2018 but
> the commit that added the password function comments:
>
>    Since the fallback version is still unsafe, I would rather keep the
>    _qemu postfix, to make sure it's not being misused by mistake. When/if
>    necessary, we can implement a safer fallback and drop the _qemu suffix.
>
> So if we are going to make a distinction between a qemu prefix and
> suffix we should agree that and add it to the style document.
>


