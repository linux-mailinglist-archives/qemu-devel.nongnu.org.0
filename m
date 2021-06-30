Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7ADF3B851C
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 16:34:28 +0200 (CEST)
Received: from localhost ([::1]:51150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lybIJ-00055Q-Fc
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 10:34:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lybGH-0004OH-6i
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 10:32:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31944)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lybGD-0008Gp-Jh
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 10:32:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625063534;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ccMi6YdFyxFJIiahkd1I0PdAFzdmu2cNIHJ83e+c95s=;
 b=IIfz9O0hC9RCJwvss8TSqjKYIsFSqwbQ/Is87/fdb5P72S7QoxbNTPhN/bxgDdLxEXT5nF
 kLQcnjUqOe7cDNlrQ6zn3Ar0PwvmN8Qr8DWrJlu+Pq+CS31qLINp/aPM2BogutxbHeT8Yt
 +7zclocqDmTH/RFFviuKklz/hlN2TXM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-429-XZjGBgszMfOZNGCIlRwr6A-1; Wed, 30 Jun 2021 10:32:13 -0400
X-MC-Unique: XZjGBgszMfOZNGCIlRwr6A-1
Received: by mail-wm1-f70.google.com with SMTP id
 d16-20020a1c73100000b02901f2d21e46efso821428wmb.6
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 07:32:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ccMi6YdFyxFJIiahkd1I0PdAFzdmu2cNIHJ83e+c95s=;
 b=Mw8ayVD/xxl7DwADTFRM3QmCUzBUxxeVc/JOyo2SzMJv39rEzkCYcVuo2JoXUvfCYy
 1wrvTUhX+jRAp81p03exroBkAetNWcwTzBI3RDTrkNNQqoD89x+o57dFldywzukaYcsf
 4hNM+VZyZnQEnvQrUCskUUgZ7CJYECZeqlkTDB96r+Fxu58GHgWE7zr4RtN7rdW3bsWR
 brIJURbd8cNX7vy7dCoYJq2jwVlnZRxGXYYfl9PJGe9ttNZd7ITy4trmZZFYBzhxU5ds
 Q5GVM4x210EV/kOWueBrH+uhhH9z2azBCszbP2DcZ5ZaaGTY1sdjvHsyq4XWsQGh8u/D
 bmMA==
X-Gm-Message-State: AOAM5314mKiriaOrwMOuRpBWK5EWX8Op5c6zrYyZl4meUGBlbO2BTY1N
 Yb43MAvNmu5JtL/SuYgK4UqN2fHPHSbFb60f/LbrBgoeB53KMIUP3b0yosYDGXkja1SdIQqpeCL
 BRJzuDrc74CzkU0o=
X-Received: by 2002:a05:600c:33a6:: with SMTP id
 o38mr4955870wmp.126.1625063531875; 
 Wed, 30 Jun 2021 07:32:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxh4fNNSgGP3jMyY68cj8UZA9r9JJXWoHknYeuPvuC7t+VQxdAB1Nxek6at7jo+SFEgTVj4jA==
X-Received: by 2002:a05:600c:33a6:: with SMTP id
 o38mr4955845wmp.126.1625063531721; 
 Wed, 30 Jun 2021 07:32:11 -0700 (PDT)
Received: from [192.168.11.95] (pop.92-184-110-55.mobile.abo.orange.fr.
 [92.184.110.55])
 by smtp.gmail.com with ESMTPSA id l15sm22180779wrt.47.2021.06.30.07.32.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Jun 2021 07:32:11 -0700 (PDT)
Subject: Re: [PATCH] pvrdma: Fix the ring init error flow (CVE-2021-3608)
To: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-devel@nongnu.org
References: <20210630115246.2178219-1-marcel@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <e6bce09f-575b-eca5-fdd0-2947957fb287@redhat.com>
Date: Wed, 30 Jun 2021 16:32:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210630115246.2178219-1-marcel@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
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
Cc: marcel@redhat.com, vv474172261@gmail.com, mcascell@redhat.com,
 pj.pandit@yahoo.co.in, yuval.shaia.ml@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/30/21 1:52 PM, Marcel Apfelbaum wrote:
> Do not unmap uninitialized dma addresses.
> 
> Fixes: CVE-2021-3608
> Reviewed-by: VictorV (Kunlun Lab) <vv474172261@gmail.com>
> Tested-by: VictorV (Kunlun Lab) <vv474172261@gmail.com>
> Signed-off-by: Marcel Apfelbaum <marcel@redhat.com>
> ---
>  hw/rdma/vmw/pvrdma_dev_ring.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


