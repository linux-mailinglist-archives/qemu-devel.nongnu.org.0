Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86AF738AFAA
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 15:07:27 +0200 (CEST)
Received: from localhost ([::1]:58704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljiOc-0004c5-Ki
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 09:07:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ljiNW-0003sk-0a
 for qemu-devel@nongnu.org; Thu, 20 May 2021 09:06:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27342)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ljiNT-000888-P2
 for qemu-devel@nongnu.org; Thu, 20 May 2021 09:06:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621515974;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UvRvEMtxls0DTArIn856/xzIS2grPdl3d1twepUycos=;
 b=V7arqHf//McvjcDIiMKFgT2Q68l0vKXwwSrY0cOplz7McYv5oXvUHdaoGgtoMu94KyzuoQ
 8XVoZkI132iRA5scip68l6OAPspy7hMDTPAwQNuf9ReX5PH2AoWgflQ4wo9w7MwKm3Egpx
 P5tBDCDQOEfWpIjSBLcnrVcaQu70pxM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-205-Pert3PViOF-AwoJvUc2NHg-1; Thu, 20 May 2021 09:06:12 -0400
X-MC-Unique: Pert3PViOF-AwoJvUc2NHg-1
Received: by mail-wm1-f70.google.com with SMTP id
 12-20020a1c010c0000b0290176491efde9so2314271wmb.4
 for <qemu-devel@nongnu.org>; Thu, 20 May 2021 06:06:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UvRvEMtxls0DTArIn856/xzIS2grPdl3d1twepUycos=;
 b=qDDZtnCrxPInSA7nqrzRrfbvb5C8TjHsJPeNgaJnTsZpSsBahmRgkGZAas6ERtROUS
 Aty7ezfK/L2eT+U5U9HUeWWUP/GFzcSly9IRIX/FLjNYXE23IgmzBHwnMHFpep4yKuVe
 dZ+qOWOAecuIG6bx38iBwwUO4wU+kyXY/9GrPh4w23XrhjPBQhtkJgMN9gQz5vUdyCdS
 qc9ZR43uVuDgBMFaVbUrEoRwELgLS1Ip7GIwfdPRsKHBHEr9BO35x+UM1GEJoGEaQvRx
 T8C3hhXHOQFTs05DMBMloeYpZqXFjt2j/ohkGeXJaLWOaXxpP1/eyHk4t1nG/+XFZh9e
 MMBw==
X-Gm-Message-State: AOAM5309QLr88h62rXuYup1G//h/fXsYZg6ZPsA0VC/7XGWCu+YIxyjg
 5S29BmE2Un5EW6SYW4PrbK2q5bgkKF2wUVPgE0ZBliJL86yNd2uBaI9afT5WJ6PKW+QKqVjPweo
 zzNpVO+1nUGsDQgCbN0TO8klrTXDV4NzTgiXPb7TpUD+nb1rEs2KXtk+W/aCR369D
X-Received: by 2002:adf:f309:: with SMTP id i9mr4305600wro.307.1621515970669; 
 Thu, 20 May 2021 06:06:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxI0+OK07F/baBFt475oGnBzz6VQ+bHGdr4rTI6X12lk/Im57gPPIwoOcBszVmoKhkRe4gd0g==
X-Received: by 2002:adf:f309:: with SMTP id i9mr4305571wro.307.1621515970457; 
 Thu, 20 May 2021 06:06:10 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id x10sm3165918wrt.65.2021.05.20.06.06.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 May 2021 06:06:10 -0700 (PDT)
Subject: Re: [PULL 00/10] Gitlab-CI, qtest, moxie removal and misc patches
To: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210503104456.1036472-1-thuth@redhat.com>
 <CAFEAcA8k1DnOFT+5pjQ4ytene3asVDKB7TUOZgGhucTp_ypz2g@mail.gmail.com>
 <66206f67-f3c8-eb1c-fd5d-8c7555fe5316@redhat.com>
 <CAFEAcA_9o+h29L1Y0BVFhg9JbQbo6A=MgGwCaH_=vt3OhcERBw@mail.gmail.com>
 <c748372a-d585-7777-9dda-9faf33e97e30@redhat.com>
 <d5bf0064-052e-a0c7-cc17-72db815949e2@redhat.com>
 <b2a28a69-2525-b07e-bec8-65d7439f1154@redhat.com>
 <11382e1f-4ab9-6f04-6c53-938bd50a1e78@redhat.com>
 <9840231d-9b5b-a61e-fd8c-098c1a9a7596@redhat.com>
 <75e088da-b815-8f97-acf2-1743205967f5@redhat.com>
 <3b1e8f37-7d38-1450-b288-c23c2d14b90a@redhat.com>
 <924f165c-369e-7f52-7287-fc7211c6abbf@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <8dd49eba-29c8-617c-c61a-d5c7e0bcacec@redhat.com>
Date: Thu, 20 May 2021 15:06:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <924f165c-369e-7f52-7287-fc7211c6abbf@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/20/21 9:43 AM, Paolo Bonzini wrote:
> On 20/05/21 07:08, Thomas Huth wrote:
>>> OK... Not sure how to detect it from ninja then.
>>
>> Every time you pull, there could be changes to the "configure" script
>> which affect the build ... I guess you also won't notice those when
>> you're only compiling with ninja? Thus at least after pulling from
>> upstream, I think you have to type "make" once at least.
> 
> Yes, and using "ninja" directly is not supported.

Unrelated to my issue, but I find it unfair to state "using
ninja directly is not supported" when the majority of the
QEMU developers don't have access to the Meson 0.57 bugfix.


