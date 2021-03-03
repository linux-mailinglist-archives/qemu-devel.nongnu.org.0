Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 500BB32B86C
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 15:00:04 +0100 (CET)
Received: from localhost ([::1]:57674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHS2l-000562-5L
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 09:00:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lHRyr-0007ta-PI
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 08:56:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lHRyp-00031o-9R
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 08:56:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614779758;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wfAESWlDsOVbALTd/coIK2jpJnq1gMwI/305QB0rDG4=;
 b=c8TIMp0s+EfvJ4x3JODyevMjSILIhkT1O0Y91voZLrjnVfiBXEqwDsueBaIWb7L1V3tqjh
 3o3prfiqRdl7IkoMZurNlFTV/nHAEQFCTDLipZPFvTb1VT0LzW7sS1bMCecbfqSZNJU1mM
 BbgpR8vPY4QjOEV2gYbkXotfaPSVqL4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-110-vlRYbJ3fPi6-0eLepO30ZA-1; Wed, 03 Mar 2021 08:55:56 -0500
X-MC-Unique: vlRYbJ3fPi6-0eLepO30ZA-1
Received: by mail-wm1-f71.google.com with SMTP id y9so1827911wma.4
 for <qemu-devel@nongnu.org>; Wed, 03 Mar 2021 05:55:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wfAESWlDsOVbALTd/coIK2jpJnq1gMwI/305QB0rDG4=;
 b=PCXaBWudfcEIiLpfZAJXiRq04uo3Nfu0tY4VL9RnnJYpQzk0sH8uxjAtoyNJ5vXtgy
 bNMGWuUVXehMgtGL4mh1bkx6Ujw+/Xg1LFlI902+9c88HQWmyab2X9e9eTOG6yjmBjkV
 3VyCptB4t7mLoshwU9bkvqew8d18odpB7oisgg/6Z7mw/90o7jCIoyfnyhT6ExIFqC8+
 /vezT/DB88hFn/CCMBeEfMTQFeq1IBAihPw3tltteLXg6IqXiY9id7nZGqNJ16CeHy26
 lphVGL+8uO+U7NjSqWs/5os5y9e3dCi3fSEN9Gu+dn5o9gmY1UKpKhcM5HqRFcYud99S
 Ocjw==
X-Gm-Message-State: AOAM532CES+Gs7EX8ctcO+ji8F0touwtJiUFksFUHlhODfMaR2fbQy6g
 V+h5d5vyR5fIlnx3ia0JXOE6kr0vsn3umsFvbcveKjdeeelMfzlMnYzu5qyF9Wq4rIMa7/jPq1C
 txMrfX1Ai+nF0y05AQTPEzh+ikdn1Jfrd87zWYRX34IY6Lnutedah3m2pgtcvGjQDjJ0=
X-Received: by 2002:a5d:4441:: with SMTP id x1mr27764606wrr.56.1614779754942; 
 Wed, 03 Mar 2021 05:55:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxKvb1pm50hR8W3nXMuxJgKNXDGpU2TH/XNbN2zUY4z/+C/wylTfDYukp36+zr6fR3Cy1uUeg==
X-Received: by 2002:a5d:4441:: with SMTP id x1mr27764584wrr.56.1614779754657; 
 Wed, 03 Mar 2021 05:55:54 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id n186sm5915040wmn.22.2021.03.03.05.55.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Mar 2021 05:55:54 -0800 (PST)
Subject: Re: [PATCH v2] qemu-config: add error propagation to qemu_config_parse
To: Markus Armbruster <armbru@redhat.com>
References: <20210226170816.231173-1-pbonzini@redhat.com>
 <871rcwjql7.fsf@dusky.pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <d4aa81f6-eed0-e42b-a25e-aa483be0229e@redhat.com>
Date: Wed, 3 Mar 2021 14:55:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <871rcwjql7.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03/03/21 14:48, Markus Armbruster wrote:
> Reviewed-by: Markus Armbruster<armbru@redhat.com>
> 
> But please consider avoiding it anyway.

It does make for a smaller patch, so I'll use that as an excuse instead 
of me being old school.  I'll clean it up in a separate patch.

Paolo


