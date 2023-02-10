Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD01969205E
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 14:59:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQTvM-0001Kj-H5; Fri, 10 Feb 2023 08:58:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pQTvL-0001Ka-JO
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 08:58:47 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pQTvK-00033f-55
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 08:58:47 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 hn2-20020a05600ca38200b003dc5cb96d46so6333391wmb.4
 for <qemu-devel@nongnu.org>; Fri, 10 Feb 2023 05:58:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EZKfq+SNmOui1QneP2+6DoU7HzN7p5dEKL9uMWLkiTY=;
 b=cWrPJy6kCOqEAp3DQrYPXMxwoVomS4Lu+Y+ZqHVw/l0vifbX4nRdpeNRUhkOZB2swA
 OLx9k5Iog8/bxqwPrf4PULG1G4lwmeyVi3+bFVBUXMlO4QLK7Jb4EQc9Nyo7Jv5RCWxo
 tlLDNqjoXlrQDDBGZdSNneF1kzmFZgmrSMvj+PRevZZbPv+hjrzW+sUPKqLeJ8oKCWF4
 8veJIx/0dgb6PBUURZdSrGCC3EnKSbYkGPCqy2vlrICMPjf6w05XCaB5MPsSQLSxUtBR
 D1dxOFJE+PfgEtkbfi6hdbDcYwqH1Wu9U5eEbQaph+p0CjHYFVj4ObYQCZJAOW0VocpW
 sIXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EZKfq+SNmOui1QneP2+6DoU7HzN7p5dEKL9uMWLkiTY=;
 b=AwIXKOJBBMwXUlAACx9ZcQ2J+uvINtx48f8QKP+PFKeQ4DSQkZF0T7sQ0zSl/Ovo8T
 VwvNw2yH7Uw8ZycOpq3Kxy0KzQrCxhVqRAxlE9cHHm9ClGjXce05uBVwkcIPBdOSE1QR
 mK6tYCIFzgQpEJ5+Lh/RpcmZfuU3xcItuCDPOXN82Jy7fOBm26Q2y5WvrvdJgKC2xCGB
 RMMPYja0L0t0BmD7wJRCJVUBd4wPYDOZ3AE20ZgTM5z0u/bo92whwwj3qkPS1AjoCPqD
 /CXv91ylCQE4d51HnX+wGVPeXaUzJRwafxUNxIZ5H12H92YA/kieYAUnTpll7EA91Huf
 YxDA==
X-Gm-Message-State: AO0yUKVKhKQIyrKmkvP+L3UlfnPDabhot26JTyc/SGb8LzyxBJ9xwJvq
 MHOKhm5onL1ubFR5kWioJCk=
X-Google-Smtp-Source: AK7set9AfncYvWj4PoCNRO9abT6wBkP7JdbxOZKh6aL3L5nz0JmSszK9l6mE7pGL112OOQPygEYx7A==
X-Received: by 2002:a05:600c:9a2:b0:3dc:576c:ab07 with SMTP id
 w34-20020a05600c09a200b003dc576cab07mr12825926wmp.14.1676037524621; 
 Fri, 10 Feb 2023 05:58:44 -0800 (PST)
Received: from [192.168.15.58] (54-240-197-232.amazon.com. [54.240.197.232])
 by smtp.gmail.com with ESMTPSA id
 bi5-20020a05600c3d8500b003db012d49b7sm12636076wmb.2.2023.02.10.05.58.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Feb 2023 05:58:44 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <69aee905-6934-19b0-bdcc-14bc1b48e324@xen.org>
Date: Fri, 10 Feb 2023 13:58:42 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v10 34/59] hw/xen: Implement EVTCHNOP_send
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
 <20230201143148.1744093-35-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20230201143148.1744093-35-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=xadimgnik@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-1.149, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/i386/kvm/xen_evtchn.c  | 180 ++++++++++++++++++++++++++++++++++++++
>   hw/i386/kvm/xen_evtchn.h  |   2 +
>   target/i386/kvm/xen-emu.c |  12 +++
>   3 files changed, 194 insertions(+)
> 

Reviewed-by: Paul Durrant <paul@xen.org>


