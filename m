Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD4F387634
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 12:12:29 +0200 (CEST)
Received: from localhost ([::1]:44932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liwiC-0005Qq-9o
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 06:12:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1liwNe-0001g6-7i
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:51:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55079)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1liwNc-0005o4-Nf
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:51:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621331472;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0WulmnstO/dVStg1w/uCPv+CD1abYRqwMpLe8r/uNGY=;
 b=D9OY2peazd3CMlpeZHs0HWDMG2XWuPi8IGrS7Cq/fywGeJDN3eR29FhoxRy48+ixoyq5yH
 nTKn2RLg9xsqGpnVTCGDB5JVVjhQjKb5FAXDOYcp5RQHmbyW8RqMaFWLpBJdH84A9jPQBs
 c/xvTCY1P7Mz73emkbhsPucfjw2ouYQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-316-ld--b4KcNY6BztGhog7yvw-1; Tue, 18 May 2021 05:51:10 -0400
X-MC-Unique: ld--b4KcNY6BztGhog7yvw-1
Received: by mail-wr1-f69.google.com with SMTP id
 p11-20020adfc38b0000b0290111f48b8adfso1859560wrf.7
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 02:51:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0WulmnstO/dVStg1w/uCPv+CD1abYRqwMpLe8r/uNGY=;
 b=j4aNo9MWqLD0cHaBaga5zc8vWOcULxtnaop9jxB5ff127KnbT5Pl9Wp3Si9B4HpuI7
 J28MLsmcon3dfF5fQDe+2igvCDJkv1rudBvJAEVtIzBef4ZNS+P+3rOUImbl8bBXynqf
 RnFt76TmG8St3Y/oa1yW5E451yFiB6BrSQhy9hELBZe+iQJZsdNvYOLIHMcyYx1sA/sx
 fmmlXVS2zrAA6NdGmuhVZXgFkVbdUtn9GUrxdcZUQxSqLhzZ5n5+KjWS9jC0w1fuCkVU
 Sh0TLcZnI5ljWX+/LRa2UJMfi/Bk2dz29qexmE4hBl1Lwef/dobqnztB/nOKEYbijEdT
 406Q==
X-Gm-Message-State: AOAM532rXZM31szH6URSVrfIP+p2vpovU9LhdeyJUy0xxbMIp0yjHtWY
 SPQt7IrlpQ/5yLx2pMoX55f5I1lV2Nf/AFeIynJANOd2QyxM/TsxVAegGkUyDtK+A2zqf3Wlgc7
 tJqJAaqqLNFSluxE=
X-Received: by 2002:a05:6000:44:: with SMTP id k4mr5800073wrx.76.1621331469504; 
 Tue, 18 May 2021 02:51:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyxbS4Ky292TnxELUwYr0INZkkgd0jkCES1Bg8vIoCD9s0znVpn2JAOtz2b8YOK+ag6WAkOEw==
X-Received: by 2002:a05:6000:44:: with SMTP id k4mr5800056wrx.76.1621331469364; 
 Tue, 18 May 2021 02:51:09 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id g128sm8823705wme.0.2021.05.18.02.51.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 May 2021 02:51:08 -0700 (PDT)
Subject: Re: [PATCH v2 30/50] target/i386: Assert !SVME for user-only
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210514151342.384376-1-richard.henderson@linaro.org>
 <20210514151342.384376-31-richard.henderson@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <baf949b3-a73d-963c-03d6-adcb62e4f455@redhat.com>
Date: Tue, 18 May 2021 11:51:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210514151342.384376-31-richard.henderson@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: cfontana@suse.de, f4bug@amsat.org, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14/05/21 17:13, Richard Henderson wrote:
> Most of the VMM instructions are already disabled for
> user-only, by being usable only from ring 0.
> 
> The spec is intentionally loose for VMMCALL, allowing
> the VMM to define syscalls for user-only.  However,
> linux does not do so; VMMCALL is illegal.

Perhaps:

However we're not emulating any VMM, so VMMCALL can just raise #UD 
unconditionally.

Paolo


