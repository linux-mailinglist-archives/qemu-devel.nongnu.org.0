Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D44501537
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Apr 2022 17:39:35 +0200 (CEST)
Received: from localhost ([::1]:47748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nf1ZG-00052v-7m
	for lists+qemu-devel@lfdr.de; Thu, 14 Apr 2022 11:39:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1nf1XX-0003Qq-In
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 11:37:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60831)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1nf1XT-0006OW-Oe
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 11:37:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649950661;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CfUL2qaqlFXi9mZE+3/1hhY4kbVbT2iWiO+gyFBJ6Yw=;
 b=Bt6r/hWSTZQww40ivXYct/LSWNs5/LSUF+YL9ULP5mVDd7tIMQ9fOf/zEd6sSTsdX8sL19
 NurprtMRB6DF3CHtf+ZD4j2uruSFpGDaiQ/f+VbIU19T6rzwNVBRlSIgkayrexHjsGH1oS
 5Vp+RcnJmtLTcR2IJYJGj7ddBcfkhJE=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-621-JzydLFC4NPCfjRytdvRJ3g-1; Thu, 14 Apr 2022 11:37:40 -0400
X-MC-Unique: JzydLFC4NPCfjRytdvRJ3g-1
Received: by mail-qv1-f69.google.com with SMTP id
 jr12-20020a0562142a8c00b0044429017bcbso4626718qvb.20
 for <qemu-devel@nongnu.org>; Thu, 14 Apr 2022 08:37:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=CfUL2qaqlFXi9mZE+3/1hhY4kbVbT2iWiO+gyFBJ6Yw=;
 b=vaz1dOhda6/43icq6xQPSijYMFuYwf8h/V44JnuED57iLDCBGTmDkTXcUG1ctrdbxN
 cYXFrwwR0lrBSpPFSQ7/rDzxW1+YkLqyxjlw/dAsgcWjUB7vMLikaDK1qc9RnPMywHKY
 a6U8N6vOWwH05eXTr4aroF/63Tj/p8rwMsjzK68ID7RuOemrpW/OosajQqDzOJb+9ew7
 JLSffgdQE+M4yfKM2w5GdlGQaxfeYNP6h/2eoDI+YsXaHhbeffsIxyfx9Af1gO6QgBsE
 h1y9EAwvfTy0QygjHMCRpqpLwaqbmumRnzqtykERIjKnZSOnkKWGRkEFLKILoeTv7Ndp
 UOtA==
X-Gm-Message-State: AOAM532GLmm3zLX6mhxNmjThEt8lcF58slQnPyjllBNLYZ8Cd+LsSw5K
 gTjgawxYgFA56CKx6GJ88t/uBHqp2RMllaAPr+BP0yliUsjblZDJXgeOf4OrmrQPrKFDfRkHjWR
 B360opO39jxTwPw8=
X-Received: by 2002:a0c:9045:0:b0:443:cec9:e349 with SMTP id
 o63-20020a0c9045000000b00443cec9e349mr3871346qvo.88.1649950659621; 
 Thu, 14 Apr 2022 08:37:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz3HYNBpUQ/7QRRidr6ofI5JOk8jXX4/AIc1ach1ALtXI+YwjNuR/1TYx1Ai/btY3pDmjNzpQ==
X-Received: by 2002:a0c:9045:0:b0:443:cec9:e349 with SMTP id
 o63-20020a0c9045000000b00443cec9e349mr3871320qvo.88.1649950659347; 
 Thu, 14 Apr 2022 08:37:39 -0700 (PDT)
Received: from [192.168.100.42] ([82.142.26.186])
 by smtp.gmail.com with ESMTPSA id
 m10-20020a05622a054a00b002eb965bbc3esm1421226qtx.93.2022.04.14.08.37.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Apr 2022 08:37:39 -0700 (PDT)
Message-ID: <3307503e-aa21-24f8-c9dc-7151eeda2f9b@redhat.com>
Date: Thu, 14 Apr 2022 17:37:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] tests/qtest: Move the fuzz tests to x86 only
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20220414130127.719528-1-thuth@redhat.com>
From: Laurent Vivier <lvivier@redhat.com>
In-Reply-To: <20220414130127.719528-1-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Hannes Reinecke <hare@suse.com>, qemu-block@nongnu.org,
 Darren Kenny <darren.kenny@oracle.com>, Bin Meng <bin.meng@windriver.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Alexander Bulekov <alxndr@bu.edu>,
 Bandan Das <bsd@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14/04/2022 15:01, Thomas Huth wrote:
> The fuzz tests are currently scheduled for all targets, but their setup
> code limits the run to "i386", so that these tests always show "SKIP"
> on other targets. Move it to the right x86 list in meson.build, then
> we can drop the architecture check during runtime, too.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   tests/qtest/fuzz-lsi53c895a-test.c  |  8 ++------
>   tests/qtest/fuzz-megasas-test.c     | 12 ++++--------
>   tests/qtest/fuzz-sb16-test.c        | 12 ++++--------
>   tests/qtest/fuzz-sdcard-test.c      | 12 ++++--------
>   tests/qtest/fuzz-virtio-scsi-test.c |  8 ++------
>   tests/qtest/meson.build             | 13 ++++++-------
>   6 files changed, 22 insertions(+), 43 deletions(-)
> 

Reviewed-by: Laurent Vivier <lvivier@redhat.com>


