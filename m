Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCCEC6FA5C6
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 12:13:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pvxr4-0005c8-EM; Mon, 08 May 2023 06:12:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pvxqz-0005bd-E3
 for qemu-devel@nongnu.org; Mon, 08 May 2023 06:12:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pvxqx-0007Bh-1O
 for qemu-devel@nongnu.org; Mon, 08 May 2023 06:12:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683540741;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0u9gjqKWnT5vfasxqQZsS1j3G6ZsHascY7PG3p3MTSE=;
 b=cfpEgjgnJwC8OkTtEJAsjvAT2QjJLy1TXzCNaa8pxUc27YIJIuC+nDxid72eqUNTk+r5Hw
 CiT+lS3Yyg2zE5Sw7HtwbRQ1znhHtPMe3KaTnvltfH/2NaucyUTG1iculn7k3dq0A57WFy
 RlV9r4WDcZ4SUHT3BJMtBrHcHl2ZdC0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-537-Lmi1EwNBNY2J7bhPNlAmzQ-1; Mon, 08 May 2023 06:12:20 -0400
X-MC-Unique: Lmi1EwNBNY2J7bhPNlAmzQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-30633990a69so1451529f8f.3
 for <qemu-devel@nongnu.org>; Mon, 08 May 2023 03:12:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683540739; x=1686132739;
 h=content-transfer-encoding:in-reply-to:from:cc:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0u9gjqKWnT5vfasxqQZsS1j3G6ZsHascY7PG3p3MTSE=;
 b=e8s5DGiZLPiFN2JM3RElIyDqG/Si8PTMyKbw0h2nyF3fPaRiag+nAanIKtCfYZwJfK
 2SVJo7FaMJakuYi6OThVC94wUlBbEAdVaybu85Xl6rU/2YblRi+edh6PUEJqRWw8WHUa
 WrHC4LRqAtuzFkw+LroB7fEHSsFWZ5tWN6cGhuQax6NFaywSiwaiJRVfOCldCToZ7SXs
 bykk+sOti+b/hO0JeQ8X+dGDcQ2vFqMMAKzD3Xtk3ar6Ic7O04yPATLQuOHm6i2IajNp
 DDlawqUZIiG4qYvkzBefrRFIkQVTdCuHjKc9iDNTRwW9HnTNWKN1NkutGh5BI0VcWFM+
 ruEw==
X-Gm-Message-State: AC+VfDy6v90SBx0cf/Pc06tXlPzv3R7DXaTMmTJ9UmZ/22seOctAHmuN
 3kW+e79Rd3MZj0e2M8NTnXuY5b2qJ/JX7Uia0gjGtYhwTlZYDtrAT9q30I9NwfyUbr3U2iAM5Xa
 xzs1e/+CtVUuvtSE=
X-Received: by 2002:adf:ea85:0:b0:307:834f:7159 with SMTP id
 s5-20020adfea85000000b00307834f7159mr6447999wrm.4.1683540739537; 
 Mon, 08 May 2023 03:12:19 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4zy0vDFIuT9HmQE5KUWzBVCqbHEbvrL9MdrIjmhY15leHrOW89uC2a4zEOGJq87f8v32g+yA==
X-Received: by 2002:adf:ea85:0:b0:307:834f:7159 with SMTP id
 s5-20020adfea85000000b00307834f7159mr6447982wrm.4.1683540739226; 
 Mon, 08 May 2023 03:12:19 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-179-212.web.vodafone.de.
 [109.43.179.212]) by smtp.gmail.com with ESMTPSA id
 f15-20020a5d50cf000000b00304adbeeabbsm10814429wrt.99.2023.05.08.03.12.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 May 2023 03:12:18 -0700 (PDT)
Message-ID: <90c49bba-c108-f929-97aa-f954f4226e1b@redhat.com>
Date: Mon, 8 May 2023 12:12:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: missing boot rom: is it really a fatal error?
Content-Language: en-US
To: Michael Tokarev <mjt@tls.msk.ru>, QEMU Developers
 <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <d6f3e06c-ee84-5101-c583-220aa90c0c12@msgid.tls.msk.ru>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <d6f3e06c-ee84-5101-c583-220aa90c0c12@msgid.tls.msk.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.964, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 07/05/2023 19.56, Michael Tokarev wrote:
> Hi!
> 
> In old good world ;), there was qemu which didn't require boot roms to be 
> present
> for all devices for which bootrom file is defined, missing rom was just a 
> warning.
> But this changed in 2014, 9 years ago, with this commit:
> 
> commit 178e785fb4507ec3462dc772bbe08303416ece47
> From: Marcel Apfelbaum <marcel.a@redhat.com>

Marcel left Red Hat a while ago ... CC:-ing him with his current address - 
maybe he remembers why that fix was needed...

  Thomas


> Date: Mon, 27 Oct 2014 19:34:41 +0200
> Subject: [PATCH] hw/pci: fixed error flow in pci_qdev_init
> 
>    Verify return code for pci_add_option_rom.
> 
> where inability to load rom file started being treated as an error.
> Up until now I didn't even know about this change, until today when someone 
> bugged
> me about non-working qemu on debian, due to missing network boot roms (this a
> packaging issue due to me being unaware of the above change).
> 
> What is the reason to require boot roms to be present and throw an error if 
> not?
> 
> I'm about to revert that old change on debian, to make it just a warning 
> instead
> of an error (the code is different now, but the same principle applies), - 
> because
> I dislike dependencies which are useless 99.9% of the time and are trivial to
> install when actually needed.
> 
> Thanks,
> 
> /mjt
> 


