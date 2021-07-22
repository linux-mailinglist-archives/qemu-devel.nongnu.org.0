Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBFA43D24B7
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 15:37:27 +0200 (CEST)
Received: from localhost ([::1]:52936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6YtD-0004jI-1l
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 09:37:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1m6Ys2-00042n-Rw
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 09:36:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57244)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1m6Ys1-00080s-Aa
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 09:36:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626960972;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=81PHulDQeptm9/TDCKQXLky+cn1ziQPE6MpO/pmr4Jo=;
 b=U1rewL9ZLSlJX49eFZf9UIqX/bamxURI1qIrq3MKvtj595pzFn6by5xu8nYtXbmwkN8Y6P
 +9OfyFNwOZrB0yoGRcWchkBTeSHgtJzoY70NSiA2mO/ADgOOwW9WNOAgHQWjDeF6ZMLZbm
 PHpFcuhC9xVWfx606lnBaqsYO3QzQXE=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-357-QoIk-NH8OHiE7YMMU5uktQ-1; Thu, 22 Jul 2021 09:36:11 -0400
X-MC-Unique: QoIk-NH8OHiE7YMMU5uktQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 w17-20020aa7dcd10000b02903b85a16b672so2802956edu.1
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 06:36:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=81PHulDQeptm9/TDCKQXLky+cn1ziQPE6MpO/pmr4Jo=;
 b=BegZQoba8S8rwgmlogjW69/0oNRNo1btrk8nyJA31/LKDeLUYN4DBMdharGsgXtEWO
 VJCa5gOT7qbZHWlym1xFAwRu0j1rU6IwSGqlD2V9aVfdY56yDi+qYDT5pJFCG1efXE7v
 wZGVUEE0E2lFWtn3ogpmy6XcVyhbZ00Fgx73gME2imUps/aFdau3j3hm788aLnvuyCmc
 LYK2Iysc5H5LI5QMKz4lI4NDx0N8tbBFtNWTExjDW9FZFs4Gi5GCOcoLlpN0Nr1W+xPu
 kuFfqBnbZYbAPwnLzvSxkCnf8RKBMMhx5akTq3CxW768gF63o6NIS2P57dJpB5nPbAuG
 hDDA==
X-Gm-Message-State: AOAM532nfDkU9nb3FdLANaVKkVzjEW/MAvgayp/RMiyGliM6nZ33lFy1
 1FfZprPVQ0252bU5Fu5KLOEgkR7qhLT7IjBR3CkShIaX8Q/naPbtFYDMXjOU06XUoy4/W9+8YI0
 yAnWSxyZS73WPucHciEt+5IBSlJiH5iu3yxEDnlHTclI9zCiqnGfBhB90MnUqT/xy1zI=
X-Received: by 2002:a05:6402:1592:: with SMTP id
 c18mr54513595edv.243.1626960969863; 
 Thu, 22 Jul 2021 06:36:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwNjI66FDWPAvVioDS10XbRD41HCpvnN1RuZz/aiAi5J80JUpkBq3ELSi9DhE+vG2S3tnRG9Q==
X-Received: by 2002:a05:6402:1592:: with SMTP id
 c18mr54513547edv.243.1626960969606; 
 Thu, 22 Jul 2021 06:36:09 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id ba25sm12338873edb.1.2021.07.22.06.36.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jul 2021 06:36:08 -0700 (PDT)
Subject: Re: [PATCH 0/2] qapi/qom: use correct field name when getting/setting
 alias properties
To: Markus Armbruster <armbru@redhat.com>
References: <20210719104033.185109-1-pbonzini@redhat.com>
 <87o8auh44e.fsf@dusky.pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <e798dfe6-81f6-445a-09de-a820778f14b8@redhat.com>
Date: Thu, 22 Jul 2021 15:36:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <87o8auh44e.fsf@dusky.pond.sub.org>
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
Cc: imammedo@redhat.com, alex.williamson@redhat.com, eblake@redhat.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/07/21 15:25, Markus Armbruster wrote:
> Since patch submitters tend to submit code that works for the success
> case, I like to test a few failure cases before anything else.  Gotcha:
> 
>      $ qemu-system-x86_64 -machine pc,pflash0=xxx
>      qemu-system-x86_64: Property 'cfi.pflash01.drive' can't find value 'xxx'
> 
> The error message is misleading.

Indeed I knew about this, and even thought briefly about how to fix it 
before realizing it is not a regression (which is also why I didn't 
think of including it in the commit message).

All the ways I could think about for a fix involved looking at the error 
class, and possibly even adding a dictionary of key-value pairs for some 
error classes.  I know you don't really like error classes and you 
probably would like the idea of key-value pairs even less---and to be 
honest I didn't really have a plan to implement any of that.

Paolo

> This is not a "must not commit" issue.  Fixing a regression in time for
> the release at the price of a bad error message is still a win.  The bad
> error message needs fixing all the same, just not necessarily before the
> release.
> 
> Since mere thinking doesn't rock the release boat: any ideas on how this
> could be fixed?
> 
> 


