Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 097366F82C4
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 14:16:23 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puuLN-0007T9-Eg; Fri, 05 May 2023 08:15:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1puuLI-0007Nw-I4
 for qemu-devel@nongnu.org; Fri, 05 May 2023 08:15:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1puuL7-0007iP-9l
 for qemu-devel@nongnu.org; Fri, 05 May 2023 08:15:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683288904;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bJd6Erlf3q3PrKPgNTHRwj1LbySDBxiBdjaWDYCPncw=;
 b=f/ZrPXXXEcnRsIS7Gn7oQHmjCasB4IvSccAmLQPrZfUpCSw5G9/nr2H83rruJHHP5qgR/k
 OBPmP9sOW6f30JDO3WxO98nnpFxtEvknDkOOJFfVxQHz++YdAM2DPxfI2h9QUETPUTGgun
 pkC0a/SB/LQimXLKD7uPxsRfcstG5XI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-494-vf78IL2ZOyaOYMBGyq0_WQ-1; Fri, 05 May 2023 08:14:55 -0400
X-MC-Unique: vf78IL2ZOyaOYMBGyq0_WQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-3f250e9e090so6601185e9.0
 for <qemu-devel@nongnu.org>; Fri, 05 May 2023 05:14:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683288894; x=1685880894;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bJd6Erlf3q3PrKPgNTHRwj1LbySDBxiBdjaWDYCPncw=;
 b=hBDseNoA479zUo67XYRYiE/mXzoGX+K5wONu1nj6/7+XDKMIhwDmjh1jAMVFQzYIyg
 sIrsXh0IfmFvrRprnTLbClRo/dYjfrvMlkyUNgFtnbA5j5vEnTOUtPd4sBkowURwzuM1
 29HqPa+hV+T+wpZAli1OgtqnHVgxvmDif3OlF74fINp+yvP67Y4RnCnMXHRi6why2/DT
 l/DDdg+193w1Zq2Hi8FGLDJKRyuQa1ULJ7Is2MCn1StrYqwr8hUMTOuioqzvQvVbYXG9
 0qV7bwA3WfHA58VbjXvVMO4xAg4/flJZ1XGZjbsOXFkQ7KA49VULUIMoo+icZggAn0bf
 Tv0Q==
X-Gm-Message-State: AC+VfDx6+4hg96droztZezXruCcTec5O4Zwi50NOFkq29WPq7zcSBtye
 QrBvH1xnKtcfgzpBw+XPyPWrogwgc1wNep5FEN8yL8Bw25FO7rOK2leIOF9h+HZHr3wDQsErU9T
 DaCCeRbefSJ0u6qY=
X-Received: by 2002:a05:600c:21c2:b0:3ed:ec34:f1 with SMTP id
 x2-20020a05600c21c200b003edec3400f1mr921284wmj.35.1683288894524; 
 Fri, 05 May 2023 05:14:54 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5AMpukv6/8jzqsIo0DJblblh4fAgwyTm/YpErSjNQDzO6KLzy1YnRjjnHF0pflETZQGzOfKg==
X-Received: by 2002:a05:600c:21c2:b0:3ed:ec34:f1 with SMTP id
 x2-20020a05600c21c200b003edec3400f1mr921267wmj.35.1683288894147; 
 Fri, 05 May 2023 05:14:54 -0700 (PDT)
Received: from redhat.com ([89.6.163.213]) by smtp.gmail.com with ESMTPSA id
 y11-20020adff14b000000b0030497b3224bsm2270088wro.64.2023.05.05.05.14.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 May 2023 05:14:53 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org,  qemu-block@nongnu.org,  Stefan Hajnoczi
 <stefanha@redhat.com>,  Leonardo Bras <leobras@redhat.com>,  Fam Zheng
 <fam@euphon.net>,  Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH 9/9] qemu-file: Account for rate_limit usage on
 qemu_fflush()
In-Reply-To: <ZFSt6KBFOz48CIpt@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Fri, 5 May 2023 08:19:04 +0100")
References: <20230504113841.23130-1-quintela@redhat.com>
 <20230504113841.23130-10-quintela@redhat.com>
 <ZFPkP58QSrkm6riX@redhat.com> <87h6ssovu6.fsf@secure.mitica>
 <ZFSt6KBFOz48CIpt@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Fri, 05 May 2023 14:14:45 +0200
Message-ID: <87cz3f5616.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:
>> >
>> > This has a slight semantic behavioural change.
>>=20
>> Yeap.
>>=20
>> See the answer to Peter.  But three things came to mind:
>>=20
>> a - the size of the buffer is small (between 32KB and 256KB depending
>>     how you count it).  So we are going to call qemu_fflush() really
>>     soon.
>>=20
>> b - We are using this value to calculate how much we can send through
>>     the wire.  Here we are saything how much we have accepted to send.
>>=20
>> c - When using multifd the number of bytes that we send through the qemu
>>     file is even smaller. migration-test multifd test send 300MB of data
>>     through multifd channels and around 300KB on the qemu_file channel.
>>=20
>>=20
>> >
>> > By accounting for rate limit in the qemu_put functions, we ensure
>> > that we stop growing the iovec when rate limiting activates.
>> >
>> > If we only apply rate limit in the the flush function, that will
>> > let the  f->iov continue to accumulate buffers, while we have
>> > rate limited the actual transfer.
>>=20
>> 256KB maximum.  Our accounting has bigger errors than that.
>>=20
>>=20
>> > This makes me uneasy - it feels like a bad idea to continue to
>> > accumulate buffers if we're not ready to send them
>>=20
>> I still think that the change is correct.  But as you and Peter have
>> concerns about it, I will think a bit more about it.
>
> If Peter's calculations are correct, then I don't have any objection,
> as that's a small overhead.

#define IOV_MAX 1024
....
#define IO_BUF_SIZE 32768
#define MAX_IOV_SIZE MIN_CONST(IOV_MAX, 64)

struct QEMUFile {
   ...
    uint8_t buf[IO_BUF_SIZE];

    struct iovec iov[MAX_IOV_SIZE];
    ....
}

Later, Juan.


