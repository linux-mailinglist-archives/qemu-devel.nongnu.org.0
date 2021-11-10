Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B75A44C5C7
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 18:15:36 +0100 (CET)
Received: from localhost ([::1]:55984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkrCB-0000QQ-41
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 12:15:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mkr8b-0004eF-PI
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 12:11:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48049)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mkr8Y-0002xT-6A
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 12:11:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636564308;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IcksHdmFdF89ruMZ6fvC07UpNilYgw46xYq0LFhg8d0=;
 b=fes8eL6ME6sccwEo4QfNTs+OSTNamKIMOYiPzLbZC46EN3Jqh+7i+feNLyJOboTWq6cObw
 pCnpzk/Uu2O6tBEaHm+jWq+YMuoN8/zFy7q1uXyJUZroNaJOgjkX+F4CBOq3IpinVaguMT
 SIvUs8UMLQ+Q+deo7sdC2toP344c3P4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-332-rU72bxiaO-uyiCJuAZvkDA-1; Wed, 10 Nov 2021 12:11:47 -0500
X-MC-Unique: rU72bxiaO-uyiCJuAZvkDA-1
Received: by mail-wr1-f69.google.com with SMTP id
 v17-20020adfedd1000000b0017c5e737b02so566403wro.18
 for <qemu-devel@nongnu.org>; Wed, 10 Nov 2021 09:11:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=IcksHdmFdF89ruMZ6fvC07UpNilYgw46xYq0LFhg8d0=;
 b=WnRnYsVAzH8j1aTEmT9fm8NkL5XlAFlmltLOy2Dglizv8m3rAhKg+iL7POzd2yaTwT
 4QOd0P8XD8bfAy1XIGXyxwcHlCpBADg8R4JtOzQfk/4G/L0cY/5+0UYnwP4OHxJKPDtm
 tYaU53cwxSc9yOhgdJuUdqGWQ+eSEyoZTyFZpfcCM0MUu2gHDHlLgW4cgBP056HMPFRM
 GEWxxMn/ThsMRtbUmwo+azE2cLZRvodVrVGKNc4XIwuA1fm1HquIcvVV7sg9YWSL9B/7
 zb1avcpKPR/FoN4OoiyLsuUU3CdtkkQcUGUvBZu8Pzj4eZuADZ1KqL0RYeiZKmZA0u/H
 3HvQ==
X-Gm-Message-State: AOAM530+CKzYzdy2L4CXklERqSZGxdBpUCYMcfK5w6KXTYzTkR2ch4jZ
 85z3s43ZdEzlF8x7hUDj/i8BPQfgZ9Q+gqBBEfCMjj12Tul1k2JxfUGc3kQCQEz9SFZbhs0nH4Z
 VXT6jQSVgj+pDHbE=
X-Received: by 2002:a05:6000:381:: with SMTP id
 u1mr725350wrf.302.1636564306293; 
 Wed, 10 Nov 2021 09:11:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyGR600M3ZYdr6WPLuWQ9xsx9natZw0fgvQHxn+AO8qppE4Lp+qRGdG5g/uEbMT5qMS8aniBw==
X-Received: by 2002:a05:6000:381:: with SMTP id
 u1mr725314wrf.302.1636564306119; 
 Wed, 10 Nov 2021 09:11:46 -0800 (PST)
Received: from [192.168.100.42] ([82.142.14.190])
 by smtp.gmail.com with ESMTPSA id z6sm472426wmp.1.2021.11.10.09.11.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Nov 2021 09:11:45 -0800 (PST)
Message-ID: <d78f3993-cba2-fd06-fbc9-5d5fbb7550ee@redhat.com>
Date: Wed, 10 Nov 2021 18:11:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 1/3] qdict: make available dump_qobject(), dump_qdict(),
 dump_qlist()
To: Markus Armbruster <armbru@redhat.com>
References: <20211110135616.1188725-1-lvivier@redhat.com>
 <20211110135616.1188725-2-lvivier@redhat.com>
 <87bl2sugs0.fsf@dusky.pond.sub.org>
From: Laurent Vivier <lvivier@redhat.com>
In-Reply-To: <87bl2sugs0.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.678, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/11/2021 17:17, Markus Armbruster wrote:
> Laurent Vivier <lvivier@redhat.com> writes:
> 
>> move them from block/qapi.c to qobject/qdict.c, qobject/qlist.c,
>> qobject/qobject.c
>>
>> This is useful to debug qobjects
>>
>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> 
> I think qobject_to_json_pretty() is better suited to debugging, because
> it preserves differences like the one between the string "1" and the
> number 1.
> 

Yes, you're right. I didn't think about this solution.

So we can drop this patch.

Thanks,
Laurent


