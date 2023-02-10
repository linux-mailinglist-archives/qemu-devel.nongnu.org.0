Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AAE16921B9
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 16:13:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQV4U-0004rP-M7; Fri, 10 Feb 2023 10:12:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pQV4S-0004r2-RS
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 10:12:16 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pQV4R-0000b5-3M
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 10:12:16 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 l37-20020a05600c1d2500b003dfe46a9801so4332266wms.0
 for <qemu-devel@nongnu.org>; Fri, 10 Feb 2023 07:12:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/5xKzpdfFdMzt5UFIip1Hxf07GmyY1XivypXJzcxFLM=;
 b=dcoeFKt8+Zcbjk7p9Y+DsGEhJ8Vt6KTQzqGFZWPKWUpRpHlVYHWPCOygJBEaMl1sj6
 OZOCFj4L8n3l7nI1RkGpge5ntvLHF33KiaH4DUzeTfy/m4yBPz4eMTZBFb9W6zOTQxwh
 LwkmRfTUiQJCJ1jVeoMPEW2330nH3QuHjaWtw21Q21pIOgT+/mraenaE0lOuV+8s7J2V
 7GJu3TI902i6ONvtPb3Y5OvSBFkwjiak4AfvGTNDqBYPain3LyukfDPmZCNKSAhqJVIp
 9lyjTq8vo1Hs54ElUi6Vdt7ICWZrV5fn09Wbd0IPsonhTI0V3Mq6d7tXKfG8yxsFi0Ky
 P4bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/5xKzpdfFdMzt5UFIip1Hxf07GmyY1XivypXJzcxFLM=;
 b=c/rjnFpf2D4hirCmeOozg3MXnZkpwptV5DhKeWsYNwoVHYq7USobC47Mj4iSJN5IKW
 zyNU+fY/57PHfNqhSvNOp1IKZajnSuVar9lCyRtWSAGAqxRgwlYmug8pCFKx9AfRhnwi
 He/aP1Xb27JWXYl3PxfuKSfiHsw32AdCKwO8vndxnsH+xxBwwhfYLYe4Bp4r9EX5FF+p
 PAzW+R2oZ+o0fBQDvfht9Tzbe1xtHVzCGH8kgoriS1E01a8oEtEF01NvC+m0GfZ2osTd
 PUmF9Cpt7CcJrWTgX0BaAScsK2cepmfuNDJp6g6VdaJon12ASQ7UfX0eOz6A1kjKkFQj
 rxZA==
X-Gm-Message-State: AO0yUKWK1i/m1s0k0zsAb9iOeHvNZEBY3p9C2xBhzWFAMPQJmaaM2m38
 dqQe9AwVEhkSw1tmi/9FCsE=
X-Google-Smtp-Source: AK7set+OffuAkGWuggoW0+PPViEo7CH6f/fjVxM5LhXlaGpjYqRH9R8cX3v3L0nV+GThLaAQ9luh0A==
X-Received: by 2002:a05:600c:1f12:b0:3e1:541:2b56 with SMTP id
 bd18-20020a05600c1f1200b003e105412b56mr8837708wmb.30.1676041933362; 
 Fri, 10 Feb 2023 07:12:13 -0800 (PST)
Received: from [192.168.15.58] (54-240-197-232.amazon.com. [54.240.197.232])
 by smtp.gmail.com with ESMTPSA id
 h4-20020a1ccc04000000b003dc4a47605fsm8737781wmb.8.2023.02.10.07.12.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Feb 2023 07:12:13 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <6b51db04-97bf-2e59-8aad-e4d0beb0b040@xen.org>
Date: Fri, 10 Feb 2023 15:12:11 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v10 39/59] i386/xen: add monitor commands to test event
 injection
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
 <20230201143148.1744093-40-dwmw2@infradead.org>
 <be2420d5-b267-9e9b-d3e6-cdfa30d57640@xen.org>
 <77aacace96f80eaa4e16ea9a60417b64b4c1e7ef.camel@infradead.org>
Organization: Xen Project
In-Reply-To: <77aacace96f80eaa4e16ea9a60417b64b4c1e7ef.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=xadimgnik@gmail.com; helo=mail-wm1-x331.google.com
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

On 10/02/2023 15:05, David Woodhouse wrote:
> On Fri, 2023-02-10 at 14:54 +0000, Paul Durrant wrote:
>>
>> Given that this patch only provides a command to inject an event on a
>> specific port, I think it's be useful to have the target field report
>> the type of a VIRQ. PV drivers often hook VIRQ_DEBUG for dumping debug
>> info, so knowing which of the VIRQ ports
> 
> It's there in type_val, Wary of overengineering I hadn't actually
> translated it to strings but frankly if you don't know VIRQ_DEBUG is 1
> you don't deserve to play...
> 

Ah, it's already in there... good. And indeed a number is all that's 
needed. In which case...

Reviewed-by: Paul Durrant <paul@xen.org>


