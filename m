Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB9E336E3F
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 09:51:44 +0100 (CET)
Received: from localhost ([::1]:58254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKH2l-0000eR-Hn
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 03:51:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lKH0s-00088V-RG
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 03:49:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lKH0p-0007Zs-AY
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 03:49:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615452581;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/7aMfjMgaTNlD5dnl6siK92Xg5T/Q7V+P7jl1eU2280=;
 b=g1FOVdQ5qoZ9YW3MU5sikKSCUaoZDpxc6M/ZyIQAMqPZJa9URyUarZTMKD8HFpSwKOZ6ND
 njHAhEy+xpi+V/7h8rSVrgZLRUGxSF4uqVl61AgA14JNxAIyTJw4+ikATMIDKG8GD9YPbH
 aBbRlgfdGoRHFr6lJYOfhomRObyar6Y=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-319-H2FGwuFkO5uoU6VyZEImvQ-1; Thu, 11 Mar 2021 03:49:39 -0500
X-MC-Unique: H2FGwuFkO5uoU6VyZEImvQ-1
Received: by mail-ej1-f72.google.com with SMTP id v27so3657533ejq.0
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 00:49:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/7aMfjMgaTNlD5dnl6siK92Xg5T/Q7V+P7jl1eU2280=;
 b=fm/Pq0hqOP/aYgI2mmK81GyH+EEWlNuH96QAPKxC/WtmL1hBQPkfy3ULYpvwaIyMe7
 dhnvrq5iecPXFNrRUrHPAW+VKpfJsazx6z94jtp6aN4vAP2ye/PU6Yy1dlPaLZqehyZB
 BuGdVtrDpq4v9tM3pb0tWCGp7NVcxQeB2nddNZOjS5W/wtlAqVTZFHgvISCpmupigURM
 s9prYomrq6uf3vrHaExLQluD+3/w2lGGqHxiH8mnIxhXoFkkQ+I1Q4EMu6PWiQ2gbHLt
 mF/5nJBpjpr9hqCiWP/hZ3kPKo9OlvXjkDFV7dxnbwEKKdGEpncZjjyJbE0pcioZETCA
 3iiw==
X-Gm-Message-State: AOAM530batkMjfK88YSkbkkDoosAlfHWNLnWYcxEVVuDEaxoKwWHSKfk
 +SgcyVfFf6oqQfhDblkfVjXhDVHTJ/wN3mlLKH/EWwJffJMk/wk162HirG54nF9BHtXiZ2EDjJo
 6A/1ZgHQnyZymxa8=
X-Received: by 2002:a17:906:f296:: with SMTP id
 gu22mr2027340ejb.20.1615452578492; 
 Thu, 11 Mar 2021 00:49:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzJCY2nmQ49yD3Rh9tbr4ygqoO/L+9va38Yp3qj7JbVPchI9mVwrG4d6gCqeXrN1jmHohqLYw==
X-Received: by 2002:a17:906:f296:: with SMTP id
 gu22mr2027322ejb.20.1615452578272; 
 Thu, 11 Mar 2021 00:49:38 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id j25sm903772edy.9.2021.03.11.00.49.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Mar 2021 00:49:37 -0800 (PST)
Subject: Re: [PATCH v3 00/30] qapi/qom: QAPIfy --object and object-add
To: Kevin Wolf <kwolf@redhat.com>
References: <20210308165440.386489-1-kwolf@redhat.com>
 <YEjWQnWKbr5teciB@angien.pipo.sk>
 <90130a0c-7f96-f344-b185-b790c5d6b78a@redhat.com>
 <20210310173044.GF6076@merkur.fritz.box>
 <ad85d8d9-74a7-9e8f-8287-b6ce66670ed3@redhat.com>
 <20210311084502.GB9008@merkur.fritz.box>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <27ad5b7e-a02a-3d89-1df5-2704db0cf2c8@redhat.com>
Date: Thu, 11 Mar 2021 09:49:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210311084502.GB9008@merkur.fritz.box>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: lvivier@redhat.com, thuth@redhat.com, Peter Krempa <pkrempa@redhat.com>,
 ehabkost@redhat.com, qemu-block@nongnu.org, libvir-list@redhat.com,
 Markus Armbruster <armbru@redhat.com>, jasowang@redhat.com,
 qemu-devel@nongnu.org, mreitz@redhat.com, kraxel@redhat.com,
 dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/03/21 09:45, Kevin Wolf wrote:
> I think it's only patch 29 and 30 that we would have to drop, actually.
> 
> Unfortunately, that still removes one of the most immediately useful
> features, which is non-scalar properties for -object in the system
> emulator. But of course, a lot better than not merging it at all.
> 
>> Who is going to include this series in the next pull request, Markus or
>> myself?  The time is ticking for soft freeze.
> QOM is probably the right subsystem, so that would be you. Or I can just
> merge it myself as long as everyone is fine with it.
> 
> Eric has some minor comments that I think could be addressed while
> applying the series. Or should I send a v4 for that (and for dropping
> patches 29 and 30)?

I'd say just send a pull request. :)

Paolo


