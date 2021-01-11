Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 897EF2F1D6B
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 19:04:58 +0100 (CET)
Received: from localhost ([::1]:38464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kz1Yn-0002Jm-3J
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 13:04:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kz1Wd-0001Qq-40
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 13:02:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43625)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kz1WZ-0007LK-Qk
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 13:02:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610388158;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y4PMywaYmb66e1kMY5et+9AwODDmf6DLVn78wpOd84Y=;
 b=Qz+/AECxnsUllUC1W40xClhiAXxPJa6zrzqLcoiWImrxNn8fg+q2hzbkQTiWkU8Ja3TvFL
 bBe6thF1dthtXtSNbirqtmaPWQl5hNzJGyEuBgaRdocO4tyLu09z0fZ3UEp08WcASDSdcR
 pCsDQgVn4rUFovehWU2ao3d/ttdh0Wo=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-453-7VNoZzL1NGagiZwvUvyoxA-1; Mon, 11 Jan 2021 13:02:35 -0500
X-MC-Unique: 7VNoZzL1NGagiZwvUvyoxA-1
Received: by mail-ed1-f72.google.com with SMTP id e12so38244eds.19
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 10:02:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=y4PMywaYmb66e1kMY5et+9AwODDmf6DLVn78wpOd84Y=;
 b=huo/SxZeq6AfaHIVUlDMcR6pW85lp+5i0MvGmKxCo3m1Kvk3dziof76aMixedLIhJF
 WeH4rxtN6dSwPhaQaGIi7K9lE6bQm7Ux6Epe+EsumXEKcArj0IC8ZcTo5a0dwpgaJ1bu
 iIwDAnFW2BaEPTYO15+jJ37iK0GmBx3ZDLIfNRobHgVTKZ8I5ikimj6rgFjfHTGRZQQ9
 +qiu1lpK654YOEu2mIBl6CqvntnYJTs0oFx+WujAQz3g2L+G21Pkq2Cc3c1321D4XbTz
 /dtjUxaqzMaTwHgcTEH/aWStrzU9sefYWAwBwfBeyxnf5SutkpIIeTfC4QUK8tpbycZf
 NVZQ==
X-Gm-Message-State: AOAM533i80Zdi/j675OdgmyBvf0kpmO1OhnTfcSkMKtRthsNUadbQ4A0
 40DUK4OwR/5FQ2HHg8/2e/ddFOhQur0SFcKNuqyozfs1gFzpjjbU09kS1ZPNsLY9vhQxXExe6w/
 v7nPX/zn8ccbRwfV7UxZQhbclMzRVaWOqJOcTmCMEzQ8c7EcF7599Tqmw7LmTvPdi
X-Received: by 2002:a17:907:214d:: with SMTP id
 rk13mr441641ejb.501.1610388153513; 
 Mon, 11 Jan 2021 10:02:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwlfShj0j7+iKW1MyI2tgUSmys3LaSaSjjcU7Yl1jfJGxDZ3WRy2ufY4AR6kTXuVU0HaDV/3w==
X-Received: by 2002:a17:907:214d:: with SMTP id
 rk13mr441620ejb.501.1610388153302; 
 Mon, 11 Jan 2021 10:02:33 -0800 (PST)
Received: from [192.168.1.36] (129.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.129])
 by smtp.gmail.com with ESMTPSA id v16sm261157eds.64.2021.01.11.10.02.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jan 2021 10:02:32 -0800 (PST)
Subject: Re: [PATCH v2 2/2] s390x: Use strpadcpy for copying vm name
To: Miroslav Rezanina <mrezanin@redhat.com>, qemu-devel@nongnu.org
References: <cover.1610384501.git.mrezanin@redhat.com>
 <7334beb15bb36de2f9472264bea284f91abf686f.1610384501.git.mrezanin@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <1df4110d-f34f-7e3f-2363-b5882a5829bd@redhat.com>
Date: Mon, 11 Jan 2021 19:02:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <7334beb15bb36de2f9472264bea284f91abf686f.1610384501.git.mrezanin@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/11/21 6:09 PM, Miroslav Rezanina wrote:
> When using strncpy with lenght equal to size of target array,

Typo "length".

> GCC 11 produce following warning:
> 
>    warning: '__builtin_strncpy' specified bound 256 equals destination size [-Wstringop-truncation]
> 
> To prevent this warning, use strpadcpy function that will enusure that
> provide functionality similar to strncpy but allow copy strings with
> length equal size of target array (and discarding endint zero) and
> ensure array is zeroed after copied string.

Hard to understand... Look like incorrect copy/paste in the middle?

> Signed-off-by: Miroslav Rezanina <mrezanin@redhat.com>
> ---
>  target/s390x/kvm.c         | 12 +++++-------
>  target/s390x/misc_helper.c |  7 +++++--
>  2 files changed, 10 insertions(+), 9 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


