Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0709247FAC0
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Dec 2021 08:33:53 +0100 (CET)
Received: from localhost ([::1]:56844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n1kVz-0004Ah-FD
	for lists+qemu-devel@lfdr.de; Mon, 27 Dec 2021 02:33:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ykonotopov@gmail.com>)
 id 1n1kRd-0003Jj-9R
 for qemu-devel@nongnu.org; Mon, 27 Dec 2021 02:29:21 -0500
Received: from mail-lf1-f44.google.com ([209.85.167.44]:33717)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ykonotopov@gmail.com>)
 id 1n1kRb-0008JX-QV
 for qemu-devel@nongnu.org; Mon, 27 Dec 2021 02:29:21 -0500
Received: by mail-lf1-f44.google.com with SMTP id k21so33145159lfu.0
 for <qemu-devel@nongnu.org>; Sun, 26 Dec 2021 23:29:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=KoOpc6Gl8t6Kg+GxCdRP2VmgrzTJACiinYPjhcQeOcw=;
 b=Y3VnrrhSmn5l/8KJMf5odG2R981V9j+Q6DymohN5exhRtf+wj0nQyUrOpKMIQmfV43
 lNp5QLKS+uxDce6ExyKvVrHGy3flnJhMTFb7yrSow3yBaKAbDrWnrY7suDh9B4WGPvKL
 h/oFzBI67O3tAFpsY0mamYoXtpRx/BBfOWScKtelV0g2MQj9zk1ZHeQh0a36KQtr88JP
 +frSlDUMNd6UVgnVYeTOrSyLW7mKx6/dJupLwbYvZ9La4UfvsYwXD1ok87DWMpcoNysK
 K7g1H9b/03ktKEq68YU+tBARKWLulglJWyfHJJKLjLMoH4a2enFRzlDLIlw2WCGgQZGr
 iHqg==
X-Gm-Message-State: AOAM533fE4DTUS7C2LPujgdSqBNSHuIVR48LXImcaNFb9TZ+gtMeWSEv
 vwEjfQjbZslfR5ycX4ljtmY=
X-Google-Smtp-Source: ABdhPJxOnFG29LcR3VXM+6gntJhQtzs2LNRtpWDAW/FT0YTX4Pa7AzD55iZvjxQbkJQpEQy4TXloNg==
X-Received: by 2002:ac2:4f03:: with SMTP id k3mr14780556lfr.314.1640590157776; 
 Sun, 26 Dec 2021 23:29:17 -0800 (PST)
Received: from [192.168.178.33] (95-24-165-59.broadband.corbina.ru.
 [95.24.165.59])
 by smtp.gmail.com with ESMTPSA id o6sm1052343lfk.232.2021.12.26.23.29.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Dec 2021 23:29:17 -0800 (PST)
Message-ID: <a167f9ed-75a7-e719-bc68-d22b13e85db8@gnome.org>
Date: Mon, 27 Dec 2021 11:29:15 +0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] tpm: fixed be_buffer_size size in in tpm_crb
Content-Language: ru-RU
To: Stefan Berger <stefanb@linux.ibm.com>, qemu-devel@nongnu.org
References: <20211225123806.113368-1-ykonotopov@gnome.org>
 <c212e049-0f1a-dc81-e785-2ae02097187d@linux.ibm.com>
From: Yuri Konotopov <ykonotopov@gnome.org>
In-Reply-To: <c212e049-0f1a-dc81-e785-2ae02097187d@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.167.44; envelope-from=ykonotopov@gmail.com;
 helo=mail-lf1-f44.google.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.248, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.363,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

27.12.2021 06:24, Stefan Berger пишет:
> I suppose the host has a TIS interface.

Hello, Stefan.


I do not think so. There is only tpm_crb tpm kernel module compiled in 
my system

# systemd-cryptenroll --tpm2-device=list
PATH        DEVICE      DRIVER
/dev/tpmrm0 MSFT0101:00 tpm_crb


>
> The reason it gives this message is that the response this TPM may 
> send back could be 4096 bytes in size but the CRB of the VM can only 
> catch 3968 bytes, so there's a mismatch. You may not be able to use 
> the CRB in passthrough mode. I would try to have the VM use the TIS.

-- 
Best regards, Yuri Konotopov


