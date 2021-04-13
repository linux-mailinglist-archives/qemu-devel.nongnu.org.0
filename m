Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7CC935D8FB
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 09:36:39 +0200 (CEST)
Received: from localhost ([::1]:34130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWDbC-0008LT-PI
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 03:36:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lWDZ9-0007VO-V9
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 03:34:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23219)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lWDZ7-0002OS-Ph
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 03:34:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618299269;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kHV9sd/ZVAzmMSc8NRqeuxFbEImuUGUHQ7aQYB2Y4x8=;
 b=QCEan1yjVO3dvJB6XOoExF81Kv5rHltPBZyy13D3ziDUmFHq2kA8tqRJIxhCTdwlFvc0+N
 nK4L+HvOC0tB4Li/FyIaRqH9n7yz4/XXu29b+5GqjmKhCKA8MPkkjpDMAtOmj/wgA7qErQ
 DqJfjg+82kf8LXc+pKeQsUzNDyGd0Tk=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-148-vbqwZsy_MKuPnA5QZGk5rA-1; Tue, 13 Apr 2021 03:34:27 -0400
X-MC-Unique: vbqwZsy_MKuPnA5QZGk5rA-1
Received: by mail-ej1-f70.google.com with SMTP id cx17so1943055ejb.4
 for <qemu-devel@nongnu.org>; Tue, 13 Apr 2021 00:34:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kHV9sd/ZVAzmMSc8NRqeuxFbEImuUGUHQ7aQYB2Y4x8=;
 b=OzifiwPjgSndXltO5RhDdKAwB3gVSVaQaT3z4OenmSercb6B84kgTzNS/jzwI6H/4p
 OqY7ZZExFISaaqnPCtaqK2cuGiW/nV8qcqUY4hZY16xXXAAQrBSRvyz2VLcb7SF+iOql
 O3t3K4XIfYAwn2bjVJcnqu02B97dfDviZWD2goylm2nWJY7N5xS6ZTnWfArCD119h2lV
 aZKYfRdKXuFjl8MPzIH20rbQvJb+U3OHbOWKs5oJRVt7/HyTN81miF3IHRX16dQZQk9v
 OMpin8Ynb/LRl659LzMRYqeYZc7w+IR8NJbUj1B0Mo1MkvOUm/l9lnkdZNw0bC7IVQqc
 v0sQ==
X-Gm-Message-State: AOAM532h239WNJH10f2fT148jdtQ2bOgu/304C+LbJzcKj5MkvcVQdwB
 Alne846e2nVROFikGVmnlH70DAy5HA6xDRnjrTuGjy/GhxR2VQi/p+cI+lkb7wur0/zaic/5k98
 xU/Oi8bzydsKuBMY=
X-Received: by 2002:a17:906:5e15:: with SMTP id
 n21mr5167576eju.57.1618299266209; 
 Tue, 13 Apr 2021 00:34:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz0jzPyfR8iJGOZva9gWEn99qUU6b4Qglz2nZtDZDXTLhmWleYjK8N7/Y5uu18CMBEVIiMxBA==
X-Received: by 2002:a17:906:5e15:: with SMTP id
 n21mr5167559eju.57.1618299266034; 
 Tue, 13 Apr 2021 00:34:26 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id u1sm8385860edv.90.2021.04.13.00.34.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Apr 2021 00:34:25 -0700 (PDT)
Subject: Re: [PATCH v2 0/2] docs/devel/qgraph: add troubleshooting information
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20210412143437.727560-1-stefanha@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <6c4a9afa-55aa-4778-fa62-a49cbc55be28@redhat.com>
Date: Tue, 13 Apr 2021 09:34:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210412143437.727560-1-stefanha@redhat.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/04/21 16:34, Stefan Hajnoczi wrote:
> v2:
>   * Fix "will unavailable" typo [Thomas]
> 
> I recently needed to troubleshoot a case where qos-test terminated immediately
> with no output. In other words, qos-test decided that no tests are runnable.
> 
> After lots of head scratching and some help from Emanuele it turned out that
> the machine types weren't being detected as expected.
> 
> These patches add documentation about how to troubleshoot similar cases in the
> future.
> 
> Stefan Hajnoczi (2):
>    libqos/qgraph: fix "UNAVAILBLE" typo
>    docs/devel/qgraph: add troubleshooting information
> 
>   docs/devel/qgraph.rst       | 58 +++++++++++++++++++++++++++++++++++++
>   tests/qtest/libqos/qgraph.c |  2 +-
>   2 files changed, 59 insertions(+), 1 deletion(-)
> 

Acked-by: Paolo Bonzini <pbonzini@redhat.com>

Thanks, this is helpful.

Paolo


