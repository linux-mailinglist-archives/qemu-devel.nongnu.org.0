Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30442436893
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 19:01:29 +0200 (CEST)
Received: from localhost ([::1]:37664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdbRY-00012d-AC
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 13:01:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mdbNV-00061Z-5f
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 12:57:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mdbNM-00025d-Nt
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 12:57:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634835421;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r4GVbsKIeSZDbkstDXnV7HZhqdaEToErIthiFae2CoA=;
 b=bfU6FAXGlY8HfK9z5/d61DntCn/Rj2v8stG3zaLjR09xadiZ67F590ppC0qr9JADYYdsNS
 mvhwfIQxc7pAIxzo3x8VOhpJHeWmVHZnzTz9Sjf7Hb3m0XfLuiQtTHOCqmhsVEFVsTMHW3
 lqf8cnfW+SO7uUt7d8LNzDUDuXyPXkM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-481-yI77cPC5MEq9Xk4wQ3KOlA-1; Thu, 21 Oct 2021 12:55:02 -0400
X-MC-Unique: yI77cPC5MEq9Xk4wQ3KOlA-1
Received: by mail-wr1-f70.google.com with SMTP id
 s18-20020adfbc12000000b00160b2d4d5ebso108730wrg.7
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 09:55:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=r4GVbsKIeSZDbkstDXnV7HZhqdaEToErIthiFae2CoA=;
 b=7P/yBk3p7l7QvE4SVfJM65TJ/rfe4Y+KL2DPTWzpZsknufsTNTuc6f/eRA2/G7By47
 +3hC9lfI5pLQmVwaT+zJx6FEOejqqgFsWkl1vw01ZKGT/tDt9cxadflmIqKMLyl7ZErM
 aBvvJVNCpfJAkFCHpl2yV2MNg+EJsf4e/a/ihpjfAM4c4ZytzsvKHTWgc66r4LqRxQE8
 ZhkMm3FvL/CwQmfDdLp+MnAMyHdRi4rN6aN+qWB6Cm9oFErgLrwI6q+mEFbhI63xjMdv
 44cUKUNtoXJE7TgG7UtI02R6thPwzHZTNKce5Y/TCOXo2lemXiWpKTA9MQytbRIjk5k4
 Kztw==
X-Gm-Message-State: AOAM533GI1+41b1zvi+DlRCn1R3AjauvkqUUYBtGTVWWgviueMdscGUk
 4FRnrzXJLoGAT4+J0hw8vuHAMJ+pZDH2qBky/BOFiZVVOvjHJh2I+bvWJtfY18Z6MwBWTlHNDzF
 5/oC1M+Xys9CRiYw=
X-Received: by 2002:a05:600c:19cd:: with SMTP id
 u13mr22044966wmq.148.1634835301426; 
 Thu, 21 Oct 2021 09:55:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxgI/atV20upLbW1CIZqNSFLbnNKJLHIkEAphktoPwLrScR0TqlczJ5lze9G7Gx/kSNfGp2Tg==
X-Received: by 2002:a05:600c:19cd:: with SMTP id
 u13mr22044928wmq.148.1634835301149; 
 Thu, 21 Oct 2021 09:55:01 -0700 (PDT)
Received: from [192.168.3.132] (p4ff23aba.dip0.t-ipconnect.de. [79.242.58.186])
 by smtp.gmail.com with ESMTPSA id n9sm5896957wmq.6.2021.10.21.09.55.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Oct 2021 09:55:00 -0700 (PDT)
Message-ID: <0a475bcd-b501-e7c4-b2ff-11fae7f6b208@redhat.com>
Date: Thu, 21 Oct 2021 18:54:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 0/4] vl: Prioritize device realizations
To: Peter Xu <peterx@redhat.com>
References: <20210818194217.110451-1-peterx@redhat.com>
 <2817620d-facb-eeee-b854-64193fa4da33@redhat.com>
 <YXDqaZL71DCEghbr@xz-m1.local>
 <12cdd7f4-16c2-5af8-aeb2-e168506eefc2@redhat.com>
 <YXEeEFuovkNqRRMu@xz-m1.local>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <YXEeEFuovkNqRRMu@xz-m1.local>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -56
X-Spam_score: -5.7
X-Spam_bar: -----
X-Spam_report: (-5.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.867, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21.10.21 10:00, Peter Xu wrote:
> On Thu, Oct 21, 2021 at 09:17:57AM +0200, David Hildenbrand wrote:
>> I know, whenever someone proposes a way to tackle part of a challenging
>> problem, everybody discovers their hopes and dreams and suddenly you
>> have to go all the way to solve the complete problem. The end result is
>> that there is no improvement at all instead of incremental improvement.
> 
> Yeah, there's the trade-off; we either not moving forward or otherwise we could
> potentially bring (more) chaos so the code is less maintainable.  Before I'm
> sure I won't do the latter and convince the others, I need to hold off a bit. :-)

Sure :)

>> I'm not planning on letting the user set the actual number of memslots
>> to use, only an upper limit. But to me, it's fundamentally the same: the
>> user has to enable this behavior explicitly.
> 
> I'm not familiar enough on virtio-mem's side, it's just that it will stop
> working when the ideal value (even in a very corner case) is less than the
> maximum specified, then that trick stops people from specifying the ideal.  But
> if it's bigger the better then indeed I don't see much to worry.

Usually it's "the bigger the better", but there are a lot of exceptions,
and error handling on weird user input is a little hairy ... but I'm
playing with it right now, essentially having

"memslots=0" -> auto detect as good as possible
"memslots=1" -> default
"memslits>1" -> use user input, bail out if some conditions aren't met.
Especially, fail plugging if there are not sufficient free memslots around.

-- 
Thanks,

David / dhildenb


