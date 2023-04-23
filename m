Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 806836EC1A3
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Apr 2023 20:40:23 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqeci-0005AW-BU; Sun, 23 Apr 2023 14:39:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1pqece-0005AO-M4
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 14:39:40 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1pqecd-00019J-6Y
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 14:39:40 -0400
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-1a6817adde4so42199315ad.0
 for <qemu-devel@nongnu.org>; Sun, 23 Apr 2023 11:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682275178; x=1684867178;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5t0Zjbwqyb1Shoq+F0o8uEz3R+ZoaK0kSgxoTvNr5Zw=;
 b=TW2PFinLIOaJyPKfUPM8S7N7/719agvF3MAqaxz4yV7owRB9Ya/B6tRHUBj4i8sYVK
 b3cBt1c2yMGnX7awb0T/CpytUoIQtslSyFxX542lRMHuroBfMx1CS3uytuwOC5qgkJXB
 yS4eV/BFUl86CL9SaH+2RVl8/PQCE93U5tWqAdFjcQhcT2kyHnGCFta4Cs/0411TMZPS
 mT+DV9Cb+JQA2+qBSnq0tnWpql28pzu+fTieNjKjgVZX34S5o/VHuiOkS0kPmEREbVGf
 Vwet73xF3wQrF8aZet/jM2fDL2uijM53ihu2T0Jyaiv20vuQT5njdyu58f0CXRYl/jde
 /Utw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682275178; x=1684867178;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5t0Zjbwqyb1Shoq+F0o8uEz3R+ZoaK0kSgxoTvNr5Zw=;
 b=UzoZ52HLR7Xc/wPKyR4oQKYZeilCx+0scttsAg9jxYqOgGQpihZMp4wVpokb9XpZ9l
 raF2ncszkgwrkVkzWq+S8eJlyi2PKr+K//n3yhRr/ToPTWr9ufkIlm+zkF/eAoMvXyv9
 Z/KVKFF78fSmeHwahV3QgPNi0VIZJYMk6Y/+HPpEByn56TQoa8uoe2Ztvh3ZbbAvG1xt
 9AYvOb6HlEAYsat2AUg1HquQCXLe5a19HxsTUzDibiXglpallK1jAvDvf1UAgDx5MDUR
 3n7Ebj+Ir9ePegIFABwyfcNwCRe95oKST74W13zTUCprNNx7FlZkkEMFA8aKVr3sXPzl
 MFLQ==
X-Gm-Message-State: AAQBX9c2SMZCXGrkxeYiZwEobrEcLsxcD11QBstbNRKeza/AgfXiasA8
 kYU7OHJsXND4nGv5rCxO2bU=
X-Google-Smtp-Source: AKy350bcYziA6VYQZPriu1r7qrX+nlGwxqO5+W/XdE2axCFhrYBT/f438FLY/8LlmrNaPDB4ZO4FwQ==
X-Received: by 2002:a17:902:f544:b0:1a6:84be:a08f with SMTP id
 h4-20020a170902f54400b001a684bea08fmr13948815plf.64.1682275177613; 
 Sun, 23 Apr 2023 11:39:37 -0700 (PDT)
Received: from ?IPV6:2400:4050:a840:1e00:4457:c267:5e09:481b?
 ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 t7-20020a170902bc4700b001a21b871824sm5334100plz.119.2023.04.23.11.39.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Apr 2023 11:39:37 -0700 (PDT)
Message-ID: <62fdda3d-095a-679a-4579-0d20cef93e4e@gmail.com>
Date: Mon, 24 Apr 2023 03:39:35 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: get_relocated_path: the configured paths are not looked for?
Content-Language: en-US
To: Michael Tokarev <mjt@tls.msk.ru>, QEMU Developers <qemu-devel@nongnu.org>
References: <7f96ff38-2268-07d3-23a3-d46bf036b711@msgid.tls.msk.ru>
 <20e76562-b1c7-3574-a277-7df6260226cc@gmail.com>
 <a01a470e-891e-bdfc-aefc-00701a6a0413@msgid.tls.msk.ru>
 <63948283-d7dc-924b-c19a-6e376096daac@gmail.com>
 <30817af4-5b21-b1ff-293c-f39196842077@msgid.tls.msk.ru>
 <fa344795-07c0-b6a2-5666-9a44e1671b38@gmail.com>
 <bccc8256-30f9-95e4-68a2-793ba4bceb0a@msgid.tls.msk.ru>
 <c5568089-d8e4-36da-4a77-92ccc350f003@gmail.com>
 <0803ed60-9ed6-26aa-f5a8-c955c8ca085a@msgid.tls.msk.ru>
 <dfa9e438-d1be-caec-6320-c5f196ced2f5@gmail.com>
 <8bbe3316-2020-e995-9b57-d6a93da4ab1f@msgid.tls.msk.ru>
 <635b7a76-9972-1c5a-5215-1d148a098e37@msgid.tls.msk.ru>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
In-Reply-To: <635b7a76-9972-1c5a-5215-1d148a098e37@msgid.tls.msk.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-2.143, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 2023/04/24 3:37, Michael Tokarev wrote:
> 23.04.2023 21:33, Michael Tokarev пишет:
> 
>> $ cd /tmp; printf '#include <stdio.h>\nint 
>> main(){puts("Hello!");return 0;}' > hello.c; cp /usr/bin/gcc .; ./gcc 
>> hello.c; ./a.out ; ./gcc --version; ls -l gcc; cd /tmp
>> Hello!
> 
> execve("/tmp/../lib/gcc/x86_64-linux-gnu/12/cc1", [...])
> 
> Since this is merged-usr system, it finds its component just fine,
> that's why it works here in /tmp, doesn't work in a subdir of /tmp,
> and doesn't work in your case (non-merged /usr).
> 
>> Still, GCC is an exception. It is very rare.

Oh, I was just wondering why it worked and digging what's going on. 
Thanks for the answer.

Well, I have nothing to say GCC is an exception or not, but it's 
certainly an important program so I still think it's better to talk with 
GCC packagers (and upstream developers perhaps?)

Regards,
Akihiko Odaki

> 
> /mjt
> 

