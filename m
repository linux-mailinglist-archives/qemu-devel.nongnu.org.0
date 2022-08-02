Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A47B0587999
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 11:08:25 +0200 (CEST)
Received: from localhost ([::1]:41834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oInt2-0004IH-H7
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 05:08:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oInjh-0000hf-SJ
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 04:58:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60564)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oInje-0002df-Lo
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 04:58:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659430720;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2EjRgsOGy1q+SnoY5oPjskpp0hogT0syAZ6XP3pCdnY=;
 b=aemihttJXyTgrqrc6Sjm5O8yla8/2p+5Gz5/i9vcTa3JGkEvXG5q+kZvpBxBR2gjrygNDi
 6mEH2WWoWX5K/wJa7nNnq91uh2Qahott/SoEYWuBzIEnx7T2ORi+MUGhjvg+MkAn0hMPOf
 6hWsNFUxHmCV7UFN6C/AQfV283P38MU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-225-NzUDDICjMuGFXAmbV5ZKIw-1; Tue, 02 Aug 2022 04:58:39 -0400
X-MC-Unique: NzUDDICjMuGFXAmbV5ZKIw-1
Received: by mail-wr1-f72.google.com with SMTP id
 d27-20020adfa41b000000b0021ee714785fso3291803wra.18
 for <qemu-devel@nongnu.org>; Tue, 02 Aug 2022 01:58:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2EjRgsOGy1q+SnoY5oPjskpp0hogT0syAZ6XP3pCdnY=;
 b=eGhsT7m22WnItvcZsUooHeeuXf6q0N+tAiWDiGUDH49BLdF4xu3EEgWZEM8VVYIzEJ
 QJANZwyl9Bhsaeu48Xg785kEOHWI/4r1vkqGwjm3eh+pzpH0CYxvkq8faevsMTsL/sam
 1hZW0WvyZMVxRChNG361ehqkdAKsQh9dhsIvBjZH67+isFdxw4ChWe/fMvKoIoKU3Ko+
 NINkJsUq2k7aid6/Ge1pmRH5e1QSg5Ejw3RQ+dJBb4Vivp+Dgzt8YJjWaoxmWi4LPlQU
 enxcCFdgeV7Qt3dKxcB1GLT3h5hkxnmzysu3c/wD4L19ZcrzhxNEqaht4vIqb+DskFZJ
 pOUw==
X-Gm-Message-State: ACgBeo1uhl+yLwBUJRCKb0BswzmZmYcZJkFr63CnUf+T+NGz69NIJg28
 7GKG0BZlEJY935kFJXxBEJupc92ycLfm3I9sfHlLrG1yDErA4oHeio4haytLlFfRTLqjYRkLkQO
 soHiNSM1Lm754/Xw=
X-Received: by 2002:adf:fe45:0:b0:220:625e:f4e8 with SMTP id
 m5-20020adffe45000000b00220625ef4e8mr5769375wrs.182.1659430718207; 
 Tue, 02 Aug 2022 01:58:38 -0700 (PDT)
X-Google-Smtp-Source: AA6agR54cs/04I/bYR9kLK1FJf652R5Mxi5P4VqlRvJ2yUSW50wc94m7NJUXK6jCmYhFj32p6fjLyA==
X-Received: by 2002:adf:fe45:0:b0:220:625e:f4e8 with SMTP id
 m5-20020adffe45000000b00220625ef4e8mr5769366wrs.182.1659430718019; 
 Tue, 02 Aug 2022 01:58:38 -0700 (PDT)
Received: from [192.168.8.104] (tmo-096-80.customers.d1-online.com.
 [80.187.96.80]) by smtp.gmail.com with ESMTPSA id
 b5-20020adff905000000b0021b970a68f9sm14347306wrr.26.2022.08.02.01.58.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Aug 2022 01:58:37 -0700 (PDT)
Message-ID: <b941a128-11d8-cda1-b48a-bc356a0a60cd@redhat.com>
Date: Tue, 2 Aug 2022 10:58:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH for-7.1] Revert "migration: Simplify unqueue_page()"
Content-Language: en-US
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: Juan Quintela <quintela@redhat.com>, peterx@redhat.com,
 qemu-devel@nongnu.org
References: <20220802061949.331576-1-thuth@redhat.com>
 <YujksCJ/JjRAJc9N@work-vm>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <YujksCJ/JjRAJc9N@work-vm>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_SORBS_WEB=1.5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02/08/2022 10.47, Dr. David Alan Gilbert wrote:
> * Thomas Huth (thuth@redhat.com) wrote:
>> This reverts commit cfd66f30fb0f735df06ff4220e5000290a43dad3.
>>
>> The simplification of unqueue_page() introduced a bug that sometimes
>> breaks migration on s390x hosts. Seems like there are still pages here
>> that do not have their dirty bit set.
> 
> I don't think it's about 'not having their dirty bit set' - it's
> perfectly fine to have the bits clear (which indicates the page has
> already been sent to the destination, sometime inbetween the page request
> being sent from the destination and it being unqueued).

Ok, could you maybe simply drop that sentence from the commit description 
when picking up the patch? Or shall I resend a v2?

  Thomas


