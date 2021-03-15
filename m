Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A4C33B210
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 13:05:55 +0100 (CET)
Received: from localhost ([::1]:52600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLlys-00039b-J5
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 08:05:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lLltW-0001ET-LD
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 08:00:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:29979)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lLltU-0005iZ-Op
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 08:00:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615809616;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kil8kgBekEk3iU+YOO+dt4K9VYlSHazY8KtTNOOyU6U=;
 b=GM+WYly//ungypHFBaQo9UcMxLVur7L3eZdeR1wsZa54qe867OxzL4ARB7RhdGVbsE2qT3
 gPWZP9BeQxz23LPSBqMjacKxYt3w3Yf3YIFP0/kv2oPCaqqxhFZZxpdLcLCQGHUsQh7p8q
 yArfKmQFEnvJrgvnPdgjRS8BWlZP2pY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-598-qr2QmNciO-6tAuQM835tpQ-1; Mon, 15 Mar 2021 08:00:13 -0400
X-MC-Unique: qr2QmNciO-6tAuQM835tpQ-1
Received: by mail-wr1-f72.google.com with SMTP id y5so14994337wrp.2
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 05:00:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kil8kgBekEk3iU+YOO+dt4K9VYlSHazY8KtTNOOyU6U=;
 b=dz7dSYdDyzrTU8c309yztgiciA0u7v1rMvp+WL9Rnp4y8UKjzzxGsmEiiImtdGH/Vm
 c6NKF4FPgwm/57Pp0hACp5iMrX5gHrqrJxDjpgpguw3845HLqeqQmElNdS2eXvdxF4Fl
 tVuuHqb12Tghm5yS8mKekututDvRbNf1+sFWWCCc59NfwUikTWa7i0erJ9s0n7LQkDEO
 Yd+gIYn0csVaDq00m6GQe5LnMzrAKMA+GGV2LburkmzKIYlxBTe9qBufJWnzqETzfuFL
 ReFWlxy323ghGxaL/4SUD+r2iKEGdDy+9IZ20SYWd9QugXZomyNfY0WBeS9uTxRXvt44
 R/MA==
X-Gm-Message-State: AOAM531fzNqQAgFlc/18Yqbf6rlStQ8dH8NUvEAFwDIUU2w7zll8kkQb
 baaujM14a6H0Y7IwTneLMXi5Lb8LSlbmw/mH3sDz6oqJssZguEsWan6I0zA/2T54uEH0LN+wxO3
 TQ9Wz9FnTVC7ccI8=
X-Received: by 2002:a1c:c244:: with SMTP id s65mr26248756wmf.2.1615809612242; 
 Mon, 15 Mar 2021 05:00:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy++tdLocHRRtkZh5VhukboetqeFZUmz37rsMPmLB5EF54TZg8QoO8kSH3bX7vtWEdot6nxOg==
X-Received: by 2002:a1c:c244:: with SMTP id s65mr26248742wmf.2.1615809612113; 
 Mon, 15 Mar 2021 05:00:12 -0700 (PDT)
Received: from ?IPv6:2001:b07:add:ec09:c399:bc87:7b6c:fb2a?
 ([2001:b07:add:ec09:c399:bc87:7b6c:fb2a])
 by smtp.gmail.com with ESMTPSA id n23sm19002108wra.71.2021.03.15.05.00.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Mar 2021 05:00:11 -0700 (PDT)
Subject: Re: [PATCH] qom: Support JSON in user_creatable_parse_str()
To: Kevin Wolf <kwolf@redhat.com>, Markus Armbruster <armbru@redhat.com>
References: <20210312131921.421023-1-kwolf@redhat.com>
 <87blbnxz2f.fsf@dusky.pond.sub.org> <YE9Lhbxbi8Nf4soz@merkur.fritz.box>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <bed70d6e-7b51-1e39-ae62-3eb62d1098bd@redhat.com>
Date: Mon, 15 Mar 2021 13:00:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YE9Lhbxbi8Nf4soz@merkur.fritz.box>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: pkrempa@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15/03/21 12:56, Kevin Wolf wrote:
> Am 13.03.2021 um 09:00 hat Markus Armbruster geschrieben:
>> Recommend
>>
>>      qom: Support JSON in HMP object_add and tools --object
>>
>> to put the most interesting bit right in "git-log --oneline".
> 
> Makes sense. I've updated my patch locally, but Paolo has already queued
> it. Paolo, can you update the subject line accordingly?

Ok, done.

Paolo


