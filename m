Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB8D742F529
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 16:23:35 +0200 (CEST)
Received: from localhost ([::1]:57534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbO7S-0006OQ-Sh
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 10:23:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mbO5q-00052M-5I
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 10:21:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57649)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mbO5n-0007QY-Jj
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 10:21:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634307710;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+6Xn4Cavy/gUArbPjnAQU1n1mtR0ge7Bsl7iEaEQDXM=;
 b=bKZYkEC+7WoBVZ4jwK0Hq5KXVA8aVuxn1VAUEOABVEqYk2ab7czfMx0A+CUbzr1yz/pUbT
 iUw00I5LrDrN+9UZwJRcrldwmnJACkj0zcnru0I6ICuwEBcKMd8ikoVoAJtlfc0fCGsd/V
 bWcn92ZLUcvlppsjt9DU0WhqhyecSqA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-38-13DeXPRSMI6UOT90CgXbAQ-1; Fri, 15 Oct 2021 10:21:49 -0400
X-MC-Unique: 13DeXPRSMI6UOT90CgXbAQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 c4-20020a5d6cc4000000b00160edc8bb28so6000030wrc.9
 for <qemu-devel@nongnu.org>; Fri, 15 Oct 2021 07:21:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+6Xn4Cavy/gUArbPjnAQU1n1mtR0ge7Bsl7iEaEQDXM=;
 b=n5MxRRl7t3dlk2dqvfzrjA+c+zn3E0PJeek58lbxN1Ucq28We0cDPRIdlhM6JWrbz3
 dOhFRk9xX04qjfBZUZE5G1c8oOw9IHmLDifbL+YzIZCOV1oO/RWLdl3PZYBc/manqqi+
 XSHozieGuTgzoJ+1lVc6C6DbZjN9acnv4jm1iiD9rzuiC0B+Al3TCQcEi5Wn97Oo5p+m
 CzCTFYxuvF57KABYzJDDUrQb6uhcJ7iCjalpcBoWHJrlO8LVROAcA/A51rQwPMFyxgYe
 e7KQ5JcyYnRUz2N7KZxetJQyaopolXLSzgG6vN1RYRwvcMArlS5OJptCRO/I54yboQD/
 w3OQ==
X-Gm-Message-State: AOAM53028eSpcoOVQySWufwfQy3OULC0EOsFiWGNWbMQdul8vC3U0Coa
 dZdbCvGIqFUxpB3oDgoy+5qbPUD9JpA5KbKorV/iJaUJvHxKhjt5SqO2ET0Z02dU/xwYV2nxPIU
 isPv2EAt5reYaGec=
X-Received: by 2002:adf:8b5d:: with SMTP id v29mr15039399wra.175.1634307707596; 
 Fri, 15 Oct 2021 07:21:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxnGphScoGYWwKgwwUJjrJdehb6JM2Fw1xCOP6zP2wY/yHYoUH9QwUJJLM7Uwu13XkoHJzBMQ==
X-Received: by 2002:adf:8b5d:: with SMTP id v29mr15039384wra.175.1634307707464; 
 Fri, 15 Oct 2021 07:21:47 -0700 (PDT)
Received: from [192.168.1.36] (213.red-81-36-146.dynamicip.rima-tde.net.
 [81.36.146.213])
 by smtp.gmail.com with ESMTPSA id k10sm10492930wmr.32.2021.10.15.07.21.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Oct 2021 07:21:46 -0700 (PDT)
Message-ID: <7020c8c5-6430-541b-dda8-5ded0ee555f2@redhat.com>
Date: Fri, 15 Oct 2021 16:21:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] target/s390x/cpu.h: Remove unused SIGP_MODE defines
To: Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org,
 David Hildenbrand <david@redhat.com>
References: <20211015124219.1330830-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211015124219.1330830-1-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) DKIMWL_WL_HIGH=-0.049, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/15/21 14:42, Thomas Huth wrote:
> These are unused since commit 075e52b816648f21 ("s390x/cpumodel:
> we are always in zarchitecture mode") and it's unlikely that we
> will ever need them again. So let's simply remove them now.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  target/s390x/cpu.h | 5 -----
>  1 file changed, 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


