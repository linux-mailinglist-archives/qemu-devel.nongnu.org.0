Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAFE1403533
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 09:23:23 +0200 (CEST)
Received: from localhost ([::1]:45380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNrvW-0003St-QK
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 03:23:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mNru0-00024Q-TH
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 03:21:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mNrty-0001ZK-DW
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 03:21:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631085705;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZHNHC13RlzOY+XHipE/lDY7P96RCiG9sReSzzjtewWE=;
 b=EJ6lTp1HaHNKt78vtgpJka5homif5+KW8j2PB9znT/2BqEHPmLRQ4Novg8+GWWQFkNJlxi
 qVRN9m9IdgejVsaYuoDYwav+29mep4Wot2AXzDoKeYTKf2aqRxE1iNMOZ5fMgVIHYciEN2
 ADBZrpdzg5C2Lh+1DjdmMzv8FWe/Nag=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-99-J0BP6hIvPEmrwCyeD4PN7Q-1; Wed, 08 Sep 2021 03:21:44 -0400
X-MC-Unique: J0BP6hIvPEmrwCyeD4PN7Q-1
Received: by mail-wm1-f69.google.com with SMTP id
 r4-20020a1c4404000000b002e728beb9fbso644796wma.9
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 00:21:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZHNHC13RlzOY+XHipE/lDY7P96RCiG9sReSzzjtewWE=;
 b=ELOxHnNBAz2ZXfIApY2Z9sbJfkc0RhOvxVSkymnLCVRkJk8rDf9iuoExg+zrcPjFBq
 jDPDm7EIEfpcpic8NLmSWwW785pX7KvaXfv643yqRsxIFJa6pTreO2aVB+UjYH1bIqcK
 aGw99vZJHuc4RgXrXozkSTMzcT9UJUakpR0hew5PQ/DF/UQwZv3H4pSDdqDrTwIoo8Vt
 acKfPiXoFJkXzWvgCzf3Tgun++jxtHEKOPrG8lmQQ7VUC7wkJP+incUmVnLNUx2T1ful
 +m9v7ywo8b1Iy/tRChSiAndXD94IJILs5zFn2L7y6NHbSx38sY4NOCUGd8ZlI2Suoyd/
 /vlQ==
X-Gm-Message-State: AOAM531ZisRVexokSnJXsxW97FE5SHkDdB7nad7IYDvsY+qFAuQQeNOt
 kE8VabnCYj4SK8Z013rai61aYL/zl6L9JMu+D7r+w/QEy3HlR5HUZ+LtO3J2cgPqmv7u1DQDjzc
 x8+v6kRXRtRKy43SMyHDqbqAfuTrN2Mq8JMzg8NxkIvDyrXIlbBuaxIbWInYKLqIe
X-Received: by 2002:adf:80c8:: with SMTP id 66mr2334236wrl.65.1631085702428;
 Wed, 08 Sep 2021 00:21:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJywExV3Dmo3QHep1OmbdQaguaUVq26ytZsUwtOpG0z248DkMvj7aaVoE9XuEbhX7ZTBB17kZw==
X-Received: by 2002:adf:80c8:: with SMTP id 66mr2334211wrl.65.1631085702135;
 Wed, 08 Sep 2021 00:21:42 -0700 (PDT)
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id x11sm1165455wmk.21.2021.09.08.00.21.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Sep 2021 00:21:41 -0700 (PDT)
Subject: Re: [PATCH] fw_cfg: add etc/msr_feature_control
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210907170935.210428-1-pbonzini@redhat.com>
 <f9c001a8-b81c-c559-7ba9-437827594f29@redhat.com>
 <dc764149-022b-b108-c185-70c485038e6c@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <95806ecb-1c0b-3bcc-df67-5a22bf1728f9@redhat.com>
Date: Wed, 8 Sep 2021 09:21:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <dc764149-022b-b108-c185-70c485038e6c@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.332, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 9/8/21 7:47 AM, Paolo Bonzini wrote:
> On 07/09/21 20:19, Philippe Mathieu-Daudé wrote:
>> Fixes: 217f1b4a721 ("target-i386: Publish advised value of
>> MSR_IA32_FEATURE_CONTROL via fw_cfg")
> 
> Yes, thanks.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


