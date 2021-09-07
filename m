Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C472402987
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 15:19:21 +0200 (CEST)
Received: from localhost ([::1]:55878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNb0S-0000tv-KZ
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 09:19:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mNafa-0001Za-OV
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 08:57:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mNafM-0003jf-9E
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 08:57:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631019451;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0xDdXr4Hf44fCkIifioaaBOsBZP2nc+cN8k2e3QFrIM=;
 b=IEtAQ8a9d+Nhzr0X8Qo8FdKycMTpbqCDmGCs/24F82jSOWdXJRlaLetCzIcoVmM7gMsTVa
 thasfaI6AkGsIzmXtT4rxwFoCGYjeNgHhQ2FPv0O7vY5qLq4rrsO3HONGArDYu/xH8TYpz
 g5Q5vFFxNQ3Mg2EQjS7s62anTmtDPJE=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-442-TkFipRqROR2xRthdhZUAcA-1; Tue, 07 Sep 2021 08:57:27 -0400
X-MC-Unique: TkFipRqROR2xRthdhZUAcA-1
Received: by mail-ej1-f72.google.com with SMTP id
 cf17-20020a170906b2d100b005d42490f86bso3656021ejb.3
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 05:57:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0xDdXr4Hf44fCkIifioaaBOsBZP2nc+cN8k2e3QFrIM=;
 b=qHe4ALSYN1pSeWglfaC2l+fWceoR5nq/urnSbX5oxkIA/goE0E49uvHdwc6dVUIKGf
 ITciW2jMbZeGLeduG0sVT3nQ2XUAAYPtXjrumWZKE5Ga7bDX5PPMBLWk533loX4oYGb9
 N0mxZQbc7bbRuDSrSOfXlmU5JyDuGOubuXPMgKLDUf0/oLqalveJYTDpeELjwTfmGtVk
 6cA/NSpvLFV+y/u3K+ATM4GcoHD1RDtZtxSID/rFf2HSFnrJx0PTBv+KSgxIozYt1qWl
 1NclwVhYlfSoArOK1L+qBQlZZcOTogT7XOWE2vKc5iMCL7r93bqO9Splrc6k83C43IZZ
 /xRw==
X-Gm-Message-State: AOAM530FQAxfRdWHG2YRBS8Aqynp0WckF232x/rLDDWXZfRKrm0bv8u6
 gshRBNH3l2tEJOL8TQ4docKIS9AQ5hjxP0z8PMNaGn2r6B6CTZFTi4a/emxTchOSSs58tssQ228
 4fAV8h5Qnp2A6Ubs=
X-Received: by 2002:a05:6402:3098:: with SMTP id
 de24mr18875420edb.326.1631019446387; 
 Tue, 07 Sep 2021 05:57:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxAWlv6RlnDXkoTbCDZ6aT50cNZOM5kgeIDk27n5YMCG9A2rTuZ/u3qPNjk4Dmqc0FESfCB+w==
X-Received: by 2002:a05:6402:3098:: with SMTP id
 de24mr18875409edb.326.1631019446231; 
 Tue, 07 Sep 2021 05:57:26 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id jx21sm5414596ejb.41.2021.09.07.05.57.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Sep 2021 05:57:25 -0700 (PDT)
Subject: Re: [qemu-web RFC] CONTRIBUTING.md: Mention maintainers
To: Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org
References: <20210906170038.26602-1-hreitz@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <63441b5c-2262-3b7a-e0bd-e6f41401a64a@redhat.com>
Date: Tue, 7 Sep 2021 14:57:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210906170038.26602-1-hreitz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.332, SPF_HELO_NONE=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 06/09/21 19:00, Hanna Reitz wrote:
> This is an RFC first because I feel bad about sending a patch that
> gives people responsibilities who aren't me.  But Thomas seemed to agree
> with me that making this requirement explicit would be nice, so I guess
> someone has to send a patch for it...

Don't feel bad, I'll make sure you'll have to send a v2.  Actually I'm 
kidding, this looks good to me and I've merged it.

But we should make a decision on accepting qemu-web merge requests on 
GitLab.  For that, apart from touching the CONTRIBUTING.md file, we 
should also edit 
https://www.qemu.org/2017/02/04/the-new-qemu-website-is-up/ which 
suggests using "git send-email".

Paolo

> Second, I'm not sure whether this is the ideal place.  Perhaps we should
> have a MAINTAINERS file, but on the other hand, maybe that would be a
> bit too much.
> ---
>   CONTRIBUTING.md | 5 +++++
>   1 file changed, 5 insertions(+)


