Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 085B8455F9C
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Nov 2021 16:33:56 +0100 (CET)
Received: from localhost ([::1]:36280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnjQA-0000eY-KA
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 10:33:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mnjOB-00088i-OJ
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 10:31:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21435)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mnjO9-0006YJ-1F
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 10:31:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637249508;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=drmZPliX8obnOvykgLjgLe7sWLoQvClYxLym+hHICD8=;
 b=HUn3hMAdvKAhLeOqElWiGAW8EJJJ+N9PxVgt+3/GLkDShSW4g+rBVHZPSE8rbMjE/vTSOe
 4JWcSBVnQQAT5nYZ+QD5yd8/4HOOmeIAJEYmM6LvXd0FW5W6UXe/5mw80QhzVtj6n8TSUH
 Hs9UFHXwH+h7vuWud+Zjy42DPLcapYU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-532-GHTEgAT6NWuYwSgGplgqJQ-1; Thu, 18 Nov 2021 10:31:46 -0500
X-MC-Unique: GHTEgAT6NWuYwSgGplgqJQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 u4-20020a5d4684000000b0017c8c1de97dso1168828wrq.16
 for <qemu-devel@nongnu.org>; Thu, 18 Nov 2021 07:31:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=drmZPliX8obnOvykgLjgLe7sWLoQvClYxLym+hHICD8=;
 b=ad1awGKMrzj/Pmnnm5ammJiYWeZ69ts1QLZRmjlbbeAs0lE6XbEPCg+0nFRMslgLnM
 KOsAQC/mZBFoDxkc8b7OH8kNUZN3WCS5LyABuZgX6DL4WCUsZy2ITTdYh9fLdDo+/6Pe
 5qu22oaIA6MktKce54jGqH1k/+2w1gCVVHv5xA6A+3CNln4gMm3+LfrUpOT0nkVb7D97
 BJ7z/9B/s4Zdoge1KxerGZ6v7y3FjAeSPLfmFxglG3gcV6/HsMyJ4uOBFyQHfXubtDMW
 bL+HEJyDEdCmrKQaBwAov99Izhs8DtQhwIIj0TgeT8X4349j1+2gBmhEtw7zc8a/ZzjO
 k4wA==
X-Gm-Message-State: AOAM531lIQOV1rvTt9wmDVUW0uxWeOd11jtmDcXkZcXua2nzANfZYPqm
 feP9OcHupdfuX/NhHL9BO9TP+UugqEN7XF3n7iMZXfkzkBZ60hsBUkVgWUgSS1px2pNNKCdlx16
 KZAgZsGkGSqnCfxk=
X-Received: by 2002:a05:600c:221a:: with SMTP id
 z26mr11348033wml.20.1637249505418; 
 Thu, 18 Nov 2021 07:31:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxf3gTWy4F7GIuKz0mGuxxXSyN+kmbNTBillCtP2WskXzS+pVop/k/887LrQCFjetRRqMADHQ==
X-Received: by 2002:a05:600c:221a:: with SMTP id
 z26mr11347983wml.20.1637249505209; 
 Thu, 18 Nov 2021 07:31:45 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id w15sm147623wrk.77.2021.11.18.07.31.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Nov 2021 07:31:44 -0800 (PST)
Message-ID: <3e55da77-66e1-d9ac-e23a-3fa0beceec8e@redhat.com>
Date: Thu, 18 Nov 2021 16:31:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v4 00/25] block layer: split block APIs in global state
 and I/O
To: Paolo Bonzini <pbonzini@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20211025101735.2060852-1-eesposit@redhat.com>
 <93821bd8-2ac0-a19e-7029-900e6a6d9be1@redhat.com>
 <a2891f6d-f383-f252-4b82-da08b2a2c1d7@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <a2891f6d-f383-f252-4b82-da08b2a2c1d7@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.084, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Eric Blake <eblake@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 John Snow <jsnow@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18.11.21 14:50, Paolo Bonzini wrote:
> On 11/15/21 17:03, Hanna Reitz wrote:
>>
>> I only really see four solutions for this:
>> (1) We somehow make the amend job run in the main context under the 
>> BQL and have it prevent all concurrent I/O access (seems bad)
>> (2) We can make the permission functions part of the I/O path (seems 
>> wrong and probably impossible?)
>> (3) We can drop the permissions update and permanently require the 
>> permissions that we need when updating keys (I think this might break 
>> existing use cases)
>> (4) We can acquire the BQL around the permission update call and 
>> perhaps that works?
>>
>> I don’t know how (4) would work but it’s basically the only 
>> reasonable solution I can come up with.  Would this be a way to call 
>> a BQL function from an I/O function?
>
> I think that would deadlock:
>
>     main                I/O thread
>     --------            -----
>     start bdrv_co_amend
>                     take BQL
>     bdrv_drain
>     ... hangs ...

:/

Is there really nothing we can do?  Forgive me if I’m talking complete 
nonsense here (because frankly I don’t even really know what a bottom 
half is exactly), but can’t we schedule some coroutine in the main 
thread to do the perm notifications and wait for them in the I/O thread?

> (2) is definitely wrong.
>
> (3) I have no idea.
>
> Would it be possible or meaningful to do the bdrv_child_refresh_perms 
> in qmp_x_blockdev_amend?  It seems that all users need it, and in 
> general it seems weird to amend a qcow2 or luks header (and thus the 
> meaning of parts of the file) while others can write to the same file.

Hmm...  Perhaps.  We would need to undo the permission change when the 
job finishes, though, i.e. in JobDriver.prepare() or JobDriver.clean().  
Doing the change in qmp_x_blockdev_amend() would be asymmetric then, so 
we’d probably want a new JobDriver method that runs in the main thread 
before .run() is invoked. (Unfortunately, “.prepare()” is now taken 
already...)

Doesn’t solve the FUSE problem, but there we could try to just take the 
RESIZE permission permanently and if that fails, we just don’t allow 
truncates for that export.  Not nice, but should work for common cases.

Hanna


