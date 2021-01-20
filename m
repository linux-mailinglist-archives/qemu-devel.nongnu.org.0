Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E45962FCD1F
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 10:05:14 +0100 (CET)
Received: from localhost ([::1]:39248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l29QP-0005Xf-Ik
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 04:05:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l29Oz-00055g-Ve
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 04:03:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l29Ox-0004uZ-Jy
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 04:03:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611133422;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i9RUBWCEL9U//DT0KWgAsm7FputAJwz1quCRwcCubZ8=;
 b=WPuRndFsyUHF1qswsveVRaRhdSrvF44rIkg7U9A0E9yLR8qw7USP7mz9500MKQZx+gPcYm
 Ajvfqr2MQHdlCscQK5WlbPVgLtcNNqyPnxYyJg041ZkiTVHTuCoOEwM0D1YboYCDwNYnqf
 0d/DcLEIEYBh00UH09NseQEEa3ERicI=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-203-DPvMooWUMlSQCgsL0pLjOg-1; Wed, 20 Jan 2021 04:03:39 -0500
X-MC-Unique: DPvMooWUMlSQCgsL0pLjOg-1
Received: by mail-ed1-f71.google.com with SMTP id n18so10744594eds.2
 for <qemu-devel@nongnu.org>; Wed, 20 Jan 2021 01:03:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=i9RUBWCEL9U//DT0KWgAsm7FputAJwz1quCRwcCubZ8=;
 b=i/+y+Yf9wrnPYaiHhw9GjG1DPoZ0EyMu83Sv845supvek8cE1+gpIqOU4L1oQUdm2J
 0sAQwgarDsw7g3f6hMHJkV0MECd1pwiMudt+FEvgAexgAle6zm6SvgmfCPx5Z+pZhqSW
 tcNc7dsYnevUzPCRPaAfmBisCnFDYEQQw/LZGURa2ObJPn0eo2jxMqO3GKnHRMbJLm89
 +Ha9qp0bTHzxYv/zZ184pQg6WsjeVy20DO0UMnMKz1IPq482r61yPwWVULYGj2jN3NXH
 p9OZ+qUxC/R7lYwRmHnyydG90rHivwYL3jBa/lICaFCO44w5gcTK65yj9DAxHwRVmIs4
 INVg==
X-Gm-Message-State: AOAM533KuWS/581bOAixntkINEEhyFufiDzllwi9edEyx4REF8UaMVgP
 1jiJsz5lh9tvirU5FW8AEbOADMBdRL8V2u1GWtakOnYr9H0dZ4aicnT1GS/feDDAcvKBsTItSrD
 hHvQB7nLQb5A/8yQ=
X-Received: by 2002:a50:b5c5:: with SMTP id a63mr6573231ede.227.1611133418735; 
 Wed, 20 Jan 2021 01:03:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxVRf83a0xQKc1C7En38VEYB5Sq9+kZFyXE8ENgbUTlyTY/tJfJ040sv//uHGMVMBazrQ3Q8g==
X-Received: by 2002:a50:b5c5:: with SMTP id a63mr6573219ede.227.1611133418576; 
 Wed, 20 Jan 2021 01:03:38 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id fi14sm596367ejb.53.2021.01.20.01.03.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Jan 2021 01:03:37 -0800 (PST)
Subject: Re: [PATCH] fuzz: refine the ide/ahci fuzzer configs
To: Alexander Bulekov <alxndr@bu.edu>, qemu-devel@nongnu.org
References: <20210120060745.558970-1-alxndr@bu.edu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <f404e320-5ae7-d01d-bce7-88add14700dc@redhat.com>
Date: Wed, 20 Jan 2021 10:03:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210120060745.558970-1-alxndr@bu.edu>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.195,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/20/21 7:07 AM, Alexander Bulekov wrote:
> Disks work differently depending on the x86 machine type (SATA vs PATA).
> Additionally, we should fuzz the atapi code paths, which might contain
> vulnerabilities such as CVE-2020-29443. This patch adds hard-disk and
> cdrom generic-fuzzer configs for both the pc (PATA) and q35 (SATA)
> machine types.

Yet another point for using qgraph generated configs ;)


