Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 748714208F1
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 12:02:15 +0200 (CEST)
Received: from localhost ([::1]:38628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXKnW-0000FN-GJ
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 06:02:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mXKej-0004Fj-HB
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 05:53:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33278)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mXKef-0003G9-SN
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 05:53:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633341184;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dLdVZwV55H+4qE24sikv/fij64wLKswRHNeY0rWAvWo=;
 b=dqLZUBDYgmt6SD1D4GSwb0FpxOJaXhLQsvfaYQtlgxtkw40xApIU+KxpMnV+PMCoQcjIaa
 I8G5AjmorzwFEATPtgZJkJ9bnRRSUYYxPOtaLzkoXrl6QUs5/CAa32uUF8gepJgq73O13H
 A8KWhRipWOi9zkJz1h7OPvfogCxuv8A=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-101-ixKEEfZtPa6Mvdpoh1xCiQ-1; Mon, 04 Oct 2021 05:53:02 -0400
X-MC-Unique: ixKEEfZtPa6Mvdpoh1xCiQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 3-20020a05600c22c300b0030d6a6a28f8so674489wmg.5
 for <qemu-devel@nongnu.org>; Mon, 04 Oct 2021 02:53:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=dLdVZwV55H+4qE24sikv/fij64wLKswRHNeY0rWAvWo=;
 b=cj/oL1OEdR37LvH3nOs7/Txw2DZluYo0YEyZJZNzCTC7J7UZ3UHyXw6z7Qg4jAPhum
 xN4J5rGrxjz+0xUBBiOXHZfGzaC3ypn9fSWgL+bKS3/NMtSYgJURhlzphSSzYuOA47ye
 gjZMe/29ezo+H9jmZVVo91mC75Qq85vR4I2tX3qIoeFEhBRdr80z3CN8dCQTuEMDj39a
 HtnjvhtuYtgoQiuRIJywxqD74j7Yuwb3co0wjLgBknbjhjP6Th7nIyNpZusCDhDhOhiC
 J1HSGLbScP1ARVj3uSWRMR727m0WQaJSTy7/W2duI4uxJTZb6SOAkC5NB4rjfJ4w+tpq
 V/5A==
X-Gm-Message-State: AOAM530yXFNDXmeALjTlgBCzYJYqvSTVBnYwWoJD8/RbebCkj/3Nz71z
 2W/03pnZaKwihqFSbR79LXUe9wynjitdClocADd6MtqamqWVjg90tpzWYO40kVSN8wmAG7OGDgb
 8YDQyFGbQomW6jfQ=
X-Received: by 2002:adf:9796:: with SMTP id s22mr12615471wrb.224.1633341180877; 
 Mon, 04 Oct 2021 02:53:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx2nY7DCeTIWrgN1uUNdar3oJAnaOne4s6NgMVfvZS5kXEnkseqznm5vXcvTt+ywyPJvuOJxA==
X-Received: by 2002:adf:9796:: with SMTP id s22mr12615452wrb.224.1633341180668; 
 Mon, 04 Oct 2021 02:53:00 -0700 (PDT)
Received: from dresden.str.redhat.com
 ([2a02:908:1e48:3780:4451:9a65:d4e9:9bb6])
 by smtp.gmail.com with ESMTPSA id q18sm16019358wmc.7.2021.10.04.02.52.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Oct 2021 02:53:00 -0700 (PDT)
Subject: Re: [PATCH 12/15] iotests: Disable AQMP logging under non-debug modes
To: John Snow <jsnow@redhat.com>
References: <20210917054047.2042843-1-jsnow@redhat.com>
 <20210917054047.2042843-13-jsnow@redhat.com>
 <e885ae38-5e31-8a89-96d2-10ffab69e373@redhat.com>
 <CAFn=p-aaU8OK99R8u21SGb0kyOz=RtNy_aZoYnLwoOu6d4WE6A@mail.gmail.com>
From: Hanna Reitz <hreitz@redhat.com>
Message-ID: <96337ed3-fcdf-ffa9-c938-3b4998f65420@redhat.com>
Date: Mon, 4 Oct 2021 11:52:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFn=p-aaU8OK99R8u21SGb0kyOz=RtNy_aZoYnLwoOu6d4WE6A@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.055,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 qemu-devel <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18.09.21 02:58, John Snow wrote:
>
>
> On Fri, Sep 17, 2021 at 10:30 AM Hanna Reitz <hreitz@redhat.com 
> <mailto:hreitz@redhat.com>> wrote:
>
>     On 17.09.21 07:40, John Snow wrote:
>     > Disable the aqmp logger, which likes to (at the moment) print out
>     > intermediate warnings and errors that cause session termination;
>     disable
>     > them so they don't interfere with the job output.
>     >
>     > Leave any "CRITICAL" warnings enabled though, those are ones that we
>     > should never see, no matter what.
>
>     I mean, looks OK to me, but from what I understand (i.e. little),
>     qmp_client doesn’t log CRITICAL messages, at least I can’t see
>     any. Only
>     ERRORs.
>
>
> There's *one* critical message in protocol.py, used for a circumstance 
> that I *think* should be impossible. I do not think I currently use 
> any WARNING level statements.
>
>     I guess I’m missing some CRITICAL messages in external functions
>     called
>     from qmp_client.py, but shouldn’t we still keep ERRORs?
>
>
> ...Mayyyyyybe?
>
> The errors logged by AQMP are *almost always* raised as Exceptions 
> somewhere else, eventually. Sometimes when we encounter them in one 
> context, we need to save them and then re-raise them in a different 
> execution context. There's one good exception to this: My pal, EOFError.
>
> If the reader context encounters EOF, it raises EOFError and this 
> causes a disconnect to be scheduled asynchronously. *Any* Exception 
> that causes a disconnect to be scheduled asynchronously is dutifully 
> logged as an ERROR. At this point in the code, we don't really know if 
> the user of the library considers this an "error" yet or not. I've 
> waffled a lot on how exactly to treat this circumstance. ...Hm, I 
> guess that's really the only case where I have an error that really 
> ought to be suppressed. I suppose what I will do here is: if the 
> exception happens to be an EOFError I will drop the severity of the 
> log message down to INFO. I don't know why it takes being challenged 
> on this stuff to start thinking clearly about it, but here we are. 
> Thank you for your feedback :~)

Errr... You’re welcome!! *cough*

Hanna


