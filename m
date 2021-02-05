Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1E52310ED2
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 18:37:03 +0100 (CET)
Received: from localhost ([::1]:54446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l852U-0008QI-O7
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 12:37:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l84NN-00005t-LR
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 11:54:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53989)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l84NL-0001I9-Hj
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 11:54:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612544070;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DUs3TrFH7i9/8WXkd3thvRD/8ZtwfnGqkbVFYETHHVY=;
 b=fDJmH1puvaOs7+T9R8qHeBVARBCN4ShukKsj3zc7GN95vPEjipwP4aoQSZ/CmVQ/2HkOUB
 zVnyWIzsJVugIXPmdGh9luGeLEEKW+l9zI9TM+RupVLtWjCFk9IM2flLrZrL9QFRFYtB1L
 msvolILfo3/RC6qi+d36bCacxypPCD4=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-585-Wa4gHpNfMWWZH18FWp6zFw-1; Fri, 05 Feb 2021 11:54:28 -0500
X-MC-Unique: Wa4gHpNfMWWZH18FWp6zFw-1
Received: by mail-ej1-f72.google.com with SMTP id jl9so2713212ejc.18
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 08:54:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DUs3TrFH7i9/8WXkd3thvRD/8ZtwfnGqkbVFYETHHVY=;
 b=OGgwtC95MeIdX5+KvQlDXi4kDQawmvFsemcgxpqCyTuHFD4b/1wEcFuxkb+4GVqbKP
 jx3aLbH/kXHeSx1CMHUqf9pW48g7tPTyMC8OtagfAWZ7rMQa3NFkupIEbNmlFMvlInX6
 KQ2I80aByziUL42sugvBpIwrJBGMnT7jKjNg18OrlFmMNjlDL5/5gxrSBFhinhHc71+1
 /1K+1PxYl3y+KoKd7WDuD3PDdbx0JK2GBdnGw38WhocD1Zy4OFEzcjc6uOyaccxDNHnQ
 FCTdc2+oFZRzE1viLxm3mePmt3N0nvic58OnF3UmpoJ5WJaNBzpwBuAWOPoXaGrcPT4Z
 +cQQ==
X-Gm-Message-State: AOAM5307jPR2JNDCv2GnJviyOtLRX3u1S7Hknd2uY33VaFzc+dAfUI4Z
 gea9bp0T+kWCVebgVEmSsyoE7vNQiZ/rV+oPBgyviy6D9XfLAA0l690JHnSPJ8ZlleMWIL5wgJc
 11NLbJ09uBWnzKj8=
X-Received: by 2002:a17:906:f6c7:: with SMTP id
 jo7mr5072670ejb.178.1612544066960; 
 Fri, 05 Feb 2021 08:54:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwaQuOtb3s+dgJJWGJr2Y84JEq93lohdj4s7lOxVLTpYD6b3EW8Lfia6YnRAX/kj+lozHZm+w==
X-Received: by 2002:a17:906:f6c7:: with SMTP id
 jo7mr5072654ejb.178.1612544066782; 
 Fri, 05 Feb 2021 08:54:26 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id s15sm4128414ejy.68.2021.02.05.08.54.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Feb 2021 08:54:26 -0800 (PST)
Subject: Re: [PATCH 0/1] tests/acceptance/boot_linux: Switch to Fedora 32
To: Daniele Buono <dbuono@linux.vnet.ibm.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org
References: <20210127010946.17370-1-dbuono@linux.vnet.ibm.com>
 <20c6fbf7-3000-0ef4-cdb1-31d748878206@redhat.com>
 <9955636f-507f-3b6a-d403-d23c4b78f01e@linux.vnet.ibm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <b8dd87b0-b0d1-0d7b-29db-686a60ceb930@redhat.com>
Date: Fri, 5 Feb 2021 17:54:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <9955636f-507f-3b6a-d403-d23c4b78f01e@linux.vnet.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.352,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.33, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Wainer,

On 1/28/21 11:06 PM, Daniele Buono wrote:
> On 1/28/2021 3:19 PM, Wainer dos Santos Moschetta wrote:
>> Hi,
>>
>> On 1/26/21 10:09 PM, Daniele Buono wrote:
>>> Local acceptance tests run with "make check-acceptance" are now
>>> showing some cases canceled like the following:
>>>
>>> (01/39)
>>> tests/acceptance/boot_linux.py:BootLinuxX8664.test_pc_i440fx_tcg:
>>> CANCEL: Failed to download/prepare boot image (0.25 s)
>>>
>>> Turns out, every full-vm test in boot_linux.py is trying to use a
>>> Fedora 31 cloud image and is failing, with Avocado refusing to download
>>> it, presumably because Fedora 31 is EOL.
>>>
>>> This patch moves to Fedora 32, which is still supported. And seem to
>>> work fine
>>
>> While ago it was discussed about updating the Fedora version which, in
>> my opinion, ended up without a conclusion. Please see the complete
>> thread in:
>>
>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg763986.html
> 
> Oops, didn't notice the previous thread. Apologies for the duplicate!
> 
>>
>> I'm CC'ing Daniel Berrrangé so that, perhaps, we could resume the
>> discussion.

The first question I'd like to figure out is how/where can we archive
the artifacts being tested by the project. As we maintain stable tags,
I'm more worried about regressions affecting LTS use rather than
recently added features which get more coverage and activity.
Is this too conservative for acceptance testing?

Regards,

Phil.


