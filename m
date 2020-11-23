Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3BA2C0374
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 11:40:40 +0100 (CET)
Received: from localhost ([::1]:37786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kh9Gv-0008IZ-Ht
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 05:40:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kh9G9-0007rn-KK
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 05:39:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60178)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kh9G6-0004O6-34
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 05:39:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606127984;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c22B5trcV0fuvgADegst8mXXC+MI+643TKjHDAtBk4E=;
 b=F4ThZRApiWJI8PQhrmKAuWEliSBNllGMr3rbvoKdnrVoMdEhs/HI+sstshEvDdLo3myv9s
 bOHXLqfqSwf0mepEMgRn6sXlQnZmSutQIUNr2XOdJE77dAmR4LtAWEwepqbw4mnIO3me/m
 KVvnMmzFXOJS+tU1Xe/DayKHoKkohJE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-534-7P2riB19P8G4bEz1ARW78w-1; Mon, 23 Nov 2020 05:39:40 -0500
X-MC-Unique: 7P2riB19P8G4bEz1ARW78w-1
Received: by mail-wr1-f72.google.com with SMTP id w5so5690474wrm.22
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 02:39:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=c22B5trcV0fuvgADegst8mXXC+MI+643TKjHDAtBk4E=;
 b=MzkSk0duY2aayekovggsu8w2NbwIlp2nDo3LohAohaL/oyhsTm9+URhBD9Nos60OQh
 zj/RTpIfJu+JZ3fe1O4QIYlSqu8K1fD4PIjxKbdMWPB7zE9E9UTpo4Or3gglxXiE8gCH
 eVWTEH8wXhs+T1iWHTZzqm3byd5uh2Zns9cCA/f2w30EdcDJNtflt2GRvXuc1j+2CVVx
 mGJhTjO+w1WHNpT2NxO2TV+PSYFQUHYbFw3bdY80NK02/V6pvEXpDqtY2TP4j4kOwunV
 tF6Lm6njaUsj0UAm44Qi9p180U1GVDZ7ahF4CzWILPsQgCMWs0KC4U/Q+ILKQxolbZtD
 /pcg==
X-Gm-Message-State: AOAM532XEL1E3A2C0oyQ9ouOBJ504T6w/NbgqOVA2nXXDfEEMNW01qlQ
 5cr0TbWtMa2qFsLn+OYpoQtrW2vwONCHCz2b83sCgbPlsX7SfStxhkn8MtYFQkajmOMEJYmb4hu
 eHEKKeCA2gqG4hVs=
X-Received: by 2002:adf:ea47:: with SMTP id j7mr29664564wrn.126.1606127978748; 
 Mon, 23 Nov 2020 02:39:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy0aiobPivhfqB0wKix9myK/7zyNdR8b3WfwQCPz3Wq8I7HcQk6rqmw66A9C5i87oaZJQxg8Q==
X-Received: by 2002:adf:ea47:: with SMTP id j7mr29664539wrn.126.1606127978503; 
 Mon, 23 Nov 2020 02:39:38 -0800 (PST)
Received: from [192.168.1.36] (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id d3sm17989630wre.91.2020.11.23.02.39.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Nov 2020 02:39:37 -0800 (PST)
Subject: Re: [PATCH] gdbstub: Correct misparsing of vCont C/S requests
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20201121210342.10089-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <857fd287-3a1f-3d27-2b5b-f1abd8427bb2@redhat.com>
Date: Mon, 23 Nov 2020 11:39:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201121210342.10089-1-peter.maydell@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/21/20 10:03 PM, Peter Maydell wrote:
> In the vCont packet, two of the command actions (C and S) take an
> argument specifying the signal to be sent to the process/thread, which is
> sent as an ASCII string of two hex digits which immediately follow the
> 'C' or 'S' character.
> 
> Our code for parsing this packet accidentally skipped the first of the
> two bytes of the signal value, because it started parsing the hex string
> at 'p + 1' when the preceding code had already moved past the 'C' or
> 'S' with "cur_action = *p++".
> 
> This meant that we would only do the right thing for signals below
> 10, and would misinterpret the rest.  For instance, when the debugger
> wants to send the process a SIGPROF (27 on x86-64) we mangle this into
> a SIGSEGV (11).
> 
> Remove the accidental double increment.
> 
> Fixes: https://bugs.launchpad.net/qemu/+bug/1773743

Eventually more precise using:

Fixes: 544177ad1cf ("gdbstub: Fix vCont behaviour")
Buglink: https://bugs.launchpad.net/qemu/+bug/1773743

> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Haven't really given this enough testing to want to put it into 5.2,
> I think (though it does fix the repro in the bug report).
> The bug has been present since commit 544177ad1cfd78 from 2017.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

I am not against having it fixed for 5.2 (trivial fix,
reporter can use sigprof again).

Thanks for the fix!

Phil.

> 
>  gdbstub.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/gdbstub.c b/gdbstub.c
> index f19f98ab1ab..d99bc0bf2ea 100644
> --- a/gdbstub.c
> +++ b/gdbstub.c
> @@ -1243,7 +1243,7 @@ static int gdb_handle_vcont(const char *p)
>          cur_action = *p++;
>          if (cur_action == 'C' || cur_action == 'S') {
>              cur_action = qemu_tolower(cur_action);
> -            res = qemu_strtoul(p + 1, &p, 16, &tmp);
> +            res = qemu_strtoul(p, &p, 16, &tmp);
>              if (res) {
>                  goto out;
>              }
> 


