Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E2C2F66A6
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 18:06:26 +0100 (CET)
Received: from localhost ([::1]:44060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l064n-00013J-Qc
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 12:06:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l05qN-0005ul-EZ
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 11:51:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23611)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l05q7-0002SI-MJ
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 11:51:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610643073;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EeRmWE8z2jwv1uv019vv8OZzPSKJ93t6AkTxknfHXRI=;
 b=Q59/4iYUwTE22LItsEdP26Mu4lcm+88YsLpsTuvy/AsyUjbqjDomQ5bagVtQHhbTwZJT9p
 xS1MxiocoxEl9QwLB5lLgthCbKlfxzaMerMs/GyKUvKYmhZMdWphQgsoHuOcXxJeANQLvP
 Xlk9CGL4z0hdINswQwf/Fs3yws5Kods=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-592-L4AmA8MSOTWd4W6P8LZ4vw-1; Thu, 14 Jan 2021 11:51:11 -0500
X-MC-Unique: L4AmA8MSOTWd4W6P8LZ4vw-1
Received: by mail-wr1-f69.google.com with SMTP id v5so2864331wrr.0
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 08:51:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EeRmWE8z2jwv1uv019vv8OZzPSKJ93t6AkTxknfHXRI=;
 b=RRiT/3rgK35ZDMjm6R0C+VBVMFVUqPjcTr1bYfCd/Xh8Hh/FtmlhkFC9jPyoolo8ta
 U/J/GIET97uoLzA4anVsT8dZ1tcfhCY5EiyPuft9yxXN68Rq7tNRNp2eJWKRJgJMWTGq
 IOYgPo3YpkCAFEo1gL8Gbb47SVt4HVOMW5HhjLlwp758O/Xw2l2BwzHKKbpct9V9wnaJ
 E2+Ukv9DJT0IvfqnvkkFx9RlLgY+l8JFwaAhybQbhEZOcoKSSUp7G0UKM6S7PrFQ4rtp
 NvRV8njACl7v2Z4ykGWGcIx0zlmwZpPzj+7SjYxNqRxL1A0+Mrp9MQYS+2sr0iZWkcP9
 NMig==
X-Gm-Message-State: AOAM531Y8Zn+fgfWM0c3SKDm4VNc6LxJ0/rRaZR/hX/z17Eaf03ioG6u
 Zo4q9BPRZ7QdwVD7PC0cC4ApAN2DAnvkOWAEEDOsBtvKmQVTHgvzojbZpQaN8kQLCOZHJ28CIev
 gFfwIA6G+ma/b73k=
X-Received: by 2002:adf:94c7:: with SMTP id 65mr8617631wrr.423.1610643070681; 
 Thu, 14 Jan 2021 08:51:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyP+NYf1Z1HZTLUb06pwNKb0WEb38eOt42nQnTZJmKvfeJByyGxYq3Xcvf16PuRz0qTGvUy3w==
X-Received: by 2002:adf:94c7:: with SMTP id 65mr8617614wrr.423.1610643070517; 
 Thu, 14 Jan 2021 08:51:10 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id z8sm10350443wrh.65.2021.01.14.08.51.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Jan 2021 08:51:09 -0800 (PST)
Subject: Re: minimal "zero conf" build dockerfiles for fedora:latest and
 alpine:latest
To: Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
References: <a2f5077b-ae74-2b39-4fb8-70d29dd549eb@redhat.com>
 <c1e768d9-24fe-f414-f684-1b1c908c09ce@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <1df7f1bc-187c-a91d-b81a-b51654e8573c@redhat.com>
Date: Thu, 14 Jan 2021 17:51:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <c1e768d9-24fe-f414-f684-1b1c908c09ce@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.237, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/13/21 9:20 AM, Paolo Bonzini wrote:
> On 12/01/21 23:37, John Snow wrote:
>> - our configure file suggests bzip2 is an optional dependency (It's
>> set to 'auto') but meson will error out if it is not present at
>> configuration time:
>>
>>      ../pc-bios/meson.build:5:2: ERROR: Program 'bzip2' not found
> 
> Yes, the configure option is for libbzip2, not bzip2.
> 
> Perhaps bzip2 could be required only if get_option('install_blobs') is
> true, I don't know.

Yes, OK.


