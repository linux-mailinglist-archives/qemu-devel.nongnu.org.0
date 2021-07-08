Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60C4C3BF917
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 13:33:24 +0200 (CEST)
Received: from localhost ([::1]:58556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1SHT-0008TF-0t
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 07:33:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1m1SGW-0007dA-KC
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 07:32:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1m1SGR-0007UD-Nn
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 07:32:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625743939;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rmCWjvIE7XKdjz+zPJYpMwmd1Klw7OVhAt8pvIztMuc=;
 b=cJCHwLovsUrbSbfPwEeV4RgGye7DpFyz7iPBFT9zDWGGPLTIe0NHxMyJ6/ENt6BdXBeTOj
 FYzyVA1gmKd2UbwwznCmrlmZ5JoIhk9QKYiU/2GF82JezlGTlBS+in8dLXSi6X2YTMMtbo
 KkwC3NzuVbdL3M4xzM8KkzdJVLEpV7w=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-319-7BxG3p3XMlCdc2j8bjOTTw-1; Thu, 08 Jul 2021 07:32:16 -0400
X-MC-Unique: 7BxG3p3XMlCdc2j8bjOTTw-1
Received: by mail-ed1-f71.google.com with SMTP id
 bx13-20020a0564020b4db02903a02214fad8so956649edb.1
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 04:32:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rmCWjvIE7XKdjz+zPJYpMwmd1Klw7OVhAt8pvIztMuc=;
 b=gZD8dzNzFNEhuaXs7beiOrSxBZUfu48vslD3PZZ3HZ8TTH1xtu1Oxd6p3LoKomwxAQ
 rC+xoif6+SOu4AE0BbGmzCtT7LJuWdBbKZEY/gMsAHYteEMji36tZpHS1dZabPVhjz4I
 Yop2HUgD3QG9e9drzSdg93Z6G6mEqDhM/WLpxFoQVvPPMfoQF89ytnEekqx8oPA5Bs1Q
 js+uLQZOBdhQuZAtHsFHqVHro39DoYRlPjkBCHE8rE7C4snWIYXZ7w5i7pdDhRYKdEU6
 kLcpMcLGdfxy8J5rkjFeHejet9U5EtjHBeWEiEYpsdIBRb01k2RA8UBxst5G2Q1AKQez
 HCwg==
X-Gm-Message-State: AOAM530kwvA8Tg/mjIu+8rnq2BJ4zo0o6F8UtzVKzkXtq1aJFl3uBVEx
 6XF56UhoOhMOUst2BBpez6C8Ix06TG62K0/t8bmPtpyc4q3KRlopmgXVKn8pLzKiKwb3HoSZiJC
 +GwRqjL2j9V6VbmU=
X-Received: by 2002:aa7:ccd2:: with SMTP id y18mr37846454edt.196.1625743934921; 
 Thu, 08 Jul 2021 04:32:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyjTaS4vMTQTvnkAn0CQMy0N8daJmmGee8gS+DgfPK/U2XHW1bZYmFvGUrDSCYAsCiu7ZYI4g==
X-Received: by 2002:aa7:ccd2:: with SMTP id y18mr37846417edt.196.1625743934678; 
 Thu, 08 Jul 2021 04:32:14 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id e2sm816142ejt.113.2021.07.08.04.32.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jul 2021 04:32:14 -0700 (PDT)
Subject: Re: [RFC PATCH 0/6] job: replace AioContext lock with job_mutex
To: Stefan Hajnoczi <stefanha@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>
References: <20210707165813.55361-1-eesposit@redhat.com>
 <YObVSuBjCEwSMvu7@stefanha-x1.localdomain>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <6dadca95-632a-61fa-4a91-c2df25e19b52@redhat.com>
Date: Thu, 8 Jul 2021 13:32:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YObVSuBjCEwSMvu7@stefanha-x1.localdomain>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08/07/21 12:36, Stefan Hajnoczi wrote:
>> What is very clear from this patch is that it
>> is strictly related to the brdv_* and lower level calls, because
>> they also internally check or even use the aiocontext lock.
>> Therefore, in order to make it work, I temporarly added some
>> aiocontext_acquire/release pair around the function that
>> still assert for them or assume they are hold and temporarly
>> unlock (unlock() - lock()).
>
> Sounds like the issue is that this patch series assumes AioContext locks
> are no longer required for calling the blk_*()/bdrv_*() APIs? That is
> not the case yet, so you had to then add those aio_context_lock() calls
> back in elsewhere. This approach introduces unnecessary risk. I think we
> should wait until blk_*()/bdrv_*() no longer requires the caller to hold
> the AioContext lock before applying this series.

In general I'm in favor of pushing the lock further down into smaller 
and smaller critical sections; it's a good approach to make further 
audits easier until it's "obvious" that the lock is unnecessary.  I 
haven't yet reviewed Emanuele's patches to see if this is what he's 
doing where he's adding the acquire/release calls, but that's my 
understanding of both his cover letter and your reply.

The I/O blk_*()/bdrv_*() *should* not require the caller to hold the 
AioContext lock; all drivers use their own CoMutex or QemuMutex when 
needed, and generic code should also be ready (caveat emptor).  Others, 
such as reopen, are a mess that requires a separate audit.  Restricting 
acquire/release to be only around those seems like a good starting point.

Paolo


