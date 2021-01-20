Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A4A2FD28F
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 15:24:11 +0100 (CET)
Received: from localhost ([::1]:57912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2EP4-00046q-Gl
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 09:24:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l2EOE-0003UL-7s
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 09:23:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l2EOC-0005fN-Kz
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 09:23:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611152595;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/aaL/ybZ6ilyCTWPk2HD6W48wHLPYjbQ+l+NBzkrMn0=;
 b=U2sQq6PRSL7e8qAfw5IlGCsUmZD+4DsFIlcDkadFn4LkKfSEPYs2AwRxIiinmFu6NX6r+B
 2GuJYRdJcrBvuElageTU7WchLlGYpg9Mc6uMNctNqDLqxiq9lFU+y1ysgZSmpw9iA8cLxH
 otaLt/fd8hy5dDgjVfXKuTAsyAbMzNw=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-482-TONnXjInNGOaoijy8gqBtw-1; Wed, 20 Jan 2021 09:23:13 -0500
X-MC-Unique: TONnXjInNGOaoijy8gqBtw-1
Received: by mail-ed1-f70.google.com with SMTP id l33so11118407ede.1
 for <qemu-devel@nongnu.org>; Wed, 20 Jan 2021 06:23:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/aaL/ybZ6ilyCTWPk2HD6W48wHLPYjbQ+l+NBzkrMn0=;
 b=p00jVothzjEDBHrPpb0As3HWMapFJ6f2B069rvpusJHN2JAgumQGFQjlLfVOAgi++H
 SuW+LS71WWn+ywGGXAT//S9i7GINL96CCi+26OsIY35XWHL3HbCC1jYrx+6ulrosW7T+
 z9+eG7vC1lzFvn8RGRjJKYbodOYT+Tq6jYK5rp8SQYw27RwJEM3bSHobHOaTcSNhbyo4
 2IcVIoEeIjRyabu/+IEsW7oHtTzIcOhXzYUErzNNqF0KTVJbYpt8xAa2IkcXNHkFgx5D
 hzMdybou6fmtK/N0UoOqnJU6YtDbYpVuedWVmWPEZQ1XBeJxWJCzrmW93c+uv6Le0wWW
 UEtA==
X-Gm-Message-State: AOAM532M25BKLyhXKxtNASBjO/8EDvy9yql2OVHFkowZZmmK1/j2DuWx
 i3ySqTz8yQBbBVqTOswfK6PT0hYMc8/2OJIkPK0PggO+GR6u/9m5dHiRpFzDJD/ySMX3oCGRSiB
 Zy8LfPCablm5vstVwAZOJsfS0FyUd5y6PKcJH/G3gH172i2APxI3nF+YWb0dxK6Nm
X-Received: by 2002:aa7:c94a:: with SMTP id h10mr7483003edt.247.1611152592345; 
 Wed, 20 Jan 2021 06:23:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz7VtF/hVHwO4jN3WAv1TSZ53j4AanlDi/SMKNG00w7RdOJyJx5sO2Jr0Vk9dxNv6wC4f29SQ==
X-Received: by 2002:aa7:c94a:: with SMTP id h10mr7482992edt.247.1611152592152; 
 Wed, 20 Jan 2021 06:23:12 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id o17sm1212379edr.17.2021.01.20.06.23.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Jan 2021 06:23:11 -0800 (PST)
Subject: Re: How to run crypto benchmarks tests?
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <c72a38ac-d164-9357-4eda-2334c496c555@redhat.com>
 <20210120130624.GI3015589@redhat.com>
 <5a7feef9-fc27-c72f-ea59-5f45ddfc5c83@redhat.com>
Message-ID: <b7fb8509-4c5d-4392-a357-f8757bb25ce3@redhat.com>
Date: Wed, 20 Jan 2021 15:23:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <5a7feef9-fc27-c72f-ea59-5f45ddfc5c83@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.094, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/20/21 2:58 PM, Philippe Mathieu-Daudé wrote:
> On 1/20/21 2:06 PM, Daniel P. Berrangé wrote:
>> On Wed, Jan 20, 2021 at 01:50:48PM +0100, Philippe Mathieu-Daudé wrote:
>>> Hi,
>>>
>>> Using the following "build tools and doc" config:
>>>
>>> ../configure --disable-system --disable-user

So when using --disable-system, tools have to be explicitly selected
with --enable-tools.

>> Either way, all of this is surrounded by 'if have_block' in tests/meson.build
>> which should apply if you have tools enabled or system emulators enabled.
> 
> That helped:
> 
>                       block layer: NO
> 
> I'll see why the tools are not automatically selected.
> 
> Thanks,
> 
> Phil.
> 


