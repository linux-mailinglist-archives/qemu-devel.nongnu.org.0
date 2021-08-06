Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D26FC3E22DD
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 07:26:46 +0200 (CEST)
Received: from localhost ([::1]:46822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBsNZ-0002Ax-Sd
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 01:26:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mBsMY-0000lg-99
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 01:25:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mBsMV-0007N5-RT
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 01:25:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628227539;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wdUf8nZFgQxWCMeYpPx9Sr+EpRqx6lqszJJrP65dHAQ=;
 b=ZUI1kpgPfvwKlz7Iv0sXXGdLc8g3dUmaHWUuooYrgyf6mAA139/gTm1CO+BvzccqJs+1mk
 cTGKEpvy2JTX86866FHVJrf+6v69pkA+AHZSlJsfC5NLnn7wnT0pbYyoHoqMWW9nIoc+S3
 RuP64j29qYvDSGSuoiQqrPP7J8w9oFs=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-353-YC4LUWNIOTKD-HOHf_wxNw-1; Fri, 06 Aug 2021 01:25:35 -0400
X-MC-Unique: YC4LUWNIOTKD-HOHf_wxNw-1
Received: by mail-wr1-f71.google.com with SMTP id
 r17-20020adfda510000b02901526f76d738so2758280wrl.0
 for <qemu-devel@nongnu.org>; Thu, 05 Aug 2021 22:25:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wdUf8nZFgQxWCMeYpPx9Sr+EpRqx6lqszJJrP65dHAQ=;
 b=sLijjkifOt5VUwZmCAbx/pF+na9cacqkW6PDmHC6kwQcH9BjDZ52JQRCJS51nvyyC7
 4ZSDQG6ZUT2qSdCL4vXm8JMN4nq7iBsxWTjMCHLh2j+TCJHi/4lSe/jRJedbH2Y2geJR
 Yx3k7gVkhwPkTkaxuMyupRdSCVWCnkj639XkwF6YIXMcJhq2CgqN31+pR9efpx7/nTBj
 DDGKdaNNmHp9mUcly1ZdvuMu5sM7pEOImD5U+mUf76iRia9dxejDhLsBl0z5uDwwWTO/
 1oU53JWfHR67LMqYbG4mArfrd01/9ObvqUlCXS4IUvzYpMwvxN9h8n54YLsbO8ltcX8N
 JZzQ==
X-Gm-Message-State: AOAM533SggrAMF/Cz6m0MZiCnvvQQnWl45CWwzD58eJMGRB1icTwsW7u
 Tc6z8m9oh58QgYWdG8w9xyvnZWpF3B2iZIlT0rCM4529eXZjnTTXgKcdu5FuqJhljg2MCrMlW6Y
 l3MhpJdCLuMGBNl4=
X-Received: by 2002:a05:600c:3581:: with SMTP id
 p1mr1363433wmq.1.1628227534495; 
 Thu, 05 Aug 2021 22:25:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzvgNVEHTKl4eg+OjTUVZyUq859RrFcN5yLLpIlCNFfm+nA69sUdDi178qzn/pafjHa8pvWtw==
X-Received: by 2002:a05:600c:3581:: with SMTP id
 p1mr1363408wmq.1.1628227534210; 
 Thu, 05 Aug 2021 22:25:34 -0700 (PDT)
Received: from thuth.remote.csb
 (dynamic-046-114-147-107.46.114.pool.telefonica.de. [46.114.147.107])
 by smtp.gmail.com with ESMTPSA id u11sm8209202wrt.89.2021.08.05.22.25.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Aug 2021 22:25:33 -0700 (PDT)
Subject: Re: [PATCH v8] tests/tcg/s390x: Test SIGILL and SIGSEGV handling
To: Ilya Leoshkevich <iii@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Cornelia Huck <cohuck@redhat.com>
References: <20210804225146.154513-1-iii@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <24e2f339-da2f-3317-070d-7e8761c47271@redhat.com>
Date: Fri, 6 Aug 2021 07:25:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210804225146.154513-1-iii@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) DKIMWL_WL_HIGH=-0.699, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.132,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: "jonathan . albrecht" <jonathan.albrecht@linux.vnet.ibm.com>,
 Ulrich Weigand <ulrich.weigand@de.ibm.com>, qemu-devel@nongnu.org,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Andreas Krebbel <krebbel@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05/08/2021 00.51, Ilya Leoshkevich wrote:
> Verify that s390x-specific uc_mcontext.psw.addr is reported correctly
> and that signal handling interacts properly with debugging.
> 
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> ---
> 
> v7: https://lists.nongnu.org/archive/html/qemu-devel/2021-08/msg00463.html
> v7 -> v8: Another rebase needed due to the conflict with Jonathan's
>            50e36dd61652.

Thanks for respinning this patch! I now gave it a try, and it seems to work, 
but the output looks a little funny:

   SKIPPED signals on s390x because BROKEN awaiting sigframe clean-ups and 
vdso support
   TEST    test-mmap (default) on s390x
   TEST    testthread on s390x
   TEST    threadcount on s390x
   TEST    hello-s390x on s390x
   TEST    csst on s390x
   TEST    ipm on s390x
   TEST    exrl-trt on s390x
   TEST    exrl-trtr on s390x
   TEST    pack on s390x
   TEST    mvo on s390x
   TEST    mvc on s390x
   TEST    trap on s390x
   TEST    signals-s390x on s390x

i.e. it first says "SKIPPED signals", but later still executes the test. 
Could that be fixed somehow?

  Thomas


