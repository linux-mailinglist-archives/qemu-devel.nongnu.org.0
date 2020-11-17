Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3CAB2B5E08
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 12:11:59 +0100 (CET)
Received: from localhost ([::1]:58132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1keyty-0006lg-L4
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 06:11:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1keysU-0005np-1S
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 06:10:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57217)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1keysS-0003bt-6K
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 06:10:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605611423;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+JOyj4kutaU2iZnp/EOgkgJPA2zLV7S8aMUZchlyxms=;
 b=M0Gh4a8/c4Oh5VK3bDGbLgH9zSzDxeAX6GA8BayKi2DYXoO/57BGYN3de5dnjMpEEaDVli
 8EZnTzkP30Q7jNuVFSi+ODC2+UdGVc1Am57AtPnOR0fTsdYFzUHCyaUjrTFKPLFecby38n
 xpUYsqTRn2RgCICBhJkQFClQJwZnrwQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-495-QMy2cz1xOLG4Rk78vdmjJA-1; Tue, 17 Nov 2020 06:10:21 -0500
X-MC-Unique: QMy2cz1xOLG4Rk78vdmjJA-1
Received: by mail-wm1-f69.google.com with SMTP id h9so1556629wmf.8
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 03:10:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+JOyj4kutaU2iZnp/EOgkgJPA2zLV7S8aMUZchlyxms=;
 b=mkIN8oN/hQ4ecm14ea/VpKjbBy/eQqcsNBGdRJCj4AH7oGtIUmjWFuZqTluZL5DSF1
 QqJe3xHxkdOAxaFcCRzZaoBz+crBCP5Gcz2kyCdXXCRE52VjrUl7FjXwoyPkTupw8bZD
 4rRp5RuyQmiPWU1x/fZkLhKHCectm49DJvom0ZSw/6Pc1RGXnki8npMIeL/mspR6yVfV
 qgVC97/aa3Pz2XZ/iL16pST0YeQuUGWV97QuBjVvJWdmnZHvCI7sQQX3RlAnqhtOydBP
 lL0Ho2heZ8fTvV33FsT6IW9Nm3UwnpkINx8iWXVv4TIR3Sk0P/6cqddRYlrC80GCOK5d
 zihA==
X-Gm-Message-State: AOAM531ryM6FGTy67Gar3qZC2heEpt9o026EeyUTEF/dLakeoczx5ah0
 AWTSXoiomilteJENwamiONCEKnGqfoHBDDn4U4Q57+x7VYJn5tURotM3hm4PHVbvnkCopymsbMQ
 8ZqkSDns22NJptLqw1G5gi9dzphTeg3HIz+Vrx7mTaTDxjsTC3H91RVnEzNNfSXUMsgc=
X-Received: by 2002:a5d:4046:: with SMTP id w6mr23946491wrp.51.1605611419770; 
 Tue, 17 Nov 2020 03:10:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwHZjUKS8Gc6GN/TNoRRrZKiXqYVQv72/IP8OtxM0N6PAb2xYKpO/yytkWi88ou/73ztiqwQw==
X-Received: by 2002:a5d:4046:: with SMTP id w6mr23946457wrp.51.1605611419482; 
 Tue, 17 Nov 2020 03:10:19 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id a12sm26562128wrr.31.2020.11.17.03.10.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Nov 2020 03:10:18 -0800 (PST)
Subject: Re: [PATCH 7/7] scsi: move host_status handling into SCSI drivers
To: Hannes Reinecke <hare@suse.de>
References: <20201116184041.60465-1-hare@suse.de>
 <20201116184041.60465-8-hare@suse.de>
 <e16d0002-8038-2ad0-da7f-969e770df2fc@redhat.com>
 <08795f50-2b4e-14cb-f5dd-709b054308c0@suse.de>
 <d2a538ca-d865-07d7-1c8f-380633bd4b0e@redhat.com>
 <f97fc536-d666-4a5e-5178-8ee86b2f3f7b@suse.de>
 <483cc7e9-fc93-2994-49cb-bd97e383dbb6@redhat.com>
 <a64eea56-f54d-f2df-4036-0ffddf24aee2@suse.de>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <f87ead6f-ab96-7205-cbb5-148cdd8a4f91@redhat.com>
Date: Tue, 17 Nov 2020 12:10:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <a64eea56-f54d-f2df-4036-0ffddf24aee2@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 01:18:45
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17/11/20 09:50, Hannes Reinecke wrote:
>> Since we're right in the middle of the freeze, let me send a RFC patch 
>> for Linux to clean up DID_* a little bit.
>>
> What's your intention there? I do have (of course) a larger patchset for 
> revisiting the SCSI status codes, so I could resubmit those portions 
> relating to DID_ codes ...

Not much.  First, renaming DID_NEXUS_FAILURE and BLK_STS_NEXUS to 
DID_RESERVATION_CONFLICT and BLK_STS_RESERVATION respectively.  Second, 
adding a __ in front of those DID_* constants that are ultimately 
changed back to DID_OK.

Thanks,

Paolo


