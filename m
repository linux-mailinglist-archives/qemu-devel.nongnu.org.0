Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5006A2B993F
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 18:26:11 +0100 (CET)
Received: from localhost ([::1]:48266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfnhB-0001h1-Sf
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 12:26:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kfneu-0000x5-Ho
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 12:23:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57357)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kfneo-0006Lb-H4
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 12:23:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605806615;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5Sp9cOJ9Yc8t/P1YWE0UWYesvO9/dk6WOszL8jP5YEw=;
 b=eoEe6fwIpLrzxQO5f3PpXdGGDslxoRysYNAnMfjwOCDkTXZ8lkJjemRzsxWUm16nrRn2D+
 TzntpK72mnfRfe8anLtLKseb3i6wLV2RI0ej7OOc9eH5Lgy3quJ7t34NzIHGAaXDAQMNmJ
 CcU0Iq1Lc5Ktcgh23rgZOUviONLWdF4=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-448-TOZnvl92Mb6PeiVddhDjig-1; Thu, 19 Nov 2020 12:23:33 -0500
X-MC-Unique: TOZnvl92Mb6PeiVddhDjig-1
Received: by mail-ed1-f69.google.com with SMTP id d3so2617795eds.3
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 09:23:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5Sp9cOJ9Yc8t/P1YWE0UWYesvO9/dk6WOszL8jP5YEw=;
 b=GFtFi6jyWtSw44hB3iZ82EJhk1lHoTZ/A4UjN0HrG7NlG1zy0Fw6W6lJupnkXlD+Xg
 DG3/q3iwL9gw2pSCK0ak2RyoyZ8r160MRi5sQQOyNWQMwzsbhcuQVxbQGMJDxeLa9933
 VTM1mV3eNZeKPcm5Ec+F5GxdsHMq+9UGqWZZYxJ5h18pwzLAlbTVhZYYlt6lJ1dY5fna
 8Taaz4jCMIn7VlbUGhYFzc7M7In//yO7ci9Eo46Qo4m6KoiTKpCbBUCc5O79mVC00Hos
 EVU7ZRh64BkbahqguiXTjnVou1ROT4Jky0S4i1rJEZUlRd3iJKDirk0oqZxhSsaE6Wxf
 lqoQ==
X-Gm-Message-State: AOAM530J3AgX2fN21CXAj6mhT/2ydXF4xioDx+Otw4AqfOzyPJv1rrZU
 bUsEUS9UxuFmgNYqH8kvh4+FCiJwl5rLjE2emkgHhMJvSJvu/Tue1VVby2mvAMh9kWKtDKBKdCc
 HyQlC8QP94RwV1J0=
X-Received: by 2002:aa7:d2d2:: with SMTP id k18mr30574733edr.290.1605806612641; 
 Thu, 19 Nov 2020 09:23:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxfpK/d4QDi/OLAllzINFvWCd3M9f4QlryYlN3tWLbfxZvZWdb4Qk4nK70y1piSbpjp/e0RfA==
X-Received: by 2002:aa7:d2d2:: with SMTP id k18mr30574714edr.290.1605806612373; 
 Thu, 19 Nov 2020 09:23:32 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id k12sm145364ejz.48.2020.11.19.09.23.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Nov 2020 09:23:31 -0800 (PST)
Subject: Re: [PATCH v2 0/8] qom: Use qlit to represent property defaults
To: Eduardo Habkost <ehabkost@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
References: <20201116224143.1284278-1-ehabkost@redhat.com>
 <87eekpbjvt.fsf@dusky.pond.sub.org> <20201119171342.GT1509407@habkost.net>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <981fb59f-ad67-886c-40e7-6f129997f4c7@redhat.com>
Date: Thu, 19 Nov 2020 18:23:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201119171342.GT1509407@habkost.net>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19/11/20 18:13, Eduardo Habkost wrote:
>> What's left?
> Enums.  Enums properties are a mess to implement, and I plan to
> tackle them later.
> 
> On all other cases, the external representation of the property
> value is similar to the internal representation.  In the case of
> enums, the external representation is a string, but the internal
> representation is an integer.
> 

I would have expected a string QLit to work with enums, is there a 
reason why it doesn't?

Paolo


