Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7E66DD2DC
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 08:33:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pm7Z9-0005F3-8i; Tue, 11 Apr 2023 02:33:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pm7Yt-0005Dj-GY
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 02:33:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pm7Yr-0000Mt-V0
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 02:33:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681194781;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wp4/jJBNzm+WTRJZU0xSlcWLHfxOUEEufPpp+1wU2T0=;
 b=Gq7NVpHmxJU58KrVlnH71r/GyZO7JU0u+8WxbED8Y4mnrszzWoFc28r4nEP2lgVImLgg9g
 qkedbMEUJU+nqKeQ4BNhFVN5wA5HwbYjOKUCV03jNUaKjkEz/2cneGGIM3nMWOGB7GLpEL
 I3pQVUPT1+8gW6nkITgDP0iycIY/+FA=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-673-W0So25oNPO-IIFJvZ15NXw-1; Tue, 11 Apr 2023 02:32:59 -0400
X-MC-Unique: W0So25oNPO-IIFJvZ15NXw-1
Received: by mail-pj1-f72.google.com with SMTP id
 e8-20020a17090a4a0800b002466688af09so2217647pjh.7
 for <qemu-devel@nongnu.org>; Mon, 10 Apr 2023 23:32:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681194778; x=1683786778;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wp4/jJBNzm+WTRJZU0xSlcWLHfxOUEEufPpp+1wU2T0=;
 b=msWMqCL+nJVaafKRSxu/OSHzrpHQSZw7ZaD4Fi0hdCi3XwtEb7qSHEXK6gV2RCrnQB
 FnClf77R2nNRUkeCSR6TvRqz0kg9yF35b356lO+46GpJr6n8UrIKW2jko+AtANmsmQOp
 YuQLthCffalQY8Z5MVUd2eWHC1ZhePan7tvYjB2jLQM2Ds+HEUXS1MRFrmbfprhbB7hP
 b4sUHF3dEkIn+tUAEUKziDB8P1xA5T7UKC/KdxHV0oUShbkmFR19M/fsGV1byU7Ta/L9
 AMMiON4cuzrBeJW/XqXk5kTvFcVDZPG4ADwvN4eSk5zlLw2iFcRm1/kHLEGlDlInCij4
 PqCQ==
X-Gm-Message-State: AAQBX9e7Sv7IBUINrUHdmmUHtR7sfFQ1L+GM5CSUrUjAi6ToZ51Hh2va
 OM8R0AzgwGnTOMLvzXFfpwUiqWDRVtHaEtvcmFSaZT67Ruem1/hJ34bUxI+COJDDT3JBMwFg4Zl
 CEcd4KuOT+7ZmAEU=
X-Received: by 2002:a17:903:4101:b0:1a5:19bc:d70d with SMTP id
 r1-20020a170903410100b001a519bcd70dmr10389784pld.38.1681194778479; 
 Mon, 10 Apr 2023 23:32:58 -0700 (PDT)
X-Google-Smtp-Source: AKy350bYZw2RgfteHRQ08TxYvWZdjJRAjP5vqAnLeQGSwpVk9bNLQuUAhlnnPhKXWu0mARlqbvW5mA==
X-Received: by 2002:a17:903:4101:b0:1a5:19bc:d70d with SMTP id
 r1-20020a170903410100b001a519bcd70dmr10389769pld.38.1681194778120; 
 Mon, 10 Apr 2023 23:32:58 -0700 (PDT)
Received: from [10.72.12.112] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 x5-20020a634a05000000b0051afa49e07asm1893912pga.50.2023.04.10.23.32.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Apr 2023 23:32:57 -0700 (PDT)
Message-ID: <268c8128-d1cf-3103-b990-e92a2e69465f@redhat.com>
Date: Tue, 11 Apr 2023 14:32:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
Subject: Re: [PATCH] tap: fix net_init_tap() return code
Content-Language: en-US
To: Steven Sistare <steven.sistare@oracle.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
References: <1680624004-154390-1-git-send-email-steven.sistare@oracle.com>
 <9da71dfa-52b7-5b65-3160-6f236440add4@linaro.org>
 <4be85e27-0990-7ba9-60a1-45d53d63004e@oracle.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <4be85e27-0990-7ba9-60a1-45d53d63004e@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.246, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


