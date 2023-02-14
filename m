Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B8CC6964D7
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 14:40:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRvWx-0004v0-Pq; Tue, 14 Feb 2023 08:39:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pRvWw-0004us-E1
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 08:39:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pRvWu-0007Lp-TL
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 08:39:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676381972;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Him3I8vbAkMoYFPHzv+tVfCv85D48ZOGIdzzNaS2s2w=;
 b=Sp02orjzkWEOZ1n/zJlhkQ1Vxvdit8/t6sgJOopZAUSQNUzOsLqwGpIKzJ/MlPQdDyf0kC
 naMBVcQi04G4saLFJ/o5XZXMLPWX2tiPABpqJQrcA34PxW0P1USGAiggHoScBs9pYJULF9
 sZjGhzWjz9qpZjcdJT4o2/ThFvmGCrU=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-607-ZCQrjnX0OBeoLFJGA15tBA-1; Tue, 14 Feb 2023 08:39:30 -0500
X-MC-Unique: ZCQrjnX0OBeoLFJGA15tBA-1
Received: by mail-qt1-f199.google.com with SMTP id
 v8-20020a05622a144800b003ba0dc5d798so9407450qtx.22
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 05:39:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Him3I8vbAkMoYFPHzv+tVfCv85D48ZOGIdzzNaS2s2w=;
 b=VPfUPb3rQ1b8XYigepDYZ9ZKI72ZECcw+AL7tLq4rNZkIJ1mR90TUJDu5qH3+joDYL
 0WycUoy0jkV8rrOebyis0f1rqwxXB6rhOlp+6JMZkB05EqmfP6At7f6OgJs27vyoNe+G
 EuZDZY35C1wugLBYAW67gGYrwjv+fC7Nby8LI2JNMbWtEo8GSIOzWmYAhN5cFIkY1FFz
 2El4Yns04ZyPZX36svINmj8IeHEFxZPMojDC6Ux6RN4kS2Gv/3tjqimhrwI1REFjkrj1
 07tAN+sHKnMxkO2MBRV5jBtdqC+bSSkmflfpXznDhfzM+87oID2l7rTc1UnirgXaIawR
 LpPg==
X-Gm-Message-State: AO0yUKXFhh4XhFPKIu8uKoMe2pg0vB9dQ2qRY1EPb30KRk3mlTNr7D9F
 f6ZNp+9OKGvMZ4MRFBcZds1uankH5zpSJ2fYTj0TOC2oFQPaH+3XC2uXURayLJBGv54ox5wAWiq
 EsWqOLG8UL1puQKU=
X-Received: by 2002:a05:6214:246b:b0:56e:b124:156e with SMTP id
 im11-20020a056214246b00b0056eb124156emr4879412qvb.10.1676381970362; 
 Tue, 14 Feb 2023 05:39:30 -0800 (PST)
X-Google-Smtp-Source: AK7set/rfW35eu4Kt8f8gvbx9NL6Etzrlo8j5UfAteIHlhhULALe17gS6atPkuIVjjB0QFuPN5tAvw==
X-Received: by 2002:a05:6214:246b:b0:56e:b124:156e with SMTP id
 im11-20020a056214246b00b0056eb124156emr4879384qvb.10.1676381970104; 
 Tue, 14 Feb 2023 05:39:30 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-177-176.web.vodafone.de.
 [109.43.177.176]) by smtp.gmail.com with ESMTPSA id
 x133-20020a37638b000000b006e07228ed53sm11958022qkb.18.2023.02.14.05.39.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Feb 2023 05:39:29 -0800 (PST)
Message-ID: <ea791a1e-8f9c-ac64-8ff2-0d2d3fdb3f97@redhat.com>
Date: Tue, 14 Feb 2023 14:39:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 1/1] readline: fix hmp completion issue
Content-Language: en-US
To: Dongli Zhang <dongli.zhang@oracle.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>
Cc: dgilbert@redhat.com, joe.jin@oracle.com
References: <20230207045241.8843-1-dongli.zhang@oracle.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230207045241.8843-1-dongli.zhang@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.35, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 07/02/2023 05.52, Dongli Zhang wrote:
> Subject:
> [PATCH 1/1] readline: fix hmp completion issue
> From:
> Dongli Zhang <dongli.zhang@oracle.com>
> Date:
> 07/02/2023, 05.52
> 
> To:
> qemu-devel@nongnu.org
> CC:
> dgilbert@redhat.com, joe.jin@oracle.com
> 
> 
> The auto completion does not work in some cases.
> 
> Case 1.
> 
> 1. (qemu) info reg
> 2. Press 'Tab'.
> 3. It does not auto complete.
> 
> Case 2.
> 
> 1. (qemu) block_resize flo
> 2. Press 'Tab'.
> 3. It does not auto complete 'floppy0'.
> 
> Since the readline_add_completion_of() may add any completion when
> strlen(pfx) is zero, we remove the check with (name[0] == '\0') because
> strlen() always returns zero in that case.
> 
> Fixes: 52f50b1e9f8f ("readline: Extract readline_add_completion_of() from monitor")
> Cc: Joe Jin<joe.jin@oracle.com>
> Signed-off-by: Dongli Zhang<dongli.zhang@oracle.com>
> ---
>   monitor/hmp.c | 8 ++------
>   1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/monitor/hmp.c b/monitor/hmp.c
> index 2aa85d3982..fee410362f 100644
> --- a/monitor/hmp.c
> +++ b/monitor/hmp.c
> @@ -1189,9 +1189,7 @@ static void cmd_completion(MonitorHMP *mon, const char *name, const char *list)
>           }
>           memcpy(cmd, pstart, len);
>           cmd[len] = '\0';
> -        if (name[0] == '\0') {
> -            readline_add_completion_of(mon->rs, name, cmd);
> -        }
> +        readline_add_completion_of(mon->rs, name, cmd);
>           if (*p == '\0') {
>               break;
>           }
> @@ -1335,9 +1333,7 @@ static void monitor_find_completion_by_table(MonitorHMP *mon,
>               /* block device name completion */
>               readline_set_completion_index(mon->rs, strlen(str));
>               while ((blk = blk_next(blk)) != NULL) {
> -                if (str[0] == '\0') {
> -                    readline_add_completion_of(mon->rs, str, blk_name(blk));
> -                }
> +                readline_add_completion_of(mon->rs, str, blk_name(blk));
>               }
>               break;
>           case 's':
> -- 2.34.1
> 

Thanks, this fixes the completion for me, too:

Tested-by: Thomas Huth <thuth@redhat.com>


