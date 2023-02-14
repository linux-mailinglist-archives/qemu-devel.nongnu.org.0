Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32CA269682C
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 16:36:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRxL7-0003mz-Sd; Tue, 14 Feb 2023 10:35:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pRxL4-0003Zd-S3
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 10:35:26 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pRxL2-00065N-Qk
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 10:35:26 -0500
Received: by mail-wr1-x429.google.com with SMTP id a2so16085218wrd.6
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 07:35:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8HrFs4E258MGtaS4we3mj1ofzHFL8cHjJv264PZ8Yb4=;
 b=gnHtrvAeNuzzjo11oSOw4Dn6y2kpQKh6fKSID5YfrWjbEQ5YMmjaiwPAeSBpIngqtb
 5DnyAjwdv1DLbYvIjZZChPsxMlRoYrQHbdbvQnIG6Eow9wTdLzJGKhjZQYn3POPiSCJn
 hFgzWLLVJ3COkDa1SzbGn4y2rdU7n+TBB+698b70dg0IVM+N3KaND1HCom/KaLCc9hQx
 h2UhlYTgNmVAuTz2+Y6R09sRSGzUi7wkZLkFm/hsAeIDDqpxa9dYwJaPUQDvvb14BKBv
 cd/h85lavJU736pmHPqAX8IIOgsmu9wdf6k/OcKIUg4qwlO53uP4GPnSCy0HVCv7ESSE
 3/DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8HrFs4E258MGtaS4we3mj1ofzHFL8cHjJv264PZ8Yb4=;
 b=Gv1G1SYXwZQ2R09DFt8N4I3fD58sIFCJUM3BbtjytdDZEfcK8w4lhXCKbmGj2Q9Qcx
 SFWSKlZi/JG+yd4XQt6vycoz3xy2ykHA829P2pz6lT5347/Rha83NoTSSxFjtJZLyFDf
 k4vcayzmdLKPFGEmJV7MMzApDJlB+aOAaY5t2V4trs0/iLSrPuozgAA+G07Uff/dz1f9
 wxdyyOthHZwa242AsgxJ2OlgS5sR5N8UIsqWGxiVOcMRvLrDp7XNycKx3xrhEK+mcUWD
 zh4rfmJGex66Ta8xAxHqcmOzySRXrQPEaTYDAAOUSzSPvxmMUKRBPeIIe7WaVZdUOA5Z
 i8hg==
X-Gm-Message-State: AO0yUKUE4jTfGfs5XLz085bIQ7naPQxWCsrdMX8YoOO8vbiZE4q0dRnX
 ff/hqSNm3Zx8Mc2K4mVAKjw=
X-Google-Smtp-Source: AK7set/8jfjqbViA0CubmEVVfdZACYjCfNIjfyQelkDUdHME9DPGUGT+COy0rQYCw20YjtJJzcmjRA==
X-Received: by 2002:adf:e885:0:b0:2c3:dc42:525d with SMTP id
 d5-20020adfe885000000b002c3dc42525dmr2617352wrm.36.1676388920907; 
 Tue, 14 Feb 2023 07:35:20 -0800 (PST)
Received: from [10.95.154.108] (54-240-197-224.amazon.com. [54.240.197.224])
 by smtp.gmail.com with ESMTPSA id
 d1-20020adff841000000b002c5640f9bf9sm2019308wrq.85.2023.02.14.07.35.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Feb 2023 07:35:20 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <3c6b57d8-cb41-f60f-e07d-1574fcdc8f07@xen.org>
Date: Tue, 14 Feb 2023 15:35:18 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v10 48/59] i386/xen: Reserve Xen special pages for
 console, xenstore rings
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Julien Grall <julien@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, armbru@redhat.com
References: <20230201143148.1744093-1-dwmw2@infradead.org>
 <20230201143148.1744093-49-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20230201143148.1744093-49-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=xadimgnik@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.35, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 01/02/2023 14:31, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> Xen has eight frames at 0xfeff8000 for this; we only really need two for
> now and KVM puts the identity map at 0xfeffc000, so limit ourselves to
> four.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   include/sysemu/kvm_xen.h  |  8 ++++++++
>   target/i386/kvm/xen-emu.c | 10 ++++++++++
>   2 files changed, 18 insertions(+)
> 

Reviewed-by: Paul Durrant <paul@xen.org>


