Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D1DD3E2331
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 08:20:57 +0200 (CEST)
Received: from localhost ([::1]:45716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBtE0-0005nw-Ek
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 02:20:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mBtCy-0004Pw-FV
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 02:19:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47695)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mBtCv-0003gg-DJ
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 02:19:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628230787;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rW6p1biSN7Gnix1MgLBW+CnbnXnenDacCym9sHAMr6k=;
 b=PNl9Twx7ClZPpBBwqOuDWluuYET8wdTrSKmWlnIA70KUyhVI1PtLprd5dXvO5ksHlSaIoS
 IWYPGKIJQ3FUcLAxL3GkSPnD6y+LlA6/v30xkMaCmAAOjgmk1OXpTlTLIUeSyGDnzX4qvt
 v3m9HNLkHJag068ENH48XkLCHl3hOQM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-239-KNrhM0FfPw22W_VQ5Be1gQ-1; Fri, 06 Aug 2021 02:19:46 -0400
X-MC-Unique: KNrhM0FfPw22W_VQ5Be1gQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 d72-20020a1c1d4b0000b029025164ff3ebfso3519892wmd.7
 for <qemu-devel@nongnu.org>; Thu, 05 Aug 2021 23:19:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rW6p1biSN7Gnix1MgLBW+CnbnXnenDacCym9sHAMr6k=;
 b=E1hQmqXus1fCZeGKUm3C+ynKVHXKv1nbP9dDyb6ps/Bj+EVyNSHiNROlgzEDOwi1UA
 1viW8jG+/AaOB2ZHDeVaFVbstq3bX7gTCt+feDS6Uer1z/qSYo8mkeYCYp/g5OkHwjsH
 cdok1P+kRDN/Y4d2OVS3yt5MsNmrU7XNJXVJnL75KSJ+7mfUPgk6HKlSx21/jGsafcSm
 wAP+uota+/OUFS0uni1VJupzEQDQVpkZSr8cKLXS4PE+r4rG4nroek7dEhIR6hKzpD8h
 KParXq0WL8nAsn1QzN4HBcmcoLC6th4MSyaRTpC32ymYT5J4mMuaQWHRzU7FF3rhVEqw
 m+qg==
X-Gm-Message-State: AOAM5319VyYaXdM0XHZNvtBxqIN0SvFUgj4cxv9RU5xmjDGZvlQaX0LI
 OOvKPyGJzUd/t8JKhF7cl9IBJlk6psRg1HBHDE78nNVU9zrACkmRef8rtZpp6FWGG0XbprlpYYr
 6aE+l4vEdwWNbegw=
X-Received: by 2002:a05:600c:a08:: with SMTP id
 z8mr18873339wmp.165.1628230785462; 
 Thu, 05 Aug 2021 23:19:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxmSR5Im+dgpxLRlhde7htMPx4IdGGiNTgAaDbaPcbOsNDIr1OcfAnkLau1F/PRS/hxCsHEnA==
X-Received: by 2002:a05:600c:a08:: with SMTP id
 z8mr18873317wmp.165.1628230785203; 
 Thu, 05 Aug 2021 23:19:45 -0700 (PDT)
Received: from thuth.remote.csb
 (dynamic-046-114-147-107.46.114.pool.telefonica.de. [46.114.147.107])
 by smtp.gmail.com with ESMTPSA id u11sm8333040wrt.89.2021.08.05.23.19.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Aug 2021 23:19:44 -0700 (PDT)
Subject: Re: [PATCH v1 02/12] s390x/tcg: fix ignoring bit 63 when setting the
 storage key in SSKE
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20210805152804.100333-1-david@redhat.com>
 <20210805152804.100333-3-david@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <1aa00053-4923-423e-5a7d-d81b203d3eb2@redhat.com>
Date: Fri, 6 Aug 2021 08:19:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210805152804.100333-3-david@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.132, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: "Jason J . Herne" <jjherne@linux.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Claudio Imbrenda <imbrenda@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05/08/2021 17.27, David Hildenbrand wrote:
> The last bit has to be ignored.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>   target/s390x/tcg/mem_helper.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/s390x/tcg/mem_helper.c b/target/s390x/tcg/mem_helper.c
> index e0befd0f03..3c0820dd74 100644
> --- a/target/s390x/tcg/mem_helper.c
> +++ b/target/s390x/tcg/mem_helper.c
> @@ -2210,7 +2210,7 @@ void HELPER(sske)(CPUS390XState *env, uint64_t r1, uint64_t r2)
>           skeyclass = S390_SKEYS_GET_CLASS(ss);
>       }
>   
> -    key = (uint8_t) r1;
> +    key = r1 & 0xfe;

I'm not sure about this one ... could you cite a sentence in the PoP where 
this is declared? For me it rather sounds like SSKE always sets the whole 
storage key...

  Thomas


