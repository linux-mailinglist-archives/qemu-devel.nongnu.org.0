Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC7030FBCD
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 19:46:24 +0100 (CET)
Received: from localhost ([::1]:33218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7je3-0002LW-1T
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 13:46:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l7iZr-0002KT-Bd
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 12:38:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23052)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l7iZo-0005GO-Ro
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 12:37:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612460275;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tYVibDkyPAeLk2rCg4jXuwIM3vzPHQxtkcbwq4qUFj0=;
 b=K3OBzpkYWAp+ZWZ5HpLuvrFriaVgoZXDE2gSLffMNUryUnZ40MmUcpCp64R8aw6e1wC2Ma
 R+wW1q2WhayBao7ncSq9TC1/KABcvrnrnhFXXVTMACG+tfxvWO7gNwDoD6MtMdWAXMDA6v
 hOz22Gw1vPNOz2yq54wwCU3qvC7xfjo=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-469-uYBqVlILPNaOdmxEPs8rUw-1; Thu, 04 Feb 2021 12:37:54 -0500
X-MC-Unique: uYBqVlILPNaOdmxEPs8rUw-1
Received: by mail-ej1-f69.google.com with SMTP id q11so3196071ejd.0
 for <qemu-devel@nongnu.org>; Thu, 04 Feb 2021 09:37:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tYVibDkyPAeLk2rCg4jXuwIM3vzPHQxtkcbwq4qUFj0=;
 b=HsaOnCVsvNgWO4wHtV/NWajETdSGqK/Ygcyahp5uCBI84yEvu+rJeECBNSa/QFs6bz
 RajT7jWpnP2Uv7BHgzHR5/tEI00wN/XXydDtIBsYHqbe9r1RURM5310vjaFAK0eanT5L
 aznTcnYpjj/BJhUF2ILzK4QXOX2iKE/tvWgoEdsl1Gu3wWtHbdGQqrUU/W3/uq7lG7nx
 BmcbDXQUhORnqhubWGc5CTHD7Foeaj5/raLWxUGGilHmM+CW3t5PlcRadNJiN6anT6YP
 K9XYfhAqqpAyewKH4Itr0URNfuo7yMczaFf6aaZVGRZOanaiPucmDMDYrGvHbaSNH85T
 88rw==
X-Gm-Message-State: AOAM530EofBPAJejVGem0TkKYVU9QE1piynfKR7tsVTxAaPzqJlmzD7R
 OJAM+0I+ZQ/Kf6bX1gS/VueuRceEFKAQooKAsj/yd8OwCE3aWotLySBP38AuEKMCmxYU6U9qePx
 IoQAz8Vxa2Z7CrM4=
X-Received: by 2002:a17:906:f854:: with SMTP id
 ks20mr243162ejb.50.1612460273100; 
 Thu, 04 Feb 2021 09:37:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzbBwnE14SCcHYqmxP/DvTr9nMMrk4eGh70FJwPkmFSw6TKaXR9wwecsWULfkYwcDe/SKHOmQ==
X-Received: by 2002:a17:906:f854:: with SMTP id
 ks20mr243145ejb.50.1612460272966; 
 Thu, 04 Feb 2021 09:37:52 -0800 (PST)
Received: from [192.168.1.36] (107.red-83-59-163.dynamicip.rima-tde.net.
 [83.59.163.107])
 by smtp.gmail.com with ESMTPSA id d5sm2810464edu.12.2021.02.04.09.37.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Feb 2021 09:37:52 -0800 (PST)
Subject: Re: [RFC] Move tools sources to the tools directory (was Re: [PATCH
 v2] MAINTAINERS: Fix the location of tools manuals)
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20210204135425.1380280-1-wainersm@redhat.com>
 <516694bd-42fe-7929-811b-545f257c58bf@redhat.com>
 <0e0f9745-fe21-0bc6-2d02-431d67a6b57e@redhat.com>
 <CAFEAcA9nwnii1geGFpwEg8CFfST8B21y0BRL5ci=4ykiwqJywQ@mail.gmail.com>
 <20210204144006.GI6496@merkur.fritz.box> <20210204144700.GN549438@redhat.com>
 <CAFEAcA_=ANGKcy7QNfEdxUft9qGyCHttHo9hfvjQHC_ZfYeo1g@mail.gmail.com>
 <6339c78f-e77c-85e7-8e3f-6c2c514f3206@redhat.com>
 <20210204150601.GQ549438@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <8de7541f-60ce-0b7f-f11c-557d127698aa@redhat.com>
Date: Thu, 4 Feb 2021 18:37:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210204150601.GQ549438@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.182, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Greg Kurz <groug@kaod.org>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Max Reitz <mreitz@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/4/21 4:06 PM, Daniel P. Berrangé wrote:
> On Thu, Feb 04, 2021 at 04:02:01PM +0100, Paolo Bonzini wrote:
>> On 04/02/21 15:50, Peter Maydell wrote:
>>> On Thu, 4 Feb 2021 at 14:47, Daniel P. Berrangé <berrange@redhat.com> wrote:
>>>> The distinction of contrib/ vs tools/ is supposed to be more a
>>>> reflection on the quality of the program.
>>>>
>>>> contrib/ should be considered demo-ware, no back compat guaranteed,
>>>> may or may not work, no testing guaranteed, no man pages.
>>>
>>> On this definition, why do we have any of it in our source tree?
>>> Interesting but unmaintained side things can live quite happily
>>> elsewhere (other peoples' git forks, blog posts, whatever).
>>> If we care about a bit of code enough to keep it in our source
>>> tree we ought to care about it enough to properly document
>>> and test it and give it a suitable place to live.
>>
>> That's indeed what happened with libvhost-user; it has graduated to a
>> separate project since it is okay for use in other (production-ready)
>> vhost-user backends.
>>
>> Most of the software in contrib/ is essentially a reference implementations.
>> They are "perfect" for that task, but not meant to grow more features or to
>> be used in production (compare vhost-user-blk with qemu-storage-daemon for
>> example).
>>
>> The other four can be classified as follows:
>>
>> - elf2dmp and rdmacm-mux should be in tools/, probably it's in contrib/
>> because nobody uses it and there's no tests so it might bitrot.

Why keep something nobody uses?


