Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82744487B9B
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 18:44:55 +0100 (CET)
Received: from localhost ([::1]:32792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5tIM-0006v0-Ln
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 12:44:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n5t1n-0005Rg-9e
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 12:27:47 -0500
Received: from [2a00:1450:4864:20::52f] (port=44615
 helo=mail-ed1-x52f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n5t1l-0000JZ-Le
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 12:27:46 -0500
Received: by mail-ed1-x52f.google.com with SMTP id w16so24667458edc.11
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 09:27:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+4YBjwqY0uJRu5eoPUm0lGfpgZPC3Jr5Ow6kMpqpJxY=;
 b=lVX0BncU5V1P6jvgetSkpS76khmypjdhKxgdLCvRKnJLlYpn105WA7jr5IhYXLesy6
 tg6+iXZN+jiWuDPHZwV96NbtHRiV5dPCBC2sUxRCad9njTTR+HR8nBbjgyDTdgrNbOrT
 8FP12tiAcFFvKNy22CGilxBivvC4isbN0OLzgUx0syr7/GtGDGki5vXGcj5h9oZN4wQl
 33LAxTj+qckjdFZ9F0uJughTsn3tWIQWAOpJRWCCACiCbIKix16z+QB94hW+ZrS3vr6d
 6EhPHgADm72fQwQne97KH47zdI77U9jX1UmcjcsaFJf5nzWaBVBZwVaoI/kU7N7BEfvt
 0AGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+4YBjwqY0uJRu5eoPUm0lGfpgZPC3Jr5Ow6kMpqpJxY=;
 b=Md9qi2QEqrJlLuw9JyuymhTooy5l3B9z+5eITav0g56j+7hCf/XVBpiN5GLiv/xDLr
 Ew1fuEq2n3VxGmuYDbFsEBpuy2xLui85hrwuhL/IdDUrXZS+4DQ+PHk3x+Qcq1GoRdnK
 s0VPcMKSe7VS/Ms6eD5U3mHQRW7amhgGA/wqGcPsAjTzwfLRDdBwQ5kDcC3Hoq+4gTRd
 kuHxHgfyOc3FUnQemboU3VFHQbDNLv1g6p2n3etoZfzl5ZraKX47HhVYxNTr9K4FKOLr
 ZWlrk5vgpEn82V6gjSs5qwwcMAWNWO1gG5a5y0aiC7ThzL/boAU2HRFfabbWloaNaAKL
 D2AQ==
X-Gm-Message-State: AOAM532TfaWgwbpW7LwzR62NSnov8cjY/+lnAtgzP/l6m1vRMcw4xwBv
 rNbLK9hPfBI7bqSzx89IQTw=
X-Google-Smtp-Source: ABdhPJzfMDStzPop/QWsWnwDoHjurEJO8igtV37SuannQqzz/v8mY4Rr3kcanI+9diCo0TibJu+g/Q==
X-Received: by 2002:a17:907:760b:: with SMTP id
 jx11mr44376109ejc.99.1641576464159; 
 Fri, 07 Jan 2022 09:27:44 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id 24sm1572477ejg.47.2022.01.07.09.27.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Jan 2022 09:27:43 -0800 (PST)
Message-ID: <4e54ef7d-ac0a-e2b2-faee-fddeaeac422b@redhat.com>
Date: Fri, 7 Jan 2022 18:27:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: test_isa_retry_flush() in ide-test.c
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, John Snow <jsnow@redhat.com>
References: <9d84ab18-72a6-4913-4c56-ffd02ff386ed@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <9d84ab18-72a6-4913-4c56-ffd02ff386ed@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.691,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/7/22 17:01, Thomas Huth wrote:
>   Hi John!
> 
> I just notice that test_isa_retry_flush() is not doing anything useful 
> anymore: It likely was supposed to run the test_retry_flush() function 
> with the "isapc" machine type, but actually test_retry_flush() ignores 
> the machine option parameter completely and always uses PCI accessor 
> functions nowadays (since commit 9c268f8ae84ae186).
> Question is: Is it worth the effort to try to restore the original 
> intended behavior for the ISA test here, or shall we rather simply 
> remove it instead to save some testing cycles?

The right way to fix it would be to use qgraph.  Second best option is 
to nuke it, because the conversion to qgraph would give the test back 
for free without writing more code.

Paolo

