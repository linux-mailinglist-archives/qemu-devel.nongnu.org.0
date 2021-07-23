Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9783C3D3F1D
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 19:46:08 +0200 (CEST)
Received: from localhost ([::1]:55464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6zFP-00038Z-8U
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 13:46:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m6zEA-0002Gl-Rp
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 13:44:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48029)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m6zE7-0002ze-3E
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 13:44:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627062283;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Rf9dHJ6UmU4AxH4IoxHRmHR3+KS1e98Icem4NODYOF8=;
 b=bNwmBjZvlDJNOo/3ulJReAL2g0ZKt3xnFa1kfOwzr59twGQyCejdZ7LtWTbWf4JeQUf9+D
 w/PQx8XFqlqDnRboEFVXScdM3GmkjRU53rB7acHIZ9awU3aH3ZLb6L7W/QRYElyfiWzbTs
 fP8y1bYm8HmPhUU8yLgBcP/pV1YkVI0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-141-528QuRtxPweCC3kVgXDPHQ-1; Fri, 23 Jul 2021 13:44:41 -0400
X-MC-Unique: 528QuRtxPweCC3kVgXDPHQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 l14-20020a5d560e0000b029013e2b4ee624so1284264wrv.1
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 10:44:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Rf9dHJ6UmU4AxH4IoxHRmHR3+KS1e98Icem4NODYOF8=;
 b=fQJVvnte9jXRugJYNK/QDkNC9W1f3CLFDjCt1H1dZJ3ymYv9bKiIA9b6lBuIVMvhob
 mk1RbamgthxjplwyHia6J5nOL9Cf2bUyd4s5/C+iHd8St9zkqc7TTSzZ6ZOpjxcPkQxa
 Rd51AiMHKdHXU0JW0pJeEXv5mu0iGTsqcNtQzXQXrCx8do+WBvNxNaHW/Om7LUEgQaI9
 LsOVHPFbO40lFjqJfAqv14O2fxfh6u0fyYAiZ1gpDl7a1UTvdhjKagioSR/mOXBqAu0Z
 Z7BLZHcyUWbyFPYbWbdJoLuCWttQ80q32c2qtN9AxsV2oSwDp6UYeqXig1F6XngSdpty
 h92Q==
X-Gm-Message-State: AOAM530pOy92a8MzlBfyW+DWQuWbt9NHQEXMniMBV0jJysgmYIIRvmz6
 QZSlH62lqH246zq6up0quY08sUj6UkCb7zQhNc015xXSE93kdr+FFwbT22xbvbcGosxPyIGOVjn
 viUFSNXE+cD0F347K7UPYP4IHsBAl43mMyQVr6Y51djI9I7Nd9S231R5a2kwiGUom
X-Received: by 2002:a5d:59a1:: with SMTP id p1mr6632903wrr.100.1627062280066; 
 Fri, 23 Jul 2021 10:44:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxHISRyWTKWySbA4iJk+QIqsSRJdyvyqNCA7t0I7kimg/RN65vZdy4RMgJSMp/ngR+TeEi2lw==
X-Received: by 2002:a5d:59a1:: with SMTP id p1mr6632894wrr.100.1627062279865; 
 Fri, 23 Jul 2021 10:44:39 -0700 (PDT)
Received: from [192.168.1.36] (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id v11sm32823167wrs.4.2021.07.23.10.44.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Jul 2021 10:44:39 -0700 (PDT)
Subject: Re: [PULL for 6.1-rc1 00/28] doc, metadata, plugin and testing updates
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 peter.maydell@linaro.org
References: <20210723170354.18975-1-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <e66f26d0-f2d6-c10a-8da3-de7d03d13391@redhat.com>
Date: Fri, 23 Jul 2021 19:44:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210723170354.18975-1-alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.203, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/23/21 7:03 PM, Alex Bennée wrote:
> I realised I'm on holiday next week so I thought I'd better send this now.
> 
> The following changes since commit a146af86c8247f41b641783428b95ee71eb0e43f:
> 
>   Merge remote-tracking branch 'remotes/kraxel/tags/vga-20210723-pull-request' into staging (2021-07-23 12:16:12 +0100)
> 
> are available in the Git repository at:
> 
>   https://github.com/stsquad/qemu.git tags/pull-for-6.1-rc1-230721-1
> 
> for you to fetch changes up to 0a9487d80af9ed6fa14d2696bc34a920b32e53e5:
> 
>   gitlab-ci: Extract OpenSBI job rules to reusable section (2021-07-23 17:22:16 +0100)
> 
> ----------------------------------------------------------------
> Doc, metadata, plugin and testing updates for 6.1-rc1:
> 
>   - git ignore some file editor detritus
>   - add overview on device emulation terminology
>   - remove needless if leg in configure custom devices logic
>   - numerous gitdm/mailmap updates
>   - fix plugin_exit race for linux-user
>   - fix a few bugs in cache modelling plugin
>   - fix plugin calculation of physical address
>   - handle pure assembler/linker tcg tests outside of docker
>   - add tricore build to gitlab
>   - remove superfluous MacOSX task
>   - generalise the OpenBSI gitlab rules
> 
> ----------------------------------------------------------------


> Philippe Mathieu-Daudé (1):
>       gitlab-ci: Extract OpenSBI job rules to reusable section

Oops this isn't to latest version of this patch :/

https://lists.gnu.org/archive/html/qemu-devel/2021-07/msg06130.html


