Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB84308E61
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 21:29:45 +0100 (CET)
Received: from localhost ([::1]:33896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5aOm-0003d4-5E
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 15:29:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l5aCI-0004nA-0w
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 15:16:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22154)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l5aCE-0002U8-10
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 15:16:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611951404;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kh6JoibPGK7sPnRMKy0LxXkZTWoEBghgV9GyNkIND90=;
 b=Iwt+htlI602nW2V6sTg52uDgVRP/NVkVtwFq2Ocu+aMFPvWTt6nkgYcuHBRF0dFHJOEopO
 jdQhu/7u8lLW7o6mSj+MdOCTrzQUvzsgKbgZJzL51oqLnvKobXADffjJ5YiN3htHJoUi6N
 VxjBBdVezKANtGqvk+EEE8AEV1mKjGs=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-111-2js0Yt3WN6ycgWRe4VbeBA-1; Fri, 29 Jan 2021 15:16:42 -0500
X-MC-Unique: 2js0Yt3WN6ycgWRe4VbeBA-1
Received: by mail-wr1-f70.google.com with SMTP id l13so5825949wrq.7
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 12:16:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kh6JoibPGK7sPnRMKy0LxXkZTWoEBghgV9GyNkIND90=;
 b=T5lw8/GZplEkzifr1wnCEh3t3u/jdKZ6Jpvtz09cN/IVJZjjm+7juQHaVxopJVxvwb
 IcEgpYmG3T6Sq18qjXvAOM8p/+/VuGbSHDjhEM9nBRVltsgfrLexuc/pPNXsv65rx4hg
 rsuBRpwx/PzSRD6FfYkVBjBhRuBVpccupC1xh8pkkAAjFUwtvmg6VwHH4FTfggnVC3wx
 QAyiWftmHCFUfOyKv1Xf5a/PGyYUwiADjM1s5GYlkPH6SybREMBC1UY+ig7jTx5V3d7s
 cYlB7ndg0bF179RQD/91oTvLdo5mZf4sQ8N1csZ3J8np0+nhlqIIzmBlfO5t3Vb8jDOL
 OGBw==
X-Gm-Message-State: AOAM531nNjOn6zia7dxTMquLmYMYa2QfJVngi8ZBap5l2FUFet9hz9gl
 irWqVh/UYs9d7vaA2WEGO0AFpbhj1wnErHVVLsfkEMoFjQOnoakQOurx62KFuTSnmmnmQuku0fz
 /19ecQ/KZlDwCTWA=
X-Received: by 2002:a5d:5411:: with SMTP id g17mr6444421wrv.54.1611951401423; 
 Fri, 29 Jan 2021 12:16:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxc2TE8iX1ujuXhiI22NL1r+jzfD/Ys4QaGB17u9O1EYhl3k+PpcmDYiElo3Xpy5D0rFUUGqA==
X-Received: by 2002:a5d:5411:: with SMTP id g17mr6444412wrv.54.1611951401232; 
 Fri, 29 Jan 2021 12:16:41 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id t205sm11706451wmt.28.2021.01.29.12.16.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Jan 2021 12:16:40 -0800 (PST)
Subject: Re: [PATCH v2 2/2] pci: add romsize property
To: BALATON Zoltan <balaton@eik.bme.hu>
References: <20210129192838.582771-1-pbonzini@redhat.com>
 <20210129192838.582771-3-pbonzini@redhat.com>
 <ee924cca-8b90-df77-b544-c6405f6b761@eik.bme.hu>
 <9aae8014-8f86-ad1c-1a67-f08312aeb8d9@redhat.com>
 <dbff55a-3a-6873-32c1-2a1974b02f8e@eik.bme.hu>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <21978acc-179d-457a-18ee-1db0a9d4cd63@redhat.com>
Date: Fri, 29 Jan 2021 21:16:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <dbff55a-3a-6873-32c1-2a1974b02f8e@eik.bme.hu>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: mst@redhat.com, lersek@redhat.com, qemu-devel@nongnu.org, peterx@redhat.com,
 dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 29/01/21 21:06, BALATON Zoltan wrote:
>> The empty property value configures the device not to have a ROM file 
>> at all. The commit message says that ROM files (if they exist) cannot 
>> be empty, corresponding to this code in pci_add_option_rom:
>>
>>    } else if (size == 0) {
>>        error_setg(errp, "romfile \"%s\" is empty", pdev->romfile);
>>        g_free(path);
>>        return;
>>    }
> 
> OK, then it was just not clear to me that the commit message talks about 
> the romfile itself and not the property.
> 
> By the way, does it make sense to compare uint32_t value to -1 and could 
> that provoke some compiler/sanitiser warnings? Is it better to have a 
> signed type or use UINT32_MAX or simlar instead?

There is probably some warning for it but I think not even -Wextra 
enables it by default.

Paolo


