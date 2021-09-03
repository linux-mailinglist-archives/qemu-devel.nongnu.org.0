Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E3B4002AF
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 17:54:56 +0200 (CEST)
Received: from localhost ([::1]:52868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMBWp-00081p-C2
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 11:54:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mMBVV-0007Le-Me
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 11:53:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30151)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mMBVT-0006xj-Jy
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 11:53:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630684410;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q/n/5OaufhO1OUUuwgFXAIZPn2ui+xrv8qVh/LpQlSo=;
 b=PiDKi/44I0EVryItprnWirq5TeYq4lT5TPH0rYDx+3GTzQGXypgMVmL+2ZQvUrSqFghCi+
 GA52G/BY2ixH+LdBQlrJhG+LiImWJPtwVhR9YFGtKm1ei3UFaErtTeXH2f5Kh4x8vwU8EJ
 k0LvOhoym7HNPLngUEZeFp/L+tqn/fk=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-102-vc4q4cNgNhiYTbJ1s59lag-1; Fri, 03 Sep 2021 11:53:29 -0400
X-MC-Unique: vc4q4cNgNhiYTbJ1s59lag-1
Received: by mail-wr1-f72.google.com with SMTP id
 102-20020adf82ef000000b001576e345169so1729244wrc.7
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 08:53:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=q/n/5OaufhO1OUUuwgFXAIZPn2ui+xrv8qVh/LpQlSo=;
 b=YBA58IRRvEEa/n02ynEV+bBU1LzFliPTaiha0RLfFUnmtHqezla/ScbQSLenki/qTk
 AFw+VpLS7e6aMR2NCPivPHPaSVG0sGQ+KAI0lHvwI5dXqTezxU0dQtJiMdb4zNPVwLTX
 pxhoQP737BabuWJfaMLtdujUjcm+8kUWqnL0TYBSF+ZZnDin3oIK8Rq7V0FMDNe3dqDN
 uFdNsv7HU/ySaOZAxTONhDNVXkeTkmEJPhsuLjJyr2Kx+eNkj11bf4odNtfndds8je8t
 BegP+C0ebn/EvEjes46IYMW3aEDlBjmWU9OGd7MWuI7tld5gyxiVP9leR7LNJQGWaDni
 vExg==
X-Gm-Message-State: AOAM533I1ow2VzoNzakCtfwE+OKXoE4Dg2qgtg2wdxqB9A5IiFB/HjTx
 MpN1ChaFYUmgyuAaJn4NqgpC5WpndoxH6H/d8TVZhG1cf/kPTGED1SU06lNaeACArGapZs88qGa
 qWO/qQP7jivldCVg=
X-Received: by 2002:adf:ea4d:: with SMTP id j13mr4918934wrn.86.1630684408182; 
 Fri, 03 Sep 2021 08:53:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwLQSu3LYQL2VteVAHNH6YHqEtIFVsWxzPeredpJ1dEzBCBlIk1wKqSanSgi3g4PvGwsQMKng==
X-Received: by 2002:adf:ea4d:: with SMTP id j13mr4918916wrn.86.1630684408007; 
 Fri, 03 Sep 2021 08:53:28 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id c13sm5112526wru.73.2021.09.03.08.53.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 08:53:27 -0700 (PDT)
Subject: Re: [PATCH v5 2/2] memory: Have 'info mtree' remove duplicated
 Address Space information
To: Peter Xu <peterx@redhat.com>
References: <20210902062604.182620-1-philmd@redhat.com>
 <20210902062604.182620-3-philmd@redhat.com> <YTFIXrxd0i6GZbtG@t490s>
 <ae681972-e2c2-1453-00b7-1d4674fbd6c2@redhat.com> <YTJBotzQOjfQ9L7p@t490s>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <cef9a003-e3a8-8dd1-a03b-9d0046ed3f6d@redhat.com>
Date: Fri, 3 Sep 2021 17:53:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YTJBotzQOjfQ9L7p@t490s>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.888, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/3/21 5:39 PM, Peter Xu wrote:
> On Fri, Sep 03, 2021 at 10:40:25AM +0200, Philippe Mathieu-Daudé wrote:
>> On 9/2/21 11:55 PM, Peter Xu wrote:
>>> Hi, Phil,
>>>
>>> On Thu, Sep 02, 2021 at 08:26:04AM +0200, Philippe Mathieu-Daudé wrote:
>>>>   address-space shared 4 times:
>>>
>>> I commented on the format of the output, I saw that it's switched back to the
>>> v1.  Any reason?
>>
>> The code uses the format you asked, I simply forgot to update the
>> commit description :/ Sorry, I'll respin.
> 
> But I'm talking actually about the code too. :) After your answer I feel like
> it's just an accident anyway.  Thanks,

Doh sorry... Not sure how I messed that bad :S


