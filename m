Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 474A93B3FCF
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 10:53:37 +0200 (CEST)
Received: from localhost ([::1]:49536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwhai-0004zz-9g
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 04:53:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lwhZL-0003O7-HC
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 04:52:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lwhZI-00023a-JO
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 04:52:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624611127;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Up8vquIZcTUwfmGvPBh8P1pLLbdHUH2dgU9dltyJuE0=;
 b=ZixI+0lvyWTLESGZlcvX1W9d1lt+P+IxBP/gxFoBwzy4zSJq+Bs+XKdxHygpD4QLtNxJEe
 1PALChQWFg9fFRfY4nDStnaiT2gFys6tBNX3swxUjEFXDBwesCdIKGT7Brn+Gmu42G2HvH
 SE6D1ttT59qfpleq8aedl3Ovje1kiYo=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-535-RfRA0nsXMxmpX3j2yUnRMg-1; Fri, 25 Jun 2021 04:52:06 -0400
X-MC-Unique: RfRA0nsXMxmpX3j2yUnRMg-1
Received: by mail-ed1-f70.google.com with SMTP id
 o16-20020aa7c7d00000b02903951279f8f3so2015814eds.11
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 01:52:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Up8vquIZcTUwfmGvPBh8P1pLLbdHUH2dgU9dltyJuE0=;
 b=gTqVK8O+7N1AdXb4AT2xu5Yw9CTHatN8DtHKgbFtkaxENw9IeR7YeWtxs2zLrRdoPw
 UbJwElG9uV0ybFupEEC6i6MwsER/+R3fLwrRdrPo4G1jF5yCIP1VbdqVZKVXzlDdkcMS
 NdSFP2pnbLXayuNMOBnYcMnUAWkZsW6wiVO2e5UE0JPRUC404cy/IEKc306AIJjoulU/
 QDT/vSYSKUejPqH+AYPl0kC+dPSbvc/+2KzSAvpIVDy4Ra2Gylreqd14nfZYWplskiLL
 1KLOdBT+B1byrSX2T6HHHMA5xqUjQbcXbNsKXai/e3tqPpzDVZNpz7AWDnmRryz7FVlY
 dUIw==
X-Gm-Message-State: AOAM530PA0KFx9jhwmQOc/MhT3Y5B+T88hD7gEYlZYmr7PYSwOejhBQK
 yBDSvv9idewdunpdm1i43CHO1aoL0pY+DH1fTPPpRYY2Nhp+sNu8huwMcGIPzESTSEb77AOqxab
 hBSFKZVHFUQ0g5rQ=
X-Received: by 2002:a17:906:3c0d:: with SMTP id
 h13mr9610089ejg.269.1624611125254; 
 Fri, 25 Jun 2021 01:52:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxLmyr6ZkuMSsprQ2AJ09tQzAnRjDF6sVI1nZXSyg6NUU7k0eIXxkIPhBWXCnZMfLVk76pd9A==
X-Received: by 2002:a17:906:3c0d:: with SMTP id
 h13mr9610078ejg.269.1624611125091; 
 Fri, 25 Jun 2021 01:52:05 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id fl21sm2460458ejc.79.2021.06.25.01.52.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Jun 2021 01:52:04 -0700 (PDT)
Subject: Re: [PATCH v5 00/11] block: file-posix queue
To: Max Reitz <mreitz@redhat.com>, qemu-devel@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>
References: <20210624180423.1322165-1-pbonzini@redhat.com>
 <176597b0-f42c-601d-a401-e47fd0b60a3c@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <ec71bd52-4b08-bb01-8a48-dab20c97b3ed@redhat.com>
Date: Fri, 25 Jun 2021 10:52:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <176597b0-f42c-601d-a401-e47fd0b60a3c@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.362,
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
Cc: qemu-block@nongnu.org, mlevitsk@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25/06/21 10:37, Max Reitz wrote:
> Thanks, looks good to me, though I’m afraid I’ll be on PTO the next two 
> weeks so I can’t take this series through my tree... (I don’t really 
> want to send a pull request today when I probably wouldn’t be able to 
> deal with potential problems)

I can take it too, if it's okay for you.

Paolo


