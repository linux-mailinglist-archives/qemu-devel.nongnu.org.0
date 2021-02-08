Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E7233140A5
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 21:39:53 +0100 (CET)
Received: from localhost ([::1]:37842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9DK4-0004XN-3p
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 15:39:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l99RW-0001Lj-5D
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 11:31:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l99RO-0001jz-9X
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 11:31:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612801867;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Wn8I/qJ1un2ZJdSVwTB0v/DOi4MI+17hJgbx/HbxT80=;
 b=KCyfAPY4K6OpyX0N+mdKmB9+7qwXWpYGrHC8VQLYqy/b83hXOGj5YMvZkoMFTIP3DIt7rF
 mIRBxErkEhE+Yel5Jgjh38ZBwuTysbpY2NmZL7eMI5ymqaKd7uGfJkSNNGRGn++KYjCNwq
 VM253EXH5ex0MtNyha7Y8b3NnSMeKkE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-227-tYJT2p5uPmKL_ESSDrw2yQ-1; Mon, 08 Feb 2021 11:31:04 -0500
X-MC-Unique: tYJT2p5uPmKL_ESSDrw2yQ-1
Received: by mail-wr1-f72.google.com with SMTP id x12so13483853wrw.21
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 08:31:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Wn8I/qJ1un2ZJdSVwTB0v/DOi4MI+17hJgbx/HbxT80=;
 b=UU9QH295efzfSXVvBdZl0tZZicutjTJTa0nfWv5D8eExeqxLP5po+jeguYDJ/tSmn6
 eHytEuB8hHZkZhq37E+lHTidi1S4fqYdhf25Q+xFqtNeUvJyhBnOsrlZ2EqjHRTZhiBw
 n65CYbRAlhNgrtirfUx1y/BRgjfDIoV94jfrCeehR6G/A91KY0lHlJShmKRnKQBKcqFY
 ndgGEQ7x7J5McSwAOgJZmaO2IXr+DYOSKwrp6qw6hsrNxDJLsQv70Eum4gbTyCr5lPpF
 r1OF88Gmf0Xj2uJl28u4kR6sMrICiaDXf06V2divRMXl5LaGdzPd2kYfUIdbSvAeRaAS
 PQ5g==
X-Gm-Message-State: AOAM532fCpogLLYAkj0eYCPt6Xw0v1VJfZkRlB9K3FNuYCelNsFyFB9c
 E8q6uNMIl+G3b7MWJX0rvOfB/Hw1z9fWAcyOq5cgrCYcJ34anOhy/MbhEXHVfSyZ0hpTUrB8l4M
 X2Po1FGzPQyTgR7M=
X-Received: by 2002:adf:e4c9:: with SMTP id v9mr20431996wrm.277.1612801863010; 
 Mon, 08 Feb 2021 08:31:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxfWh4Gw4F1maYiyuME3xdHTAofYjpshxRYsDIc3ialXANCrUJ5Cop5pxlm9pNuSR1QSpqSqA==
X-Received: by 2002:adf:e4c9:: with SMTP id v9mr20431972wrm.277.1612801862835; 
 Mon, 08 Feb 2021 08:31:02 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id e4sm29630045wrw.96.2021.02.08.08.31.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Feb 2021 08:31:01 -0800 (PST)
Subject: Re: [PATCH v6 0/6] Qemu SEV-ES guest support
To: Tom Lendacky <thomas.lendacky@amd.com>, qemu-devel@nongnu.org,
 kvm@vger.kernel.org, "James E . J . Bottomley" <jejb@linux.ibm.com>
References: <cover.1611682609.git.thomas.lendacky@amd.com>
 <9cfe8d87-c440-6ce8-7b1c-beb46e17c173@redhat.com>
 <6fe16992-a122-5338-4060-6d585ca7183f@amd.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <f4e12261-c3e3-8934-5fd7-79fd30eccfe5@redhat.com>
Date: Mon, 8 Feb 2021 17:31:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <6fe16992-a122-5338-4060-6d585ca7183f@amd.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.265, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Connor Kuehl <ckuehl@redhat.com>,
 Sean Christopherson <seanjc@google.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>, Jiri Slaby <jslaby@suse.cz>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08/02/21 16:48, Tom Lendacky wrote:
>>>
>>
>> Queued, thanks.
> 
> It looks like David Gibson's patches for the memory encryption rework 
> went into the main tree before mine. So, I think I'm going to have to 
> rework my patches. Let me look into it.

I was going to ask you to check out my own rebase, but it hadn't 
finished CI yet.  Please take a look at branch sev-next at 
https://gitlab.com/bonzini/qemu (commit 
15acccb1b769aa3854bfd875d3d17945703e3f2a, ignore the PPC failure).

Paolo


