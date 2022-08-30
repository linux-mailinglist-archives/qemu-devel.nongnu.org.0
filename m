Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1A55A678F
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Aug 2022 17:42:49 +0200 (CEST)
Received: from localhost ([::1]:40290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oT3Nz-0006ra-5t
	for lists+qemu-devel@lfdr.de; Tue, 30 Aug 2022 11:42:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oT3Da-0008De-Sj
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 11:32:01 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:34546)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oT3DV-0001IS-MP
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 11:31:58 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 p8-20020a17090ad30800b001fdfc8c7567so1535053pju.1
 for <qemu-devel@nongnu.org>; Tue, 30 Aug 2022 08:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=LGjbXhLsmvHrubO4TKvzcY8jbthiOjwwqeeXvBZOSlg=;
 b=QibcUH4vWwCVciOKkxL+Xei5NokNpekU3v7BY8vegPupOE03wF/wqlyxvUgDvWU+06
 a+fFEGyC7hEiFVr/UO/Acrq2goFcjyQdKSg5NQrSRCBrNuyrTYkKNY4oq4Bxc2T9LJyy
 e332hjQSMIqP2yx6QjA2aTezwI4V+mOslsQxvpy4Ew5QWPrGpe3rE5za5AgkO8CH0kO3
 1NwmqaERK+sCr8GrFmMnuBHEfr8+rFZefVORXVlU2+NJHlzsbcorLTfn4/DoLQdfFPHT
 vmF19Ych7SlxaqM5TGG1E4h7xpbOuPkJI9vZm/nApCo9ZLLDjDxFCBLa5iYf+ae1aXqD
 G/JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=LGjbXhLsmvHrubO4TKvzcY8jbthiOjwwqeeXvBZOSlg=;
 b=qjW8ZyuIBiz23/FgrQu0Ey6V1bBa/VkfvqYwpqm+gH92Jzq/RdoHdjwiox0STBYO3Z
 gfBUuogogiPkkXWyh4f91zz0GwS14Epj0pZJ2gU+o1juADaOG58oq7XDgHJeADpRPm/T
 AOrpeuNdq/elnTr3by8viP9/y0oLVVrg+JVQypuXhpyLug+FONWfQhb9FByOAURnNjP4
 4e7tqxSmkTuVNVUySJ4/jMOYUSNkYjp212cRpGq1vkGXVU41Qqt3ht2u5dvfbfLaIjyq
 MD3C5FMaoBfE+LZOLnkTUdfwDB95e7WFP7rMByb6xPy+fh367WThI+TyrriBDDqlHrNj
 9lBg==
X-Gm-Message-State: ACgBeo0Nuf9+993GR0+H502829b25+TzbtI2OtwILJSuuJciC68e4YjU
 pSNPjxHZph9f2Uq7qFerX9E+Vw==
X-Google-Smtp-Source: AA6agR4x7oajzHcwNTSVpQpLnMEPSN97cuX0aGgm5y7dz7qSWtqTgoBa0/LXZwKL6F5Kmi5TV+U59Q==
X-Received: by 2002:a17:90b:388e:b0:1fb:62c1:9cb7 with SMTP id
 mu14-20020a17090b388e00b001fb62c19cb7mr23376373pjb.207.1661873511126; 
 Tue, 30 Aug 2022 08:31:51 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.157.236])
 by smtp.gmail.com with ESMTPSA id
 n12-20020a170902d2cc00b001750b31faabsm2426001plc.262.2022.08.30.08.31.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Aug 2022 08:31:50 -0700 (PDT)
Message-ID: <56952aa9-823b-252b-33c3-7a7c5b31d2fc@linaro.org>
Date: Tue, 30 Aug 2022 08:31:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/2] util/log: add timestamp to logs via qemu_log()
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>,
 Dongli Zhang <dongli.zhang@oracle.com>
Cc: qemu-devel@nongnu.org, joe.jin@oracle.com, alex.bennee@linaro.org,
 f4bug@amsat.org
References: <20220829100622.1554-1-dongli.zhang@oracle.com>
 <20220829100622.1554-2-dongli.zhang@oracle.com> <87czcihts0.fsf@pond.sub.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <87czcihts0.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 8/30/22 04:09, Markus Armbruster wrote:
> Dongli Zhang <dongli.zhang@oracle.com> writes:
> 
>> The qemu_log is very helpful for diagnostic. Add the timestamp to the log
>> when it is enabled (e.g., "-msg timestamp=on").
>>
>> While there are many other places that may print to log file, this patch is
>> only for qemu_log(), e.g., the developer may add qemu_log/qemu_log_mask to
>> selected locations to diagnose QEMU issue.
> 
> Opinions on the new feature, anyone?
> 
>> Cc: Joe Jin <joe.jin@oracle.com>
>> Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>
>> ---
>> Please let me know if we should use 'error_with_guestname' as well.
>>
>>   util/log.c | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/util/log.c b/util/log.c
>> index d6eb037..f0a081a 100644
>> --- a/util/log.c
>> +++ b/util/log.c
>> @@ -129,8 +129,15 @@ void qemu_log(const char *fmt, ...)
>>   {
>>       FILE *f = qemu_log_trylock();
>>       if (f) {
>> +        gchar *timestr;
>>           va_list ap;
>>   
>> +        if (message_with_timestamp) {
>> +            timestr = real_time_iso8601();
>> +            fprintf(f, "%s ", timestr);
>> +            g_free(timestr);
>> +        }
>> +
>>           va_start(ap, fmt);
>>           vfprintf(f, fmt, ap);
>>           va_end(ap);
> 
> This extends -msg timestamp=on to apply to log messages without
> documenting it in -help or anywhere else.  Needs fixing.

I think this is a poor place to add the timestamp.

You'll find that qemu_log is used many times to assemble pieces, e.g.

linux-user/thunk.c:360:            qemu_log("%" PRIu64, tswap64(val));

linux-user/thunk.c:376:                qemu_log("\"");

linux-user/thunk.c:379:                qemu_log("[");

linux-user/thunk.c:384:                    qemu_log(",");

linux-user/thunk.c:391:                qemu_log("\"");

linux-user/thunk.c:393:                qemu_log("]");

linux-user/thunk.c:417:                qemu_log("{");

linux-user/thunk.c:420:                        qemu_log(",");

linux-user/thunk.c:424:                qemu_log("}");


Not the best idea, really, but the replacement for this is to avoid qemu_log entirely, and use

     f = qemu_log_trylock();
     if (f) {
         fprintf
         some
         stuff
         qemu_log_unlock(f);
     }

at which point you don't get your timestamp either.  You'd need to explicitly add 
timestamps to individual locations.

It would probably be easier to add timestamps to tracepoints, which are always emitted as 
a unit.


r~


