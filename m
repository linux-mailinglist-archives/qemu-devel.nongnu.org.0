Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C275D321C08
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 17:02:50 +0100 (CET)
Received: from localhost ([::1]:40350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEDfd-0002T7-R3
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 11:02:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lEDZz-000649-FZ
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 10:56:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47792)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lEDZw-0004BF-MG
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 10:56:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614009415;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1t3h3w0boJDcubfiHIZv2MhsOgPTZBBsNhVoop9slg4=;
 b=dgU8zXkvaUx0BLVwiYx1qDyXreOrue+JMcNkqly1r6bWS24EvP7pXtPZBKpf0h5+8tXWQv
 yjDxYBKPJZW73w0myGrusuM70aImlA4aLKTH2CGeafk8uUu/+xN//2oxObODvXmHtyi7rA
 +ceqD41HT6JfjXv/LBjddmGdLaqb7D8=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-604-uK1vpFIINaeztr-QqfMwTw-1; Mon, 22 Feb 2021 10:56:52 -0500
X-MC-Unique: uK1vpFIINaeztr-QqfMwTw-1
Received: by mail-ed1-f71.google.com with SMTP id m16so7203218edd.21
 for <qemu-devel@nongnu.org>; Mon, 22 Feb 2021 07:56:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1t3h3w0boJDcubfiHIZv2MhsOgPTZBBsNhVoop9slg4=;
 b=sRzU40XbjJdfGNAjDGAiD8VYElz/HZKj5fBrg9KEeuXAwtOtFS4SaqXTPFsoexTZUR
 rmPm0xIEn9uN92HO4MqucDT0LCepQrTuxNOJ0sWFgJubAVFepZPSN6AT1B2/mhEKkVmd
 eDGzpNPZKKlYgfHmyN+1TPQEHBYvVTJRt89wDIXmXRXxlRQ0bhdmvjZ+F92AXYfoqRms
 jO/MwznRKoGzlX4MSbcI8BZJp37ZXL3hvzxJ2yJGOIUSI/UzG/03fkY4NPqHT1kZMdw2
 NmNzk+hfYFnTrS9jM857Am9FrUPJ64xXOv9Db3rpb3T+UHaIyoB+G4AkUhhtK2K1xTWC
 BeFQ==
X-Gm-Message-State: AOAM530DyNiAoHqYpojypEaPDObBLQdko09HG1G+N+JzaiTzXjpflajq
 n57o0oDm6ul177ae57YayglwQwKFlCQA5IGP4vMMogzOH4z2WE5x5yurnfDnZS1fMMaA/ZabaYZ
 /981nga+98BR4XaD6BMiuc6RIZjCr1ZWMJFeQ6+mYH7OFlwB/Lf/HeYV/aXRBiqb6
X-Received: by 2002:a05:6402:d09:: with SMTP id
 eb9mr23568550edb.285.1614009410827; 
 Mon, 22 Feb 2021 07:56:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyLG3qR33fQPnMMb2EAzjsfl2thU36RtUrkbBFla/bfIwdYPvrr+LxRcCCFL4LX7EbT4YH5Eg==
X-Received: by 2002:a05:6402:d09:: with SMTP id
 eb9mr23568535edb.285.1614009410597; 
 Mon, 22 Feb 2021 07:56:50 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id dj9sm10102335edb.81.2021.02.22.07.56.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Feb 2021 07:56:49 -0800 (PST)
Subject: Re: QEMU hosting
To: Fosshost <admin@fosshost.org>, Stefan Hajnoczi <stefanha@gmail.com>
References: <CAJSP0QVZuh8H-U1vtFMhasqSsSy3OA4jmRvwZrQEAx3=1dcb+w@mail.gmail.com>
 <LO2P123MB2605DA330913C7D2DA311EF1C8D10@LO2P123MB2605.GBRP123.PROD.OUTLOOK.COM>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <b803bbce-ef10-229b-eccb-b26f0e589a43@redhat.com>
Date: Mon, 22 Feb 2021 16:56:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <LO2P123MB2605DA330913C7D2DA311EF1C8D10@LO2P123MB2605.GBRP123.PROD.OUTLOOK.COM>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Thomas and Stefan,

On 1/5/21 7:55 PM, Fosshost wrote:
> Hi Stefan
> 
> Thank you for your email.
> 
>  1. We do not offer MacOS hosting
>  2. We can provide virtual machines with full KVM virt on x86
>     architecture and soon arm64 v8
>  3. We do not provide dedicated servers.

Would it be possible to have a dedicated VM for a git LFS server [*]?

If so, what storage is usable? Are there network traffic limits?

Thanks,

Phil.

[*] https://docs.gitlab.com/ee/topics/git/lfs/

> ------------------------------------------------------------------------
> *From:* Stefan Hajnoczi <stefanha@gmail.com>
> *Sent:* 05 January 2021 14:21
> *To:* Fosshost <admin@fosshost.org>
> *Cc:* qemu-devel <qemu-devel@nongnu.org>
> *Subject:* QEMU hosting
>  
> Hi Thomas,
> In November you emailed qemu-devel asking if the QEMU project was
> interested in exploring hosting with Fosshost.org. I think my reply
> may have gotten lost so I wanted to check if you have time to discuss
> this again.
> 
> The main hosting need that QEMU has is for continuous integration
> system runners. We are particularly interested in non-x86/non-Linux
> build machines and a dedicated server for reproducible performance
> tests. Just today there was discussion on #qemu IRC about how to go
> about adding a macOS build machine, for example.
> 
> It would be great to find out more about Fosshost.org and whether we
> can work together.
> 
> Thanks,
> Stefan


