Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8054E6CF4E3
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Mar 2023 22:57:56 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phcrZ-0003nw-2x; Wed, 29 Mar 2023 16:57:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dhobsong@igel.co.jp>)
 id 1phcrW-0003nl-SZ
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 16:57:42 -0400
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dhobsong@igel.co.jp>)
 id 1phcrT-0008Ec-68
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 16:57:40 -0400
Received: by mail-qt1-x82f.google.com with SMTP id h16so9613488qtn.7
 for <qemu-devel@nongnu.org>; Wed, 29 Mar 2023 13:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=igel-co-jp.20210112.gappssmtp.com; s=20210112; t=1680123457;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ozFiWwNJb7ck7Oryse1wTmBMw7vzQpV2tm0TWOx4rCA=;
 b=epP2Q/Flo2rleS7yeT5PSGh44jHrk/BgNTfoDhKMgBMZTJ5ma41LQJPSoPwm/MEQ7n
 Gv37VHZqqmeJ2vrhINv9V4eezWtgt9OKqjiEqv4s3MLtJmJew/KKK/DJvLurS/irV/U9
 uTWolHCA8ifqr4cqAFJCZmOwn1A8aA/F95FdCDi4nlym6f87w1xHYPdvlZVjBTSWLpA9
 MlAzDQ5z9C/+erB83+AzGwO8iVayexFZw32pdoMq8tjkbyMaQ0WNGgMQbdD6RnlgWjhA
 NikzvSRrbqPNMCvZPm/SjDbpa2jkD790axNnQqio4qn3GxI+/JqYWBOtg48F8/mAHjuD
 DJ7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680123457;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ozFiWwNJb7ck7Oryse1wTmBMw7vzQpV2tm0TWOx4rCA=;
 b=HYWuEfXPP1NlLVwDQ/zL04RGt4dcC7iIqlgtGSEUxDFzcnu4LqteUdIHI2KGFJdqE9
 YirbKtAnvhX2wVYUsEFbcQJbsKNoXT7uIppvDd3kTLQZYCcsHUXQ3WizLwOPoSwhupK+
 YUCa0HGG7ph6+PskBp/yDNJlzDNc/FftlizBNLLg56BLgvnrF7H5F0D0ZkM308s1Np/d
 AozOOq3l+kDaW/7m4+zfO7QR4jSPkxMbJc9bZ/9iNWmBg4lT8rtqfu037/2VdKqlG4LI
 CWQbueUAnVUGLnRV49BLU4EmHWUOHOS1fLVZiMQC0uMNfYv5AuUKe5OnRvwbDJiEvWhp
 4MoA==
X-Gm-Message-State: AAQBX9fuDFEngUIvMDrB/Nqm3kEo9HWj62C/KuwMncSK1HNGk+14syzk
 2oD8iMfGORixooU6zo58o5gRgQ==
X-Google-Smtp-Source: AKy350bebo4AWwRvsJVda/Kux1o8Xrj+CMgXBah/FUSMaIrXgONipeZBBU5mtbOzWvrXlAxjNGtKpQ==
X-Received: by 2002:ac8:5aca:0:b0:3e3:7dff:663e with SMTP id
 d10-20020ac85aca000000b003e37dff663emr6832311qtd.27.1680123457185; 
 Wed, 29 Mar 2023 13:57:37 -0700 (PDT)
Received: from [192.168.68.65] (135-23-249-188.cpe.pppoe.ca. [135.23.249.188])
 by smtp.gmail.com with ESMTPSA id
 n67-20020a37bd46000000b007469c93ac2dsm10843962qkf.31.2023.03.29.13.57.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Mar 2023 13:57:36 -0700 (PDT)
Message-ID: <9bf0e5a2-a84a-28c3-b847-69d33ba3354d@igel.co.jp>
Date: Wed, 29 Mar 2023 16:57:35 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [RFC PATCH 2/2] virtio-gpu: Add an option to connect all outputs
 on startup
Content-Language: en-US
To: kraxel@redhat.com, mst@redhat.com, marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org
References: <20230308162548.1766359-1-dhobsong@igel.co.jp>
 <20230308162548.1766359-3-dhobsong@igel.co.jp>
From: Damian Hobson-Garcia <dhobsong@igel.co.jp>
In-Reply-To: <20230308162548.1766359-3-dhobsong@igel.co.jp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82f;
 envelope-from=dhobsong@igel.co.jp; helo=mail-qt1-x82f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 2023/03/08 11:25, Damian Hobson-Garcia wrote:
> When multiple outputs are enabled using the "max_outputs" attribute,
> only the first connector appears as "Connected" in the guest DRM
> device.  Additional connectors must be enabled from the host side
> UI frontend before they are usable by the guest.  However, multiple
> outputs can still be of use on a headless configuration, if for example,
> the display will only be used for taking periodic screenshots in the
> guest or integration into a CI pipeline, etc.
> 
> Add an option to start all of the outputs in the "Connected" state,
> so that they are immediately available to the guest.

I was also thinking that since the main application for this is headless 
configurations, it could be possible to implement this in
ui/egl-headless.c.

Calling dpy_set_ui_info() for each console during initialization is 
enough to enable the outputs, but then there is the question of what 
resolution to pass in the ui_info. Hardcoded? Add a new option to the 
`egl-headless` display property?

Are there any thoughts on this approach vs. addressing this at the 
display driver (virtio-gpu) level?

Thank you,
Damian




