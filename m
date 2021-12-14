Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED31D473F21
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 10:16:48 +0100 (CET)
Received: from localhost ([::1]:33278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mx3vT-0005TA-EN
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 04:16:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mx3u2-0004Wb-S3
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 04:15:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58143)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mx3u0-0002F4-Ex
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 04:15:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639473314;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+Kk85KTl+7IdXUjjl4lEha/e9L8sbcBOBJQ9KBiV0Io=;
 b=MPgx2KiFtuhubUge1BtCs7POL0xPNYGSLNTNbozVP7xp0APilh8m/tAukiwrS2f3oZ3tyH
 7Pl8K5WcarelhTzLurvMiP+kVJ162ZeGwGfnk5SXxx6xzlk7jh+WbuTPPwL3Wk1vaOtmXb
 i6s3z4IwZMYYxa/obNKOWjP0Pp6PgqI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-15-3cy37EwRM6K3m6KJEFWexg-1; Tue, 14 Dec 2021 04:15:11 -0500
X-MC-Unique: 3cy37EwRM6K3m6KJEFWexg-1
Received: by mail-wr1-f71.google.com with SMTP id
 f5-20020a5d4dc5000000b001a0b1481734so1637109wru.23
 for <qemu-devel@nongnu.org>; Tue, 14 Dec 2021 01:15:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+Kk85KTl+7IdXUjjl4lEha/e9L8sbcBOBJQ9KBiV0Io=;
 b=e9mdThxnoMuk07KwQHng5XW+YO7hOTFn5LxsWtmsVkj4wD4Jq7zAlZVBu4Ti8zB0fX
 ROmy9s0lqda3z5S+Y1e1KWYTWpl7veao8h4ep6wGflhMZq6usqGknoGZWb8m0EwHpY63
 m7GhKRp3IPBrSQ3sS9UNM+dWSSkgH2GMhybRC+AWXiHpvKMiStk3014dVT8WKfIIG2VN
 tX36xUtRV//bMgOKzhmAnaTIDxTaWLP3CBldBt78r6+3/8CKLBrGN2TeMvUF5NacvcdH
 YhwaB4E5DmgyZMqDyjsDXe1mOKxcDL2X7AbHoDrZ8ztEEhsvCTcFhR/S/pweoqoW28Jm
 d9Gw==
X-Gm-Message-State: AOAM531Xnk+MzQUJIyAd1NwCxoH1RSaPP68D868YuQelVp3M8MVyq7Rg
 QPFPMQZVBJ8cuwfXejX2FpIH6TjBWxZVxCBgice7Fl1qdClaD4Yxkvqh5wsR71o/M9y3fWW+p7A
 obrL93xXGBKdGbO4=
X-Received: by 2002:adf:9cc4:: with SMTP id h4mr4401075wre.644.1639473310190; 
 Tue, 14 Dec 2021 01:15:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwwaC5CuZNtCtoj1wvRaVQp4eU7fOCeoggEwCILmIp4b7yM1xxO/8Ro+y2NIMeT8yPDWPYzIA==
X-Received: by 2002:adf:9cc4:: with SMTP id h4mr4401050wre.644.1639473309914; 
 Tue, 14 Dec 2021 01:15:09 -0800 (PST)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id d2sm1541337wmb.24.2021.12.14.01.15.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Dec 2021 01:15:09 -0800 (PST)
Message-ID: <8e55777f-b99c-2b5e-8c24-de942b907463@redhat.com>
Date: Tue, 14 Dec 2021 10:15:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 3/4] Move CONFIG_XFS handling to meson.build
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20211028185910.1729744-1-thuth@redhat.com>
 <20211028185910.1729744-4-thuth@redhat.com>
 <e02332c0-7c4e-18a2-5c33-b00e8045f6da@redhat.com>
 <7da70e19-537b-9ca5-125d-f9bcf2d3f6df@redhat.com>
 <aa0b8d39-32ad-b3a0-afff-474de704211f@redhat.com>
 <4ebf08ed-dd35-8347-45f8-18be46fae16f@redhat.com>
 <73e6f8e1-d30c-6c1b-008f-235f624d08f0@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <73e6f8e1-d30c-6c1b-008f-235f624d08f0@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.716,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.962, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/12/2021 11.10, Paolo Bonzini wrote:
> On 12/10/21 09:46, Thomas Huth wrote:
>>>
>>> platform_test_xfs_fd() is only used to decide whether to invoke 
>>> XFS_IOC_DIOINFO; but failures of XFS_IOC_DIOINFO are ignored anyway, so 
>>> we can get rid of is_xfs in BDRVRawState, too.
>>
>> After staring at the code for a while, I wonder why we're not simply using 
>> fstat() here instead to get the st_blksize value... wouldn't that be 
>> better anyway since it also works with other file system types?
> 
> The value that XFS_IOC_DIOINFO returns is the logical sector size of the 
> underlying device; it should be 512 or 4096, but more likely 512.  It can be 
> smaller than st_blksize, because often it will be if it is 512 but the 
> st_blksize is usually 4096.
> 
> If it is wrong, QEMU will do unnecessary read/modify/write operations for 
> disk writes that are not 4K-aligned.

Ok, true, I've checked it and XFS_IOC_DIOINFO return 512 on my laptop 
indeed, while fstat->st_blksize is 4096 instead. So it's not the same :-/

  Thomas


