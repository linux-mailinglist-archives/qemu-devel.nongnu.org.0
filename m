Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB0F4E2327
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 10:18:19 +0100 (CET)
Received: from localhost ([::1]:39080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWEB7-0007xt-TA
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 05:18:17 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nWE7S-0004Gg-Ew
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 05:14:30 -0400
Received: from [2a00:1450:4864:20::531] (port=37584
 helo=mail-ed1-x531.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nWE7Q-00040V-Mb
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 05:14:30 -0400
Received: by mail-ed1-x531.google.com with SMTP id b15so17023007edn.4
 for <qemu-devel@nongnu.org>; Mon, 21 Mar 2022 02:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=no3qUNHVh6uthb4h2aYDbVN1t1iD8xCXedEWZ6Y3L9M=;
 b=PMkImg/n6b9D148JA9qxqz2pa64Z8+x+9CYZFHaqO1rEG1Csq2IwTRpZSHYFDEwWMd
 0QNBxYTz55BpLn/9fwdkDOumm0G+2B3UTTOsLM5c3Do5o8j3QiPdio0Au/SzOZ9OnR0C
 I++H/peX94qJRhOMbz+cdbVFjwdFW7OtG3S5FT+xB0XT6hH9pMuBTt++x38P4FE5vaPz
 5eJmfl09tkLcoWBpT4DEOwWrFXu/jNDFqT6dsyuYxtAaIIXKscKupImiHP+Ey/SFKK6W
 IAnqBvQVbSQfj1Ftt2WqTIYPjU9Rj91/DlKTWiMTcN1zRKg4IZdPlFnZmZNg4hJ5Si/u
 hBQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=no3qUNHVh6uthb4h2aYDbVN1t1iD8xCXedEWZ6Y3L9M=;
 b=y0M5cNxL7OdMDymncuklKA9PTP+DKOHOj6sdpZ3GVzgrg9yc4hLJbprKi+8zHTZOmh
 QasFbDtK7c2Wk2w/Bb0pcJkB8tlJB7JPnhq3pD9cqp49iI2QAnPOCIUwdx6QA52hhUEw
 jYwVZSegQ6tg5yHbhTYbHZ6QAUtwFpuP5YgJODwHBRmaacfm4SV6cM/YO+UCs70g7E8/
 UpTs/UogWAngeInR7ZT2q7TXaWdyYBa0TwAKy0nmXfMRP7DJbypEdzCUssR1D6x6AaN9
 wRtCWx63ZYZiUTnda+7U0AuC1sKCcYeAq4diIUm+3mbOqi/pqye1PvOT8BdZ8CtcjDS0
 H2WQ==
X-Gm-Message-State: AOAM5307WQIl8I4iCPmr5W1hkJhd7490fVd3Jg7lx2XcmfAZXtQdMJpQ
 SefchubDUu43Q8dGEuS/fSg=
X-Google-Smtp-Source: ABdhPJzTMh69KHTWC2c4CvdYQF8TUdJoqEJb2HN3fY0qVpnjBcZARLSfDrZ1HtX10g1gGPcNRdXXCQ==
X-Received: by 2002:a05:6402:909:b0:415:cdbf:4748 with SMTP id
 g9-20020a056402090900b00415cdbf4748mr21614423edz.395.1647854066895; 
 Mon, 21 Mar 2022 02:14:26 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.googlemail.com with ESMTPSA id
 o3-20020a17090637c300b006d8631b2935sm6582505ejc.186.2022.03.21.02.14.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Mar 2022 02:14:26 -0700 (PDT)
Message-ID: <d74d6213-09ef-b835-e3e3-16b00a42f3e8@redhat.com>
Date: Mon, 21 Mar 2022 10:14:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [RFC PATCH-for-7.0 v4 0/2] cocoa: run qemu_init in the main thread
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Akihiko Odaki <akihiko.odaki@gmail.com>
References: <20220317125534.38706-1-philippe.mathieu.daude@gmail.com>
 <342e06e6-8d38-d068-5686-eb13c70da93b@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <342e06e6-8d38-d068-5686-eb13c70da93b@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::531
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x531.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/19/22 14:56, Philippe Mathieu-Daudé wrote:
>>    1. Move setgid and setuid calls after [+NSApplication
>>    sharedApplication] to let NSApplication initialize as the original
>>    user.

Another possibility is to move the code up to "[QemuApplication 
sharedApplication]" from main() to cocoa_display_init().

Paolo

