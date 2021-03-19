Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1585E341F61
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 15:30:38 +0100 (CET)
Received: from localhost ([::1]:52840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNG96-0000Pi-S5
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 10:30:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lNG7i-000872-Nj
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 10:29:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34092)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lNG7g-00072h-H7
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 10:29:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616164147;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pZsNPY+7u9YimaotRbLtdf9/BWsyaBDMF1BFsjRRzJo=;
 b=Tt/GjocfaB7FPy0rfKFmmATW1e6itisQMVwq+XgvlXRdCyE4Zu6RU4p/WYS/XJVjSXBGjH
 8pqYwUjxfwi3kZnxFaPF02aOCqDka1o+/A9VK6G66qellsoiXW9BM2GrEJi/0oShS3LqZl
 DEJImCrnTH8TG3ILLbeSIbJ7+RkeTSk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-603-K-7qXKQ8M5WACVgs_Wcsuw-1; Fri, 19 Mar 2021 10:29:05 -0400
X-MC-Unique: K-7qXKQ8M5WACVgs_Wcsuw-1
Received: by mail-wr1-f70.google.com with SMTP id 75so21738457wrl.3
 for <qemu-devel@nongnu.org>; Fri, 19 Mar 2021 07:29:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pZsNPY+7u9YimaotRbLtdf9/BWsyaBDMF1BFsjRRzJo=;
 b=ihf4/X2Y1m81yBjbEQc9Wp4GzbBE1+43JEQvcfxuReyoRoffJcOYEfyso6ZLT42cVk
 41XtSGjJOTfTFitl6sTpAU6PsumC+hyg8tRflKXgP4zix/eKEjFcNuJFs/e0smwKf/hM
 hJA28zL3AGEvbTs/1mrFOH/hNkcBdjX0hOPJ6CaFn6Cy82VHV2i0B41HMWeIaPE0Ojsj
 bqnC0cb0Rg2d8eua7CZEwN/XSIkTA2PoDBoxlSUpN6NBEES/aNysEBi40WyEPGQs9F18
 KDqcvaPpXdimCBLo7MfEHKfVqAbb53CoVsUAtN0opgzpddmRh2m3o39BzdhyQIN+SMeg
 6wWA==
X-Gm-Message-State: AOAM531D4q10jq/c9AMwoBqqwlT0jjYspF7QMNMCRSPQnVikPpZEvIKx
 YsfY0ukVHBqptA/94d6jnDqlK0yzXb3NVB2pftcRj+MoYK9HW4KnxkZRwUXyfTR+9HdlC0veVJK
 ZHdHsaLJ7DSkcIw0=
X-Received: by 2002:a05:6000:3:: with SMTP id h3mr4184428wrx.91.1616164144739; 
 Fri, 19 Mar 2021 07:29:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzE9fYyMuLPRIuk2BRb1KS8yZ2qpiV62QM+4v7Kpsbw6VknRtgU4bfU2hAJxqz7MJvvy8NO2A==
X-Received: by 2002:a05:6000:3:: with SMTP id h3mr4184412wrx.91.1616164144579; 
 Fri, 19 Mar 2021 07:29:04 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id p6sm7871958wru.2.2021.03.19.07.29.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Mar 2021 07:29:04 -0700 (PDT)
Subject: Re: [PATCH for 6.0 v4] hw/intc/i8259: Refactor pic_read_irq() to
 avoid uninitialized variable
To: qemu-devel@nongnu.org
References: <20210319142308.3980259-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <93a65a36-fa6d-920a-5259-1ff829715569@redhat.com>
Date: Fri, 19 Mar 2021 15:29:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210319142308.3980259-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/19/21 3:23 PM, Philippe Mathieu-Daudé wrote:
> Some compiler versions are smart enough to detect a potentially
> uninitialized variable, but are not smart enough to detect that this
> cannot happen due to the code flow:
> 
> ../hw/intc/i8259.c: In function ‘pic_read_irq’:
> ../hw/intc/i8259.c:203:13: error: ‘irq2’ may be used uninitialized in this function [-Werror=maybe-uninitialized]
>    203 |         irq = irq2 + 8;
>        |         ~~~~^~~~~~~~~~
> 
> Restrict irq2 variable use to the inner statement.
> 
> Fixes: 78ef2b6989f ("i8259: Reorder intack in pic_read_irq")
> Reported-by: Christian Borntraeger <borntraeger@de.ibm.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> Since v3:
> - Declare irq2 really local (Richard)

I forgot to keep:
Tested-by: Christian Borntraeger <borntraeger@de.ibm.com>


