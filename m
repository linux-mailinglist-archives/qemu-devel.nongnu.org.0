Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D453169690D
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 17:16:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRxyc-0007NZ-LD; Tue, 14 Feb 2023 11:16:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pRxyP-0007M5-Cu
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 11:16:06 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pRxyN-00064d-SC
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 11:16:05 -0500
Received: by mail-wr1-x433.google.com with SMTP id co8so12475575wrb.1
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 08:16:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GTTVEoLws2368wZq8Y01H4w+ekLwKFC4yqXFnnmKrjE=;
 b=W3BoklxXyArWc3v1hGOGlcFjEHmHLr8CpFvyyVANHr97HkPnzO/zI81S0j1TT7WVcT
 FuYbi1M4YNT/IYo0CBrwrfhELFhwzwkrTdEgfzD+ihpOr3YctppiNGuyHVD2rP6+/XPg
 2rF0PRFHEXF7K1eq9EAzwnC9CArqNc5IbDfRHkgFoVttKVjQvMkNL6C0vPGFNd1RE+ua
 60Gww9ZSADdOBu0PosdY7/G0AxDbrOLjhibCrw4hFQzD+0InlvoEh6Mjhak12IBnDvUd
 OSe1rwxVtgbs/W6hZ7Pj65TF0c0TerCIFFZ6LK/YAsM/dd5oW3l3vgyn+xOsskR96bEo
 65Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GTTVEoLws2368wZq8Y01H4w+ekLwKFC4yqXFnnmKrjE=;
 b=yOUfiouBc8JFvJrk1dVZF2DWvfJIXvVGhveP1hQArprmZr95eVTliksH9m8YmXZWgZ
 rGOuNZs3RR84gpoxjIiG8FFFyu/NkFlNf+8JDOz8Oe9QGLiObQnBK+ikFLj6dqlJvwP/
 12zT1paGjOsPvaO83/odBLjr/Wbt9OBkbFe4ie4YTNALIv8x2UNK8L91jgpMAtdlPJdc
 r9dj562Y6JX7eekk7q4pcM9f07XkKRqiPLvc5FfrQp8IXhdASt5Y10LmxY39myUrVOhS
 2u0abZjws1aGYQ0ch8nS5rU6jQsDbOBvHA3iWBpWKGA4FWw02JGd2ELI4XPoCqbSCJln
 fwRw==
X-Gm-Message-State: AO0yUKXD6GtYXoMzOe2zw23gEzTgkQX5OAraDCs4u3//024/7XFG1jUH
 jLILKOAtAniKTIEtJ5uA1gA=
X-Google-Smtp-Source: AK7set8Gsp1ZwhzNhUsRzWPu4sjo4dtw/8uN+Q9pZDzbOcKz2EiyT7EPnuG1Fmah1zBXPG/hoEN+Gg==
X-Received: by 2002:a5d:554f:0:b0:2c3:ee67:391f with SMTP id
 g15-20020a5d554f000000b002c3ee67391fmr2471673wrw.56.1676391362142; 
 Tue, 14 Feb 2023 08:16:02 -0800 (PST)
Received: from [10.95.154.108] (54-240-197-224.amazon.com. [54.240.197.224])
 by smtp.gmail.com with ESMTPSA id
 c13-20020adfed8d000000b002c56249281csm2388296wro.88.2023.02.14.08.16.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Feb 2023 08:16:01 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <082d3a8f-ec9a-a9ff-6c32-9a71309d250c@xen.org>
Date: Tue, 14 Feb 2023 16:16:00 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v10 58/59] kvm/i386: Add xen-evtchn-max-pirq property
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
 <20230201143148.1744093-59-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20230201143148.1744093-59-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=xadimgnik@gmail.com; helo=mail-wr1-x433.google.com
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
> The default number of PIRQs is set to 256 to avoid issues with 32-bit MSI
> devices. Allow it to be increased if the user desires.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   accel/kvm/kvm-all.c       |  1 +
>   hw/i386/kvm/xen_evtchn.c  | 21 +++++++++++----------
>   include/sysemu/kvm_int.h  |  1 +
>   include/sysemu/kvm_xen.h  |  1 +
>   target/i386/kvm/kvm.c     | 34 ++++++++++++++++++++++++++++++++++
>   target/i386/kvm/xen-emu.c |  6 ++++++
>   6 files changed, 54 insertions(+), 10 deletions(-)
> 

Reviewed-by: Paul Durrant <paul@xen.org>


