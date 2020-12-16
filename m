Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A45662DC30A
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 16:25:39 +0100 (CET)
Received: from localhost ([::1]:46732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpYgL-0005Ap-FI
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 10:25:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kpYeI-0003sv-F4
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 10:23:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:22649)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kpYeG-0006AM-Jt
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 10:23:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608132207;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v9G6J/v1zHg+Vq+Ag6ihYebHFjkABINqn63k9VUU768=;
 b=ZhQt2p2mHfFIgj6DQBpUoLJTZB8+VU1hWBCz0Eg6yI1+Viyu5tnpkllAiMuaR3BNO5nROT
 prhRabd3oXjgjWINeOukbIUaBffkFiNN6+c7eWRcr8FS7hi02Qz4QpviqeatrpeIV/v5JQ
 5lL+SefSKqWN1T9GNsfBgOKC+9FENG0=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-536--9wh6jHWNZ25hitACVqvkw-1; Wed, 16 Dec 2020 10:22:12 -0500
X-MC-Unique: -9wh6jHWNZ25hitACVqvkw-1
Received: by mail-ed1-f70.google.com with SMTP id h5so11929367edq.3
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 07:22:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=v9G6J/v1zHg+Vq+Ag6ihYebHFjkABINqn63k9VUU768=;
 b=go9ijyX9Db3DDhpkQwB2K2n3tzveIyGp68dLHQkd1y00+df0Y6fLVJE0rSW2j5SiXS
 hllhFJ9aqS5e+tUcPu775UnT1KE61//81q+tUuqf/YiVNToSWMlVNytarvfbcY6gR+p8
 SSz7AAe9YyA90Nh2sX8SWgjkG7Lg2wigJu8q0sMtpqbiEEzcKREcWlMnbbkXtSoX2wZR
 DMx5sGbX1Ubr9jg0ZbxR88U7phX6kGw17kJPGq5Ih+1v25RtZ5CFdCb9GyeExEaFhodU
 vYnyp8dt2qjrnPmq66Q9OgYkzsbgxyDm/QddEyXA9f3x9GrY9z3RjPvlm7U9nzBogdGh
 1fQQ==
X-Gm-Message-State: AOAM531GSSCjJ7ejE/GJJcsBqHQtXlTZ8VpLYtpRSvEkU6V4orhFklCy
 4lL0FwUWxHVt6LMZtpaJQWQvZsqooKQXY7Pb7HfGsk96X7Zv3Vp1B3xIBmbWaEQS2hxVTOOoWc7
 NnScLFMabZN3H8DQ=
X-Received: by 2002:a17:907:444f:: with SMTP id
 on23mr31811168ejb.300.1608132129403; 
 Wed, 16 Dec 2020 07:22:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyVJ+ffrFpTToRRsPkkaPPMjg30mXRAwzy+M7JeDh27S2L4j9TykXN+CzY7bIB8/ncJhkZlHA==
X-Received: by 2002:a17:907:444f:: with SMTP id
 on23mr31811147ejb.300.1608132129196; 
 Wed, 16 Dec 2020 07:22:09 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id n9sm20689721edy.83.2020.12.16.07.22.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Dec 2020 07:22:08 -0800 (PST)
Subject: Re: [PATCH 3/3] trace: do not include TCG helper tracepoints in
 no-TCG builds
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20201216135529.265165-1-pbonzini@redhat.com>
 <20201216135529.265165-4-pbonzini@redhat.com>
 <98e787e4-884b-61c5-bf52-b041f57747c3@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <a4974b10-ba71-8bd7-e5a9-6eef7543cee4@redhat.com>
Date: Wed, 16 Dec 2020 16:22:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <98e787e4-884b-61c5-bf52-b041f57747c3@linaro.org>
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
Cc: philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/12/20 16:13, Richard Henderson wrote:
>> @@ -71,7 +71,7 @@ foreach d : [
>>                   input: meson.project_source_root() / 'trace-events',
>>                   command: [ tracetool, '--group=root', '--format=@0@'.format(d[1]), '@INPUT@' ],
>>                   capture: true)
>> -  specific_ss.add(gen)
>> +  specific_ss.add(when: 'CONFIG_TCG', if_true: gen)
>>   endforeach
>
> Sure, unless it makes more sense to conditionalize the entire loop, so that
> those targets aren't even created?

The targets exist but the files won't be created (the rules will be in 
build.ninja but they'll be orphan).

Paolo


