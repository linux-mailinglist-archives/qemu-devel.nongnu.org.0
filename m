Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6AC43D25FE
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 16:42:32 +0200 (CEST)
Received: from localhost ([::1]:59786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6ZuB-000163-P8
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 10:42:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1m6Zrh-0006AS-3k
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 10:39:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41331)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1m6Zrf-0007cL-RR
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 10:39:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626964795;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cqQ6xN3WrK5HyDDkUWHeq6CnrRxEF9ZrWlGfcVc0UGs=;
 b=Uyf4RRjSUzDEsRLJ2Iu1EEr7aNoeiu7kyOi7KDB2ifwVwBeyRqrmeNLCG4pf9sKVCcrK8D
 LMdBwCKn4UMDzQAwhkOQyPIsPuXWqOS18SDTuJR+JmauCQd45gmQ+z4Fh3RDR0BgNPp7wu
 SL42jRKxsNwFGSQhhw3CpOLs669k7/8=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-373-aLeCmd7iMvCr088Oj07SvQ-1; Thu, 22 Jul 2021 10:39:54 -0400
X-MC-Unique: aLeCmd7iMvCr088Oj07SvQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 x16-20020aa7d6d00000b02903a2e0d2acb7so2865430edr.16
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 07:39:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cqQ6xN3WrK5HyDDkUWHeq6CnrRxEF9ZrWlGfcVc0UGs=;
 b=dK/1SvNClFAE8Qk8jBOtqpGE7586Po1SGmarW/2QhXIHwVv8q2yg20rVCYWgzVLVOQ
 OivqAEH32J5kaqOOiaHiDBHzMJ+Lf/dWMulxTm1pNUDk958Bb7BnhK7nS3O6W58yC5l9
 bAvzeqBqkOss+GEc0eCKixF0KOy0tUrFBliuE9q4gn1kYkPeDkn+4ThBxuLomWoXIIqO
 SvKBKW0u2nTVf9oP0an44KJwXyc7lVUsmpmdhLa4T9DOjEFI4j6TUcCdJ+sbVu+tJsw0
 FXFyCejTPsF8WrHHBOxRj0Oy1DsMb91K/NvWcJmOV1GKPeAUEXghUKSsxqpmmoEkquy1
 I/MQ==
X-Gm-Message-State: AOAM531yYBWdy3kpLjqJn1Y9VGQ7I4Z9E1vi364pIYJ/7SXfs34gM0pR
 /woP8adevx6+WJX/8a4eZzAQZBdcq6wgoH68fpTy05801DsWeiZVFfjlpLKMh64WY6c+Cd+XI0S
 rUJz1cRl+rAXydrc=
X-Received: by 2002:a17:906:63ca:: with SMTP id
 u10mr194555ejk.411.1626964792841; 
 Thu, 22 Jul 2021 07:39:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyv1FDFnJyJh3QY4FeAo6zw+kkyVNlrl6aHdi1VelxkTVLPGdsZcVwrfhNr8p3jw/nEkSjnKA==
X-Received: by 2002:a17:906:63ca:: with SMTP id
 u10mr194541ejk.411.1626964792691; 
 Thu, 22 Jul 2021 07:39:52 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id y11sm9574659ejr.14.2021.07.22.07.39.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jul 2021 07:39:52 -0700 (PDT)
Subject: Re: [PATCH] vl: Parse legacy default_machine_opts
To: Anthony PERARD <anthony.perard@citrix.com>,
 Jason Andryuk <jandryuk@gmail.com>
References: <CAKf6xps07sbk7MnehPTKes52sst0UyaHiHjjSdEX0bFjT+E_ag@mail.gmail.com>
 <20210713021552.19110-1-jandryuk@gmail.com> <YPl80YnsDpLI8gtN@perard>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <2f532fad-9c74-04b5-58c7-5f9d5464340e@redhat.com>
Date: Thu, 22 Jul 2021 16:39:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YPl80YnsDpLI8gtN@perard>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.203, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: xen-devel@lists.xenproject.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/07/21 16:12, Anthony PERARD via wrote:
> Reviewed-by: Anthony PERARD<anthony.perard@citrix.com>
> 
> I can't find a different way to set a default "accelerator" to a
> machine, so this patch seems necessary.

I agree, and I'll be sending a pull request shortly.

Paolo


