Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8546B2CA71A
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 16:33:19 +0100 (CET)
Received: from localhost ([::1]:50800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk7eY-0007db-Gq
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 10:33:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kk7cQ-0005zB-OP
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 10:31:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:43957)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kk7cN-0007BJ-Fq
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 10:31:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606836662;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fCQwiOh6wm1fB7gK0SLvEs7cuw1VIg0JCTjMy78wD68=;
 b=Gpj41NEpa78TGfcwlF2NuOiMXallQFktNrpEvAOkEpHcitE8mAnG2vpjNCmpWrcSqyQapQ
 p7koFNJLq3V8xhImVQepZYB+bg9NfsWytklgu7MkIhwxN5q4GEJ9Zt4+qCoDxPz6OoFdcS
 KMRAdP/SiuhEGvZfzKhzkNCUCe7Lo80=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-444-cBROqXMvN-Knf-O3ftN2rQ-1; Tue, 01 Dec 2020 10:31:01 -0500
X-MC-Unique: cBROqXMvN-Knf-O3ftN2rQ-1
Received: by mail-ed1-f69.google.com with SMTP id h5so1528026edq.3
 for <qemu-devel@nongnu.org>; Tue, 01 Dec 2020 07:31:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fCQwiOh6wm1fB7gK0SLvEs7cuw1VIg0JCTjMy78wD68=;
 b=qWwWTCP02dHs+SYB18ht0Bmf+TW7UyRFkJLKaGXAoF9/H5MW2zAd4dX1sPxR4xy3KB
 dgF3tmHMnioFBRvz+5eFy0+y1Ep9tP1a2TH4pk8G4eqVxJkvf5b22XlK4aT89PmwZA9Q
 QBmfrQ46CMn3P3jsMjO+++MTQQaKm/FdrOHavZpFHLeqggOtytSTBRcz5WBDc8vBy+PE
 ibKrWKFd8M+H8IHUG/rpS9/n8TNfg7dDk6k7nC0M5Xop1u1c9p02DHSTy5a86wf39fO5
 9hJXDRyjQ+ONEsHSlnAAkBe/+3moUKNbwKoN2Yb/ODwG0k/AjMWPvSxUubayMxhY9LCZ
 twEA==
X-Gm-Message-State: AOAM530myTiQvhmIS5OlApMWws3TACZgSldODbpXT/nIt6qmHBu9VoBo
 tBum0ag4qpdIWndGiEbBAtrBCmYEq41O8701jic/Afyalk6xXFp/hqieLqjGFo7BTVl6Sg0A9AL
 /oA7Qt8uGy5gSk98=
X-Received: by 2002:a17:906:85cf:: with SMTP id
 i15mr3665707ejy.373.1606836660006; 
 Tue, 01 Dec 2020 07:31:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxZhRpJksQ/jl7aGy/K9hA6TkgJUUeapmvhvYI6ovi6xQMo+KAEzdQcmlxFewo+VEez3B97Rg==
X-Received: by 2002:a17:906:85cf:: with SMTP id
 i15mr3665685ejy.373.1606836659796; 
 Tue, 01 Dec 2020 07:30:59 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id v16sm83672eds.64.2020.12.01.07.30.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Dec 2020 07:30:59 -0800 (PST)
Subject: Re: [PATCH] ide:atapi: check io_buffer_index in
 ide_atapi_cmd_reply_end
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 P J P <ppandit@redhat.com>
References: <20201118142745.112579-1-ppandit@redhat.com>
 <204751s9-11np-413q-q3pr-3o6os86078@erqung.pbz>
 <492170b8-8056-bd65-5150-62c6e89cb3f0@redhat.com>
 <933np1s-8p4p-o74p-rp94-517r98nop2o6@erqung.pbz>
 <0fd8daa2-7ce3-0231-8b95-d498ce900c8e@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <2c7c7e74-4b5b-dac2-2057-60be910ec1e7@redhat.com>
Date: Tue, 1 Dec 2020 16:30:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <0fd8daa2-7ce3-0231-8b95-d498ce900c8e@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
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
Cc: Michael Tokarev <mjt@tls.msk.ru>, Wenxiang Qian <leonwxqian@gmail.com>,
 John Snow <jsnow@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01/12/20 16:23, Philippe Mathieu-Daudé wrote:
> Hi Prasad,
> 
> On 12/1/20 4:00 PM, P J P wrote:
>> * I was thinking about checking 'elementary_transfer_size' against
>>    'byte_count_limit', but that did not work out. The loop is confusing there,
>>    it first sets elementary_size = size and subtracts the same
> 
> If the code is confusing, you can rewrite in a less confuse way :)
> That way the problem are easier to notice.
> 
>> * I tested the patch with a reproducer and it helped to fix the crash.
> 
> [thread hijack]
> 
> About reproducer, Michael asked about CVE-2020-24352 (ati_vga OOB in
> ati_2d_blt) this morning. What happens to reproducers when a CVE is
> assigned, but the bug is marked as "out of the QEMU security boundary"?
> 
> Is it possible to release the reproducer to the community, so we can
> work on a fix and test it?

Ideally it should be, in the shape of a qtest. :)

Paolo


