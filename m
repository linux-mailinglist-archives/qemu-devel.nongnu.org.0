Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A905B3278EF
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 09:11:28 +0100 (CET)
Received: from localhost ([::1]:42562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGdeJ-0005KS-N2
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 03:11:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lGddP-0004rT-B3
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 03:10:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:34667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lGddM-00064y-21
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 03:10:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614586226;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JJJnrDAb2MgwkYQsyoK94m1HCHKbG4+DlLZdVVy68eI=;
 b=NnokL1wf8QodwpRUrOZ3lXn+4JJvoyxcYBhXG27W+IAiDK7Iv4tpgwop9T81cuZGLyD9w9
 OLW7hVJ5yUvQ+VJjlt8DsspVtx8kAr+qsUUEZw3Q1wTt96523vjA1gLTWDBRqZQvGQlwj5
 bYpCjhYpKp0FX16MMvnkHotPqkJxnc0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-350-GRHzsuqjOBK1YQ8-mjDISg-1; Mon, 01 Mar 2021 03:10:24 -0500
X-MC-Unique: GRHzsuqjOBK1YQ8-mjDISg-1
Received: by mail-wr1-f70.google.com with SMTP id b7so8950127wrv.7
 for <qemu-devel@nongnu.org>; Mon, 01 Mar 2021 00:10:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JJJnrDAb2MgwkYQsyoK94m1HCHKbG4+DlLZdVVy68eI=;
 b=qncQJcURoEzxySHLqBNNhUcBUccQRGheUs0AqB0rrHJbJYDjPbscd8noMN7NRhK5Aq
 XaJ3877Rw76yjEcg+PdVNWaYYQtP9cBnk7+yta9XgWTnFw62o1lVsRyhIHHhdGVX57ZM
 tjisrHSDuLpgqbfY/TZulpKVz/jPsFJc1frytZl3SIGxBjqq04i2w+fRlc5eTx2s+km9
 L275ppR4IpkGdTE7pFfjkKJvdRTY88pEylxImosBcZnHk9OFRK3lTA1DkRZJyLhxek7f
 cmNTlWC6nKLlAcXsECz/lK8zPchOgv05hf99qy0EkvTv/iQzwe4QQST/Rqpq0WzpHZ7b
 80rg==
X-Gm-Message-State: AOAM533PgaF1TX2MM0SOY04oR28bmIqu3zqRY4gW6CBJC4NYlPeLL1rS
 A+TvYfrsIkOiNcFRYanq92YHP6MbAQUG1jYYClFtKum9aWyJhS/QCUolNHuidBvguBWYCeXi5ok
 ap+NJRtt1pGE15SdCj0JFAUyTj7dolCm2wFa+/QGaP3BspuXlR6E9wBHUkB/lLMlb
X-Received: by 2002:adf:d851:: with SMTP id k17mr9695814wrl.254.1614586223390; 
 Mon, 01 Mar 2021 00:10:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy85Z7BjcLTExnWMIBf1dsMEGvZdOuVYbZ5yIsucVDcXERvvqUi8RNAZ78CzfRmeIa+YMYhQA==
X-Received: by 2002:adf:d851:: with SMTP id k17mr9695723wrl.254.1614586222205; 
 Mon, 01 Mar 2021 00:10:22 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id f16sm23118562wrt.21.2021.03.01.00.10.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Mar 2021 00:10:21 -0800 (PST)
Subject: Re: issue with meson and recursion: negation missing in add?
To: Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
References: <db7f5fca-be04-b36a-33ac-efd0fa79011b@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <d186b95d-7fe9-2f37-382f-2dcc1a79b31e@redhat.com>
Date: Mon, 1 Mar 2021 09:10:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <db7f5fca-be04-b36a-33ac-efd0fa79011b@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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

On 2/27/21 11:23 PM, Claudio Fontana wrote:
> Hi Paolo,
> 
> I don't know how to handle an issue in the current way we are using meson with recursion, ie always recursing,
> and testing multiple options inside the recursed directory.
> 
> In the case of ARM, we have:
> 
> target/arm/tcg/meson.build,
> 
> where I need to check all the time for TCG, given our current standard of always recursing.
> 
> Besides being error-prone to always remember to check for CONFIG_TCG,
> 
> how do I add some object conditionally on whether CONFIG_TCG is true, but TARGET_AARCH64 is false?
> 
> I'd need something like:
> 
> arm_ss.add(when: [!TARGET_AARCH64,'CONFIG_TCG'], if_true: files(
>   'tcg-cpu-models.c',
> ))
> 
> but the negation !TARGET_AARCH64 is a syntax error... is there any way to negate the condition?

Funny, I asked Paolo the same question last week on IRC, but:

- I also included TARGET_SIZE in the when:
- your email is clearer than my questions :)

> 
> Also as we nest directories more and more, it seems to me that this becomes more and more confusing.
> 
> How about dropping the idea to recurse always unconditionally?
> 
> Thanks!
> 
> Claudio
> 
> 


