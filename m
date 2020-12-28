Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6162E2E3636
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Dec 2020 12:13:48 +0100 (CET)
Received: from localhost ([::1]:59388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ktqTD-0002Rn-0b
	for lists+qemu-devel@lfdr.de; Mon, 28 Dec 2020 06:13:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ktqSF-0001cz-6g
 for qemu-devel@nongnu.org; Mon, 28 Dec 2020 06:12:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35313)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ktqSD-0003Si-FL
 for qemu-devel@nongnu.org; Mon, 28 Dec 2020 06:12:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609153963;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zk5UQGksXRhFLqYMc0FKsbLfo1hQPPJPk+2NFsaqLmw=;
 b=SI5PYF9G4fAzgmeOW8cBM9b4LM5VTHUzQBdVxMbis4jSqTRK58tsA9rqADCB+W84J2fCaj
 D1hTHtdui3WRH2hFmYhVICIAwO3+6kLbY80jOj1h7NXSWfGxLetNvwof7qZ2WZ1/crDZiX
 G8JJiGyBR3fHryNcbDKGlBi686S4gxI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-219-O4QBp2DPN7uSikMLjxta1g-1; Mon, 28 Dec 2020 06:12:41 -0500
X-MC-Unique: O4QBp2DPN7uSikMLjxta1g-1
Received: by mail-wm1-f72.google.com with SMTP id s130so6902181wme.0
 for <qemu-devel@nongnu.org>; Mon, 28 Dec 2020 03:12:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zk5UQGksXRhFLqYMc0FKsbLfo1hQPPJPk+2NFsaqLmw=;
 b=mGQTlyovvYPZBvXQ7zKzBIjARXS/Z4m2eGnYj62GgXc8NaGSXBQqiC2T5X3NtAArmi
 3GZeyuB65i+97IByBQz9aiNrg8KO2ZzQDmjEFmoIcJ7EWlZ9zmzi9zKK7/xLJ7idyze1
 Orlmt1CP5fMNJCflmQQUiBFxg4cQkY8zU39xZcv3TsAYWjRjE6BpjoZbJgguKfBU/WXC
 xaJbeLyXdHLhOfmFmxL2cLsUGqI1qYP2N+BSWmYO/Hu2Yq5FBV1sXLX3Ov9npb+hNSLW
 DoGmgHdIdc5jHJG9zapeEd9XZTHsYMGPbsUVx7nxPXogjeCNjDiiGARSICy5QqXZIWp1
 YRHg==
X-Gm-Message-State: AOAM530D0KePH/mUwbXXX/xik2Ws0craUHiXnW1jWUAEIFt5tyV9dU2D
 OLS8Sf7W+uIN5PKKr3bNBygATd30mGCSmb37fCXGcfVnQHR/jp+ZeeUUGjw/ytSm3LRWNa8RLRC
 KdlE5vTX0zhNLhgk=
X-Received: by 2002:a5d:47a5:: with SMTP id 5mr51669568wrb.109.1609153960519; 
 Mon, 28 Dec 2020 03:12:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJweAdY98ZxtFWUSulnn2yhZQwvf9GNtMJL9R1DdMxUh6hXiGRgw8cfmVfeicdkVqe4WvJZUQQ==
X-Received: by 2002:a5d:47a5:: with SMTP id 5mr51669548wrb.109.1609153960323; 
 Mon, 28 Dec 2020 03:12:40 -0800 (PST)
Received: from ?IPv6:2a01:e35:2fb0:49e0:98dc:fe2:8fe8:bc3b?
 ([2a01:e35:2fb0:49e0:98dc:fe2:8fe8:bc3b])
 by smtp.gmail.com with ESMTPSA id z3sm58115479wrn.59.2020.12.28.03.12.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Dec 2020 03:12:39 -0800 (PST)
Subject: Re: [PATCH 1/4] qobject: open brace '{' following struct go on the
 same line
To: Zhang Han <zhanghan64@huawei.com>, armbru@redhat.com
References: <20201228071129.24563-1-zhanghan64@huawei.com>
 <20201228071129.24563-2-zhanghan64@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <791fabe6-cdab-2891-0dca-393ade874dfe@redhat.com>
Date: Mon, 28 Dec 2020 12:12:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201228071129.24563-2-zhanghan64@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.041,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.829, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: alex.chen@huawei.com, hunongda@huawei.com, qemu-trivial@nongnu.org,
 qemu-devel@nongnu.org, zhang.zhanghailiang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/28/20 8:11 AM, Zhang Han wrote:
> Put open brace '{' on the same line of struct.
> 
> Signed-off-by: Zhang Han <zhanghan64@huawei.com>
> ---
>  qobject/json-parser.c | 3 +--
>  qobject/qjson.c       | 3 +--
>  2 files changed, 2 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


