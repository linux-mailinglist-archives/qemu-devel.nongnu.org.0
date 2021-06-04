Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD58239B747
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 12:42:38 +0200 (CEST)
Received: from localhost ([::1]:40712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lp7Hh-0004gt-KW
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 06:42:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lp7FA-0007hc-Gf
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 06:40:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26174)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lp7F8-0007qN-VX
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 06:40:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622803198;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2k+OCkdMIxnegG/qRd9QlJbOO73zJA2Yzl+lwZ3ETpk=;
 b=aN+gCcuOpSQK90VPe6fEsTFSl4zUeNWo8PmtYbnqe3D27j/XsgodbNH+YZskhU9vg9iBwG
 Djc17ypLV1O0PJIml8JhTlsoLD8wiMensXMjXWOb+8G6Ya5hYMzGH2cI+Q3mj/y0gbKd3V
 M7Uint7XaNRYe6yISFhU7iermmnOnhE=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-414-CMfmISOiMRaw5xj6R3UxOg-1; Fri, 04 Jun 2021 06:39:56 -0400
X-MC-Unique: CMfmISOiMRaw5xj6R3UxOg-1
Received: by mail-ed1-f69.google.com with SMTP id
 q7-20020aa7cc070000b029038f59dab1c5so4780646edt.23
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 03:39:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2k+OCkdMIxnegG/qRd9QlJbOO73zJA2Yzl+lwZ3ETpk=;
 b=TEjyayAcZR/X5OGkbtJj7nGXgUvdiP0hbFIDfMHbfqoAgp7W8bYgpcGyBmKLuQS1fV
 BFLBc8iJqv4ZijSjzk3wYcWCsy/PauPBoM7ByoA03FwFw4ymQ0rtQPyncoqkGkNY6y/F
 Up5/SqxQ2LxF2roOyRiARFoSeMHSLvh5K0+UNH6XRiM5kuK4lc7x5ojvdhF+lLw/0mnE
 W/FU07SkV/lEsNILaS1nylGGIXIbsikC5uZvo61FfLT3NX3/cZOmbXL6KBHxnaQnidF5
 FC6Xrap9cvYEuIgIAzOHjUAE2WGE8G/lcZ8zpFMa1IAx0EVcE2uvcwA53buaaZVYWfpx
 OSNQ==
X-Gm-Message-State: AOAM533hDqudqhozOLzUPPXg7nqM1VO83UGfe1bf5b2c3akUE/THemn9
 YPNPK1+eZm4PMPfWNVYpwv5VQ0uRva3u4ttgKx9y0M1DNSG/Q6pZo39M1txnHzhqlbZ2zS7iqRU
 ceQfwL4Gu/4yte6s=
X-Received: by 2002:a17:906:c241:: with SMTP id
 bl1mr3490343ejb.536.1622803195880; 
 Fri, 04 Jun 2021 03:39:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzJDwG4ZA147a8wocxbDBDvoiqttLLD2rNFBIQgoCPEf/J60DIB4NSNt2iDzlKTXoLW/FgbZA==
X-Received: by 2002:a17:906:c241:: with SMTP id
 bl1mr3490338ejb.536.1622803195767; 
 Fri, 04 Jun 2021 03:39:55 -0700 (PDT)
Received: from [192.168.1.36] (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id dk12sm2573907ejb.84.2021.06.04.03.39.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Jun 2021 03:39:55 -0700 (PDT)
Subject: Re: [PATCH] vhost-user-gpu: reorder free calls.
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
References: <20210604103714.1237414-1-kraxel@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <05429b64-b5eb-1d5c-1a63-a4884747680f@redhat.com>
Date: Fri, 4 Jun 2021 12:39:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210604103714.1237414-1-kraxel@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.37,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.603, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/4/21 12:37 PM, Gerd Hoffmann wrote:
> Free in correct order to avoid use-after-free.
> 
> Resolves: CID 1453812
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  contrib/vhost-user-gpu/vhost-user-gpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


