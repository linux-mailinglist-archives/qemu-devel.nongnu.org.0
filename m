Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CABDD310DB8
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 17:17:54 +0100 (CET)
Received: from localhost ([::1]:34186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l83ns-00005P-5s
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 11:17:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l83mT-0007w7-A6
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 11:16:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51136)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l83mL-00020o-IV
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 11:16:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612541776;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BpS6RBxZdOZCLhy95q0l+0dLN0JPLEso0is/GOstV30=;
 b=gB4G7AqlvGVVFF8KDvvD5FOt4PNKmDaTG9qdyR+GxkzolwZp7f6PRh3NU5FhFZOlhNqbgd
 bl+OoigJstXrlL6tNvt04yq3217p1ekZOoevDwMUy6d+z/5PRZEbetvbgxKxWe2q3vVo7+
 rTxnuC54cqZStKfMx60vasZBLbbKnvM=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-295-Ayd6gM5dOduFLZiuMtBkLg-1; Fri, 05 Feb 2021 11:16:14 -0500
X-MC-Unique: Ayd6gM5dOduFLZiuMtBkLg-1
Received: by mail-ed1-f71.google.com with SMTP id u26so7173960edv.18
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 08:16:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BpS6RBxZdOZCLhy95q0l+0dLN0JPLEso0is/GOstV30=;
 b=F+AB9L2dH3Rwyy0nxHFlVozVJ47zmMieVuTmQMRtG+VZEtDSkfDQjA2CxJ0SrOK6DD
 tf5YAaFkrlrlHgphah31wWSA5yhOTjK1hs+x4rzHNqlBznJVgeqNatmVvkcKbPSwofq0
 lHY1lZFb3E3xgkRusz/WGRUtdqgOIOQh8XPzH61QsDZcFvf5YCQ2R5LXSf/dyG/cbLZB
 MMxfXh71VEX+/d/ImYh31TT2/RMALPBlWqqX2d09CEDdWvFPvvSV+8k+peZEIk+Ybu/g
 KI0BzHsH46XO0MLYxRGNmnPi/SuTJLrUl/rO6+uFQRSHSYNr1a+Ee8tZgESPC+929gaL
 kMFw==
X-Gm-Message-State: AOAM5336TmE9xrFk7rGgpufWqmhZ8soH7h9EmnBvCnN9EIAwk9HHVklL
 G2dtiuFm4HbmYWkTRVMbLyM/FGfpsTDY4jw1u07vynT564g6OZkrVzkZ7kCehh53HMkdSpkVcGX
 5dG8rYNgSnfDse3U=
X-Received: by 2002:a05:6402:17aa:: with SMTP id
 j10mr4271331edy.184.1612541773355; 
 Fri, 05 Feb 2021 08:16:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwKQOxXKusuSIAOgzD36ru2jQYCGWO+HDAXs1oOVzylLhBna6XoauDe+vjeGQO3bynsmNU65w==
X-Received: by 2002:a05:6402:17aa:: with SMTP id
 j10mr4271312edy.184.1612541773186; 
 Fri, 05 Feb 2021 08:16:13 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id j9sm4215500edr.25.2021.02.05.08.16.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Feb 2021 08:16:12 -0800 (PST)
Subject: Re: [PATCH 07/33] migration: push Error **errp into
 qemu_loadvm_section_part_end()
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210204171907.901471-1-berrange@redhat.com>
 <20210204171907.901471-8-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <b60d564f-2848-b6c3-2b8a-01c2aabba850@redhat.com>
Date: Fri, 5 Feb 2021 17:16:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210204171907.901471-8-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.352,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.33, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Hailiang Zhang <zhang.zhanghailiang@huawei.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/4/21 6:18 PM, Daniel P. Berrangé wrote:
> This is an incremental step in converting vmstate loading code to report
> via Error objects instead of printing directly to the console/monitor.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  migration/savevm.c | 26 +++++++++++++-------------
>  1 file changed, 13 insertions(+), 13 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


