Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF37869B359
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 20:51:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pT6jz-0003xR-5W; Fri, 17 Feb 2023 14:49:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pT6jx-0003xG-27
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 14:49:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pT6jv-000856-9d
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 14:49:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676663390;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ToLcNKcTtuy9bcS0Jy8QbtXgWrYt7WCZ7TkY6O1dt18=;
 b=Kcjj75XMwVdjaQWPToIPpku980aA+sSucCmQCjc/H6VcWRNpUxVZqXEo9RkKSsNCZz82nd
 qii6F6o+lqu/rruCo0PB+7S+Zfm9NaTf40K0mo2mXHSVxQj4BL0TphlULLQjLUgOGPo+4F
 xIEwhbfR4KmsLrhvnVvPLMBhqzuIt2M=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-628-zkCuyinOOhaUyW7KZz4YeQ-1; Fri, 17 Feb 2023 14:49:48 -0500
X-MC-Unique: zkCuyinOOhaUyW7KZz4YeQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 v6-20020a05600c444600b003e206cbce8dso1151892wmn.7
 for <qemu-devel@nongnu.org>; Fri, 17 Feb 2023 11:49:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ToLcNKcTtuy9bcS0Jy8QbtXgWrYt7WCZ7TkY6O1dt18=;
 b=0cZSTTM5tHJayMdPapoakZxIe8WuAev7RSE6j3Vp/+at8063FsK9sjP415oqKYrkYe
 0qLlP7dxtNet9v9kB0eelGKa7LD668dTE03SZTROFCS2Jy9rnsf4B8obQJr+PSRBb8Ga
 auRbEGMk7KUg6t9cAWjWANrTpReUe/H2WGuUZrEvrfTa6xJCAAFYn0JbyP4cMBunu+EX
 BAusFIbn1NwyD7OH+2yzn6wg5ezr6PezohDVAuvYIabuwLQc6jKU1PRHGpTf5fYuF7Ev
 /Ij/6cUjTd7k3Zna6TyCHDE4KzHXJLDIPTJiQ4r9mv/a4KmaUGqGrg4gESqYf54rTGbh
 N31Q==
X-Gm-Message-State: AO0yUKXunio+8c6zxE6hnAJ4fWncCOuxp751/MHn250qtDqFX6mKdid0
 SGNQ2pQlRZsTjgFTGD4JUJMRkmgiJTD5Ys/kInkhjm5jE+R1A52V8IRtLY8G0al4ofly6gO6bC3
 fj4w2i3vieNRrp5w=
X-Received: by 2002:a5d:5944:0:b0:2c5:3ccf:e99a with SMTP id
 e4-20020a5d5944000000b002c53ccfe99amr1681587wri.6.1676663387499; 
 Fri, 17 Feb 2023 11:49:47 -0800 (PST)
X-Google-Smtp-Source: AK7set9SdPXy/N+vpHg8QL24H+o1OVUv5lA/KnXmOF0HilvWdLZA5vd87zHQXWboS0/6wXsiLshm3g==
X-Received: by 2002:a5d:5944:0:b0:2c5:3ccf:e99a with SMTP id
 e4-20020a5d5944000000b002c53ccfe99amr1681576wri.6.1676663387193; 
 Fri, 17 Feb 2023 11:49:47 -0800 (PST)
Received: from [192.168.8.104] (tmo-110-21.customers.d1-online.com.
 [80.187.110.21]) by smtp.gmail.com with ESMTPSA id
 m2-20020adffe42000000b002c5d3f0f737sm2901428wrs.30.2023.02.17.11.49.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Feb 2023 11:49:46 -0800 (PST)
Message-ID: <dbe6f1de-b67e-5ece-cc27-698da4387677@redhat.com>
Date: Fri, 17 Feb 2023 20:49:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, libvir-list@redhat.com,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Reinoud Zandijk <reinoud@netbsd.org>, Ryo ONODERA <ryoon@netbsd.org>,
 Brad Smith <brad@comstyle.com>, Stefan Weil <sw@weilnetz.de>,
 Maxim Levitsky <mlevitsk@redhat.com>,
 Sean Christopherson <sean.j.christopherson@intel.com>
References: <20230130114428.1297295-1-thuth@redhat.com>
 <87a61cbmti.fsf@pond.sub.org> <Y+9bSHshiNnek31J@redhat.com>
 <b55b506e-5a73-329a-24ee-14eafc5a95c1@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [RFC PATCH] docs/about/deprecated: Deprecate 32-bit host systems
In-Reply-To: <b55b506e-5a73-329a-24ee-14eafc5a95c1@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.256, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 17/02/2023 17.38, Paolo Bonzini wrote:
> On 2/17/23 11:47, Daniel P. Berrangé wrote:
>> On Fri, Feb 17, 2023 at 11:36:41AM +0100, Markus Armbruster wrote:
>>> I feel the discussion petered out without a conclusion.
>>>
>>> I don't think letting the status quo win by inertia is a good outcome
>>> here.
>>>
>>> Which 32-bit hosts are still useful, and why?
>>
>> Which 32-bit hosts does Linux still provide KVM  support for.
> 
> All except ARM: MIPS, x86, PPC and RISC-V.
> 
> I would like to remove x86, but encountered some objections.

So if I got that right:

 
https://lore.kernel.org/all/b8fa9561295bb6af2b7fcaa8125c6a3b89b305c7.camel@redhat.com/

... the objection is mainly that some kernel developers want to keep the 
code around for easier testing of nested 32-bit guests L1 hypervisors.

If that's the only use case that is still around for the 32-bit KVM x86 
kernel code, I guess it should also be fine to use older versions of QEMU in 
those L1 hypervisor guests (assuming you have to use an older 32-bit Linux 
distro for this anyway).

So unless I got that wrong, there is really nobody around anymore who needs 
an *upstream* QEMU for running 32-bit x86 KVM hosts, is there?

Please correct me if I'm wrong, but I think we can really deprecated at 
least qemu-system-i386 and qemu-system-arm now, can't we?

  Thanks,
   Thomas


