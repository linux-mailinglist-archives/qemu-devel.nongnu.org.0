Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E32C1679696
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 12:28:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKHSw-000637-DO; Tue, 24 Jan 2023 06:27:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pKHSt-00062m-2q
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 06:27:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pKHSr-0004xz-JK
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 06:27:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674559664;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+LqR07n7/7KZfgtTJKykzlrC+DFrgRfswJGXoL4xlIQ=;
 b=HNs2Rnj8tW36DM78hnesuLUVkzssf3vmkxcOksOfW7G8NThsCGt/YQGtCnGg2D8ax2kExw
 mdkn3mrUqAeoU5h5SsG1bdr7mq8sSVxh2c+7Mcp65ivK+A6jOMmPo5q3H67ZUUyJHMHXgX
 5cKI1uBQgQom3+ZTheL+hubBziVlWEE=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-327-iUlpXtxHPj2uRqvGtTGS6w-1; Tue, 24 Jan 2023 06:27:43 -0500
X-MC-Unique: iUlpXtxHPj2uRqvGtTGS6w-1
Received: by mail-qk1-f198.google.com with SMTP id
 a3-20020a05620a438300b007069b068069so10713800qkp.2
 for <qemu-devel@nongnu.org>; Tue, 24 Jan 2023 03:27:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:references:cc:to:from
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+LqR07n7/7KZfgtTJKykzlrC+DFrgRfswJGXoL4xlIQ=;
 b=04NQeRSOjJdeTtvl1wkr9ZGvSo92QpvKir74DZ4TeUNOZJ3ZLTbQVBpgIvVZZtAZfc
 jpl7n1PpoawKZAQEiklmVDZDIjku1dObcUpJImg2x5fxxYHTiESKNGg0vRwX1yEFHNtI
 4aavWG/R+3q3Bt76V/PIzkz11gqSw8SRypTyK9y72juyGIeHAN6TA6KaWoLWUtYjo5sb
 x10Ak5fbljwF99GG3lJ/ahZydTaU5nVUa3tbmo/HsNY47DYxLsorWPfA5luyWNodEw8C
 xnc2YncQ1kSR4IyDekG9q6c1OHTIU3oDf3hQe7B/fxoLEWr2c3Gzih83G+vf7gJJI72N
 Rh8g==
X-Gm-Message-State: AFqh2kpdr29KeCD3yFaELNwYu/IznWklQIeIaJYvqOVvIYbo5pZuDHpi
 1EGKxZXPQ5i1BDKxUVkQ35I6ZzhgTxIhcYC0IKDbanftDNp//iXuzVkoY1hNOzpAcbNZWTm6a30
 nttU0zHJik5ZsNO8=
X-Received: by 2002:a05:622a:4316:b0:3b6:31e3:1a57 with SMTP id
 el22-20020a05622a431600b003b631e31a57mr35042956qtb.8.1674559663307; 
 Tue, 24 Jan 2023 03:27:43 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtzZ9FVP9ovipBSwVCB6F/7p8rKaDYuprQZqk+W/iKEgFi3YLHngpu7wyKBqEWQCK6J9XwhSA==
X-Received: by 2002:a05:622a:4316:b0:3b6:31e3:1a57 with SMTP id
 el22-20020a05622a431600b003b631e31a57mr35042936qtb.8.1674559663092; 
 Tue, 24 Jan 2023 03:27:43 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-179-158.web.vodafone.de.
 [109.43.179.158]) by smtp.gmail.com with ESMTPSA id
 i2-20020ac813c2000000b003b635a5d56csm1072453qtj.30.2023.01.24.03.27.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Jan 2023 03:27:42 -0800 (PST)
Message-ID: <4f30fcd1-a773-40af-48c3-0e017f85e079@redhat.com>
Date: Tue, 24 Jan 2023 12:27:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
From: Thomas Huth <thuth@redhat.com>
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
 Reinoud Zandijk <reinoud@netbsd.org>, Ryo ONODERA <ryoon@netbsd.org>
Cc: Bin Meng <bin.meng@windriver.com>, Stefan Weil <sw@weilnetz.de>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Biswapriyo Nath <nathbappai@gmail.com>, skrll@netbsd.org
References: <c2246b1a-51b3-2843-5164-c424c571874f@redhat.com>
 <CAJ+F1C+EC-tgDOyX5e56utKdUz-DXMMtwrtVyKXT2Jj4r43OCA@mail.gmail.com>
 <839268cb-b65c-68d6-1294-47548ed383b1@redhat.com>
 <CAJ+F1CJteJ665MLSUhWg-p9=tH6B7w-m=pop+o9ktGffxCiZaA@mail.gmail.com>
 <Y860hPT+o15BGQYq@redhat.com>
 <2bce671f-d91a-72ab-d38f-2e284d9d3ee2@redhat.com>
Subject: NetBSD and libfdt (was: Re: MSYS2 and libfdt)
In-Reply-To: <2bce671f-d91a-72ab-d38f-2e284d9d3ee2@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 24/01/2023 10.20, Thomas Huth wrote:
[...]
>>>>> On Thu, Jan 19, 2023 at 12:31 PM Thomas Huth <thuth@redhat.com> wrote:
>>>>>>
>>>>>>     Hi all,
>>>>>>
>>>>>> in some spare minutes, I started playing with a patch to try to remove 
>>>>>> the
>>>>>> dtc submodule from the QEMU git repository - according to
>>>>>> https://repology.org/project/dtc/versions our supported build platforms
>>>>>> should now all provide the minimum required version.
[...]
> Ok, I'll give my patch another try to see whether all the other systems have 
> a usable version of libfdt available, too.

... and I apparently missed NetBSD in my first research: Looks like NetBSD 
is still using dtc v1.4.7 which is too old for QEMU. (though 
https://www.netbsd.org/docs/software/3rdparty/ talks about v1.5.1, I only 
get dtc 1.4.7 in our NetBSD VM).

Reinoud, Ryo, any chance that you could get dtc updated to a newer version 
(at least 1.5.1) in NetBSD ?

  Thanks,
   Thomas


