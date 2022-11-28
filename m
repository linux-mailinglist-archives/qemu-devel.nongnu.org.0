Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D7E263A4B6
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 10:21:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozaJA-0003G3-Js; Mon, 28 Nov 2022 04:20:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ozaJ3-0003FN-UD
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 04:20:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ozaJ1-0003qP-LN
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 04:20:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669627202;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zcoze7YBifLrZZXm0zf6vAyD/1iOC73/bgtC8QDj0ys=;
 b=JC9QpoJHtwFGQAF1OLAHngRnt/P2CzvqfhCtsgAhInE6cUU1ATkS2MOqh411L8e9jZkIyF
 ojVVLrG+GEh3cvm2rGFbFGYrIh6Q/OnKg615r+LP8scCHUkm/cnRNIBqC2t5q145WWcq2x
 2tPKRso6sZXQkhyNBbyMjMBd0ZxS2sM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-331-daNyaGnGNB-FP1_q4i8gIA-1; Mon, 28 Nov 2022 04:20:00 -0500
X-MC-Unique: daNyaGnGNB-FP1_q4i8gIA-1
Received: by mail-wm1-f71.google.com with SMTP id
 c126-20020a1c3584000000b003cfffcf7c1aso8362328wma.0
 for <qemu-devel@nongnu.org>; Mon, 28 Nov 2022 01:20:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zcoze7YBifLrZZXm0zf6vAyD/1iOC73/bgtC8QDj0ys=;
 b=H2UCbc1mXv5HBhytTcM8Q/cS6d8lpirw4I+TO/RFqRHNPAAVQeqfoIwkkMRuaukiS3
 ywCxvMzMdqHJv9nnSbcL8xa0847d40+GVBLnstwJ6x6jcxJE0NoYzMRA+l1idZHAmLsc
 N2XW3NYP9yapRRUrmfL69aTPU4ZPb1MwzgFdBSrkTERDFeYLaRtNLmZSZCBOAy2bqIf3
 ONQFb18Ynak/95rYnSd1RkETbp7bsLInkaSLnzOpRfwkgdCJ3Vei4woIp/R6kzmqiDx0
 fr6bYaK9W0jIbJ4pic+Os5szPyG/kNNW7piASZ+AolAlxxKGT6lWmIG2RwjPVQJq1ckR
 LIOQ==
X-Gm-Message-State: ANoB5plWpqtKZcCIRrZZvrxPeqGTgKrlxyoriycqtDLSe2LERtFd9Q6K
 /XdYdH4YlMjwKn6mC5oRk+iS+UoOSgS+IeZ5Cl3bu2rdOBiDQ74a3PrIgeiQGOVWK3G7ATzfjcb
 TtkfOPRxR4/ZYwCA=
X-Received: by 2002:a05:6000:1e12:b0:242:1522:249b with SMTP id
 bj18-20020a0560001e1200b002421522249bmr2967707wrb.326.1669627199773; 
 Mon, 28 Nov 2022 01:19:59 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7r/hSRUVj3xnF+W5gD2AtJS/I0zcavSYu1Frd+BWu4HzlvE10PU69fzNxqV5E+Tw7AeV26zw==
X-Received: by 2002:a05:6000:1e12:b0:242:1522:249b with SMTP id
 bj18-20020a0560001e1200b002421522249bmr2967670wrb.326.1669627199448; 
 Mon, 28 Nov 2022 01:19:59 -0800 (PST)
Received: from [192.168.149.123]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 p17-20020a5d48d1000000b00236488f62d6sm10229631wrs.79.2022.11.28.01.19.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Nov 2022 01:19:58 -0800 (PST)
Message-ID: <15a6e2c4-cfd3-4815-8d8a-04e020387bc9@redhat.com>
Date: Mon, 28 Nov 2022 10:19:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v6 10/14] block-coroutine-wrapper.py: introduce co_wrapper
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, John Snow <jsnow@redhat.com>,
 Eric Blake <eblake@redhat.com>, Fam Zheng <fam@euphon.net>,
 Stefan Hajnoczi <stefanha@redhat.com>, "Denis V. Lunev" <den@openvz.org>,
 Stefan Weil <sw@weilnetz.de>, Jeff Cody <codyprime@gmail.com>,
 Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
References: <20221125133518.418328-1-eesposit@redhat.com>
 <20221125133518.418328-11-eesposit@redhat.com>
 <37c3385a-719d-053c-66f0-c4a923048b77@yandex-team.ru>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <37c3385a-719d-053c-66f0-c4a923048b77@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.257, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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



Am 25/11/2022 um 21:32 schrieb Vladimir Sementsov-Ogievskiy:
> 
>>     class FuncDecl:
>> -    def __init__(self, return_type: str, name: str, args: str) -> None:
>> +    def __init__(self, return_type: str, name: str, args: str,
>> +                 variant: str) -> None:
> 
> I'd prefer mixed: bool parameter instead, to be more strict.
> 
>>           self.return_type = return_type.strip()
>>           self.name = name.strip()
>> +        self.struct_name = snake_to_camel(self.name)
>>           self.args = [ParamDecl(arg.strip()) for arg in args.split(',')]
>> +        self.create_only_co = True
>> +
>> +        if 'mixed' in variant:
>> +            self.create_only_co = False
> 
> hmm, just
> 
>   self.create_only_co = 'mixed' not in variant
> 
> ? And even better with boolean argument.
> 
>> +
>> +        subsystem, subname = self.name.split('_', 1)
>> +        self.co_name = f'{subsystem}_co_{subname}'
>> +
>> +        t = self.args[0].type
>> +        if t == 'BlockDriverState *':
>> +            bs = 'bs'
>> +        elif t == 'BdrvChild *':
>> +            bs = 'child->bs'
>> +        else:
>> +            bs = 'blk_bs(blk)'
>> +        self.bs = bs
>>         def gen_list(self, format: str) -> str:
>>           return ', '.join(format.format_map(arg.__dict__) for arg in
>> self.args)
>> @@ -74,8 +92,9 @@ def gen_block(self, format: str) -> str:
>>           return '\n'.join(format.format_map(arg.__dict__) for arg in
>> self.args)
>>     -# Match wrappers declared with a co_wrapper_mixed mark
>> -func_decl_re = re.compile(r'^int\s*co_wrapper_mixed\s*'
>> +# Match wrappers declared with a co_wrapper mark
>> +func_decl_re = re.compile(r'^int\s*co_wrapper'
>> +                          r'(?P<variant>(_[a-z][a-z0-9_]*)?)\s*'
> 
> Why you allow everything here?
> I'd write just
>  
>   (?P<mixed>(_mixed)?)
> 
> or
> 
>   (?P<marker>co_wrapper(_mixed)?)

Ok you couldn't possibly know that, but we are also adding other type of
"variants":
co_wrapper
co_wrapper_mixed
co_wrapper_bdrv_rdlock
co_wrapper_mixed_bdrv_rdlock

Therefore I need to keep variant : str and the regex as it is, but maybe
get rid of the if else condition. I'll change the docstring of course.

If you want to know more, see the thread in
"[PATCH 00/15] Protect the block layer with a rwlock: part 3"

Thank you,
Emanuele


