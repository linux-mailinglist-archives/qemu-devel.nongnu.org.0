Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AA0335A462
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 19:08:13 +0200 (CEST)
Received: from localhost ([::1]:46372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUuc8-0003tq-GP
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 13:08:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lUuaw-0003ER-BV
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 13:06:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31166)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lUuat-00056u-Pn
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 13:06:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617988014;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XJT12KVw9rziZuqAJt0aP4r3C5VAodzDdHQMFcHp6fw=;
 b=b31oeq4Tp5soJHeouXoxR9/FJ0zvv2rPAHnd3sA3bIiJsdLUtJhdD83SNllOEVcIjFRjZy
 8nVwW4c9yBKCAH0EZK0yPFcbQpOzCXUd0jtigtu0K+Kc9VdWtZ0BWkpJsA9/aETzkxdWzU
 f5sOUGQnoDE5UzcfU4qTM4nmZGhBiLg=
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
 [209.85.161.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-416-rmQByYG8OLCN8CcDH_-OPQ-1; Fri, 09 Apr 2021 13:06:52 -0400
X-MC-Unique: rmQByYG8OLCN8CcDH_-OPQ-1
Received: by mail-oo1-f70.google.com with SMTP id p23so2736061oov.9
 for <qemu-devel@nongnu.org>; Fri, 09 Apr 2021 10:06:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XJT12KVw9rziZuqAJt0aP4r3C5VAodzDdHQMFcHp6fw=;
 b=ZFnEkBNgX9UKhGbmlCWaGRnXP9N46Np1Ire0dS1MnIMs08EnvK77EhFmTx2Fdyb0hY
 8Fnom6U/boCChLvW8Clvd6zFD631cl0q4FBttRh1YCJsqtqII/HI7D1Js6HrlyXngiJW
 wTSH128WdPnDhvHYT/6XCgkY4OIpMhws/aAghU88rsBEiOCgzKcfNwroHrGlWlBi559p
 O3e89IhBFFvT3pnqqEIKiuMrVDIyVe0/+/j8nDHtQiXglRyGqrV+O/d0LLI47rrxOOvL
 1WuBYG90LMPH3fc2/q5yKzMbJonw0szbGZUN9JH/8dhIYXbiUP5jA1c5cCsAn3KOpYLy
 pVfg==
X-Gm-Message-State: AOAM530WSdfvC24ThaACZwfh3x7kGDBtVlV4DTAEchzrIq2HkWR9B2aq
 bwDabsuv+zLDlOmi90LYKQZRjNt1kouubGv91pImd3I1bbCOgAb/d3fame1ulZyYSm9mRM5A8uQ
 j23Lqfml+fw/dVcU=
X-Received: by 2002:a4a:304a:: with SMTP id z10mr12791412ooz.26.1617988012001; 
 Fri, 09 Apr 2021 10:06:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw4nH1zKBg69P+Cxp0tKURCRITQqacNSbsr3Cj420nH9fY00O5kZMe6xYs6HVc/+2rMCZGaHw==
X-Received: by 2002:a4a:304a:: with SMTP id z10mr12791396ooz.26.1617988011800; 
 Fri, 09 Apr 2021 10:06:51 -0700 (PDT)
Received: from [192.168.0.173] (ip68-103-222-6.ks.ok.cox.net. [68.103.222.6])
 by smtp.gmail.com with ESMTPSA id
 v195sm628243oia.38.2021.04.09.10.06.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Apr 2021 10:06:51 -0700 (PDT)
Subject: Re: General question about parsing an rbd filename
To: Markus Armbruster <armbru@redhat.com>
References: <b0c867e5-6ad7-f5e4-ecff-676b3b235995@redhat.com>
 <87wntbfs7x.fsf@dusky.pond.sub.org>
From: Connor Kuehl <ckuehl@redhat.com>
Message-ID: <41af7fc7-a9d5-a299-199e-ec789f7ad47c@redhat.com>
Date: Fri, 9 Apr 2021 12:06:50 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <87wntbfs7x.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ckuehl@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ckuehl@redhat.com;
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
Cc: kwolf@redhat.com, dillaman@redhat.com, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/9/21 9:27 AM, Markus Armbruster wrote:
> Connor Kuehl <ckuehl@redhat.com> writes:
>> block/rbd.c hints that:
>>
>>>   * Configuration values containing :, @, or = can be escaped with a
>>>   * leading "\".
>>
>> Right now, much of the parsing code will allow anyone to escape
>> _anything_ so long as it's preceded by '\'.
>>
>> Is this the intended behavior? Or should the parser be updated to
>> allow escaping only certain sequences.
> 
> I can't answer this question, but perhaps I can get us a bit closer to
> an answer.
> 
> The commend you quoted in part is about "rbd:" pseudo-filenames.
> 
> By "parsing code", you probably mean qemu_rbd_parse_filename().  It uses
> qemu_rbd_next_tok() to split off one part after the other, stopping at a
> special delimiter character, and qemu_rbd_unescape() to unescape most,
> but not all parts.
> 
> Both treat '\' followed by a character other than '\0' specially.
> qemu_rbd_next_tok() doesn't stop at an escaped delimiter character.
> qemu_rbd_unescape() unescapes escaped characters.
> 
> I believe the comment you quoted is basically trying to say "to use a
> character that would normally be a delimiter, escape it with '\'".  It
> doesn't say these are the only characters you may escape.

I agree with your interpretation here.

> Not unescaping some parts feels iffy to me.

I wonder if my reading of it placed too much emphasis on the 
"Configuration values" part of it, which I understand to be the optional 
key,value pairs that come after the image name.

Thank you,

Connor


