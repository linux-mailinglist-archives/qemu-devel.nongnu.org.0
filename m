Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2ADA439D3C
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 19:15:47 +0200 (CEST)
Received: from localhost ([::1]:43622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mf3Za-0007EU-MI
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 13:15:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mf3XG-0006Dc-CL
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 13:13:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22509)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mf3XD-0008BN-GS
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 13:13:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635181998;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RJzBBx/VJvaUmqy2ETXmBBs2E9rIY53aHxjZTiW2XyE=;
 b=cmMnpT9UCkOxn7I6IK2ymJJOoM1Zwj9TOdnbmzd7qevTci8fJlvykz2pSTPIU5s7rzKhfF
 G9FBK+35MlLCtcyS37z1FKeop8LwQuEAyrcWR62mjrlJqFFfETLTJxeW+/KLcoedJAnbCq
 Rdr1W/T0aES9DBQuzI261WlYNFPfiK0=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-573-norrvowmNVGKoh7094pRJg-1; Mon, 25 Oct 2021 13:13:17 -0400
X-MC-Unique: norrvowmNVGKoh7094pRJg-1
Received: by mail-ed1-f71.google.com with SMTP id
 x13-20020a05640226cd00b003dd4720703bso4596425edd.8
 for <qemu-devel@nongnu.org>; Mon, 25 Oct 2021 10:13:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=RJzBBx/VJvaUmqy2ETXmBBs2E9rIY53aHxjZTiW2XyE=;
 b=EpLDz8VE2kOzPXGD5v7AYANonJ7A8xmnLZzf6C87kJijdfXBiXyjfSA1A8l2Twz3Qe
 k0a7vObXY5UTZ63aFvjRN67hMC/a+XIMW833aaIFcz/CAPpXho+Rjjt1T+80W8VHId0T
 jzeAsHkR6ZNkA3Gkj7WIMroMWn3MWRwsH8OCjlvNx3UqtF35AFcFyppcfLC4+An6Mtdn
 xGGUiqUkGqFLR6HAzpkyOoQDi+G5ZHqUni94HNO8rqnxTE4aoFtN1RyOtL8X0XZJXf7h
 TBU/ThbR6fopHbTT7xtPHEn4jbKcFgX4OgBdl46B/QwrTj6BNn4NHriTUnxcBoZoKzsY
 AezQ==
X-Gm-Message-State: AOAM530cdZ19ao6LEqMhixbY42VuehiXqIzFswkuXurXeP9cYK10AuLq
 NzNQAzfIHKfBfI+3/jLJLbNIirBlZPX4oyHi8N5d+9weR3/pZxjt+fyT94QGipuuswxEo9LWJTo
 W+fMwRJOUZklVU70=
X-Received: by 2002:a05:6402:401:: with SMTP id
 q1mr18657412edv.225.1635181995573; 
 Mon, 25 Oct 2021 10:13:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzpeu3sGxD4XLlAFMmb0np45Qq77K9LFdiHUqeNcamf4viUErYmNPQN+SSgGQFrA1D2w9RMYw==
X-Received: by 2002:a05:6402:401:: with SMTP id
 q1mr18657385edv.225.1635181995409; 
 Mon, 25 Oct 2021 10:13:15 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id gb3sm6082549ejc.81.2021.10.25.10.13.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Oct 2021 10:13:14 -0700 (PDT)
Message-ID: <982f8355-19eb-aa27-298b-a3d731e750b7@redhat.com>
Date: Mon, 25 Oct 2021 19:13:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] configure: do not duplicate CPU_CFLAGS into QEMU_LDFLAGS
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20211025082000.629088-1-pbonzini@redhat.com>
 <9535743f-5cc0-f756-2a3f-cebd2e1401d6@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <9535743f-5cc0-f756-2a3f-cebd2e1401d6@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.846, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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

On 25/10/21 12:52, Philippe Mathieu-Daudé wrote:
> On 10/25/21 10:20, Paolo Bonzini wrote:
> 
> Can we prefix with this?
> 
>    Since commit 4dba2789084 ("configure, meson: move CPU_CFLAGS
>    out of QEMU_CFLAGS"),

Good point, done.

Paolo


