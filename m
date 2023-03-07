Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A976AE6B0
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 17:34:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZaG8-0004wi-NP; Tue, 07 Mar 2023 11:33:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pZaG7-0004wX-4R
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 11:33:51 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pZaG5-0001vH-OT
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 11:33:50 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 o11-20020a05600c4fcb00b003eb33ea29a8so7591867wmq.1
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 08:33:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678206828;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ODFEs4lutUTOCTS0JRQfAjh1n5tVkNHNlTQgykdjlWU=;
 b=euFBFA8ao983NrMKIHWhxAbynR1JGS3jYgumyhV2/wexzrjon0cPEgodhRoTsOo0++
 uEsyiBumQRrttc4yK0Qk/9FBnwlH7oHywmHABJ3QkLWjnRFq52NRQoGoF+fyfYXPumL2
 lW7FFl2aVS+JymtkTW1Ifd3+I3ZE6rnOaT4bEl1ti5d0ublxOzzBpdke4qyCMQZRTpjr
 NC9pfR57CVLdiHfGPNVcB0KhicmBfrQsn2LRWLjC3IBhnGM7UH4aaVmSdxqcNcuD+tu9
 ZgMtMiy0cz4brWk55qszXn5Q/QdkRUnyl2wAcJctr04RofF4+GnRyzAk0/ENkiX7/NfE
 QlIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678206828;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ODFEs4lutUTOCTS0JRQfAjh1n5tVkNHNlTQgykdjlWU=;
 b=lhmmhA12ErDZrDD2uyRXitFDeHy0bjKRWkIyz2TZou6KbKVmQv3qLRuokI39ABBtL9
 xkjlBCMY/52HKv3MKbUlmqYuNCw/1oGKlesThQUJGNRd3/q5/iEHCKCw0gZKiyfuvqtO
 G+30GPesRgR3w+6oBCU6a2wN0fR2XpcH1Nhz3P5zLhMjt+UqPPktCLxOod76H+2ORoae
 6BTRtI+wiVvHXNh1zqu84+Gg/04i6OnnTc9NFQ+ZHUjCOxvUtcgYFCrZQRFuLi7sm/mu
 IvTCZoQceMNla54KSg/4e0iZUpw4sr84vVn2kdECO615pg2rpYeyZtbC8EXXapd3BeDU
 bkBQ==
X-Gm-Message-State: AO0yUKV+J7KTIQATSPnK5lL8fBWuOnrNUdvO6GHx3iZK2bXfVgvD7GXa
 JuflhSnYxH4qXE1skDTdR5Q=
X-Google-Smtp-Source: AK7set9Shid+xe129rlKccGUCdhMNEfOKP/gPOmnbV6whCjg2xYZnzh5gGuDGn58tYqNC8a5Gw9Wxw==
X-Received: by 2002:a05:600c:1906:b0:3eb:3c76:c23c with SMTP id
 j6-20020a05600c190600b003eb3c76c23cmr13341051wmq.3.1678206828227; 
 Tue, 07 Mar 2023 08:33:48 -0800 (PST)
Received: from [192.168.25.218] (54-240-197-230.amazon.com. [54.240.197.230])
 by smtp.gmail.com with ESMTPSA id
 l38-20020a05600c1d2600b003dc434b39c7sm3421568wms.0.2023.03.07.08.33.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 08:33:47 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <9e660371-c77d-1db0-56f0-26c5acfaae9d@xen.org>
Date: Tue, 7 Mar 2023 16:33:46 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RFC PATCH v1 27/25] docs: Update Xen-on-KVM documentation for PV
 disk support
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, vikram.garhwal@amd.com,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20230302153435.1170111-1-dwmw2@infradead.org>
 <1de346bcc550da15f43c9efe05cb98ea57260df2.camel@infradead.org>
Organization: Xen Project
In-Reply-To: <1de346bcc550da15f43c9efe05cb98ea57260df2.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=xadimgnik@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Reply-To: paul@xen.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 07/03/2023 16:22, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   docs/system/i386/xen.rst | 30 +++++++++++++++++++++++-------
>   1 file changed, 23 insertions(+), 7 deletions(-)
> 

Reviewed-by: Paul Durrant <paul@xen.org>


