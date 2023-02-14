Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5FCD6968C2
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 17:06:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRxol-0006Xy-1b; Tue, 14 Feb 2023 11:06:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pRxoj-0006X4-DR
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 11:06:05 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pRxoh-0001q9-W3
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 11:06:05 -0500
Received: by mail-wm1-x334.google.com with SMTP id z13so11314059wmp.2
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 08:06:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lPcgp1jhls+rHBo2jkrm+5Dmx/PDy0TxJ3P4XSn7cOQ=;
 b=k5ewkZuLyh8tqgaZfF66pfXJ8hSffknMtqDXeU6f+ThfSMKjVfB3YNsqxeKW56JjT/
 cuQlrOqBFwgpIX+B3KqTFi/48XN7QZcui4WeYQdNa9rDXdJaJ/GAWSS9rnlkxMlAq3lk
 r8jxulLIzONGl732XXNLtDeBWvrMji4b8AczPM03imCxr4qkqJCaKMlNG0iN/9muWC7k
 14Nu5u3aZHn5OrDo1ZFx8YQOFFywYxzHojNPbkyLcRYHPI2S9kqVw3+/BclrKD/fQHrA
 i7NIf8sPuKjw/tMtyttnwKE+ZcnKcgjK2FIBlR6BqdMRhA5z17ac8sbpKASZhTlQf4cc
 szuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lPcgp1jhls+rHBo2jkrm+5Dmx/PDy0TxJ3P4XSn7cOQ=;
 b=DHIJRrT8ygZVohYfUnnQbZ4M9y4a274rWodXSz+OeLzzBGymFazKQa60Arvq1uOh88
 FF5NCX53FyzPInT+bQBmY7TecfTGKDs1IYa3mrxhTl89Xk4LeCHJCk2vdp3PQcTS+PG5
 SFRxLDrpXD0+vcCIj+373dQn8tOKn9T6SKFigjoxs5Jq/G9R4Q2g4K7rWgvKkSUk2oNj
 PNfb7SKH4GOAipnGrWb9TG9bSYCWfuCzPxG50/jKeXCHX7tUB8rXY6a8cENWXDdg/kBp
 W9wQdCiHke6JayaGAtTKvXRgQ/wI9kdTV2NmWQ9Cp+sGFkSNWxxlWLBoeBzpxKwE++C1
 Fmdg==
X-Gm-Message-State: AO0yUKXxe+/p1dPLq94S/umFka1ssSUdOidGKOr2UKQl5CmLdpKov0qF
 zIia4Q/iNS81vU7unsNk0BjlyyEAyGkkBA==
X-Google-Smtp-Source: AK7set/v8D0eh26dUP3cKTUxcUtlg/QhTKAem2UMUxg98PEjV+7BritLQ6P2rUFyw4jnM0CFhCPsxQ==
X-Received: by 2002:a05:600c:2050:b0:3df:e46f:c226 with SMTP id
 p16-20020a05600c205000b003dfe46fc226mr2668219wmg.16.1676390762312; 
 Tue, 14 Feb 2023 08:06:02 -0800 (PST)
Received: from [10.95.154.108] (54-240-197-224.amazon.com. [54.240.197.224])
 by smtp.gmail.com with ESMTPSA id
 f24-20020a05600c491800b003dc0cb5e3f1sm16447582wmp.46.2023.02.14.08.06.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Feb 2023 08:06:02 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <4a2788c3-69ee-7775-42be-7a2d14842222@xen.org>
Date: Tue, 14 Feb 2023 16:06:00 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v10 54/59] i386/xen: Implement HYPERVISOR_physdev_op
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
 <20230201143148.1744093-55-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20230201143148.1744093-55-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=xadimgnik@gmail.com; helo=mail-wm1-x334.google.com
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
> Just hook up the basic hypercalls to stubs in xen_evtchn.c for now.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/i386/kvm/xen_evtchn.c     |  25 ++++++++
>   hw/i386/kvm/xen_evtchn.h     |  11 ++++
>   target/i386/kvm/xen-compat.h |  19 ++++++
>   target/i386/kvm/xen-emu.c    | 118 +++++++++++++++++++++++++++++++++++
>   4 files changed, 173 insertions(+)
> 

Reviewed-by: Paul Durrant <paul@xen.org>


