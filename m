Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A6794E8843
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Mar 2022 16:54:24 +0200 (CEST)
Received: from localhost ([::1]:55100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYUHf-0001UT-43
	for lists+qemu-devel@lfdr.de; Sun, 27 Mar 2022 10:54:23 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daerlnaxe@gmail.com>)
 id 1nYOKL-00006G-MO
 for qemu-devel@nongnu.org; Sun, 27 Mar 2022 04:32:45 -0400
Received: from [2a00:1450:4864:20::436] (port=38590
 helo=mail-wr1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <daerlnaxe@gmail.com>)
 id 1nYOKJ-000326-QN
 for qemu-devel@nongnu.org; Sun, 27 Mar 2022 04:32:45 -0400
Received: by mail-wr1-x436.google.com with SMTP id t11so16213647wrm.5
 for <qemu-devel@nongnu.org>; Sun, 27 Mar 2022 01:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:to:content-language:from
 :subject:content-transfer-encoding;
 bh=OCDr2LIAAKcMcXnSaxW1L0zBEPzQ8zWY8eCPmGDFOBw=;
 b=le9+BaDgf9T6A/iRGKBuDfh+UD2EJ3ZqRT/INs3IAfmMP+PL2uDFGQWFXz7GGwkc+I
 XcchxadoQXEUQ/WgRJ2e1BYTzsip6piCnMNZEq2oppt8y5GJCFtAzcimVlB4CNYGnymo
 8NwTLMEquHalrKbkz5xux5Ojyh+YUjlIwg5kKLmx/jKHxoSR6Aa9+ahz9Or5SJWb2lBn
 RjhD4C+UMiIj0xwyWQdT09f3sfT85vdkcnojZUNByHq9APGjjgKOHW9soTp9TiKd03l1
 NvZ4///p+ZR4KKFvY0beprdpJBqqJ5pCItu5jcB3Dp7gvKOdWTkHDJRRchxX3pWJ+2lH
 kTwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:to
 :content-language:from:subject:content-transfer-encoding;
 bh=OCDr2LIAAKcMcXnSaxW1L0zBEPzQ8zWY8eCPmGDFOBw=;
 b=AgLfgKDmWFsYcglTirBoDzVeOW9W7EhN2munsvXrn44Xa0egTTtHZNNzGrBrvzStL3
 EtH3D1tq/0vK/t6hjBFtvrIwiSyYLw8dVQvDM1fFtpIXAPclClqkYq5ZEGSNLdunaKrW
 mFbnaP9VyURx/n3DnIuYONwxGdtXQois9d9tIDzXDQ1TMCNQkvhqLyCp6UAob9G+nyf1
 oINhJ2LrgqI14/wcNLiZRNxWo+YctGMtDGZ2kfxj13R0PXhQDmhxpZ9ARql+tbCfsY4Y
 Nei/zAKyOgiAZTvrdokHBn2lLg0I/CtRRh9GyTfsE+H7aZh3WYD7iUWCzezV+FkZj+n1
 yMrA==
X-Gm-Message-State: AOAM532BR1LM+I+5p5684FNqLhQ6ZXU6rr754OrugKD3CDzQ6MKaLSXv
 +wE7ZSN+kqB2cJHf5ig8G31uoQDKMmU=
X-Google-Smtp-Source: ABdhPJycMK+BU0L3cifgtC7WSIgs+pWrRLxApqVtOK9WXCwprgKPHs2mwKM/obC2/tJMq4DdQmrnYw==
X-Received: by 2002:a5d:40c8:0:b0:205:2a3b:c2c with SMTP id
 b8-20020a5d40c8000000b002052a3b0c2cmr16464801wrq.13.1648369961525; 
 Sun, 27 Mar 2022 01:32:41 -0700 (PDT)
Received: from ?IPV6:2a01:cb1c:e6e:4300:19d2:4bc4:823c:135d?
 ([2a01:cb1c:e6e:4300:19d2:4bc4:823c:135d])
 by smtp.gmail.com with ESMTPSA id
 v14-20020a7bcb4e000000b0034492fa24c6sm8899975wmj.34.2022.03.27.01.32.40
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Mar 2022 01:32:40 -0700 (PDT)
Message-ID: <03a524ae-f4b7-4776-1717-44fe9ff8c92a@gmail.com>
Date: Sun, 27 Mar 2022 10:32:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
To: qemu-devel@nongnu.org
Content-Language: fr
From: daerlnaxe sur gmail <daerlnaxe@gmail.com>
Subject: Problem for cross compiling to windows 10
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::436
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=daerlnaxe@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 27 Mar 2022 10:51:18 -0400
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

I don't know at all how to use mingw i tried several days to make cross 
compile, sometimes under msys2 sometimes under ubuntu or even debian, i 
saw errors and errors i tried to remove. On Ubuntu i can compile but i 
have no *.exe at the end, probably a prefix problem but on the wiki page 
i can't understand...

It says i must use msvc i looked at ubuntu 20 and didn't find it on the 
hdd, same for debian11. Installation guide seems to be outdated for 
mingw (perhaps it's me), and at a moment when there is the line to use 
the prefix i saw "msvc-" must have enter "-gcc" after ? Something like 
that ?

I asked on the git, stackexchange, forums that use my native language... 
nothing. I need to understand to use patch, i want to use QEMU on win 10 
with a 3d support on w98. Someone made a patch for it, he refuses to 
help, this option can be forsake, this why i want to understand how to 
compile by myself QEMU (raw). I successfull dit it for Ubuntu, it was 
very easy, but for windows 10 ...

My purpose is also to make a tutorial in my language at the end, when i 
will sure to successfull compile, to help people and promote QEMU for 
retrogaming with win9x games. I tried probably all the others solutions, 
it's the best i saw (virtualbox, vmware, pcem, 86box, dosbox-x, 
Bochs...). It's efficient on a low machine like an old i5 laptop, i 
played thanks to precompiled packages for windows10, to several 2d games 
perfectly. Perfect on my i7 4770k. There is 2 things missing for me:
- a 3d support this is why i want patch it.
- Scanlines & shaders effect, for windows 10 i found ShaderGlass.

I know how to program with tools like Visual Studio, Eclipse, but here 
i'm totally lost and need probably a step by step guide according to the 
last tools.


Best regards.


