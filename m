Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0FC01B36A0
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Apr 2020 06:54:02 +0200 (CEST)
Received: from localhost ([::1]:41802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jR7Ob-0004YW-Fd
	for lists+qemu-devel@lfdr.de; Wed, 22 Apr 2020 00:54:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36798)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jR7B3-0003uV-KJ
 for qemu-devel@nongnu.org; Wed, 22 Apr 2020 00:40:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jR7B1-0004Q4-JH
 for qemu-devel@nongnu.org; Wed, 22 Apr 2020 00:40:01 -0400
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:37438)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jR7B1-0004KK-60
 for qemu-devel@nongnu.org; Wed, 22 Apr 2020 00:39:59 -0400
Received: by mail-pg1-x543.google.com with SMTP id r4so479091pgg.4
 for <qemu-devel@nongnu.org>; Tue, 21 Apr 2020 21:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=d2KMZZUtjLlBptB9422lpOkKfErYYFmFXsRfdyVTEUs=;
 b=f8v4ciz7AHuMx4ksKphaFWWzJlFOA1wGwqLHleltcWVaAYdaZGIZG9OYDGtpc45ZK4
 IIrDsznSpcxLTfB2Hd1elkXAKlgSWJEsb6HGBLpHXjxmQMiY1RmO9ADbNLiopQtT2r4b
 AZG8ENElZNyq8BzSq+GuemkRtYlcdRC5aCQ/i/Y1jCy6rx++WVsyBtwzOpoIMIEKIYnG
 TdMhJueYich4bh5ybYL0JHOeDshaMYnGlcdEE1/zO67orPlQ7h4mKFD9wrI3jGgzKSqj
 6advIzmOF6BHMC8PQahJLu8kkGB4uVZsh8kRJBfsHlr1vEy5kFdvnHNQoZ505c+MHjHx
 Bfmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=d2KMZZUtjLlBptB9422lpOkKfErYYFmFXsRfdyVTEUs=;
 b=d6KVqQ/GEtd5IBWkK/RU7eHHJn6pKr5zHcfx9PQCkbcrK9kVGVXw1yaSfS8l0iMnsp
 5jNXxmKc+2RAZRWxGHts+2B/9el55hfOJQYMe9hTqkJ9odhdNvg73NqWXWrk8CHW0tTD
 Y0vps4hLTz869rqccUoU1S409N8+caPLjAKWjHdtWpHQg7UbwL0hlcixpdkhmr2v1Vh/
 /q2lQGwJLpxZMdn7S3x7/FesnUugJPyW7bx1ES7p54Z5Hgl04FVb9htx/8ulePmnefhN
 lqkLjoZVBLa7AAdKej4VH/wvBHmQGPieyHGCwLogABu7QVw3XchXDRsu2CgHV2QAoFEd
 uilA==
X-Gm-Message-State: AGi0PubB5mm+WAttQhPbM3Hz1dHveHpoxBX+R47hZKE1k7Ocv+oCso0C
 ZVVQNdSoKAhqbCjhGaW163U4RXabm50=
X-Google-Smtp-Source: APiQypKS6tLYQS3w0EdGl7egySFj1qPpI0f8Wyngu+0RsSo70btghxI5MuUvNkMwg282cSips7Yabg==
X-Received: by 2002:a62:8746:: with SMTP id i67mr11046447pfe.9.1587530397494; 
 Tue, 21 Apr 2020 21:39:57 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id g25sm4015182pfo.150.2020.04.21.21.39.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Apr 2020 21:39:56 -0700 (PDT)
Subject: Re: tst-arm-mte bug: PSTATE.TCO is cleared on exceptions
To: Szabolcs Nagy <szabolcs.nagy@arm.com>
References: <20200420102902.GE15401@arm.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a36c670a-5cef-f8c6-ce1d-4fbb28f9488d@linaro.org>
Date: Tue, 21 Apr 2020 21:39:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200420102902.GE15401@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::543;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x543.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::543
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
Cc: nd@arm.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/20/20 3:29 AM, Szabolcs Nagy wrote:
> i'm using the branch at
> 
> https://github.com/rth7680/qemu/tree/tgt-arm-mte
> 
> to test armv8.5-a mte and hope this is ok to report bugs here.
> 
> i'm doing tests in qemu-system-aarch64 with linux userspace
> code and it seems TCO bit gets cleared after syscalls or other
> kernel entry, but PSTATE is expected to be restored, so i
> suspect it is a qemu bug.
> 
> i think the architecture saves/restores PSTATE using SPSR_ELx
> on exceptions.

Yep.  I failed to update aarch64_pstate_valid_mask for TCO.
Will fix.  Thanks,


r~

> 
> i used the linux branch
> https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git/log/?h=devel/mte-v2
> 
> attached a reproducer that segfaults in qemu but should work.
> 
> thanks.
> 


