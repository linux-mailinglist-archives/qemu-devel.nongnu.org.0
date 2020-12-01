Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 685EC2CA70F
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 16:28:38 +0100 (CET)
Received: from localhost ([::1]:42900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk7a1-0004BC-Ff
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 10:28:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kk7V4-00010P-Jv
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 10:23:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20501)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kk7V2-0004ai-0n
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 10:23:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606836205;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D10zVjoR/GH9V3Zy7rzmrxKPOXaKDAulrmZ7vP2eTNs=;
 b=S3VtA7cluAuV8yPimgJtjWmazybkAH0vHzGTkN+ULmdmdUtM+i9/6BCGc2nXwYpwWOWiyg
 vYW4Z18w9nspTUfiXTn3DUG0jikwjj9n6+VFrnkDBIq6+hoUhyyet/S4pLAdOD9tsHrHzU
 TjNVN+ftP2OIyoDQtFzENRgZdr2+S4g=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-277-3NPWbSBNM5WtyyWBO1-btw-1; Tue, 01 Dec 2020 10:23:21 -0500
X-MC-Unique: 3NPWbSBNM5WtyyWBO1-btw-1
Received: by mail-wm1-f71.google.com with SMTP id o17so1058933wmd.9
 for <qemu-devel@nongnu.org>; Tue, 01 Dec 2020 07:23:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=D10zVjoR/GH9V3Zy7rzmrxKPOXaKDAulrmZ7vP2eTNs=;
 b=XVHVwRwmOT7qDif/gOkhLYNae6TalKJT3zPPUs4emGfMw3UUfYvuQ1XJpoBcfyL0/1
 BvVE1jdMlJ56uk8JoATSmYBl9p1y6hUyI5qPxkmXHjOEdPmtuKEpdqLAaolNaSSZMiDj
 DfVGDCaCM2VSPd7n+pL1+C2aYbCP5TE6szeqUR1qXosLk31gTzv+WNl/uygS0dzgZnLc
 uvTkMybbi0UpQ0/LMEoeSv5rqsNNKc2dK1ciLI/nbBPNrn2i/10ys9Nd12FfH7lRaw26
 jnlnbgU84T1NhZaai0NXPSEpV5XN+ilpftKBlyqQOc/tQKtk4ojP2zBJ8kI5eHBnIXP8
 s8/w==
X-Gm-Message-State: AOAM530xK9ImuwC4tNWk+C6bG9jPa2s2VToLMpjzXn+KVWIo+E7oqnnA
 MIRxLEAypNXMESgcKshGyCLe6fbPAwwpjGtd6VU+WtrIBAMFxIgZGj9dzKKNlrR92XL7RUY7P7Z
 WW2VBVwTPOWZuqdo=
X-Received: by 2002:adf:c844:: with SMTP id e4mr4643685wrh.345.1606836200160; 
 Tue, 01 Dec 2020 07:23:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxhLJWy7sXY1w/RJ+43Em2Q9aTWCfz5PxjUnGwMcF6PPqH98X93IjcBXPb0OMB/JCUGYRjIDQ==
X-Received: by 2002:adf:c844:: with SMTP id e4mr4643669wrh.345.1606836200028; 
 Tue, 01 Dec 2020 07:23:20 -0800 (PST)
Received: from [192.168.1.36] (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id a65sm258675wmc.35.2020.12.01.07.23.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Dec 2020 07:23:19 -0800 (PST)
Subject: Re: [PATCH] ide:atapi: check io_buffer_index in
 ide_atapi_cmd_reply_end
To: P J P <ppandit@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20201118142745.112579-1-ppandit@redhat.com>
 <204751s9-11np-413q-q3pr-3o6os86078@erqung.pbz>
 <492170b8-8056-bd65-5150-62c6e89cb3f0@redhat.com>
 <933np1s-8p4p-o74p-rp94-517r98nop2o6@erqung.pbz>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <0fd8daa2-7ce3-0231-8b95-d498ce900c8e@redhat.com>
Date: Tue, 1 Dec 2020 16:23:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <933np1s-8p4p-o74p-rp94-517r98nop2o6@erqung.pbz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Michael Tokarev <mjt@tls.msk.ru>, Wenxiang Qian <leonwxqian@gmail.com>,
 John Snow <jsnow@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Prasad,

On 12/1/20 4:00 PM, P J P wrote:
> * I was thinking about checking 'elementary_transfer_size' against 
>   'byte_count_limit', but that did not work out. The loop is confusing there,
>   it first sets elementary_size = size and subtracts the same   

If the code is confusing, you can rewrite in a less confuse way :)
That way the problem are easier to notice.

> * I tested the patch with a reproducer and it helped to fix the crash.

[thread hijack]

About reproducer, Michael asked about CVE-2020-24352 (ati_vga OOB in
ati_2d_blt) this morning. What happens to reproducers when a CVE is
assigned, but the bug is marked as "out of the QEMU security boundary"?

Is it possible to release the reproducer to the community, so we can
work on a fix and test it?

Thanks,

Phil.


