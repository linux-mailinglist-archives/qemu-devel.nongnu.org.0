Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B71FE325E72
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 08:50:57 +0100 (CET)
Received: from localhost ([::1]:49328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFXto-0005s2-7k
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 02:50:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lFXrs-0005Pw-JR
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 02:48:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41491)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lFXrp-0002ip-5A
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 02:48:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614325731;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4e2jGYbLP11uTuyttoNuf2uW9qPgDS/zotDX/zE0EdE=;
 b=GLYgWNZpsbLDMMEIegaNK3CtqeBNMx0BY5AWtCg1V75xP64dFa6f9giAgU0IXQlLLrV8Xy
 kez75QI8KjlsxsTQEO8R8BTxoc+J4TSZV2JL/ZYsjC+6px8JPR76a4iPeAiY+Rno20KUh9
 jvFmyKy3W3ntUYbHO5SPD2qGC2PFDnI=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-24-pCj6Nf1iPrCOpCoQIE3ErQ-1; Fri, 26 Feb 2021 02:48:47 -0500
X-MC-Unique: pCj6Nf1iPrCOpCoQIE3ErQ-1
Received: by mail-ed1-f72.google.com with SMTP id y90so4108049ede.8
 for <qemu-devel@nongnu.org>; Thu, 25 Feb 2021 23:48:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4e2jGYbLP11uTuyttoNuf2uW9qPgDS/zotDX/zE0EdE=;
 b=LreHnlfiV7qjBlWlNH9d7NJThyBs6w7LXGf4pZdw9h9YdfOIcmryZMq07pAj5w+Sd5
 AKJIF6EpLuKe8oisxZnLiMB6YjmkOTIrMKO1R7AgrYrsWj/3NpgshGDsQ+cggLBp//Jb
 ALadytyjRYPYjoaFxJ2QxykoK6eHQ0CObQiDbgxMFTVvN7Oe85Q+vxpu2vtuMWY+wJ83
 wA4S6CRpArKqzJHA68koJ8qJFYkU9kN4X6rS6eCM3lhghq/lqOabHP6lZDbPKWnr3j5G
 93ypo1ejEgkrOkELWAYHmUCVJUb8BL37kiPCSb3hKuhkNIFdiG4Ek69fnXNHQMnghfJi
 zMbg==
X-Gm-Message-State: AOAM531bx8RFquF9AV5bNsxV5L2YhkruKORg0F+I54lwJsD2nKXbNUTm
 elKYxXpQdFPnKBKYvffExHxgr/KgWk1IBctOhfKsaIuwtQnowBvBRPjHkiFp9ZT2G+odmSRyj4Z
 3M2/O+5Xm8cGm1XI=
X-Received: by 2002:a17:906:30da:: with SMTP id
 b26mr1907677ejb.376.1614325726080; 
 Thu, 25 Feb 2021 23:48:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwPQkvewjUNN6pYaijieoo8vFz6oo6NJ7cOH7PP2ZOwNxq/VxA+mgoJPBL2UOjssZIUeMob6g==
X-Received: by 2002:a17:906:30da:: with SMTP id
 b26mr1907657ejb.376.1614325725888; 
 Thu, 25 Feb 2021 23:48:45 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id f9sm2638980eds.91.2021.02.25.23.48.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Feb 2021 23:48:45 -0800 (PST)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Jag Raman <jag.raman@oracle.com>, Stefan Hajnoczi <stefanha@redhat.com>
References: <20210224122306.451764-1-pbonzini@redhat.com>
 <72fc7d76-f8e3-2c0f-e890-99509bb6230d@redhat.com>
 <e89873e7-d996-0161-8c4f-587aadd2208f@redhat.com>
 <YDfRz3zhkoTiyoKt@stefanha-x1.localdomain>
 <C3EAD382-8A3B-4DC7-9982-CC1DDAEEF4B7@oracle.com>
 <cd96210d-58bc-2978-02bc-b7ca794f7274@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] multiprocess: move feature to meson_options.txt
Message-ID: <08381101-fde1-dc5c-8156-32e90b21fee3@redhat.com>
Date: Fri, 26 Feb 2021 08:48:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <cd96210d-58bc-2978-02bc-b7ca794f7274@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.435, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John Johnson <john.g.johnson@oracle.com>, Thomas Huth <thuth@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 26/02/21 00:16, Philippe Mathieu-Daudé wrote:
>> I personally don’t have any preference for the name.
> Great.
> 
> So with the summary/description updated as:
> 
> summary_info += {'Multiprocess QEMU (vfio-user device backends)':
> multiprocess_allowed}
> 
> option('multiprocess', type: 'feature', value: 'auto',
>         description: 'Multiprocess QEMU (vfio-user device backends) support')
> 
> Reviewed-by: Philippe Mathieu-Daudé<philmd@redhat.com>
> 

It's not yet vfio-user.  For now I can put "out of process device 
emulation"; however, if the protocol is going to change, I wonder if it 
should be disabled by default.

Paolo


