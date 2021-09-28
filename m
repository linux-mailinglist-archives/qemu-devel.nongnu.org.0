Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 533AE41B310
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 17:37:38 +0200 (CEST)
Received: from localhost ([::1]:39032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVFAn-0001zA-ER
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 11:37:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mVF8K-0000BR-HJ
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 11:35:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mVF8J-0005tu-0L
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 11:35:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632843302;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S3A5ldJ8NzA0o7NrsAMwMJaVmqXhR6r1Jb03eVPn9gs=;
 b=aAvuKiFuit9IYcwA4xUbbgpB2XlZ8w67lFAIA8EHgGjmb1t81Pf/34geOybkoHGls2lTDK
 FB4b1MQH1FS6oNrvQL8duIyUibCgsfRjtq+9KhIk6/FZIYMLHg91a69ZfMaeBEub0pTpNE
 nx6g+495Fp4QRE9TdYK/cdIs7b0Ymn8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-219-npMtAB2TNfSM2m5f4yWw2A-1; Tue, 28 Sep 2021 11:35:01 -0400
X-MC-Unique: npMtAB2TNfSM2m5f4yWw2A-1
Received: by mail-wm1-f70.google.com with SMTP id
 k35-20020a05600c1ca300b0030d13cecf46so364766wms.4
 for <qemu-devel@nongnu.org>; Tue, 28 Sep 2021 08:35:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=S3A5ldJ8NzA0o7NrsAMwMJaVmqXhR6r1Jb03eVPn9gs=;
 b=7M1XMlManbyboqi0LvfAY1LYSchlbjUoetfgfUvj1zImCnOrkI00fKBOd8NZLcGrQt
 2Z6HR97bnSsRsz6ayo8di8yYUS5i5R2Q95SN656rN6bg6G1Xns2Tr4IgAiBSFnzUS369
 T/sMxhbyvzZLKyqbZ6XJMlABSLNSeez3NzCi75add1UrdJ4VZc2Sv8d82Ifb78eGZjTw
 sZs+AIvf1aBnuPXyvhE8068+MaNxhr/qo+XR+SgPi+a4tmVG+SRu2NP10WV1C9FKnSFQ
 5h7Kuylt32dCbaNN1stulEXvYBfcjbEohvrWL5suhHA/Ttcc0OigbZTnv6ki4+9U3o93
 uQGA==
X-Gm-Message-State: AOAM531ZfAFYvPnmKN57wEt/Z/iRMxG7uaXt6L78dVWEXj+yMqqxd2qC
 TTUVcCF9GlUBgW33AWy6Ea8fmYfC7FwZqrFyDUPnqrAw0xpJaW2oTX8fKvlGpgJu3L8sos6xXEE
 zO512j/uv7pqfelk=
X-Received: by 2002:adf:a549:: with SMTP id j9mr775604wrb.353.1632843299820;
 Tue, 28 Sep 2021 08:34:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwzSj5cCO9mZh7HlkwIwRRUMr047N+GPGrQbk3yoY+2Z3sFJkebBknSX3HHG+aJTEhLcWEF8A==
X-Received: by 2002:adf:a549:: with SMTP id j9mr775564wrb.353.1632843299588;
 Tue, 28 Sep 2021 08:34:59 -0700 (PDT)
Received: from [192.168.3.132] (p4ff23aaf.dip0.t-ipconnect.de. [79.242.58.175])
 by smtp.gmail.com with ESMTPSA id l17sm1532097wrx.24.2021.09.28.08.34.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Sep 2021 08:34:59 -0700 (PDT)
Subject: Re: [PATCH v5 8/9] migration/ram: Factor out populating pages
 readable in ram_block_populate_pages()
To: Peter Xu <peterx@redhat.com>
References: <20210904160913.17785-1-david@redhat.com>
 <20210904160913.17785-9-david@redhat.com> <YVM1/nyZWvYLrCeE@t490s>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <88632fe6-cc2d-37f8-a341-9de70ac6c07d@redhat.com>
Date: Tue, 28 Sep 2021 17:34:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YVM1/nyZWvYLrCeE@t490s>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.562, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Pankaj Gupta <pankaj.gupta@cloud.ionos.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, teawater <teawaterz@linux.alibaba.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Marek Kedzierski <mkedzier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28.09.21 17:34, Peter Xu wrote:
> On Sat, Sep 04, 2021 at 06:09:12PM +0200, David Hildenbrand wrote:
>> Let's factor out prefaulting/populating to make further changes easier to
>> review and add a comment what we are actually expecting to happen. While at
>> it, use the actual page size of the ramblock, which defaults to
>> qemu_real_host_page_size for anonymous memory. Further, rename
>> ram_block_populate_pages() to ram_block_populate_read() as well, to make
>> it clearer what we are doing.
>>
>> In the future, we might want to use MADV_POPULATE_READ to speed up
>> population.
>>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
> 
> Reviewed-by: Peter Xu <peterx@redhat.com>
> 

Thanks Peter!

-- 
Thanks,

David / dhildenb


