Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 139673BC3A1
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 23:25:16 +0200 (CEST)
Received: from localhost ([::1]:35538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0W5b-0000nd-5I
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 17:25:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m0W4g-00007N-QW
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 17:24:18 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:45843)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m0W4f-00071j-3P
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 17:24:18 -0400
Received: by mail-wr1-x42a.google.com with SMTP id i8so10670516wrp.12
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 14:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=saUoasib77BuDDuNl8dZz1tYYazUNZIMGMWykSiKVa0=;
 b=PTqrTlklbNDOPBko+4TXZ+ZzbRESvd6AdF/oUBAzg7k5h/SVyTxYYEyIJUN0bcFfPD
 YdEkfWggDxqEsaamA+hXQXjE87S3i3C8Y9o8O0y9X9ua7O9U+nXmYvP3Bu0A7cOvwRM7
 n/XKUxpJn9vfWJDmNjuNMUAPKK5RdHm27H3yiZwfgraa8bIwor3ICWcQpHhRzJ+OLWjr
 jk8CEeVM8W/YHCcdCgFNC67aa07DEPuTSErTE2+M8JhTz5lf51fqOgEm5iJSBqqnHUhI
 eY0INTtxKOwi2BcLX9Bryphlv0C5vxDfngQo+5Dq9siFZZxWpTBabegrjf0V2pj3xinm
 gVFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=saUoasib77BuDDuNl8dZz1tYYazUNZIMGMWykSiKVa0=;
 b=O4bDn4/WS7m+kpXhXq1Fm5NDqse+RuekTTF8hvi5hFiaF+bmzKtfao2bGtLYpGkFpA
 Zs3PuCCu0UYjiIJBkiqkBEQl6YBmkQXfv5oT0pN+oCIQbbIpquKEQ7TZzYNlmzggM4hN
 XtXUENSgz+nt9cv0FToV9zLX/UcEdd5n3YkZ4/ljLBnt6Nh/jqB/jitZ/LSUf+tc+TXf
 jF+E5S68Jyy9l6EuP+2q+6b3958OYkebYxl/zLo2JSy7MKUXhsdNOco+nlT0i/vEVitQ
 iKQ6SNrqa7ietXrc0il2GcO/kNENA5XU5vUjsAsXBUn0k/+rJZtoyHizaf9E16bZQuXS
 asdg==
X-Gm-Message-State: AOAM530MlZ3UpYt96MKwUf0erWFwO5gdf/n7yr7VB53luLq59bQy4TDe
 g1nsrbEYbBroiWKmxMZHlMU=
X-Google-Smtp-Source: ABdhPJy5eIW/DLdu5lg0hZuIZUk7QWPKSviynR7E8av2FAJvX9dA06jhVPSdTalrgnYkivjhQn1ZFA==
X-Received: by 2002:a5d:5088:: with SMTP id a8mr15450648wrt.153.1625520255751; 
 Mon, 05 Jul 2021 14:24:15 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id x21sm607711wmj.6.2021.07.05.14.24.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Jul 2021 14:24:14 -0700 (PDT)
Subject: Re: [PATCH v3] dp8393x: don't force 32-bit register access
To: Finn Thain <fthain@linux-m68k.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
References: <20210704152739.18213-1-mark.cave-ayland@ilande.co.uk>
 <4f4d1643-85f7-fbbc-3a22-fff086362c32@linux-m68k.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <739bfc91-be28-62f1-9356-078740fc0042@amsat.org>
Date: Mon, 5 Jul 2021 23:24:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <4f4d1643-85f7-fbbc-3a22-fff086362c32@linux-m68k.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: jasowang@redhat.com, qemu-devel@nongnu.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/5/21 3:44 AM, Finn Thain wrote:
> On Sun, 4 Jul 2021, Mark Cave-Ayland wrote:
> 
>> Commit 3fe9a838ec "dp8393x: Always use 32-bit accesses" assumed that all accesses
>> to the registers were 32-bit 
> 
> As I said, that assumption was not made there.
> 
> If commit 3fe9a838ec is deficient it is probably because I am unaware of 
> the ability of the QEMU memory API to accomplish the desired result. 
> 
> That's not to say that the API can't do it, just that I don't know enough 
> about the API.
> 
>> but this is actually not the case. The access size is determined by the 
>> CPU instruction used and not the number of physical address lines.
>>
> 
> Again, that is an over-simplification. To explain: in Apple hardware at 
> least, the access size that the SONIC chip sees is a consequence of bus 
> sizing logic that is not part of the CPU and is not part of the SONIC chip 
> either.
> 
> AIUI, this logic is what Philippe alluded to when he said about this 
> patch, "This sounds to me like the 'QEMU doesn't model busses so we end 
> using kludge to hide bugs' pattern".

For the Jazz Magnum, the bus is partly represented in this datasheet:
https://datasheet.datasheetarchive.com/originals/scans/Scans-054/DSAIH000102184.pdf

I found the individual technical datasheet once, now I need to find them
again :/

I'll try to implement the missing parts in the next dev cycle.

Regards,

Phil.

