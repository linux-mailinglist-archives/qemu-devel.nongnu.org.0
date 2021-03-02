Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C58329E27
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 13:17:16 +0100 (CET)
Received: from localhost ([::1]:52168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH3xj-00013U-7y
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 07:17:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lH3vy-0000EV-MF
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 07:15:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lH3vv-0007sE-S4
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 07:15:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614687320;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/bp3DFL30WRF3wDSWF2KCEoiinV/L3+z4wscnI585j8=;
 b=hDfV7/8W0/6LdIsEFvGJuMSbZqhr1x2IPNIOjbt+p3ITtpAgA7mF7tekTR3WfIvy5mrQ2T
 edPxsn0D+ljMrLfKeh5kLhj80fVlIuAdTnxV4vtuMKlujX8S3mcLf+G01/4RQYDz/+cTkr
 hG9pxm9qsjTk/jQ+Bw0mNFblfI+fZV8=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-532-8SrQNIYgMimYw3MI5JX8Zw-1; Tue, 02 Mar 2021 07:15:18 -0500
X-MC-Unique: 8SrQNIYgMimYw3MI5JX8Zw-1
Received: by mail-ed1-f69.google.com with SMTP id h2so5669373edw.10
 for <qemu-devel@nongnu.org>; Tue, 02 Mar 2021 04:15:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/bp3DFL30WRF3wDSWF2KCEoiinV/L3+z4wscnI585j8=;
 b=NUanYWzAH2hadKtG0yi4e2cNn08yrL9PtXq/qH08jhigPVWUCGNkSnBIczzU5NnwrE
 4451gT9OKr/roEHa/fS2ErjQPE0uEpIUuVHX1RjkrRmvdJ04XS3DZEiqA0qdsPgCQyqx
 ZR6W4eeUXRVP5TPOm7st9Z9nNFmN133bbvxHyBhtaUNSlj2BkoailXsuEw1Yu62Vou8v
 vOA+Ti5osX4dkNoWSXErT6yHF3CPjdkgDHUCjxc0gA3HXVhMLQFFpa1XABjfYQ9oOyJe
 vtpdZVNrDGb7JvCSz4vJrtrGmY5sKHi2LfIjoNOeU2ZM2514+1x9S0Cxe7rZvZqskczU
 xbqw==
X-Gm-Message-State: AOAM531ZOzWmzMstrig5Iuza/4epjU1Dl2Tn+9dcHN86K7xMITIokULO
 Yns9kapBkjbpsf23j1UszPus+qd9DszI71Z1bKI6Y1XIyyJdcVZkpRCzESOKvB/dvnM0m35AgAG
 n135ar3HauiMa3B2cydseBU9c6OHjn4ydLMqbQCwKf9i3KEH+Jun+EVN9393U+F73wec=
X-Received: by 2002:a05:6402:1d1a:: with SMTP id
 dg26mr13676501edb.266.1614687316959; 
 Tue, 02 Mar 2021 04:15:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx638+Crvr+mQmGFeWnLjdneJtZhk1tn8YxYWenc5x7Yn4keDvpMXW+wdLGs5UAxYj7T9DBIg==
X-Received: by 2002:a05:6402:1d1a:: with SMTP id
 dg26mr13676484edb.266.1614687316690; 
 Tue, 02 Mar 2021 04:15:16 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id u13sm892187ejy.31.2021.03.02.04.15.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Mar 2021 04:15:16 -0800 (PST)
Subject: Re: [PATCH] chardev: add nodelay option
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210302110444.39084-1-pbonzini@redhat.com>
 <b5c10844-83e7-9fb5-0197-4ba5f7f343cb@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <c4413f53-7d5e-5c94-fcd7-2ec86e98f5ce@redhat.com>
Date: Tue, 2 Mar 2021 13:15:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <b5c10844-83e7-9fb5-0197-4ba5f7f343cb@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02/03/21 12:33, Philippe Mathieu-Daudé wrote:
> On 3/2/21 12:04 PM, Paolo Bonzini wrote:
>> The "delay" option was introduced as a way to enable Nagle's algorithm
>> with ",nodelay".  Since the short form for boolean options has now been
>> deprecated, introduce a more properly named "nodelay" option.  The "delay"
>> option remains as an undocumented option.
>>
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>> ---
>>   chardev/char-socket.c |  9 +++++++--
>>   gdbstub.c             |  2 +-
>>   qemu-options.hx       | 14 +++++++-------
>>   3 files changed, 15 insertions(+), 10 deletions(-)
>>
>> diff --git a/chardev/char-socket.c b/chardev/char-socket.c
>> index 06a37c0cc8..73a7afe5a0 100644
>> --- a/chardev/char-socket.c
>> +++ b/chardev/char-socket.c
>> @@ -1472,8 +1472,13 @@ static void qemu_chr_parse_socket(QemuOpts *opts, ChardevBackend *backend,
>>       sock = backend->u.socket.data = g_new0(ChardevSocket, 1);
>>       qemu_chr_parse_common(opts, qapi_ChardevSocket_base(sock));
>>   
>> -    sock->has_nodelay = qemu_opt_get(opts, "delay");
>> -    sock->nodelay = !qemu_opt_get_bool(opts, "delay", true);
>> +    sock->has_nodelay =
>> +        qemu_opt_get(opts, "delay") ||
>> +        qemu_opt_get(opts, "nodelay");
>> +    sock->nodelay =
>> +        !qemu_opt_get_bool(opts, "delay", true) ||
>> +        qemu_opt_get_bool(opts, "nodelay", false);
> 
> Should we add a deprecation note to remember to remove this later,
> or do we want to keep it infinitely? Then a comment here would be
> useful.

We cannot deprecate it only when options like -serial start warning for 
short-form boolean options (which I was going to propose for 6.1).  We 
probably also don't want a warning like "Please use delay=off instead"; 
suggesting "nodelay=on" would be an improvement (though an ugly one).

So the plan could be:

6.0: add "nodelay", deprecate -chardev short-form boolean options
6.1: deprecate "delay" and -serial short-form boolean options
6.2: some options (-M/-accel) start rejecting short-form boolean options
6.3: remove "delay"

Paolo


