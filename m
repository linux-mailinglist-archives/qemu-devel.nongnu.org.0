Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB9934E502
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 12:03:19 +0200 (CEST)
Received: from localhost ([::1]:34816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRBDS-0000ZX-SQ
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 06:03:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lRBAU-0007wX-LM
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 06:00:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:27337)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lRBAJ-0002MY-Rs
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 06:00:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617098400;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q5uQ1zpnBsKzNOPRmYsRBNGQI8ROfT08UVvh4xo52j0=;
 b=dqrOdWKBXTRetmziRLuoU2Xtn28t1bP6tahZ4KPGGk1EMhXbhPxDp+wNxeXGPWLs4zJ30H
 NQrNqUKeiBgCZUY6CEt8UnHZrzX4fJy/RAqCRVicvjFLVRiUDlPowLKFLkJIPRdsHINrek
 9kDTiJZEJgosVbMWclc3dJHTVORiLDU=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-552-fbVOJbfjPLGJX-bZKfC2Qg-1; Tue, 30 Mar 2021 05:59:59 -0400
X-MC-Unique: fbVOJbfjPLGJX-bZKfC2Qg-1
Received: by mail-ed1-f69.google.com with SMTP id h5so9965307edf.17
 for <qemu-devel@nongnu.org>; Tue, 30 Mar 2021 02:59:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Q5uQ1zpnBsKzNOPRmYsRBNGQI8ROfT08UVvh4xo52j0=;
 b=KqrvU/xLM6RgoDHeCwTqE8Idn3rT+vYPrf+sGwpEaPwxZpx6yZwfLmHyGRF2wDlVwL
 IUaSEKIXw9udGgujzO1S3gniKLTNgXzJr4Cl3r8xUlhjllV9oQD/+0pWciBFVcax4DXM
 uD3ezWHid9JjlDlN0DGhD82kZU/r0TtzufEMW8wrQdH+9xGs6y3AprcN3ENAbt4u3+zX
 xERQ6BGkU4SC03xXdfSH3cA4ArxhupLIk95abNF9KVbFfThExYRUJIbfQOxTg7tAhcsm
 fxP7bRWCvCCTRx4uIMl72HDbtA0IuCtzTorhYFGHXqk53Eyxy9hJ1/nb78tAxTkIwAuq
 M2UQ==
X-Gm-Message-State: AOAM532qKltLin9fSL9SrzDESXxh68FZt1FySowexdN826fUXK0ArQos
 FaWnR88h6qRIUB+DgnRUcsAbQHOaQdugLGQutuhq/fsKiy3kirabhdTPEcCogen9sx3F+LCnzbz
 KkhMMG5eNXT7F+js=
X-Received: by 2002:a05:6402:3550:: with SMTP id
 f16mr32379010edd.134.1617098397993; 
 Tue, 30 Mar 2021 02:59:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxn4thu3ercSby3w23ACqDx4TM0E6ns6kalHRcFYNoivNyrSKi+lWHpn7HtNiAYRJAxCY/Ihw==
X-Received: by 2002:a05:6402:3550:: with SMTP id
 f16mr32378998edd.134.1617098397844; 
 Tue, 30 Mar 2021 02:59:57 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id y17sm9797828ejf.116.2021.03.30.02.59.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Mar 2021 02:59:57 -0700 (PDT)
Subject: Re: [PATCH v2 0/6] esp: fix asserts/segfaults discovered by fuzzer
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 alxndr@bu.edu, laurent@vivier.eu
References: <20210317230223.24854-1-mark.cave-ayland@ilande.co.uk>
 <dffedca1-d7e1-206b-3260-6b9d88ac7d54@redhat.com>
 <f5ed9741-0f2b-313f-fc66-82f939b24d63@ilande.co.uk>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <d33de3a4-0ec6-0506-b19a-1e6043615980@redhat.com>
Date: Tue, 30 Mar 2021 11:59:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <f5ed9741-0f2b-313f-fc66-82f939b24d63@ilande.co.uk>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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

On 30/03/21 09:34, Mark Cave-Ayland wrote:
> Hi Paolo,
> 
> I had a quick look at Alex's updated test cases and most of them are 
> based on an incorrect assumption I made around the behaviour of 
> fifo8_pop_buf(). Can you drop these for now, and I will submit a v3 
> shortly once I've given it a full run through my test images?

Hi,

I also had some failures of the tests on CI, which is why I hadn't 
incorporated these changes yet.  Thanks for the advance warning, I'll 
wait for your v3.

Paolo


