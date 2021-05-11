Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B7FE37AF34
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 21:17:33 +0200 (CEST)
Received: from localhost ([::1]:48606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgXsp-0005NB-CN
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 15:17:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lgXr8-0003vJ-0J
 for qemu-devel@nongnu.org; Tue, 11 May 2021 15:15:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24969)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lgXr1-0000zO-Qj
 for qemu-devel@nongnu.org; Tue, 11 May 2021 15:15:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620760537;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BaNSp7MDbzb4M+SNoqvlNmG0J24hkQULrqo5iZse8Cg=;
 b=CfvbuaRULRsUW2I9vnTiyMRutxcLV2dE4Kf26jvMkbimIDBOd4dKiqSgAcyJZKHWgXKXis
 krInlEdnjdMhhoqRka5WDNM/XqsqW9zZ7ysmf+0Evj4NfEQ5Vg3Be0wh/8LR7RNsmmJqSR
 3eHj4eLwOQEAQaeLG+83hGthOKLKzJY=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-323-iy8-U-_UNqeCoOqGycst7g-1; Tue, 11 May 2021 15:15:36 -0400
X-MC-Unique: iy8-U-_UNqeCoOqGycst7g-1
Received: by mail-oi1-f200.google.com with SMTP id
 n128-20020aca59860000b0290159ccfcbd31so11633678oib.10
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 12:15:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BaNSp7MDbzb4M+SNoqvlNmG0J24hkQULrqo5iZse8Cg=;
 b=oUMBmmiSsBczmW0Sb92KRsuKGyw2dZ6lYWd4e+0Vxt5jSRrI3Tu3upuI+hC3UBDexv
 hsBTiLojAegPoIC4y6r39Nm3y0z5NRg7uWIiEVri0Zpu8AGbsykjxBpg/tavHv9VhDpK
 Jv5z0lGCgvmMHOCkrkElUn4W/b3XFAgkL+8WOQKtQejMy4K5xyzYvAh9AIRcx0hiMxIY
 j0+kaMLxCMEyKSGLA2p/IS1bkwTYUF1QUshIbP+dwudQeoIeYzyCbhD6j7j6IrQqxY0V
 /SMuanl1DMyyt9T97gX6zOwYQ++blgwIs9BRrboOPnZLyGZHOMpZGfg+OeYU6DdUNlJU
 IpOQ==
X-Gm-Message-State: AOAM533pgna8FNPh7BYqNPloWkoz+96Wnngt+iiPSwCgFI/di4B8NCsn
 Et9DO6NEWLJ9tLFsJ8ZYxrKh6Zuom8KWQy6+7drK29mXUGA9f34YKhC0ogTCfawPo4wgzRt1Vyi
 Fmrf0BPouj7l5W6s=
X-Received: by 2002:a9d:68cb:: with SMTP id i11mr11268344oto.364.1620760535592; 
 Tue, 11 May 2021 12:15:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy0Cm7t5GWrNQWKo+VYlMgC1eWrgXCJEt4C0mkdXXDkAsWkYN0W1Kch6Tw+O//aOnMhYOWzUQ==
X-Received: by 2002:a9d:68cb:: with SMTP id i11mr11268326oto.364.1620760535403; 
 Tue, 11 May 2021 12:15:35 -0700 (PDT)
Received: from [192.168.0.112] (ip68-103-222-6.ks.ok.cox.net. [68.103.222.6])
 by smtp.gmail.com with ESMTPSA id
 x30sm3598085ott.41.2021.05.11.12.15.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 May 2021 12:15:35 -0700 (PDT)
Subject: Re: [PATCH] docs: add table of contents to QAPI references
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210511092541.962525-1-berrange@redhat.com>
From: Connor Kuehl <ckuehl@redhat.com>
Message-ID: <a5afcb00-c747-a685-eff5-8e6a312cb153@redhat.com>
Date: Tue, 11 May 2021 14:15:33 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210511092541.962525-1-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ckuehl@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ckuehl@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/11/21 4:25 AM, Daniel P. Berrangé wrote:
> The QAPI reference docs for the guest agent, storage daemon and QMP are
> all rather long and hard to navigate unless you already know the name of
> the command and can do full text search for it.
> 
> A table of contents in each doc will help people locate stuff much more
> easily.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---

This looks so much better!

Reviewed-by: Connor Kuehl <ckuehl@redhat.com>