在 2023/4/5 23:38, Steven Sistare 写道:
> On 4/4/2023 6:00 PM, Philippe Mathieu-Daudé wrote:
>> On 4/4/23 18:00, Steve Sistare wrote:
>>> When net_init_tap() succeeds for a multi-queue device, it returns a
>>> non-zero ret=1 code to its caller, because of this code where ret becomes
>> Indeed g_unix_set_fd_nonblocking() returns TRUE on success.
>>
>> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>
>>> 1 when g_unix_set_fd_nonblocking succeeds.  Luckily, the only current call
>>> site checks for negative, rather than non-zero.
>>>
>>>       ret = g_unix_set_fd_nonblocking(fd, true, NULL);
>>>       if (!ret) {
>>>           ...
>>>           goto free_fail;
>>>
>>> Also, if g_unix_set_fd_nonblocking fails (though unlikely), ret=0 is returned,
>>> and the caller will use a broken interface.
>> We should return -1 from free_fail, not trying to propagate 'ret':
> Thanks for the review.  I will add your "return -1" changes if Jason agrees.
>
> - Steve


Note that the "free_fail" label is kind of ambiguous. It is used even if 
we succeed if I was not wrong.

Thanks


>> -- >8 --
>> diff --git a/net/tap.c b/net/tap.c
>> index 1bf085d422..e59238bda0 100644
>> --- a/net/tap.c
>> +++ b/net/tap.c
>> @@ -821,3 +821,2 @@ int net_init_tap(const Netdev *netdev, const char *name,
>>       char ifname[128];
>> -    int ret = 0;
>>
>> @@ -896,3 +895,2 @@ int net_init_tap(const Netdev *netdev, const char *name,
>>                              "the number of vhostfds passed");
>> -                ret = -1;
>>                   goto free_fail;
>> @@ -904,3 +902,2 @@ int net_init_tap(const Netdev *netdev, const char *name,
>>               if (fd == -1) {
>> -                ret = -1;
>>                   goto free_fail;
>> @@ -908,4 +905,3 @@ int net_init_tap(const Netdev *netdev, const char *name,
>>
>> -            ret = g_unix_set_fd_nonblocking(fd, true, NULL);
>> -            if (!ret) {
>> +            if (!g_unix_set_fd_nonblocking(fd, true, NULL)) {
>>                   error_setg_errno(errp, errno, "%s: Can't use file descriptor %d",
>> @@ -918,3 +914,2 @@ int net_init_tap(const Netdev *netdev, const char *name,
>>                   if (vnet_hdr < 0) {
>> -                    ret = -1;
>>                       goto free_fail;
>> @@ -924,3 +919,2 @@ int net_init_tap(const Netdev *netdev, const char *name,
>>                              "vnet_hdr not consistent across given tap fds");
>> -                ret = -1;
>>                   goto free_fail;
>> @@ -934,3 +928,2 @@ int net_init_tap(const Netdev *netdev, const char *name,
>>                   error_propagate(errp, err);
>> -                ret = -1;
>>                   goto free_fail;
>> @@ -948,3 +941,3 @@ free_fail:
>>           g_free(vhost_fds);
>> -        return ret;
>> +        return -1;
>>       } else if (tap->helper) {
>> ---
>>
>>> Fixes: a8208626ba89.. ("net: replace qemu_set_nonblock()")
>>> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
>>> ---
>>>    net/tap.c | 4 ++--
>>>    1 file changed, 2 insertions(+), 2 deletions(-)


