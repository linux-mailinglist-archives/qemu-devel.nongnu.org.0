Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F337307452
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 12:03:43 +0100 (CET)
Received: from localhost ([::1]:43278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l555S-00011B-7Q
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 06:03:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l554Z-0000EK-4D
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 06:02:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37195)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l554X-0000qb-0K
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 06:02:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611831763;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a1m/cLEY13tDBo0h/pnmMRjcNA7DsFWhW2/f2XTrp0s=;
 b=DfJWTj6TqHXXPx4ljIjNyHRdISoA+vYnoJKfqPCFiUIKjrVes7+vZneQ/CGbZnLu315rpe
 P+aU9EfXYyYaYCByqUaoxyvjixjTIDa+9q1RSz096+hSzYTjQSc2OXSCudBHi/GNTYE074
 DyfPfeZR+FfnOf++2nG+n7XcNnnM/Uo=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-330-VKTysu9EMtezYDvqtij3eg-1; Thu, 28 Jan 2021 06:02:41 -0500
X-MC-Unique: VKTysu9EMtezYDvqtij3eg-1
Received: by mail-ej1-f72.google.com with SMTP id by20so2014772ejc.1
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 03:02:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=a1m/cLEY13tDBo0h/pnmMRjcNA7DsFWhW2/f2XTrp0s=;
 b=hTu22JmmQXSHYop8YgxC7tsa0aFCqxGf0izL+KbvpnqohuH2N4CFr75U0k8GmXV3z3
 QO1ntz2ql718YOZfosmH48VDqRalrodFj5XM964Qapyic6WMFW2rwgEklK64ofS78jXN
 xbV63eGt1cO4DYK7DS0D6seObpxhwWsi1UJ4QNLT8/R49VylbrV2rUHDapRS58DHpUQJ
 vydi3Hz5uEVovwYbpUwAClFzAXgFcPa6TQ8jA+qU1hFlg2vL5bbAdBrHvVIqWBlxuOxO
 Bua5uouWGOEHI4LxCPepRk+KU9ombNZX0Z6BmOxT0Dh+9W6YI2BkiYpZdaxPMVapAx31
 Rlnw==
X-Gm-Message-State: AOAM531A12BGRCMrV3LdkKRmzd5cblRSUBrLE4j8JTRMekZWlzyeQ+ze
 HyaWtLSxqw97czIX3BiWkz1cd8m72zplXQlvJ/Ab7YwLR50LukgdyzyChj1FGIoljGRdqnBeedM
 jsdsPBBL+ER6kZ0I=
X-Received: by 2002:a50:a684:: with SMTP id e4mr13175041edc.148.1611831760021; 
 Thu, 28 Jan 2021 03:02:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx5o0yFDHCP7AW+sMzk1kU26igHGH7CIrhoMMQUw8WORBv6tISsBZGWNtT/9Otdx6ekWCpc4w==
X-Received: by 2002:a50:a684:: with SMTP id e4mr13175005edc.148.1611831759796; 
 Thu, 28 Jan 2021 03:02:39 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id e27sm2164457ejl.122.2021.01.28.03.02.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Jan 2021 03:02:39 -0800 (PST)
Subject: Re: [PATCH v4 00/12] Support disabling TCG on ARM (part 2)
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Claudio Fontana <cfontana@suse.de>
References: <20200929224355.1224017-1-philmd@redhat.com>
 <87r1m5x56h.fsf@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <98f06a0a-efe6-c630-8e68-0e4559f04d58@redhat.com>
Date: Thu, 28 Jan 2021 12:02:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <87r1m5x56h.fsf@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.308,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, kvm@vger.kernel.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Alex,

On 1/28/21 1:41 AM, Alex Bennée wrote:
> Philippe Mathieu-Daudé <philmd@redhat.com> writes:
> 
>> Cover from Samuel Ortiz from (part 1) [1]:
>>
>>   This patchset allows for building and running ARM targets with TCG
>>   disabled. [...]
>>
>>   The rationale behind this work comes from the NEMU project where we're
>>   trying to only support x86 and ARM 64-bit architectures, without
>>   including the TCG code base. We can only do so if we can build and run
>>   ARM binaries with TCG disabled.
>>
>> v4 almost 2 years later... [2]:
>> - Rebased on Meson
>> - Addressed Richard review comments
>> - Addressed Claudio review comments
> 
> Have you re-based recently because I was having a look but ran into
> merge conflicts. I'd like to get the merged at some point because I ran
> into similar issues with the Xen only build without TCG.

I addressed most of this review comments locally. Since Claudio's
accelerator series was getting more attention (and is bigger) I was
waiting it gets merged first. He just respun v14:
https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg07171.html


