Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC1C2FB57C
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 11:57:17 +0100 (CET)
Received: from localhost ([::1]:38036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1ohI-0002OT-Kv
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 05:57:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l1ogE-0001t8-9E
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 05:56:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34477)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l1ogC-0002r9-H6
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 05:56:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611053767;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xcgIODqf7LhLWBkI7V7VNeEiUmqJat/1xC5iRraSlV0=;
 b=S2LO8Bo6UYVLTQUQnySaSED56GNZoTatABL825PmnlYDCTMaBJubCU/nOly/g/qVHjLfNL
 lD0Nd05N/uwqaNeKp64VAIJxI6Hr/IKMWx76W0yeGG1ErFsN+eFufLOwJ/Fb2o9Pih93pS
 URLKmdRUYMxO+SZw9SAQt/xqW5rN6Sg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-371-ud-kpKufMcmJL13-EfFG4w-1; Tue, 19 Jan 2021 05:56:03 -0500
X-MC-Unique: ud-kpKufMcmJL13-EfFG4w-1
Received: by mail-wr1-f70.google.com with SMTP id e12so9736631wrp.10
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 02:56:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xcgIODqf7LhLWBkI7V7VNeEiUmqJat/1xC5iRraSlV0=;
 b=GCmYg4lkLch3vIGx0hudXsNNvRFqQTNqAsDP7Qr7LYX6B8Q0p1zhbr4ZfkIoeT7kxn
 DY8zu1BTTyrWI3w9nGZzAfJwf08HQF4vDo9yscI/Xe2JHUAYnM6aJ0XOVvEgegGuu1Iu
 7YUsDqZFr11kQiGjiBkOX2TEzbDAgXirm5UTrq9g7GRJ86dP8o+QYiRLqANtVObVEYbP
 Yg0/YMBct+NFsyN6m+36a7niqNaOON8Vxl6bEN4e6uB6+5PfxZLPKrRb5Dg21ljUB4Nh
 sKAkAS0IIlDpQ/5r6nMUSjSoSMXVjCZ5tvq3/guoYP2i/tgQpwMnPOInJWZ90qG1Ig9L
 YNHg==
X-Gm-Message-State: AOAM532D114wKMTSX6mwmNlCO3jgt3iWvDG9MTKg3soqMXm4F2TdpeS6
 ksgacUWlBjFJLt2cJtg7p59tHtmJABB8sUo9ZIBExZ3JjzZ259XYv2vmPNhPAI5zK/PQjtPd5Fj
 XiyKXLba+kdrlEK8=
X-Received: by 2002:adf:b343:: with SMTP id k3mr3713372wrd.202.1611053762776; 
 Tue, 19 Jan 2021 02:56:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwY39hX26okl03ZE3D6tRtQVR9jESZQRpHb78ur/wQ+68yZwER0RWoL1JMJn5Av+cWgjer8Pw==
X-Received: by 2002:adf:b343:: with SMTP id k3mr3713363wrd.202.1611053762635; 
 Tue, 19 Jan 2021 02:56:02 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id w1sm36254155wrr.84.2021.01.19.02.56.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Jan 2021 02:56:02 -0800 (PST)
Subject: Re: git://git.qemu.org/qemu-web.git now pulls from gitlab
To: Thomas Huth <thuth@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Michael Roth <mdroth@linux.vnet.ibm.com>
References: <c146373d-5a9e-8093-4f5b-48fd37152702@redhat.com>
 <dcdee54e-ccd9-2004-6b95-58ee1f26833e@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <4c9df6d2-78be-bde3-acd1-4b0a95a1664b@redhat.com>
Date: Tue, 19 Jan 2021 11:56:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <dcdee54e-ccd9-2004-6b95-58ee1f26833e@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.175,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.194, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19/01/21 11:49, Thomas Huth wrote:
> On 19/01/2021 11.43, Paolo Bonzini wrote:
>> The qemu-web.git repository on git.qemu.org is now a mirror of gitlab. 
>> The git mirror is updated every 15 minutes.
>>
>> Pushing new changes to qemu.org therefore must now be done via 
>> git@gitlab.org:qemu-project/qemu-web.git.
> I think that should be gitlab.com instead of gitlab.org ? At least I had 
> to replace it when updating my config.

Of course, sorry about that.

I have now updated https://wiki.qemu.org/AdminContacts as well since 
there is no qemu-web group anymore on the qemu.org server.

Paolo


