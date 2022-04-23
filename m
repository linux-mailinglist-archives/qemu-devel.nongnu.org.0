Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B33850C769
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Apr 2022 06:35:56 +0200 (CEST)
Received: from localhost ([::1]:52966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ni7Ux-0007r4-5i
	for lists+qemu-devel@lfdr.de; Sat, 23 Apr 2022 00:35:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1ni7T5-0006To-22; Sat, 23 Apr 2022 00:33:59 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:37660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1ni7T3-0003ua-2Y; Sat, 23 Apr 2022 00:33:58 -0400
Received: by mail-pl1-x634.google.com with SMTP id b12so258196plg.4;
 Fri, 22 Apr 2022 21:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:from:subject:to:cc
 :references:content-language:in-reply-to:content-transfer-encoding;
 bh=lcxNcqyHxbWm+oYUvlOFTcvgallnXcuKpe50x99WZsg=;
 b=j3qnrhA7PC1ACA3HzlemyuDncLu1Ptbgillw9fypGskoiikHakuBWUVARGqmdpZzJy
 GXOXoUXU0sZEtr/2WDFxjVAWwhixzmhmaYxCE3b0lI3/pGvpbGC1pqLg47T8gOawSowZ
 kzImvnt+aeJCtxZdnTIxtEBDX7K7Atm607L5OgjjAUCHR+uysZltTMdf+aTwqJq8DD5k
 ccYJ6xN2Wpk+ZOVngwIcY529sELwpgA5pg4dkNEZ5JmxGwtrXTjjBSTBii5LrtcUTKlQ
 qx7eugSa+OZ6xfENvNvDTQFRtm+E2l5b6MqW7MqO8PFZjdob3rVKeK5NzsD9APSIRCuJ
 jbhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:from
 :subject:to:cc:references:content-language:in-reply-to
 :content-transfer-encoding;
 bh=lcxNcqyHxbWm+oYUvlOFTcvgallnXcuKpe50x99WZsg=;
 b=KRafaDGs6Vw/8NxvwaqCO1Rnl4j6zXvfWzfKXpvRxeONWdui/lfEOfEQkn5TMtfcRL
 rvcdQ5hoM1uVG2NP6jsZOxuT8YBSc4TSe3mjCWVNIDwwIv/rSI+l51pEBARQM3Ti0cSI
 QZ5qv6cJ//ctiLn+OL0WpkDpvjhLPQLM4A2WXX574Axys2XGeOMGwCRUwoMl4QIfH4is
 BT5eMWJlQGxeGhvSUeKH0m6t/o2nRJ4TxGPbzaz11meUk1VNuVWiaPXf0tV2bVciS44q
 K2spOfvd7s9ywDiTSX/blVmlraAY5fi9/ZOx5FmTiltp9LPDB69QJbi5Ql4FjzrQBT6B
 NqLw==
X-Gm-Message-State: AOAM533scv8y7Z1U82lIOaLoa2bIgSH/VZNbZVYPyvakLJicaFpNXidg
 dkN7o1DM/KpZXrTCcolcY0Y=
X-Google-Smtp-Source: ABdhPJycZlw9ERNX7sFObz5IUP51R2Do98l+kTh1SIFWXYRBg3n9yCR/lj8cZnrow4YOM5sjDP0Xeg==
X-Received: by 2002:a17:90b:4c42:b0:1d2:8eeb:108 with SMTP id
 np2-20020a17090b4c4200b001d28eeb0108mr9148468pjb.113.1650688434494; 
 Fri, 22 Apr 2022 21:33:54 -0700 (PDT)
Received: from [192.168.66.3] (p912131-ipoe.ipoe.ocn.ne.jp. [153.243.13.130])
 by smtp.gmail.com with ESMTPSA id
 b7-20020a17090aa58700b001d92e2e5694sm624753pjq.1.2022.04.22.21.33.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Apr 2022 21:33:53 -0700 (PDT)
Message-ID: <eafd4bbf-dbff-323a-179f-8f29905701e1@gmail.com>
Date: Sat, 23 Apr 2022 13:33:50 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
From: Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: Re: [PATCH v2 2/5] 9pfs: fix qemu_mknodat(S_IFSOCK) on macOS
To: Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org
References: <cover.1650553693.git.qemu_oss@crudebyte.com>
 <f6d632fc82d4750b73c83a2f1d1b9972cf3e26bb.1650553693.git.qemu_oss@crudebyte.com>
 <73163b9a-bd8a-8cf1-42a1-0e4c88edfa0e@gmail.com> <1750044.XWheshbc2e@silver>
Content-Language: en-US
In-Reply-To: <1750044.XWheshbc2e@silver>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pl1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Keno Fischer <keno@juliacomputing.com>,
 Michael Roitzsch <reactorcontrol@icloud.com>, Will Cohen <wwcohen@gmail.com>,
 Greg Kurz <groug@kaod.org>, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2022/04/22 23:06, Christian Schoenebeck wrote:
> On Freitag, 22. April 2022 04:43:40 CEST Akihiko Odaki wrote:
>> On 2022/04/22 0:07, Christian Schoenebeck wrote:
>>> mknod() on macOS does not support creating sockets, so divert to
>>> call sequence socket(), bind() and chmod() respectively if S_IFSOCK
>>> was passed with mode argument.
>>>
>>> Link: https://lore.kernel.org/qemu-devel/17933734.zYzKuhC07K@silver/
>>> Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
>>> Reviewed-by: Will Cohen <wwcohen@gmail.com>
>>> ---
>>>
>>>    hw/9pfs/9p-util-darwin.c | 27 ++++++++++++++++++++++++++-
>>>    1 file changed, 26 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/hw/9pfs/9p-util-darwin.c b/hw/9pfs/9p-util-darwin.c
>>> index e24d09763a..39308f2a45 100644
>>> --- a/hw/9pfs/9p-util-darwin.c
>>> +++ b/hw/9pfs/9p-util-darwin.c
>>> @@ -74,6 +74,27 @@ int fsetxattrat_nofollow(int dirfd, const char
>>> *filename, const char *name,>
>>>     */
>>>    
>>>    #if defined CONFIG_PTHREAD_FCHDIR_NP
>>>
>>> +static int create_socket_file_at_cwd(const char *filename, mode_t mode) {
>>> +    int fd, err;
>>> +    struct sockaddr_un addr = {
>>> +        .sun_family = AF_UNIX
>>> +    };
>>> +
>>> +    fd = socket(PF_UNIX, SOCK_DGRAM, 0);
>>> +    if (fd == -1) {
>>> +        return fd;
>>> +    }
>>> +    snprintf(addr.sun_path, sizeof(addr.sun_path), "./%s", filename);
>>
>> It would result in an incorrect path if the path does not fit in
>> addr.sun_path. It should report an explicit error instead.
> 
> Looking at its header file, 'sun_path' is indeed defined on macOS with an
> oddly small size of only 104 bytes. So yes, I should explicitly handle that
> error case.
> 
> I'll post a v3.
> 
>>> +    err = bind(fd, (struct sockaddr *) &addr, sizeof(addr));
>>> +    if (err == -1) {
>>> +        goto out;
>>
>> You may close(fd) as soon as bind() returns (before checking the
>> returned value) and eliminate goto.
> 
> Yeah, I thought about that alternative, but found it a bit ugly, and probably
> also counter-productive in case this function might get extended with more
> error pathes in future. Not that I would insist on the current solution
> though.

I'm happy with the explanation. Thanks.

> 
>>> +    }
>>> +    err = chmod(addr.sun_path, mode);
>>
>> I'm not sure if it is fine to have a time window between bind() and
>> chmod(). Do you have some rationale?
> 
> Good question. QEMU's 9p server is multi-threaded; all 9p requests come in
> serialized and the 9p server controller portion (9p.c) is only running on QEMU
> main thread, but the actual filesystem driver calls are then dispatched to
> QEMU worker threads and therefore running concurrently at this point:
> 
> https://wiki.qemu.org/Documentation/9p#Threads_and_Coroutines
> 
> Similar situation on Linux 9p client side: it handles access to a mounted 9p
> filesystem concurrently, requests are then serialized by 9p driver on Linux
> and sent over wire to 9p server (host).
> 
> So yes, there might be implications by that short time windows. But could that
> be exploited on macOS hosts in practice?
> 
> The socket file would have mode srwxr-xr-x for a short moment.
> 
> For security_model=mapped* this should not be a problem.
> 
> For security_model=none|passhrough, in theory, maybe? But how likely is that?
> If you are using a Linux client for instance, trying to brute-force opening
> the socket file, the client would send several 9p commands (Twalk, Tgetattr,
> Topen, probably more). The time window of the two commands above should be
> much smaller than that and I would expect one of the 9p commands to error out
> in between.
> 
> What would be a viable approach to avoid this issue on macOS?

It is unlikely that a naive brute-force approach will succeed to 
exploit. The more concerning scenario is that the attacker uses the 
knowledge of the underlying implementation of macOS to cause resource 
contention to widen the window. Whether an exploitation is viable 
depends on how much time you spend digging XNU.

However, I'm also not sure if it really *has* a race condition. Looking 
at v9fs_co_mknod(), it sequentially calls s->ops->mknod() and 
s->ops->lstat(). It also results in an entity called "path name based 
fid" in the code, which inherently cannot identify a file when it is 
renamed or recreated.

If there is some rationale it is safe, it may also be applied to the 
sequence of bind() and chmod(). Can anyone explain the sequence of 
s->ops->mknod() and s->ops->lstat() or path name based fid in general?

Regards,
Akihiko Odaki

> 
>>> +out:
>>> +    close(fd);
>>> +    return err;
>>> +}
>>> +
>>>
>>>    int qemu_mknodat(int dirfd, const char *filename, mode_t mode, dev_t
>>>    dev)
>>>    {
>>>    
>>>        int preserved_errno, err;
>>>
>>> @@ -93,7 +114,11 @@ int qemu_mknodat(int dirfd, const char *filename,
>>> mode_t mode, dev_t dev)>
>>>        if (pthread_fchdir_np(dirfd) < 0) {
>>>        
>>>            return -1;
>>>        
>>>        }
>>>
>>> -    err = mknod(filename, mode, dev);
>>> +    if (S_ISSOCK(mode)) {
>>> +        err = create_socket_file_at_cwd(filename, mode);
>>> +    } else {
>>> +        err = mknod(filename, mode, dev);
>>> +    }
>>>
>>>        preserved_errno = errno;
>>>        /* Stop using the thread-local cwd */
>>>        pthread_fchdir_np(-1);
> 
> 


