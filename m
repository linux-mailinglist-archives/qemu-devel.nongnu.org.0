Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8677B5FDD5E
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 17:44:33 +0200 (CEST)
Received: from localhost ([::1]:48394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oj0Ns-0003ZI-ER
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 11:44:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oj0Ke-0008NO-7w
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 11:41:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57757)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oj0Ka-0005kY-PH
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 11:41:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665675668;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PG93ggOtJmIXOV/xHvBiK06/sv7Beq9bICgdpukDh1k=;
 b=ZMz2evkLVPdw2sYEe4CXGaS9lJ4S8SY3X998sS6ilp2OZcmjXGk5nZfSJL1vki7CowJJGL
 QB54ZJNp8LSfUN6xNgPuCWzcP+shV52XkMXfavU+qH9j2CkuPSul3PG1t+bYLrbQr4DXod
 iOwFM4jwI7SHKboVhJitUmP6gBxQB1w=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-116-a-Nz-Tf5NumBhIcdgKhIVw-1; Thu, 13 Oct 2022 11:41:06 -0400
X-MC-Unique: a-Nz-Tf5NumBhIcdgKhIVw-1
Received: by mail-ej1-f71.google.com with SMTP id
 dt13-20020a170907728d00b007825956d979so1097811ejc.15
 for <qemu-devel@nongnu.org>; Thu, 13 Oct 2022 08:41:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PG93ggOtJmIXOV/xHvBiK06/sv7Beq9bICgdpukDh1k=;
 b=qAjEwiz2rUXnS38uRBgrFkCH9GaDUG1lIkpBVEoz7I1/xgjSe7IjX9m1ym9b0ZkWAS
 s6cVtFm77+BdBGzxuMim27w0p0pZHDs3KST9bNhOShlS2u2503Opxo4t9M+QWOxu0JIj
 uUuljkivHsq5JA9p7xyqU3yd7DF2UyGaDdzMv8o7qFRhOoX23Z+qZdKAqkw66Z3Nlnpj
 W2ryFP+6itX/300tuFPlXYgegIsziK4WFU1W4456+JfkhSMlQ6VQvYWUgz3mxL/vLcUY
 Ml0sbS4W5CdxNMxXamxLoVQ/sxFNYBMxd7Me39Ro5muMBw+wrbMfPUsZDDb5mEGKCRmJ
 dmkA==
X-Gm-Message-State: ACrzQf0ZJzz0ST11qD6LYSdyNKkyeHoLaERxPF7QizdR2AXRUCSRJzED
 0H4WQn7wZyyT1PQH4r190aLejFD+N0OITaROznrwfE4S64+S82cX8Q8xwPV3FRaId/9RK5W+n5h
 T6LSCplahB/UxRyI=
X-Received: by 2002:a17:907:9707:b0:78d:45d1:487e with SMTP id
 jg7-20020a170907970700b0078d45d1487emr271841ejc.566.1665675665258; 
 Thu, 13 Oct 2022 08:41:05 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7uHkpp4g2IWAB4YHg0019Yq9pXWCg9kmrATKDwVCCnmCr+V7YEFDJUhhATEx8oqeSHjTrgbQ==
X-Received: by 2002:a17:907:9707:b0:78d:45d1:487e with SMTP id
 jg7-20020a170907970700b0078d45d1487emr271829ejc.566.1665675665020; 
 Thu, 13 Oct 2022 08:41:05 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:1c09:f536:3de6:228c?
 ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.googlemail.com with ESMTPSA id
 k13-20020a17090627cd00b0077826b92d99sm57922ejc.12.2022.10.13.08.41.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Oct 2022 08:41:04 -0700 (PDT)
Message-ID: <ae19fc6f-7ff8-87a7-345e-38c0e864f9d1@redhat.com>
Date: Thu, 13 Oct 2022 17:41:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH] blkdebug: ignore invalid rules in non-coroutine context
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, qemu-block@nongnu.org
References: <20221013093523.586361-1-pbonzini@redhat.com>
 <87a660yosv.fsf@pond.sub.org>
 <a6e941b0-ce20-916b-7ea1-d575056d8282@redhat.com>
 <878rljyhs4.fsf@pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <878rljyhs4.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.25, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 10/13/22 15:28, Markus Armbruster wrote:
> Let's have another look at the remaining patch hunk:
> 
>      @@ -858,7 +864,12 @@ static void blkdebug_debug_event(BlockDriverState *bs, BlkdebugEvent event)
>           }
> 
>           while (actions_count[ACTION_SUSPEND] > 0) {
>      -        qemu_coroutine_yield();
>      +        if (qemu_in_coroutine()) {
>      +            qemu_coroutine_yield();
>      +        } else {
>      +            error_report("Non-coroutine event %s cannot suspend\n",
>      +                         BlkdebugEvent_lookup.array[event]);
>      +        }
>               actions_count[ACTION_SUSPEND]--;
>           }
>       }
> 
> If I understand this correctly, the user asked us to suspend, but it now
> turns out suspend doesn't make sense, so we ignore the request.
> Correct?

Yes.

> warn_report()?  info_report()?

Sure, warn_report() can work too.

Paolo


