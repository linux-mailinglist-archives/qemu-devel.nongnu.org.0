Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D0003AB117
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 12:14:00 +0200 (CEST)
Received: from localhost ([::1]:47748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltp26-0003zm-W9
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 06:13:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ltonk-00044r-M4
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 05:59:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55469)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ltonj-0000nX-2W
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 05:59:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623923946;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GerGRtSJPmwiBI54MdauEPRITLYiJulcCsQiJAabEGU=;
 b=BYJ4mnDB+JpIXaNReOu51OmBU7rjlHNChLpLuDTN3QaAGGelJAuXV7pdS9WycwbAmFYxID
 pJVUyAEm7GpsJzdDG4RBKdKWmIarHSqwpq4M/sOmFKuWuZKkuXwGfQsmA+j9713+7aEBGo
 MsO5LG7ZNXA6MYlZIb1kedwgtL8J0sw=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-591-VqDv86KFMluwmZXsGpSYsQ-1; Thu, 17 Jun 2021 05:59:05 -0400
X-MC-Unique: VqDv86KFMluwmZXsGpSYsQ-1
Received: by mail-ej1-f69.google.com with SMTP id
 mh17-20020a170906eb91b0290477da799023so1277168ejb.1
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 02:59:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GerGRtSJPmwiBI54MdauEPRITLYiJulcCsQiJAabEGU=;
 b=RQupOf67j68b/WXDxD0eHv5PLmF+gYN2Qhe72I6mkXIl0nFRpRHLG+XzrbgbPf6qBm
 QofFb8vQNxV5RpaGNBI81B/Ws3iGWcain4gBpa25r5rVjbEIiTTbtVQA1A3SB73UKW0j
 57J13DDZdlsm0LkSPsgGZDvxbJpjcCWJ7NTX2Osa0q8ssNPiFLaQTWK6bG3Ti40d1nGB
 Db9/uHTHmNS/pnxrIMcWnCVqQTzeDgLUrjwZRIA65L9maoXI3G84pZFLqhpngClCkfxE
 sTpSF7fLQMOWLs0efXuB+F6qB6+qmNTBIR0JoqvEnKmjr4qJZHA6PRy5m7BoW/URw7IC
 KfVA==
X-Gm-Message-State: AOAM531HtpChbP9WEJpyOrks9aMECl1ovKYBw6AVvTtW19bbgonBAZp0
 y7eSzcO2iYyn+rA+HJkSshnBO5B0CLgrYzy+ECaYrVeLqN2gEbcsPEOS/5JmO6Ll35lvU17AsmP
 N8MkBOSzE46gMNETpcYrNNXBNmeHms/EnVWzMGu7GZj79WC3DSDD7ObXtsJaMX20qKi8=
X-Received: by 2002:a17:907:1009:: with SMTP id
 ox9mr4405231ejb.292.1623923943790; 
 Thu, 17 Jun 2021 02:59:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz+1mS8jiEkBFNYN5Z7uEXSU6wpzduNarBLPr2iWXcMebLuf35AJfFeOkdeqUqXK0TtlhbOYw==
X-Received: by 2002:a17:907:1009:: with SMTP id
 ox9mr4405214ejb.292.1623923943556; 
 Thu, 17 Jun 2021 02:59:03 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id a3sm3795900edu.61.2021.06.17.02.59.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Jun 2021 02:59:02 -0700 (PDT)
Subject: Re: [PATCH v3 3/7] block: add max_hw_transfer to BlockLimits
To: Max Reitz <mreitz@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
References: <20210603133722.218465-1-pbonzini@redhat.com>
 <20210603133722.218465-4-pbonzini@redhat.com>
 <cb030dc0-ee6f-4c0b-723d-4197c51f8a61@redhat.com>
 <a684c31d-9da3-9e75-89c0-c68997760108@redhat.com>
 <664fb7dd-a6ca-9165-8ed7-24dac1c0ef81@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <041d365e-4586-8406-95af-4484b25e33f5@redhat.com>
Date: Thu, 17 Jun 2021 11:59:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <664fb7dd-a6ca-9165-8ed7-24dac1c0ef81@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.17, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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

On 16/06/21 15:46, Max Reitz wrote:
> Given that the checkpatch complaint is only a warning, I think it’s OK 
> to keep the comment as it is here, and perhaps optionally fix all 
> comments in block_int.h in a follow-up. I don’t think we need to fix 
> existing comments, but, well, it wouldn’t be wrong.

We don't need to, but sometimes the benefit (of not discussing 
checkpatch over and over) does seem to outweigh the churn.  Thanks for 
the review!

Paolo


