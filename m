Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94EEB42021C
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Oct 2021 16:48:20 +0200 (CEST)
Received: from localhost ([::1]:47242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mX2mo-0005eA-La
	for lists+qemu-devel@lfdr.de; Sun, 03 Oct 2021 10:48:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mX2is-0003CR-4a
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 10:44:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52954)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mX2in-00032Z-Vw
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 10:44:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633272247;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nQcixARczoUoaesMCmtzDJfHHe98ag5MRfdMzHoIKvc=;
 b=PCCrAtGjcU9DFRku1YtKJLvQStdeHjGx2S1Wk67+THQcL8XQX9F9PRgR2HD5Jr7JvLk+Q9
 uwIqa7oPtcoFbIpMp80SpXBuDkTso4/JZ/WlLy9UgD59prJp7tMB68dmXEdhhAvEUcHfvM
 /2cPkhgb2Gf4zqNs0fV0z33JUyG4ISY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-552-zkFICgvNOQmkjig4qgkjvw-1; Sun, 03 Oct 2021 10:44:04 -0400
X-MC-Unique: zkFICgvNOQmkjig4qgkjvw-1
Received: by mail-wm1-f71.google.com with SMTP id
 k5-20020a7bc3050000b02901e081f69d80so7045324wmj.8
 for <qemu-devel@nongnu.org>; Sun, 03 Oct 2021 07:44:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:cc:from:in-reply-to
 :content-transfer-encoding;
 bh=nQcixARczoUoaesMCmtzDJfHHe98ag5MRfdMzHoIKvc=;
 b=f26KFEA5Rek/1wlv2jrn0LXfIijz2999LrU9v1oAze0VDUzJkDOHgM5Y//1hEu7Y2b
 nuOBFloUrGVrb5s0Zqm9FahQJnUrdWsBshD5/NuPJodCHQ+/mYSXLGV3Pxp3POEGf+m9
 7qijwxoB2ABv2iN6+dUTNTaNC5l4HZomckoDqzYqmpt0R2NvpK89cXOySAbXU71KC2l1
 vgTrcVBzgNNBajQ3Ag8O81fvvOl0sBc8xQjQ5LRSEC4hswR583RmNepVPYxnJPlik1ar
 /H03uRPgxJ56eye2IZLHmw9D0klt+m1wFv0Tv/nyV9Wd6hIrvTKeK3zISysdGJS88SD9
 srRQ==
X-Gm-Message-State: AOAM530s3aqMaULIAOHHz+/7Mfll2hm9xMLMBGgeXIeXhjDqQDR5HZV0
 Lj4Li4xC9ivbs8zXS9TwiqTiwMXfXpTr/aFe2Sx36hFAkHrRevB5yQg+p/0DuoPKdoHTiLnvAQB
 XzzofyMuvZVffS00=
X-Received: by 2002:adf:b353:: with SMTP id k19mr9038382wrd.325.1633272243195; 
 Sun, 03 Oct 2021 07:44:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw2Dtw5aQ8VaaHAoSvnnOa4mN7tsATtzAlKdZFln/2GpOY1YA7lNWCRZ/DAJUtaD57OXZI8Kw==
X-Received: by 2002:adf:b353:: with SMTP id k19mr9038366wrd.325.1633272243010; 
 Sun, 03 Oct 2021 07:44:03 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id r2sm12265413wmq.28.2021.10.03.07.44.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Oct 2021 07:44:02 -0700 (PDT)
Message-ID: <9888ca60-6ed4-d182-fe33-bf73f89e7bd1@redhat.com>
Date: Sun, 3 Oct 2021 16:44:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PULL 00/30] Misc changes for 2021-10-03
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20211003074250.60869-1-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211003074250.60869-1-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.055,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Nia Alarie <nia@NetBSD.org>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/3/21 09:42, Paolo Bonzini wrote:
> The following changes since commit bb4aa8f59e18412cff0d69f14aee7abba153161a:
> 
>   Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20210930' into staging (2021-09-30 21:16:54 +0100)
> 
> are available in the Git repository at:
> 
>   https://gitlab.com/bonzini/qemu.git tags/for-upstream
> 
> for you to fetch changes up to cb83ba8c1ab856b4327e7e869c410bbfd4152c2c:
> 
>   softmmu/memory_mapping: optimize for RamDiscardManager sections (2021-10-02 08:43:22 +0200)
> 
> ----------------------------------------------------------------

> nia (1):
>       configure: Loosen GCC requirement from 7.5.0 to 7.4.0

The patch is 'Signed-off-by: Nia Alarie <nia@NetBSD.org>' so I suppose
there is a git-config problem somewhere.

I don't want to delay this pull request, but it would be nice to fix
this in a follow-up .mailmap patch, to comply with our guidelines:

  If you wrote the patch, make sure your "From:" and
  "Signed-off-by:" lines use the same spelling."

https://wiki.qemu.org/Contribute/SubmitAPatch#Patch_emails_must_include_a_Signed-off-by:_line


