Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 473F5402787
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 13:03:21 +0200 (CEST)
Received: from localhost ([::1]:57730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNYsq-0002f0-Ac
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 07:03:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mNYoa-0008R2-Bu
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 06:58:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53309)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mNYoX-0000Wy-Mp
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 06:58:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631012331;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sAuF38Hyw23QNUl3knj3r28IxIC0VGP75bmbn6SJFRI=;
 b=MAJ6ibmMEbb28nqcb4cG7JDmubdXU4/j+wfgNwWjE+nLazeP+JJAF+gaVwyKto3z4HXYhK
 R/brvv3SG9oYeILtJzpzkQKecSu19oIlpy9vO2o5z5pesFgvqfa3ujHnGPDcHPlyucpjpZ
 eMmHNiyVh1C/qWJbrmUY8pmE/Lr7wek=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-295-39ci5WMCPz6BblV5R5LqOg-1; Tue, 07 Sep 2021 06:58:48 -0400
X-MC-Unique: 39ci5WMCPz6BblV5R5LqOg-1
Received: by mail-wm1-f70.google.com with SMTP id
 r125-20020a1c2b830000b0290197a4be97b7so960861wmr.9
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 03:58:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sAuF38Hyw23QNUl3knj3r28IxIC0VGP75bmbn6SJFRI=;
 b=BaUQoQmsR4xu4CEhXrttMB04JOBwkSucsVePH2MSxdoLyX7SF4w1gbBw5XDPfBXR56
 oJuYt+8HhnyTu27PxkmeM1s7HIzb6CVo0g+kv2FK5pI3kmeDMzmtHSvo0kvlL5K81ymG
 GsKpXHrXTBBJjXWzT37sCCMpu4dVyheQdaJtxA07Qb6nuGgE8IN8u7VjsuOV9UBalsXO
 gWw1Uyl7LN7tGVK8NIiMFQiXpM1rt+R0sKaI1jQmUrrwkYP29l0NsjOkL1QunyJP7ifJ
 ccFu5FaSqRIDzvXLFRNngHD9nqeJER59Oy40sXNfIUZYgD6TXF1s8/j5eVQVQVaLvKR3
 D2YQ==
X-Gm-Message-State: AOAM533K+V55AYfqDaq0nucai4xIot6kOv0nnddemU7e/hZ/rMmXr8C1
 ryuuekeCQy0cSWCgG8w/5bTH8IazGveEZsbIXq6LX61eckyZMmss6yLPXLNVTPTCciDKZZKd4hD
 VNrhZPQ+L7fpoY6g=
X-Received: by 2002:a1c:218b:: with SMTP id h133mr3369183wmh.18.1631012327559; 
 Tue, 07 Sep 2021 03:58:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxuhrkpEyh0vzlRTX8Y8qWnSdkFvtctWi0/xmknZPr4D/6g+brdk86uMvHSfpGXkQDAzHVMHQ==
X-Received: by 2002:a1c:218b:: with SMTP id h133mr3369167wmh.18.1631012327377; 
 Tue, 07 Sep 2021 03:58:47 -0700 (PDT)
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id l10sm11376015wrg.50.2021.09.07.03.58.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Sep 2021 03:58:47 -0700 (PDT)
Subject: Re: [PATCH] ebpf: only include in system emulators
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210907104512.129103-1-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <995665b7-3a95-dc88-093d-0d93a372c65c@redhat.com>
Date: Tue, 7 Sep 2021 12:58:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210907104512.129103-1-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.332, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: yuri.benditovich@daynix.com, jasowang@redhat.com, andrew@daynix.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/7/21 12:45 PM, Paolo Bonzini wrote:
> eBPF files are being included in system emulators, which is useless and
> also breaks compilation because ebpf/trace-events is only processed
> if a system emulator is included in the build.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/566
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  ebpf/meson.build | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

Thanks.


