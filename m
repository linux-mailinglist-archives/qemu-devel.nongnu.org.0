Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6600C40C0B3
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 09:44:15 +0200 (CEST)
Received: from localhost ([::1]:54724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQPaY-0002On-9z
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 03:44:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mQPZM-0001KW-RH
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 03:43:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mQPZJ-0002bO-St
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 03:42:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631691777;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n7tY2qaRUyAbVvdR/3Omi7aXBnE61Nvj044XCE+czWs=;
 b=I0AVISHsyW3UV+lMV7IjJwvoZ+iUU9wJJCw9lhH2pC7fzGmwMHLSmcFowx5xGAIuC+Qu/y
 XAD1jDlZwkdTyWt1CgPEy9CJHJXPpbyEDLppdVMnEXfoQx57Kt3/jyuvKAkvI09+9YF4hy
 GDLQu5o+opCBL/L6ve3mT9odgr6MPo8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-524-qVWHT3RkMtCzN_i-hiBGiw-1; Wed, 15 Sep 2021 03:42:53 -0400
X-MC-Unique: qVWHT3RkMtCzN_i-hiBGiw-1
Received: by mail-wm1-f71.google.com with SMTP id
 75-20020a1c004e000000b00307b9b32cc9so2026383wma.1
 for <qemu-devel@nongnu.org>; Wed, 15 Sep 2021 00:42:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=n7tY2qaRUyAbVvdR/3Omi7aXBnE61Nvj044XCE+czWs=;
 b=D06W8rBbOROB24r2ITgsEYyBXvtL1f0Gb7ppWccD5J/565Zk0MdLO3If8CMODD3mAa
 ftBGZ3f0eTrSw/x0Fg3SczzRGeWS7mPJgedGIQnV0qznTsyGEJZiVxzE5o+BeZ6XybfG
 KvymPb4uCaJVzeyJmUTgfaPMOjqySafLNGViJwHV6V8TPy4Y9ybvGxLWFZoa5JgKoVdc
 wnMnQ/HlWs/utWELrbMk7JRwrLP5yJuVaF3BDsKZ5LWg1UXGmz+a8cGEHtgt5lbPOQ3W
 1O7RQpazf1NdvTOKYS+sdd1QzrEkcbKRlY7icdJL7qkE7qPS8VYmRsUPL74Wk+rrzpYK
 ztSQ==
X-Gm-Message-State: AOAM531HoUU7jxK0Dsvn9XTHf+NsrmwtwpdBv3+GMil8tUFyFOsBOTIO
 qo+eEkokGfb7jERvm/DXoCzsdzIN1jhvDLw6cfufAnCd/IOTmiHTzXKXXNHX4pY2jm4ENqsU6Gq
 oWIBG4Smg9/b8gMI=
X-Received: by 2002:a1c:7fd0:: with SMTP id a199mr3040304wmd.20.1631691771939; 
 Wed, 15 Sep 2021 00:42:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxb5VgU7REihI3tDGowwcx6zo5IQbXGS9CmY7+fkY0eAVVsrI+5BEictSa4CAFXaQZwrwi7Lw==
X-Received: by 2002:a1c:7fd0:: with SMTP id a199mr3040278wmd.20.1631691771689; 
 Wed, 15 Sep 2021 00:42:51 -0700 (PDT)
Received: from thuth.remote.csb
 (dynamic-046-114-145-004.46.114.pool.telefonica.de. [46.114.145.4])
 by smtp.gmail.com with ESMTPSA id e8sm12952500wrj.48.2021.09.15.00.42.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Sep 2021 00:42:51 -0700 (PDT)
To: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Joel Stanley <joel@jms.id.au>
References: <20210913161304.3805652-1-clg@kaod.org>
 <20210913161304.3805652-15-clg@kaod.org>
 <88c26520-6b87-e7a2-ac78-c1c92477c814@kaod.org>
 <BBC4A4E0-651C-41DB-81DE-1F6D86AABAB1@fb.com>
 <CACPK8Xdey9_x-ZN1JbgFyTrW59EapH4xcqYbyNQxyQ5t0uWPvw@mail.gmail.com>
 <CAFEAcA8ntPE3GkTNU8bSBhCWzk_jdH4QR1kDgwo6deQ+T1iOKw@mail.gmail.com>
 <1949e204-1bce-f15b-553b-1b42b41e3e08@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Subject: Deprecate 32-bit hosts? (was: Re: [PULL 14/14] hw/arm/aspeed: Add
 Fuji machine type)
Message-ID: <ee5d379f-a792-aae1-370a-b5f21582ae58@redhat.com>
Date: Wed, 15 Sep 2021 09:42:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1949e204-1bce-f15b-553b-1b42b41e3e08@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Andrew Jeffery <andrew@aj.id.au>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Peter Delevoryas <pdel@fb.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14/09/2021 17.22, Richard Henderson wrote:
> On 9/14/21 5:26 AM, Peter Maydell wrote:
>> (2) RAM blocks should have a length that fits inside a
>>      signed 32-bit type on 32-bit hosts (at least I assume this
>>      is where the 2047MB limit is coming from; in theory this ought
>>      to be improveable but auditing the code for mishandling of
>>      RAMblock sizes to ensure we weren't accidentally stuffing
>>      their size into a signed 'long' somewhere would be kind
>>      of painful)
> 
> Recalling that the win64 abi model is p64, i.e. 'long' is still 32-bit while 
> pointers are 64-bit, how close do we think we are to this being fixed already?
> 
>> Even if we did fix (2) we'd need to compromise on (3)
>> sometimes still -- if a board has 4GB of RAM that's
>> not going to fit in 32 bits regardless. But we would be
>> able to let boards with 2GB have 2GB.
> 
> I'm not opposed to deprecating 32-bit hosts...  ;-)

I think we should consider this again, indeed. Plain 32-bit CPUs are quite 
seldom these days, aren't they? And I think we urgently need to decrease the 
amount of things that we have to test and maintain in our CI and developer 
branches... So is there still a really really compelling reason to keep 
32-bit host support alive?
Could we maybe also decrease the amount of targets, i.e. merge 
qemu-system-x86_64 and qemu-system-i386, merge qemu-system-ppc64 and 
qemu-system-ppc, etc. where it makes sense (i.e. where one of the binaries 
is a superset of the other)?

  Thomas


