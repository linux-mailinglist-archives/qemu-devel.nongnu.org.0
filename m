Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED7716F7C22
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 06:57:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1punUM-0004NP-VQ; Fri, 05 May 2023 00:56:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1punUJ-0004NB-JR
 for qemu-devel@nongnu.org; Fri, 05 May 2023 00:56:11 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1punUG-0003Dr-W9
 for qemu-devel@nongnu.org; Fri, 05 May 2023 00:56:10 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 98e67ed59e1d1-24e5d5782edso1287384a91.0
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 21:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683262567; x=1685854567;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Tb8sjhNLr3yhxpT87IGgU4I6iW7oPEeK1eXi2F8N1Pg=;
 b=po5pUY3oAZGg2RPARLR6MRRfWJGQ2m+fm5qBh0H4NjfLJz1o3L/M+tOIrLmIAWItg/
 yx+VJUzv//VoRFlG59sMtzkD2Tq7ZrJ2MKXKpSNFUSQXAl3R+sOfF5tLuTPqUcZSsJx0
 FA/2p/sVgsWk/6DjlJJmOkjssEqkl3PuUIhjtw1Otzd4ajD8uXNsi9D/HUQKxA0ULjob
 cqorAFAVhpiCd4fIPWxdS8djBLNgxkSG6sz0kFsuQD5qnEyoGRyC0f/mSXRFv2bpK74o
 zxBEVS2gmSTbUBTKwMDDe4I1AbJc9MpxyIs5srkyb4OM5Jtr54A1X0s+1ozV0ElKYvMf
 +elQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683262567; x=1685854567;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Tb8sjhNLr3yhxpT87IGgU4I6iW7oPEeK1eXi2F8N1Pg=;
 b=YjOJlBOMUb5aqHzoO7ekTIZIL23XWxXauZkEBtUTW9Bacy0pkGVr/3szEwO1fMlC3K
 SE0YwZ+83y1GhFaBcnj4URqYDt2TPQBpaGLqsqAGMe2Q9M5uUI6fLCRS85MeagVC9JvR
 S3OkA41wuwYTrG+cI3bJwEkqo4DdOyD+XHUW18Tc14sPhVd7Ki1W/v+6btSPcxuIauhV
 4NAiWiPvQYmeOrlxiR35VYgDyusDGKyj7uAYhmmVJ6W+AT+vv7WdK0OQMEUKvcPwaW8P
 tkDFd3mPfYuO+V97RUJBaql7PS/o7NQ84l88meMX2J+B5Mcij2pS6JMggIZdbZbAMmjL
 7z1Q==
X-Gm-Message-State: AC+VfDwIX9NX03sRqQ1YojDtpe66FoO8aCFdZKsgSpewqPRH+WKeIncF
 7MOz+F1I+cb75nTF06I2Eo0=
X-Google-Smtp-Source: ACHHUZ7BLcITVmEv4hymFFwifdDQYt0kwsfgVcXHLBOfonAYwDlPehU0WzuweVVHWCXMkHk6ssdB5w==
X-Received: by 2002:a17:90b:817:b0:24b:fd8d:536b with SMTP id
 bk23-20020a17090b081700b0024bfd8d536bmr223646pjb.29.1683262567261; 
 Thu, 04 May 2023 21:56:07 -0700 (PDT)
Received: from ?IPV6:2400:4050:a840:1e00:4457:c267:5e09:481b?
 ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 e8-20020a17090a9a8800b0024e227828a9sm3997774pjp.24.2023.05.04.21.56.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 May 2023 21:56:06 -0700 (PDT)
Message-ID: <168d3290-1db5-6dda-1464-493c18473760@gmail.com>
Date: Fri, 5 May 2023 13:56:02 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v3 0/5] virtio-gpu cleanups and obvious definitions
To: Gurchetan Singh <gurchetansingh@chromium.org>, qemu-devel@nongnu.org
Cc: philmd@linaro.org, kraxel@redhat.com, marcandre.lureau@redhat.com,
 dmitry.osipenko@collabora.com, ray.huang@amd.com, alex.bennee@linaro.org,
 shentey@gmail.com
References: <20230504191243.746-1-gurchetansingh@chromium.org>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@gmail.com>
In-Reply-To: <20230504191243.746-1-gurchetansingh@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -63
X-Spam_score: -6.4
X-Spam_bar: ------
X-Spam_report: (-6.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-4.28, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 2023/05/05 4:12, Gurchetan Singh wrote:
> From: Gurchetan Singh <gurchetansingh@google.com>
> 
> v3 of "virtio-gpu cleanups and obvious definitions"
> 
> https://lists.gnu.org/archive/html/qemu-devel/2023-04/msg05392.html
> 
> All patches have been reviewed, though there was a question from
> Bernhard Beschow about patch (3) and how it fits with the QOM:
> 
> https://lists.gnu.org/archive/html/qemu-devel/2023-05/msg00057.html
> 
> I go into detail in patch 3 commit message, but I think we meet
> the requirements (which are tricky/fuzzy anyways).  Also, I think
> this is the cleanest way to add another 3D virtgpu backend.  But
> if anyone has other ideas, please do reply/review.
> 
> Antonio Caggiano (1):
>    virtio-gpu: CONTEXT_INIT feature
> 
> Dr. David Alan Gilbert (1):
>    virtio: Add shared memory capability
> 
> Gurchetan Singh (3):
>    hw/display/virtio-gpu-virgl: virtio_gpu_gl -> virtio_gpu_virgl
>    hw/display/virtio-gpu-virgl: make GL device more library agnostic
>    hw/display/virtio-gpu-virgl: define callbacks in realize function
> 
>   hw/display/virtio-gpu-base.c   |   3 +
>   hw/display/virtio-gpu-gl.c     | 114 +--------------------------
>   hw/display/virtio-gpu-virgl.c  | 137 +++++++++++++++++++++++++++++++--
>   hw/virtio/virtio-pci.c         |  18 +++++
>   include/hw/virtio/virtio-gpu.h |  11 +--
>   include/hw/virtio/virtio-pci.h |   4 +
>   6 files changed, 160 insertions(+), 127 deletions(-)
> 

For all patches:

Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>

