Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44FFC6F70F0
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 19:33:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puco2-0006kA-LS; Thu, 04 May 2023 13:31:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pucfC-0003wQ-Oe
 for qemu-devel@nongnu.org; Thu, 04 May 2023 13:22:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pucfB-0006Fh-5z
 for qemu-devel@nongnu.org; Thu, 04 May 2023 13:22:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683220960;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yDwRsLFsfh5itQxZXa99P0Q8KRWP0ruhqzIUljpMoNE=;
 b=hzzSekf/XhQedqXfwjqgXIZijscBa05WmmDo1X8YehzpxPmm8e+c3VPAZ0DFH+8Njd0ChV
 m0nbR4bh0RtmZAnvUNHXAAe5DYfCZVQwkC0BUraTp2hizZPmcKdMmAoTGpUgrs3/uuT3hC
 +sQXkRbccKRS/f73UJk7JrH/+Ay2afo=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-617-kcjJnUNeO6yKiQrg5KyrdQ-1; Thu, 04 May 2023 13:22:33 -0400
X-MC-Unique: kcjJnUNeO6yKiQrg5KyrdQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-306311a2b99so324052f8f.1
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 10:22:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683220949; x=1685812949;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yDwRsLFsfh5itQxZXa99P0Q8KRWP0ruhqzIUljpMoNE=;
 b=cln5tGrQpjCaNkIdSsSifnuMYxz9lFlBmb0fW2IBaSgccogGHuqdJoT8ZfXcq91b0c
 6q1DGweO0qmRwJ9sEwIy9o4sWjmRktE18l/X31WJrm4wcTFkVALztsgumvs9ybGelknI
 CE/LtTokDq/PurLAPWYCD8WZo2OMfGrWc80/wSvXPpy0WFr1BeaU3taiI7G65Ei4H28d
 FYfRSqVRsbLTZ+qXnb1se4Ubsu5dphD05y+bfv5TFnYXzkmoQ3dyy4ic2cvDdw9f/gwt
 IKhd42K6FtTeo5EEcAhV8wZ5wrlZERmGj2xVZN/g6ipJ26vF9g9FNJCDr/8eMSollkKW
 LhtQ==
X-Gm-Message-State: AC+VfDzpfPqq5k3aqaYUCS6Jc1poZo4rsW6NIbzeSbic8KlDbi2qTa08
 wXzCniH2y1y14EqrI2OFjDdxXM3eqWgnmXUxebYa8roaPx/1U/G0irDqf0k4oG1KQFLp2Bym564
 nZitYTCiUHJ5mC0w=
X-Received: by 2002:a5d:6d50:0:b0:306:2b9f:fa4c with SMTP id
 k16-20020a5d6d50000000b003062b9ffa4cmr3603404wri.3.1683220948878; 
 Thu, 04 May 2023 10:22:28 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4JDD5yA3GU5hvKJPvuR0LfYhveZ1nJF8e+rcEWRdK+E61W9URtQTh6qt7e9lWKUyqEa55Y5g==
X-Received: by 2002:a5d:6d50:0:b0:306:2b9f:fa4c with SMTP id
 k16-20020a5d6d50000000b003062b9ffa4cmr3603393wri.3.1683220948525; 
 Thu, 04 May 2023 10:22:28 -0700 (PDT)
Received: from redhat.com ([188.85.120.92]) by smtp.gmail.com with ESMTPSA id
 h16-20020a5d5490000000b00304b5b2f5ffsm19143167wrv.53.2023.05.04.10.22.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 10:22:27 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org,  qemu-block@nongnu.org,  Stefan Hajnoczi
 <stefanha@redhat.com>,  Leonardo Bras <leobras@redhat.com>,  Fam Zheng
 <fam@euphon.net>,  Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH 9/9] qemu-file: Account for rate_limit usage on
 qemu_fflush()
In-Reply-To: <ZFPkP58QSrkm6riX@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Thu, 4 May 2023 17:58:39 +0100")
References: <20230504113841.23130-1-quintela@redhat.com>
 <20230504113841.23130-10-quintela@redhat.com>
 <ZFPkP58QSrkm6riX@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Thu, 04 May 2023 19:22:25 +0200
Message-ID: <87h6ssovu6.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
> On Thu, May 04, 2023 at 01:38:41PM +0200, Juan Quintela wrote:
>> That is the moment we know we have transferred something.
>>=20
>> Signed-off-by: Juan Quintela <quintela@redhat.com>
>> ---
>>  migration/qemu-file.c | 7 +++----
>>  1 file changed, 3 insertions(+), 4 deletions(-)
>>=20
>> diff --git a/migration/qemu-file.c b/migration/qemu-file.c
>> index ddebfac847..309b4c56f4 100644
>> --- a/migration/qemu-file.c
>> +++ b/migration/qemu-file.c
>> @@ -300,7 +300,9 @@ void qemu_fflush(QEMUFile *f)
>>                                     &local_error) < 0) {
>>              qemu_file_set_error_obj(f, -EIO, local_error);
>>          } else {
>> -            f->total_transferred +=3D iov_size(f->iov, f->iovcnt);
>> +            uint64_t size =3D iov_size(f->iov, f->iovcnt);
>> +            qemu_file_acct_rate_limit(f, size);
>> +            f->total_transferred +=3D size;
>>          }
>>=20=20
>>          qemu_iovec_release_ram(f);
>> @@ -527,7 +529,6 @@ void qemu_put_buffer_async(QEMUFile *f, const uint8_=
t *buf, size_t size,
>>          return;
>>      }
>>=20=20
>> -    f->rate_limit_used +=3D size;
>>      add_to_iovec(f, buf, size, may_free);
>>  }
>>=20=20
>> @@ -545,7 +546,6 @@ void qemu_put_buffer(QEMUFile *f, const uint8_t *buf=
, size_t size)
>>              l =3D size;
>>          }
>>          memcpy(f->buf + f->buf_index, buf, l);
>> -        f->rate_limit_used +=3D l;
>>          add_buf_to_iovec(f, l);
>>          if (qemu_file_get_error(f)) {
>>              break;
>> @@ -562,7 +562,6 @@ void qemu_put_byte(QEMUFile *f, int v)
>>      }
>>=20=20
>>      f->buf[f->buf_index] =3D v;
>> -    f->rate_limit_used++;
>>      add_buf_to_iovec(f, 1);
>>  }
>
> This has a slight semantic behavioural change.

Yeap.

See the answer to Peter.  But three things came to mind:

a - the size of the buffer is small (between 32KB and 256KB depending
    how you count it).  So we are going to call qemu_fflush() really
    soon.

b - We are using this value to calculate how much we can send through
    the wire.  Here we are saything how much we have accepted to send.

c - When using multifd the number of bytes that we send through the qemu
    file is even smaller. migration-test multifd test send 300MB of data
    through multifd channels and around 300KB on the qemu_file channel.


>
> By accounting for rate limit in the qemu_put functions, we ensure
> that we stop growing the iovec when rate limiting activates.
>
> If we only apply rate limit in the the flush function, that will
> let the  f->iov continue to accumulate buffers, while we have
> rate limited the actual transfer.

256KB maximum.  Our accounting has bigger errors than that.


> This makes me uneasy - it feels like a bad idea to continue to
> accumulate buffers if we're not ready to send them

I still think that the change is correct.  But as you and Peter have
concerns about it, I will think a bit more about it.

Thanks, Juan.


