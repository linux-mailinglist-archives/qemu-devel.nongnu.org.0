Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84EAC5677C5
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 21:28:21 +0200 (CEST)
Received: from localhost ([::1]:51692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8oDc-0003v5-KS
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 15:28:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <axboe@kernel.dk>) id 1o8o9M-00078k-B5
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 15:23:56 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:43673)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <axboe@kernel.dk>) id 1o8o9K-0002UZ-27
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 15:23:56 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 o5-20020a17090a3d4500b001ef76490983so9078577pjf.2
 for <qemu-devel@nongnu.org>; Tue, 05 Jul 2022 12:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=fOvY76u/F+5DB1+4Nt29/GRra8LAvkjZAKoT2ttjc6Y=;
 b=sM+s2ktrJ3WUEV3843ObCRhgUCELogS8hSIEjdgETcg5eobHN/AcwwF1OSQ2Q/ptrP
 Rar1S58gOugmlK9AO/VS3b0bRdVrzC2knfn6lScgiaxktMiyWC3tQwxNj3aXrtDjgKZy
 l1RpM3EnID3RhDOoAyIUNyFqENBsfRcIevJwADlbY2m1loXayONMTOv2Yn/T1RB1wzJm
 MuO6JeehGo36uCvq6KaUskwc+qPMyksD0bEGQg+wwPiN7oiXUTj99mi7Vh4lXYubV+aj
 OKKBW1/5rMt4YpsPr/BYgV3JHpVZaJcBXKXgoFFF5qvFuyiaPwIXkpNU5paFldLnUCnK
 j7Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=fOvY76u/F+5DB1+4Nt29/GRra8LAvkjZAKoT2ttjc6Y=;
 b=vOMvjOYbCZNeQs/jRBRBIe5ydHLjbbtP8fA4Dds9Tk5rP09pYrcv8b33wIfU3G3IC4
 pSLGMF9wsVzRO51hLukyUH5pwt4Lkvy46LVXX6xgu6rPZRCsNcb8CD02J+Gw0CPCq428
 9S7QfPSAhwVuTkJR2kqWhM4q65eJy0sd66vcjSU0+XmhxwghfxRyPmXa9ziUwuMaqJXF
 viClzE9Egsua5hZ6ISFW1XxunPvVWweUr15EoV5G80iQxBvuF9LHCkPEop/snpfP4+UY
 UMI02ScTef2v6eCcpPFsyupLC0iQB7P0Uq+HF50K4yYBRubEtIB2MSjk72zvKwG2lk+T
 z2Gg==
X-Gm-Message-State: AJIora8o64glSxkg1cjCc+IMBERHB2u1I5MLuzwlZyAvZm3fxbeit0sf
 +iJqmqhbk0B9fInK8Xg/FdYQmQ==
X-Google-Smtp-Source: AGRyM1tPZiiCIpiI6LhWolm4hxh52FUeQoVwPQ5Olrhqfc7OZ1QYhOrcRsx9wEZ0dkLPofjmXR9N7w==
X-Received: by 2002:a17:90a:1485:b0:1ec:788e:a053 with SMTP id
 k5-20020a17090a148500b001ec788ea053mr42177274pja.16.1657049030032; 
 Tue, 05 Jul 2022 12:23:50 -0700 (PDT)
Received: from [192.168.1.100] ([198.8.77.157])
 by smtp.gmail.com with ESMTPSA id
 t13-20020a6549cd000000b0040ced958e8fsm22925047pgs.80.2022.07.05.12.23.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Jul 2022 12:23:49 -0700 (PDT)
Message-ID: <e9bbbeb5-c6b9-8d19-9593-b2c9187a5d98@kernel.dk>
Date: Tue, 5 Jul 2022 13:23:48 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2] io_uring: fix short read slow path
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>,
 Dominique Martinet <dominique.martinet@atmark-techno.com>
Cc: Stefano Garzarella <sgarzare@redhat.com>,
 Aarushi Mehta <mehta.aaru20@gmail.com>, Julia Suvorova <jusual@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Filipe Manana <fdmanana@kernel.org>, io-uring@vger.kernel.org
References: <20220629044957.1998430-1-dominique.martinet@atmark-techno.com>
 <20220630010137.2518851-1-dominique.martinet@atmark-techno.com>
 <20220630154921.ekl45dzer6x4mkvi@sgarzare-redhat>
 <Yr4pLwz5vQJhmvki@atmark-techno.com>
 <YsQ8aM3/ZT+Bs7nC@stefanha-x1.localdomain>
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <YsQ8aM3/ZT+Bs7nC@stefanha-x1.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=axboe@kernel.dk; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/5/22 7:28 AM, Stefan Hajnoczi wrote:
> On Fri, Jul 01, 2022 at 07:52:31AM +0900, Dominique Martinet wrote:
>> Stefano Garzarella wrote on Thu, Jun 30, 2022 at 05:49:21PM +0200:
>>>> so when we ask for more we issue an extra short reads, making sure we go
>>>> through the two short reads path.
>>>> (Unfortunately I wasn't quite sure what to fiddle with to issue short
>>>> reads in the first place, I tried cutting one of the iovs short in
>>>> luring_do_submit() but I must not have been doing it properly as I ended
>>>> up with 0 return values which are handled by filling in with 0 (reads
>>>> after eof) and that didn't work well)
>>>
>>> Do you remember the kernel version where you first saw these problems?
>>
>> Since you're quoting my paragraph about testing two short reads, I've
>> never seen any that I know of; but there's also no reason these couldn't
>> happen.
>>
>> Single short reads have been happening for me with O_DIRECT (cache=none)
>> on btrfs for a while, but unfortunately I cannot remember which was the
>> first kernel I've seen this on -- I think rather than a kernel update it
>> was due to file manipulations that made the file eligible for short
>> reads in the first place (I started running deduplication on the backing
>> file)
>>
>> The older kernel I have installed right now is 5.16 and that can
>> reproduce it --  I'll give my laptop some work over the weekend to test
>> still maintained stable branches if that's useful.
> 
> Hi Dominique,
> Linux 5.16 contains commit 9d93a3f5a0c ("io_uring: punt short reads to
> async context"). The comment above QEMU's luring_resubmit_short_read()
> claims that short reads are a bug that was fixed by Linux commit
> 9d93a3f5a0c.
> 
> If the comment is inaccurate it needs to be fixed. Maybe short writes
> need to be handled too.
> 
> I have CCed Jens and the io_uring mailing list to clarify:
> 1. Are short IORING_OP_READV reads possible on files/block devices?
> 2. Are short IORING_OP_WRITEV writes possible on files/block devices?

In general we try very hard to avoid them, but if eg we get a short read
or write from blocking context (eg io-wq), then io_uring does return
that. There's really not much we can do here, it seems futile to retry
IO which was issued just like it would've been from a normal blocking
syscall yet it is still short.

-- 
Jens Axboe


