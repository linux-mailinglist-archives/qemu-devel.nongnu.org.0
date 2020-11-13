Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF342B1932
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 11:40:21 +0100 (CET)
Received: from localhost ([::1]:55756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdWVA-0006Vs-3T
	for lists+qemu-devel@lfdr.de; Fri, 13 Nov 2020 05:40:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kdWUB-00064v-PB
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 05:39:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55297)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kdWUA-0003h5-45
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 05:39:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605263957;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ReopLxip73tgBD0t4Qs2xqduFdOZZgB3kWw6DKax++k=;
 b=Nj7ui9bx6AnhvoeyIr7C58t4knzRVyn+MWFMqrrZTsZTmon4tgm1NQYoBnJ7uxqbev7SSh
 CPrEl2HGOKp6IVbHToYVah+dWRRXyBWPZ6B8OtyIYKzKlkHBb0Ssgfw4uLKfYTHGma8mcx
 ew3PyJdo64H3y7JLwhmzpjrTeTvwgqk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-393-GbcYYK7pMWafJlRsizp2Dw-1; Fri, 13 Nov 2020 05:39:15 -0500
X-MC-Unique: GbcYYK7pMWafJlRsizp2Dw-1
Received: by mail-wr1-f70.google.com with SMTP id w5so1339124wrm.22
 for <qemu-devel@nongnu.org>; Fri, 13 Nov 2020 02:39:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ReopLxip73tgBD0t4Qs2xqduFdOZZgB3kWw6DKax++k=;
 b=LVxPIn4RWnupXmh75cV1O7L+h6DsMCdhdx639mqRY+ep8n8UfKVt9D6J6N07AywOOi
 GU6kzIk2fjKlLTzP5Y+42/ohd+eGkHPM8Vn6fEX3c5W//8MDhbkkLnOyQpkmkr0lmJZj
 0fsiEOWoSlTt+Z2JbBkXyHH2SaYKWx7ldsfQEYJuYsAA6FyoMxM6fP7i/2jt0rDL/7nE
 l3n1G38c7+gFq1jfBpAMLwI2G7M0MUjmr7UysFSYu8lMOQT+CnLYUeK9fMegXXT91FhH
 PxVUgAm+cSL1eIK/ibg32myIkenShxvsaPYvgTUIM49PGR6e5N9XqIAiUH/azymtSZyd
 2YJw==
X-Gm-Message-State: AOAM53092WkWsS9fh2REXMLlgRmNmomjZKiv2a4UZ42+kbNZ+SZ0ztGy
 HeE309kNmqNFu2M5LdR0JA8WijcaJdd8Tzx44Yq3GLGsyfgfkNfcLJe8SfgpdX8VrNOFvh7EwIM
 8PkJfQIvPZich6VI=
X-Received: by 2002:adf:e34d:: with SMTP id n13mr2600098wrj.225.1605263954719; 
 Fri, 13 Nov 2020 02:39:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzbLTJbrpenmzHApv+IHOechQklEYdN30whVVZemoNnZxKHKyjBsH8n4wa8V5ai3ifZ0wBaEQ==
X-Received: by 2002:adf:e34d:: with SMTP id n13mr2600084wrj.225.1605263954505; 
 Fri, 13 Nov 2020 02:39:14 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id i11sm10639410wro.85.2020.11.13.02.39.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Nov 2020 02:39:13 -0800 (PST)
Subject: Re: [PATCH v2] target/i386: seg_helper: Correct segement selector
 nullification in the RET/IRET helper
To: Bin Meng <bmeng.cn@gmail.com>
References: <1605261378-77971-1-git-send-email-bmeng.cn@gmail.com>
 <4e7e41c4-ce96-05c7-f2cf-27f926639d49@redhat.com>
 <CAEUhbmWDXFExcYGy6SZzz9t+TwHRD3LCuPAvg_S9_5tHRHF6-A@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <a29cdbe7-12f0-839e-4296-7bf4b846bcef@redhat.com>
Date: Fri, 13 Nov 2020 11:39:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CAEUhbmWDXFExcYGy6SZzz9t+TwHRD3LCuPAvg_S9_5tHRHF6-A@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 08:00:44
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
Cc: Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13/11/20 11:23, Bin Meng wrote:
>> It would be nicer if the commit message explained how
>> the guest can notice the difference.
> 
> The commit message says "Per the SDM" :) The actual failure case
> involves a special code sequence that is exposed in VxWorks guest
> testing. Linux does not expose this however.

I see.  Is there any chance you could write a testcase for 
kvm-unit-tests?  Or just explain how to write such a test, and then I 
can write it myself; it's not clear to me how the guest can observe the 
base and limit of a non-present segment.

Paolo


