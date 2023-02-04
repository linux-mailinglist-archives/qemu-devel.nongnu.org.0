Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E236768AC3C
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Feb 2023 21:10:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOOqn-00067s-61; Sat, 04 Feb 2023 15:09:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1pOOqk-000674-0c
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 15:09:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1pOOqg-0003U2-EG
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 15:09:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675541360;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jf15Z0oWZ5uZnXowr0Km0z0G542UirfT3y3/ttJT9ig=;
 b=aGDqNho49CVAW/Q47A+8KkIhl2f7WVOGGCQS2MCWzHzllSnU8eMnf4XbD2lBZzPYZVNSmE
 1F2G7Qcjf18ouD23JTZmH0vwyuv6tSCMzBk3LeKR0A0kMPT8Q9Sz6jP3Kf3DwvCczkk99Z
 dLPAdCqv7EuQnKMWhrYH2lwOTMIdkb4=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-44-fAlO-bEqOPqpU20l3RMqew-1; Sat, 04 Feb 2023 15:09:18 -0500
X-MC-Unique: fAlO-bEqOPqpU20l3RMqew-1
Received: by mail-qv1-f70.google.com with SMTP id
 e8-20020ad44188000000b0056976ba785bso2327452qvp.18
 for <qemu-devel@nongnu.org>; Sat, 04 Feb 2023 12:09:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Jf15Z0oWZ5uZnXowr0Km0z0G542UirfT3y3/ttJT9ig=;
 b=qBSC5LAvbcpRB/BqKALFXWNjgYDNp+feiaEsgCwT8nOnwZKzY5lMVnTDlT2Hy7NMbu
 OGG0o8tbb/kEs3ZVQjxJGDIrt6AosDs+DuVNUgi3oDc7fNgGe6tuLCUpwPOG7I8ioHxI
 qGE6Vs+smUgPLZuiA6bDnaIA1pLyFukSTS9sHgZQ4gO5hmwrm7LjFuXeAyxBWCshypCV
 gcyM/XSPFt58urj02vUgR7klBvkjTjCJFVYDVNl8ZrKAQOuh8xPiVa3Z1L9cGzWRtJre
 cv2k9+iTu8PcSzRvGRbQO9SJ9oqo5tSTbgftJmWPEx91JjoPaP4BawJ/Ua1FuKXQ+uqA
 6H6Q==
X-Gm-Message-State: AO0yUKVahVncgmx15Y+aAsEv1sbZu9lcZUAbmvTjRKBfJb/Edvd1ZD0G
 6XcgVoxTcfVcyv525h/oyxB7DpK5zcDM37SDcfeaq6vIbz9XdXXEdqfZGmWXtGsmW5g3G/ZIM03
 KK/612dJc9XWW0IQ=
X-Received: by 2002:ac8:590b:0:b0:3a8:1ba:b8ab with SMTP id
 11-20020ac8590b000000b003a801bab8abmr26251379qty.6.1675541358380; 
 Sat, 04 Feb 2023 12:09:18 -0800 (PST)
X-Google-Smtp-Source: AK7set9MQxQODWRec6Hn8MQ2SChsYmgzMa+aDY67FnASW8npPJFgX42+NgDP4cf5LcYqJDKsMQHUlQ==
X-Received: by 2002:ac8:590b:0:b0:3a8:1ba:b8ab with SMTP id
 11-20020ac8590b000000b003a801bab8abmr26251353qty.6.1675541358123; 
 Sat, 04 Feb 2023 12:09:18 -0800 (PST)
Received: from [192.168.100.30] ([82.142.8.70])
 by smtp.gmail.com with ESMTPSA id
 i8-20020a05620a248800b00727538eb831sm4387345qkn.86.2023.02.04.12.09.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 04 Feb 2023 12:09:17 -0800 (PST)
Message-ID: <fe517a25-b7fc-3227-fb1b-b10be66898f0@redhat.com>
Date: Sat, 4 Feb 2023 21:09:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PULL 00/11] Net patches
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>
Cc: qemu-devel@nongnu.org
References: <20230202062126.67550-1-jasowang@redhat.com>
 <CAFEAcA8TbQFZTG_M3djxiXD+42y8C=QtXrfO9jVEOY4V1PAGGA@mail.gmail.com>
From: Laurent Vivier <lvivier@redhat.com>
In-Reply-To: <CAFEAcA8TbQFZTG_M3djxiXD+42y8C=QtXrfO9jVEOY4V1PAGGA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 2/4/23 15:57, Peter Maydell wrote:
> On Thu, 2 Feb 2023 at 06:21, Jason Wang <jasowang@redhat.com> wrote:
>>
>> The following changes since commit 13356edb87506c148b163b8c7eb0695647d00c2a:
>>
>>    Merge tag 'block-pull-request' of https://gitlab.com/stefanha/qemu into staging (2023-01-24 09:45:33 +0000)
>>
>> are available in the git repository at:
>>
>>    https://github.com/jasowang/qemu.git tags/net-pull-request
>>
>> for you to fetch changes up to 2bd492bca521ee8594f1d5db8dc9aac126fc4f85:
>>
>>    vdpa: fix VHOST_BACKEND_F_IOTLB_ASID flag check (2023-02-02 14:16:48 +0800)
>>
>> ----------------------------------------------------------------
> 
> Something weird has happened here -- this pullreq is trying to
> add tests/qtest/netdev-socket.c, but it already exists in the
> tree and doesn't have the same contents as the version in your
> pull request.
> 
> Can you look at what's happened here and fix it up, please ?

Thomas and Jason have queued the patch:

   tests/qtest: netdev: test stream and dgram backends

For Jason it's because it's needed by

   net: stream: add a new option to automatically reconnect

For me, both patches (in tree and Jason's one) are identical to my v7
(except the one that is merged does not have Thomas' acked-by).

Jason, you can remove PULL 09/11 from your pull request has it is already merged [1]

Thanks,
Laurent

[1] c95031a19f0d ("tests/qtest: netdev: test stream and dgram backends")


