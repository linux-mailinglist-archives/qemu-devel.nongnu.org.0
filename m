Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B553A2D67
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 15:47:04 +0200 (CEST)
Received: from localhost ([::1]:52630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrL1T-0000cO-8O
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 09:47:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lrKvG-0004cn-6j
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 09:40:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lrKvC-0008Mv-1r
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 09:40:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623332433;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mbbrwV9Qwr8m0szI3eufiqo8Qihr9CJRbJ2okfyJiY0=;
 b=EvS5Nl8Z+oE+W/k/WiAxJr+WdVGWLTQdLPvzYquJFWzk3W25TCWD/ZiOyQ+/2qGi2zkBtK
 Nw/911FALinE41F3OD37q/NVbpMwD11dQOoPEiTtFiAUNRjBbDu4F8nfoqutmPp69ciZt3
 K0l6ukgP7mq2DORiDMQzvBAGfKYK5v8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-529-yBGK3skzPumb2bE2Xh8XCA-1; Thu, 10 Jun 2021 09:40:30 -0400
X-MC-Unique: yBGK3skzPumb2bE2Xh8XCA-1
Received: by mail-wr1-f69.google.com with SMTP id
 e9-20020a5d6d090000b0290119e91be97dso924742wrq.1
 for <qemu-devel@nongnu.org>; Thu, 10 Jun 2021 06:40:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mbbrwV9Qwr8m0szI3eufiqo8Qihr9CJRbJ2okfyJiY0=;
 b=B/JQb/rVPWLXEW5Wx6vbCA+E3SgU2tRMSJEhevRZ7pGuGU/Yu2DAyB1bys4ZxoDEHP
 0ut38gWNO0yjHpcPX3PzyP/BUCm5lZAZBO+QmmnmoWTTC5zyUH1qN70LjUPNTQ/6REPI
 UW2xbu5DlUxghnP2PbRxtlLJivWQw/v2i7kX8+7irrGFe3ctQ3dfOXONfW3QM2HUcTTD
 auSP4rcF5bCCg8NVigUSfk/tVJDHVLJeQ2oeLDnknlhzWG2YLYIvzEcw+pkoi3zeu+yw
 +htrtU3lTb4kS+o5ec3NQDId4Ckwoles9V2236q11xpC21AjO/CCZNvg0wGd6Y80xJWa
 s+Jw==
X-Gm-Message-State: AOAM530YR/b8b8y02u30irgNTnW7B+ohtrGHf2LJztEZzAWE6uGeVoXJ
 1U3Mv3FfjRTWtS6EAYS0PfX94quMFpVMP5s2clqNvsjEBxq9mYCy4qXPr+9HBnALjeWAScU72lK
 VrS0ictGPCl+jK34=
X-Received: by 2002:a05:6000:1847:: with SMTP id
 c7mr5599482wri.368.1623332429087; 
 Thu, 10 Jun 2021 06:40:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxgXRug6E3CdIevURcFBmUdzP6NHD0XfDhnkoVr/5u86e+EDpjr2oJMfScJ1IflxaKEhNinNg==
X-Received: by 2002:a05:6000:1847:: with SMTP id
 c7mr5599465wri.368.1623332428936; 
 Thu, 10 Jun 2021 06:40:28 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id b15sm4391462wrr.27.2021.06.10.06.40.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Jun 2021 06:40:28 -0700 (PDT)
Subject: Re: [PATCH v3 0/7] block: file-posix queue
To: Maxim Levitsky <mlevitsk@redhat.com>, qemu-devel@nongnu.org
References: <20210603133722.218465-1-pbonzini@redhat.com>
 <fd152c25cea259da55f10e984391d3dd5381ab18.camel@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <ca48dc16-2f55-934d-ae24-cbc9f563f86c@redhat.com>
Date: Thu, 10 Jun 2021 15:40:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <fd152c25cea259da55f10e984391d3dd5381ab18.camel@redhat.com>
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: kwolf@redhat.com, qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/06/21 15:52, Maxim Levitsky wrote:
> I used to have a patch series that was about to fix the block limits of the scsi-block,
> which I think is similar to this patch series.
>   
> Sorry that I kind of forgot about it for too much time.
>   
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg768261.html
>   
> I'll need some time to swap-in this area so that I could compare our
> patches to see if we missed something.

They are indeed very similar; the only substantial change is that my 
patches also clamp max_hw_transfer to max_transfer.

I picked up patch 5 from your old submission and queued it, since it's a 
SCSI change.

Paolo


