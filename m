Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA8A2BA746
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 11:24:23 +0100 (CET)
Received: from localhost ([::1]:43824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kg3aY-0000lk-C7
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 05:24:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kg3YX-0000Ft-4q
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 05:22:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kg3YR-0000kd-07
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 05:22:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605867729;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BDFtEZHOuuws6wZijlC4vNYJzVmjzJkXAWou09JiSSU=;
 b=Ytl3y8w12v4WuNRLLeszZ85UfXejikZUgeV2JsXcJEdTZJlL91qx3kCTg/CnxIkHLdzNnW
 BaRND9UlQM9YUd3hhyvo3vSWzNUQr5/5zi/FQIZX18OS3DUEGHw7mGnQFOZTiLYdqYZWim
 eKKsdLB6raWoNSA9ajO6qV2WZEWYbJE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-444-VRLbMeZ3PtOoyMQVx-mPbw-1; Fri, 20 Nov 2020 05:22:05 -0500
X-MC-Unique: VRLbMeZ3PtOoyMQVx-mPbw-1
Received: by mail-wm1-f72.google.com with SMTP id y26so2936881wmj.7
 for <qemu-devel@nongnu.org>; Fri, 20 Nov 2020 02:22:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BDFtEZHOuuws6wZijlC4vNYJzVmjzJkXAWou09JiSSU=;
 b=EtwEcN709V7KaHhk+AEs+I8FfWuBYGkytpVR+1PhUAcvbagfevubIBFYpds2gnkhYL
 iJE+7GHiK3U7+CtFn634yqTkTpPpWNOch2nzcdeiXsUApJkM1wkmgP1JWOOs+f9TcxSX
 8X+I7G+NHQQC2xLyE3zDfoiIdivu9elvtj4/RM6ToDGNVp/iHBJzlWiJYmFcejNdCfyH
 dRsN9v6fwz7j9DLRYI4E4W3ldHgHYC3JxRzHaF9PR68fo7g2QGYGmzA35/NQlnh3K1gi
 s6UuczUkAnWgjH5AcI26FUx+0l0IfNXj3gXybwE1+NNug8mecmjLVm/1xyVapG751TNK
 TaSA==
X-Gm-Message-State: AOAM533DrWEZk/CA+rlwl7IwklGSkkNEdc8+CMeZEwNUcYrjH4SfrJ03
 Nttb+PtdbiF6r6XxEltmOaHjxuRDY/RXRre6G0zHxEkuCDjoeSeWKmX3mYokazieJssdU6kXdkp
 On3PqfN17He9yXSw=
X-Received: by 2002:a1c:f715:: with SMTP id v21mr8815398wmh.2.1605867724338;
 Fri, 20 Nov 2020 02:22:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxHAP9sWPNSaL6cIwlmybzgxnIGGB7JHTCC6SVPImn5x2YbPN7ipetvfq6mBdw0BTz4PEu0MA==
X-Received: by 2002:a1c:f715:: with SMTP id v21mr8815378wmh.2.1605867724190;
 Fri, 20 Nov 2020 02:22:04 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id z189sm3989805wme.23.2020.11.20.02.22.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Nov 2020 02:22:03 -0800 (PST)
Subject: Re: [PATCH for-5.2] microvm: fix kconfig for non-default devices
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20201120085524.108200-1-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <7888aa12-58c8-762b-7c89-4166c725b750@redhat.com>
Date: Fri, 20 Nov 2020 11:22:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201120085524.108200-1-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, Bruce Rogers <brogers@suse.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/20/20 9:55 AM, Paolo Bonzini wrote:
> PCIe and USB support can be disabled on the command line, and therefore
> should not be included if QEMU is configured --without-default-devices.
> 
> While at it, also remove the "default y" for USB_XHCI_SYSBUS because
> sysbus devices are not user creatable; boards that use them will
> specify them manually with "imply" or "select" clauses.
> 
> Reported-by: Bruce Rogers <brogers@suse.com>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  hw/i386/Kconfig | 4 ++--
>  hw/usb/Kconfig  | 1 -
>  2 files changed, 2 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


