Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE32328D5B
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 20:11:46 +0100 (CET)
Received: from localhost ([::1]:53144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGnxJ-0001RN-0t
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 14:11:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lGnuo-0000Tx-9e
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 14:09:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29132)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lGnui-0008V6-Uh
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 14:09:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614625742;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=al+j0jjTsEA4W4XIjtOHfC2JflouDouB1FSoVpJZd58=;
 b=dO72gIA9XTkm0vciT8HfYk6m1UyvB+ec2e3CfvCbPj9c34VTRPxRuE+Lwir8Dlyv/RLP9l
 JjGRS4qUxa/O+699F/GePi3MWEqkNHRtqd8w14D49fAjhy9qoOKKGn/xPn/la8ZfeVrFTc
 DAm2op+6vUcROC/Lum/nzYXaDY2Ouo4=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-229-gEujV4EZON6RAad6FXVtkg-1; Mon, 01 Mar 2021 14:08:59 -0500
X-MC-Unique: gEujV4EZON6RAad6FXVtkg-1
Received: by mail-ej1-f70.google.com with SMTP id 3so7162423ejx.17
 for <qemu-devel@nongnu.org>; Mon, 01 Mar 2021 11:08:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=al+j0jjTsEA4W4XIjtOHfC2JflouDouB1FSoVpJZd58=;
 b=ajfHBDO24vtKdRicADvsA0l8/dQaGJlRhwy3QtcjvP9ZRLV22H3rvlNb5ZrjzlKOfN
 Bwwz5PT4ZxF2oEWcWbCz087lUUU/U7nrsfnmeHQ8w0R+SAY0hZ1ZaBZyWVK1RMMR1BsF
 HpfHhkIvbDiz9aI4yE/KUswBWaF+EeC2Sop1uoPfHRoRCoISzplk8Hd1QbvZwn07y92R
 14nSxBoHFWZmPLbXLHKbL+Ca7m70+qOcWW+X2URH5a998NFMyX/dkZsN13afLRJ7Y1qg
 b2hCL4djFHNS+MkEbVO4Rg6SY+seemMzFvrfvMaNeEz+vp50QxTyfKaAXQYPU6lwvSGi
 0prQ==
X-Gm-Message-State: AOAM532IrKptv1ZZSRjTfiTrH1HRHOTW2HvQ81v3NibnIgXJgZJoDgPE
 nJ0jllBe7T59mEvuZ+teKImC1tKQRYx6rl4IXUduWOfS923obw05UHaCM2xHpX5qZcHjT6aRZ23
 FV4bRcClOZ0VVV+U=
X-Received: by 2002:a17:906:f0c3:: with SMTP id
 dk3mr17105711ejb.540.1614625738238; 
 Mon, 01 Mar 2021 11:08:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzjHKG88UbZEVnd53YuIuNtB77xqxTN0xQKFDVTIlWJOB6H1o0TxVJ+h3cWtcCLR0KnGbyXRg==
X-Received: by 2002:a17:906:f0c3:: with SMTP id
 dk3mr17105698ejb.540.1614625738092; 
 Mon, 01 Mar 2021 11:08:58 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id q12sm7818194ejd.51.2021.03.01.11.08.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Mar 2021 11:08:57 -0800 (PST)
Subject: Re: [PATCH] pcnet: switch to use qemu_receive_packet() for loopback
To: Alexander Bulekov <alxndr@bu.edu>, qemu-devel@nongnu.org
References: <20210301073947.39451-1-jasowang@redhat.com>
 <20210301153334.81021-1-alxndr@bu.edu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <4e6e3077-2604-8763-4c41-392cd65f9f92@redhat.com>
Date: Mon, 1 Mar 2021 20:08:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210301153334.81021-1-alxndr@bu.edu>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-security@nongnu.org,
 ppandit@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/1/21 4:33 PM, Alexander Bulekov wrote:
> This patch switches to use qemu_receive_packet() which can detect
> reentrancy and return early.
> 
> Buglink: https://bugs.launchpad.net/qemu/+bug/1917085
> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> ---
> 
> Here's another one, that looks like the same issue.
> -Alex
> 
>  hw/net/pcnet.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


