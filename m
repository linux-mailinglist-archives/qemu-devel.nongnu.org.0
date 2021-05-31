Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB68639545A
	for <lists+qemu-devel@lfdr.de>; Mon, 31 May 2021 06:11:12 +0200 (CEST)
Received: from localhost ([::1]:43208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnZGh-0006VG-92
	for lists+qemu-devel@lfdr.de; Mon, 31 May 2021 00:11:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lnZFT-0005oO-Py
 for qemu-devel@nongnu.org; Mon, 31 May 2021 00:09:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20324)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lnZFP-0000Gh-TL
 for qemu-devel@nongnu.org; Mon, 31 May 2021 00:09:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622434190;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=03NKCvPiuLB0azRHWBdCkpilhLVtXvJaWj+fNhwxpBU=;
 b=jQnHb2ovB5ErpI1j+s6hOdEzZbEsovBix3YsFTrdbeXx6JoNf7/WwWZtjvb+StH+rqxoTf
 oF49cdjj1oOEfb6qGlx+S4xbwUJBYbJcBCMjLul0avZDcsRDWvxKbQkHZQ3WMgd/YcujTF
 qMBS9ODjbpkmbIWStXpycW5eu7qQFXg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-418-1oG45TzMMjiJ-_k2OT-N_g-1; Mon, 31 May 2021 00:09:46 -0400
X-MC-Unique: 1oG45TzMMjiJ-_k2OT-N_g-1
Received: by mail-wm1-f70.google.com with SMTP id
 a19-20020a1c98130000b02901960b3b5621so1939861wme.8
 for <qemu-devel@nongnu.org>; Sun, 30 May 2021 21:09:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:references:cc:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=03NKCvPiuLB0azRHWBdCkpilhLVtXvJaWj+fNhwxpBU=;
 b=L/+08dHKpr2ovgpI9UBmlomweYalksyeGr8ThTCNmNdOB+9YbFcdJXTOOBNejWx6Ub
 gEGdzByB8+MtdSvvR62FcR55blS3xJHbY+sQ+z4PK2EYNQkjwbROSus0cNXjnxMEeRs7
 gPkLcDwt3Q2C5/aHvpz3/uZ3UwTuxcyfOCEGT3d8ZTAlcQE6DY50gRtQQRKea5zNID6i
 eMVg34AQ5ByvZm8i2AjQw+CgtrtnRBRhbXktnY9VvoT60/phv4S3J+kV4uOJaWx3oVBT
 VRy3Eif39dB/jf/pXQX5vApD9YvL0vSffvpHREo+qCPcK1783YTyQyFpySJs9TpjlnYk
 wygQ==
X-Gm-Message-State: AOAM532rbJvgowvLFw7FTmovt0YUZmoPPw6etwNYElE3VVcEbhaMWOll
 cDwypyRP4CcUpnFE2OLPNZNBv+Kpx4UK0FDCnC4UsjYYsrJuB9yFkvslZXTjfWIwPaEJXgoIaLP
 P4Xn8aRsuTWcW7bU=
X-Received: by 2002:a7b:c19a:: with SMTP id y26mr2820064wmi.132.1622434185456; 
 Sun, 30 May 2021 21:09:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzchk5iYTAug7RjYuo9stNQFaI42RITgIKEhSV1Cvy4RMMYAT3PNdEjc6mdPoNIBfwCCH1Hrw==
X-Received: by 2002:a7b:c19a:: with SMTP id y26mr2820056wmi.132.1622434185253; 
 Sun, 30 May 2021 21:09:45 -0700 (PDT)
Received: from thuth.remote.csb (pd9e83705.dip0.t-ipconnect.de. [217.232.55.5])
 by smtp.gmail.com with ESMTPSA id p6sm11244162wrf.51.2021.05.30.21.09.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 May 2021 21:09:44 -0700 (PDT)
To: Shehab Badawy <shehab.badawy002@gmail.com>, qemu-devel@nongnu.org
References: <CAHfWo0OByqVADs3Sa36cvBg0stdQ=yo-H=hJKAd5TYVq0-eysw@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: Google summer program
Message-ID: <b824361a-a4ba-aaaa-1b84-4b8b6203f55f@redhat.com>
Date: Mon, 31 May 2021 06:09:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <CAHfWo0OByqVADs3Sa36cvBg0stdQ=yo-H=hJKAd5TYVq0-eysw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.37,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.618, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 30/05/2021 03.03, Shehab Badawy wrote:
> Hello i just saw the application you are developing from google summer of 
> code and i'm curious about it
> what prerequisites that i need to learn so i can contribute in the application
> thanks in advance

  Hi,

thanks for your interest in the QEMU project! However, I think the 
application period for 2021 is already over, see the timeline here:

  https://summerofcode.withgoogle.com/how-it-works/

But if you'd like to prepare for the next time, most of the projects 
provided by QEMU require a solid knowledge of the C language (some also use 
Python or Rust), so that's certainly something you could try to learn in 
advance (if you don't have that knowledge yet).

To check whether QEMU is the right project for you, I'd recommend to pick 
one of the small task from our list here:

  https://wiki.qemu.org/Contribute/BiteSizedTasks

and then try to come up with a patch that fixes the issue and try to get it 
accepted via the mailing list (see 
https://wiki.qemu.org/Contribute/SubmitAPatch for details).

  HTH,
   Thomas


