Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A7A2FA1D5
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 14:41:08 +0100 (CET)
Received: from localhost ([::1]:51030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1UmJ-0002h6-SO
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 08:41:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l1Ujo-0001lS-1C
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 08:38:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26411)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l1Ujm-0006sw-DX
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 08:38:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610977109;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UKjFrMvuGBpNNEAuCW2/5ZWaSZhusGHfA/4nuKOHe6Y=;
 b=Ma4FsNi8VenuXJEYWx0o5FYcoR5G3ovx4WV3zmQ9JoXugu4wVrhD7+njSlf5dL8uCIXFrL
 GnXhU215RaKxGmMTJNPZW290Yv48I3AHKP1i0HFxzhW+HSP82R+QhBvJqdVxzg+HqYLVLj
 X7Dd8ROm2QBiUejHgJEEqBt6U21kaCU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-48-P4Vip_rBNQaUz-Lct19u6w-1; Mon, 18 Jan 2021 08:38:27 -0500
X-MC-Unique: P4Vip_rBNQaUz-Lct19u6w-1
Received: by mail-wr1-f70.google.com with SMTP id w8so8294308wrv.18
 for <qemu-devel@nongnu.org>; Mon, 18 Jan 2021 05:38:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UKjFrMvuGBpNNEAuCW2/5ZWaSZhusGHfA/4nuKOHe6Y=;
 b=ZBuUkmZgvOaR9t8TZpNSUnqQ6BR7VgCkEaf0R5L7LBnFFhWUyduZ9HSP0TSN2coiEN
 YIB4ihmr6eDd06WqcSvkBfOqaJPjNk1ZrmWpIbVzhDRBA7dDqCmpBofIs7SONsOB6NCC
 w5BPbZcqUDiVg8L6L67YAfXc6tkBfdcKqbMxVmGvqpMvRJASylzj1cDnSMvC0niPp8ci
 FdKFr1yn2xbdouo/RA6Xh/bf4RXqdOqjeQ7mBaVJpKdv3VsPDz/nxGsrNBdjQsVfIRHv
 +PY0mUEuEd6S1tDCraZI1W3G16OM28qgdaUL41VYa1xGzj6VqB/gYQzrugri3thWb0Vz
 3/Qg==
X-Gm-Message-State: AOAM533rO3JgYiSqhgowjiiLV0RVFq3dwxuUa/WbuypAHmYBlBZyCgH8
 acwwrnsGvQiJmii//Rd1+pjKcgrMhEZjUfPeQTH/d4RYAurIZTzCmOk5rpbejIT9A8MoEyO2Jb4
 muB0rCbQvNirnnQs=
X-Received: by 2002:adf:e84c:: with SMTP id d12mr26971102wrn.382.1610977106171; 
 Mon, 18 Jan 2021 05:38:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy4FZ3V0hLw/tXQHVsFbdSGO7qw1UExkmSFKi3gJAGsWNiEjQJgGnJGGa/IZgkDupW485TAeA==
X-Received: by 2002:adf:e84c:: with SMTP id d12mr26971081wrn.382.1610977105946; 
 Mon, 18 Jan 2021 05:38:25 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id b10sm11857715wmj.2.2021.01.18.05.38.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Jan 2021 05:38:24 -0800 (PST)
Subject: Re: pending fuzzing patches (was Re: [PATCH 2/2] fuzz: log the
 arguments used to initialize QEMU)
To: Thomas Huth <thuth@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 qemu-devel@nongnu.org
References: <20210117201014.271610-1-alxndr@bu.edu>
 <20210117201014.271610-3-alxndr@bu.edu>
 <4e63a37a-d9f1-7841-3761-6f8cd7ac9051@redhat.com>
 <84615bb8-564e-5d5f-b134-83fa223cf583@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <19fa6cfc-3d26-02bd-44c1-be710d3fa8a2@redhat.com>
Date: Mon, 18 Jan 2021 14:38:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <84615bb8-564e-5d5f-b134-83fa223cf583@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.175,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.194, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/01/21 10:30, Thomas Huth wrote:
>>
>> Hi Alexander, can you send _me_ a pull request for all the pending 
>> fuzzing patches?  I haven't paid much attention, but I have seen 
>> external contributions and I have the feeling that they aren't being 
>> applied/reviewed promptly.
> 
> I'm normally taking the fuzzing patches through the qtest tree (and also 
> merged some contributions last week, see 22ec0c696fd28e and the 
> following commits) ... which patch series that got missed did you have 
> in mind?

I was thinking mostly of "fuzz: improve crash case minimization" which I 
had lost track of, but that one has been merged.

Paolo

> Anyway, the amount of fuzzer patches seems to have increased during the 
> last weeks, and I'm not very familiar with the fuzzing stuff and also 
> sometimes I do not get CC:-ed on fuzzing patches, so it might make sense 
> indeed that Alexander now gathers the fuzzing patches and starts sending 
> pull requests for these. Alexander, do you want to have a try now?
> 
>   Thomas


