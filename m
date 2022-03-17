Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F504DCA00
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 16:31:02 +0100 (CET)
Received: from localhost ([::1]:50972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUs5d-00058g-Fy
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 11:31:01 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nUs3A-0002bu-3E
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 11:28:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39316)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nUs38-000300-Ed
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 11:28:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647530905;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BOlyevpq80r4D3sHc99qEq8TP/EVsDSRlWKm4mwp3m0=;
 b=L4qp5Q8hkamSDKHaB8onIAKe6VoBCzurU+tKNgMkpssdXo+O3fnTZY2rToOWWv+6NzKpq6
 ql/PTQUo3T76M6UpAjOp78g1JKP4i2CaoAOFLwLtG8h/9CQdX6+TXfrxPY+KfLeiNhUCgb
 m98DjopyufcmFSezsvuszRL47/mUk5g=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-613-Ladrc7E2NumI-EzhFg6WRw-1; Thu, 17 Mar 2022 11:28:24 -0400
X-MC-Unique: Ladrc7E2NumI-EzhFg6WRw-1
Received: by mail-ed1-f72.google.com with SMTP id
 11-20020a50874b000000b004186b7c1252so3314010edv.3
 for <qemu-devel@nongnu.org>; Thu, 17 Mar 2022 08:28:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=BOlyevpq80r4D3sHc99qEq8TP/EVsDSRlWKm4mwp3m0=;
 b=ExiputZT3UsU6LrLK56S9tNRp92Y6sUeEqIwuF1A/p8FYs7UMZLId/J5PX04ZQvh4H
 MO1ZbpK28GSg44u5tgoJXu32Ds1cpWc+G7v1Z2cGCg5yIOy8jTM/GQ5z4Qkb8O8lV3j6
 yrC9mgjpXw3acbNjvkl1HhUvwF64ceCb//rk6RyKPg8AyFZnDorwv8oN4qU779AkVnxj
 P6SXq4F7Z6W46uUuZLY6MR6iLrJE66uPE17tT+0YUrr2Fg6+SMjpxhN9P7n4mLJUzeUb
 cG6+pZbc0ILEKQSwb+R1NniDU/QmwNXiO8hKQ8bB+tdWMqMoDTN4G4/UpSSg8+Pts+la
 AUhA==
X-Gm-Message-State: AOAM530Jq0d2DKHO/GArQdCHEX/MIlwPi9tKoJhtxdiyZTZxtawJaPUu
 HBpB0XH2Q6L3328kAJPix5pFBeFhx/qtkxM14QXD2UYqkbrMjDZg63DwXs71P/P922Ge+2mWtlI
 zjUR7/8JThD6BsiY=
X-Received: by 2002:a05:6402:4414:b0:408:4dc0:3ee9 with SMTP id
 y20-20020a056402441400b004084dc03ee9mr4988891eda.203.1647530903375; 
 Thu, 17 Mar 2022 08:28:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxM5uRY1gdza5mMilAe9dvMeV6+OGYaxQm63EtGd7SVKC8NTz56HWpYsIViSaXjJAIOSW0MZw==
X-Received: by 2002:a05:6402:4414:b0:408:4dc0:3ee9 with SMTP id
 y20-20020a056402441400b004084dc03ee9mr4988871eda.203.1647530903197; 
 Thu, 17 Mar 2022 08:28:23 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id
 t7-20020a1709063e4700b006da6357b1c0sm2511880eji.196.2022.03.17.08.28.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Mar 2022 08:28:22 -0700 (PDT)
Message-ID: <71c3d99f-f273-ac32-d644-4b2d3eee6ffb@redhat.com>
Date: Thu, 17 Mar 2022 16:28:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 12/14] iotests: remove qemu_img_pipe_and_status()
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20220309035407.1848654-1-jsnow@redhat.com>
 <20220309035407.1848654-13-jsnow@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220309035407.1848654-13-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09.03.22 04:54, John Snow wrote:
> With the exceptional 'create' calls removed in the prior commit, change
> qemu_img_log() and img_info_log() to call qemu_img() directly
> instead.
>
> In keeping with the spirit of diff-based tests, allow these calls to
> qemu_img() to return an unchecked non-zero status code -- because any
> error we'd see from the output is going into the log anyway.

:(

I’d prefer having an exception that points exactly to where in the test 
the offending qemu-img call was.  But then again, I dislike such 
log-based tests anyway, and this is precisely one reason for it...

I think Kevin disliked my approach of just `assert qemu_img() == 0` 
mainly because you don’t get the stderr output with it.  But you’ve 
solved that problem now, so I don’t think there’s a reason why we 
wouldn’t want a raised exception.

Hanna

> Every last call to qemu-img is now either checked for a return code of
> zero or has its output logged. It should be very hard to accidentally
> ignore the return code *or* output from qemu-img now; intentional malice
> remains unhandled.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   tests/qemu-iotests/iotests.py | 26 +++++++-------------------
>   1 file changed, 7 insertions(+), 19 deletions(-)


