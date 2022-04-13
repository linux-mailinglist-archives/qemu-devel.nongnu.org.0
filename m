Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4A6500027
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Apr 2022 22:47:35 +0200 (CEST)
Received: from localhost ([::1]:36852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nejtm-0000qi-HR
	for lists+qemu-devel@lfdr.de; Wed, 13 Apr 2022 16:47:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nejsv-0008To-6G; Wed, 13 Apr 2022 16:46:41 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:43822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nejst-0001LA-3q; Wed, 13 Apr 2022 16:46:40 -0400
Received: by mail-wr1-x430.google.com with SMTP id g18so4282563wrb.10;
 Wed, 13 Apr 2022 13:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=nYgJxPOk3b+w9020t9vPK+/dF1s9XozyGcbf5UKXy4Q=;
 b=n7bXVKzA0/2FR5XLWszwzvtG0wtRb1KBqYQS2trt4f0IRX2kjo+YiUEpRYLQaOuqs6
 AO6GwYvNQW1hwBPQuA/TWILeiYegZc6pnUNozlfhyj4y4U1JDKkmFIqd3vf6Fpdowwxl
 aoUlyNOJYNDqEfvdLbcxe2Zt11jRzP2xeHPtLNiWupp2xWO5fp90bJuoK+JXD/x4wibC
 Nk02zkmhRjWZCuPbOiOZcy7obqs8qGzg8bHbjb/rj8axeXeZuP9PkeE7bX8PI7Zeq4ug
 aDjvrpN9oTeZMnZfgWJ8MZo3z2LPAZiNl+Yq7pQ1xGglOjrUdkfSbwUmYOkhGkbRr/ku
 Zu5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=nYgJxPOk3b+w9020t9vPK+/dF1s9XozyGcbf5UKXy4Q=;
 b=1ZjueewQmZO9/Sv88nIljj5dayelNjA4Ixmq7bCdPYnbmjNR6RZpG8wUYJjWDhVwDZ
 PKWt/CmEF7a+STkpo45EeY98AQ1oCNLdpQ9y5CPfTL/SeC4fPGO93vVeELWCTvHNVJwV
 D71mU2BWKM3RmIh7Tr+ZMHGFAU6rlZUKDpRxGtKfzds9sXWm+odSBjkT7NToq/telJTC
 J5OuP4F0tqf3ZmIFnGKmTBSbo8qlh5r8bet4/0MyzrmTMwKlI4ZzG2K5N3ZhCbF8UtON
 F75Wmcu8/OKiTRj9FhxziIpnXo5QRpCHgEuqaCUrG5etFpXjnhK2NSnLUGewSVevE5/O
 OD3w==
X-Gm-Message-State: AOAM530kFeNWulbumUvcu+D/OLjDDG/N6l/n8Vh5TAGOcLxgPWOzUYhQ
 dwaWT+cM8THxgCmlHUV8sr0=
X-Google-Smtp-Source: ABdhPJzxS8SKSCOS9cE+cW1HDdxTPk9YOJFBjjOOJFK4pMW7IMdfaOvG5sIIp/upi/uAKI5N+RfI5A==
X-Received: by 2002:a05:6000:1ca:b0:207:acc8:c153 with SMTP id
 t10-20020a05600001ca00b00207acc8c153mr460311wrx.165.1649882797442; 
 Wed, 13 Apr 2022 13:46:37 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 p7-20020a5d4e07000000b002079a418430sm61386wrt.85.2022.04.13.13.46.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Apr 2022 13:46:37 -0700 (PDT)
Message-ID: <c8131010-ace5-b249-f3d1-0c0c86817439@redhat.com>
Date: Wed, 13 Apr 2022 22:46:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC PATCH 0/5] Removal of AioContext lock, bs->parents and
 ->children: proof of concept
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>
References: <af53599c-c7de-d2b8-00fa-0e7d28121251@redhat.com>
 <e9eeec7b-d03e-5e8e-cc42-568c670726ca@redhat.com>
 <c8d45cd9-e7de-9acd-3fd6-13de58f5ce48@redhat.com>
 <c6a12090-b6c3-31d8-fb90-a76c9dd2e949@redhat.com>
 <88f2798b-9327-e54f-5792-e37404b94ef7@redhat.com>
 <8ae70388-ff46-6ec1-7f84-14d41ca9a6dd@redhat.com>
 <311c2e0a-fb2c-241c-cbd1-1162f7e74e18@redhat.com>
 <9d3c36f0-0834-ec9c-8473-d052d64a61dd@redhat.com>
 <69b2ce82-4826-71ed-9c32-d323df69b7c4@redhat.com>
 <6b88890c-f191-7f77-93eb-91f4951e179d@redhat.com>
 <Ylbjd3kzEsBZmgJQ@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <Ylbjd3kzEsBZmgJQ@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/13/22 16:51, Kevin Wolf wrote:
> So the idea is that we can do bdrv_graph_co_rdlock() in one thread and
> the corresponding bdrv_graph_co_rdunlock() in a different thread?
> 
> Would the unlock somehow remember the original thread, or do you use the
> "sum is correct" argument and allow negative counter values, so you can
> end up having count +1 in A and -1 in B to represent "no active
> readers"? If this happens, it's likely to happen many times, so do we
> have to take integer overflows into account then?

The counter cannot be negative, so you can use uint32_t and sum modulo 
2^32.  You might have a thread with counter 2^31+1 which is negative in 
twos complement; and a thread with counter -2^31-1 which is positive in 
twos complement; but their sum cancels out correctly.

Paolo

