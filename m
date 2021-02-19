Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9F431FFC4
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 21:23:40 +0100 (CET)
Received: from localhost ([::1]:54574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDCJP-0001t8-0k
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 15:23:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lDCHr-0000yD-Eh
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 15:22:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60245)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lDCHo-0003P8-Hk
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 15:22:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613766117;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bMl73LRnT5/N3R2q4BuQ+ML4vc9Ne1apJkys80v7ATk=;
 b=SwHQx71+ZZUOywG/Zowe3urc501R0GzWR5ZKG9CVBGrsmz961FySqOVwbIl1IMP66Kugei
 ohckB0eB5S+U8h7IRLedwBJsrv8dM0fNInsh1KF3QF9cV7F5UyjK8/SnsvhwoYsoGJRb6e
 FT6pWDLcea4lRXGg6L5clcBpYCv+Xv0=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-504-9vR6WQRmNkyPXbGXwQJCOg-1; Fri, 19 Feb 2021 15:21:53 -0500
X-MC-Unique: 9vR6WQRmNkyPXbGXwQJCOg-1
Received: by mail-oi1-f197.google.com with SMTP id l4so2773042oif.16
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 12:21:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bMl73LRnT5/N3R2q4BuQ+ML4vc9Ne1apJkys80v7ATk=;
 b=RJNM3VrtIzUHOCPsftKqclFc0ZwHs43VRr++pQmktnBRi1I/uw/f7Q85D83gXVDWiH
 dWCo/xDfHiCi2JCx7uTXVQ3NwOkQvRI+9+cycxdJneKFaKgG2DlEuREOvVCRz9RxbsVm
 uW2CLSqrW4OZ0OW0GTIO9dtJMQpLig44EwQ4YHFWo5yMqED8winOSoz5SvnyCGduYFD0
 QhyfbdsPkHCEkL+gL52elU8H9fTdrKcxw0KzfXkzPgrUsOosVTXRIdO+JK2zUUKSo50y
 /HFW+PT1kmjvOyEKwgha9MnlI3A3OUGzkKyRKn5Kfo1zjzTwiMIhqjovnsHMkheidotF
 Bj7w==
X-Gm-Message-State: AOAM531YkM6JiOUKpHfgYrHKS5FghlougTzMIi8mKa6+o9/BrwA6Pvn1
 oTYcRjA9eSb/+Lb9JGzdjV9ZES6ceQSREv1x5ZnRAE22pn0vn0PlxrOqoQMEYIxORlaHaSRmT3v
 xV0dvbJ63W21HP9E=
X-Received: by 2002:aca:4ad1:: with SMTP id x200mr2805384oia.129.1613766112896; 
 Fri, 19 Feb 2021 12:21:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxFStKG5CkfUiSxfC10dCC2xSnZKoRra1UAp37wu/hnt3oEFIwfIoL7a6m9hdH166PgI6Ogwg==
X-Received: by 2002:aca:4ad1:: with SMTP id x200mr2805374oia.129.1613766112776; 
 Fri, 19 Feb 2021 12:21:52 -0800 (PST)
Received: from [192.168.0.112] (ip68-103-222-6.ks.ok.cox.net. [68.103.222.6])
 by smtp.gmail.com with ESMTPSA id
 k68sm994599otk.28.2021.02.19.12.21.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Feb 2021 12:21:52 -0800 (PST)
Subject: Re: [PATCH] target/i386/sev: Ensure sev_fw_errlist is sync with
 update-linux-headers
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210219180131.2061072-1-philmd@redhat.com>
From: Connor Kuehl <ckuehl@redhat.com>
Message-ID: <a1c4625f-3929-26a9-040e-cc06d8eda939@redhat.com>
Date: Fri, 19 Feb 2021 14:21:51 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210219180131.2061072-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ckuehl@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ckuehl@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Brijesh Singh <brijesh.singh@amd.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/19/21 12:01 PM, Philippe Mathieu-Daudé wrote:
> Ensure sev_fw_errlist[] is updated after running
> the update-linux-headers.sh script.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> Based-on: <20210218151633.215374-1-ckuehl@redhat.com>
> ---
>   target/i386/sev.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)

Reviewed-by: Connor Kuehl <ckuehl@redhat.com>

Thanks!

Connor


