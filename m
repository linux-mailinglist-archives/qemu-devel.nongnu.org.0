Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8BE012CA54
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Dec 2019 19:21:35 +0100 (CET)
Received: from localhost ([::1]:54158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ildC2-0006dU-8Z
	for lists+qemu-devel@lfdr.de; Sun, 29 Dec 2019 13:21:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40386)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1ildB2-0006Db-SQ
 for qemu-devel@nongnu.org; Sun, 29 Dec 2019 13:20:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1ildAw-0000m7-Jb
 for qemu-devel@nongnu.org; Sun, 29 Dec 2019 13:20:31 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:51853
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1ildAw-0000f1-42
 for qemu-devel@nongnu.org; Sun, 29 Dec 2019 13:20:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1577643624;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ca1//muTxp/0i4Ak7Mu8mssfEZMUp7DeAVduoIS7kHo=;
 b=QAedTqP4q3VG9hodMxSsMFqZGIkLHt8PUDs5A2NCfy47z8e6oGT17k3b+Ut24Jgse6+DK9
 vrPH3sCoeWRjJZbys0Gsw3/zY4huD5oz7+OnIgW5bodLCyZKtYzuOBDilnPKGd7zfQkeBX
 c0706K3C6ci6C3g+2UFy9fRzUiSrjBA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-84-q02aJ6INNc2xzMScXvc6Qg-1; Sun, 29 Dec 2019 13:20:20 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BB2D9800EB8
 for <qemu-devel@nongnu.org>; Sun, 29 Dec 2019 18:20:19 +0000 (UTC)
Received: from redhat.com (ovpn-116-53.ams2.redhat.com [10.36.116.53])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E7E7460CC0;
 Sun, 29 Dec 2019 18:20:18 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH 1/4] qemu-file: Don't do IO after shutdown
In-Reply-To: <20191218122702.GF3707@work-vm> (David Alan Gilbert's message of
 "Wed, 18 Dec 2019 12:27:02 +0000")
References: <20191218050439.5989-1-quintela@redhat.com>
 <20191218050439.5989-2-quintela@redhat.com>
 <20191218122702.GF3707@work-vm>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
Date: Sun, 29 Dec 2019 19:20:11 +0100
Message-ID: <87png7kn8k.fsf@trasno.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: q02aJ6INNc2xzMScXvc6Qg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Reply-To: quintela@redhat.com
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:
> * Juan Quintela (quintela@redhat.com) wrote:
>> Be sure that we are not doing neither read/write after shutdown of the
>> QEMUFile.
>>=20
>> Signed-off-by: Juan Quintela <quintela@redhat.com>
>> ---
>>  migration/qemu-file.c | 13 +++++++++++++
>>  1 file changed, 13 insertions(+)
>>=20
>> diff --git a/migration/qemu-file.c b/migration/qemu-file.c
>> index 26fb25ddc1..1e5543a279 100644
>> --- a/migration/qemu-file.c
>> +++ b/migration/qemu-file.c
>> @@ -53,6 +53,8 @@ struct QEMUFile {
>> =20
>>      int last_error;
>>      Error *last_error_obj;
>> +    /* has the file has been shutdown */
>> +    bool shutdown;
>>  };
>> =20
>>  /*
>> @@ -61,6 +63,7 @@ struct QEMUFile {
>>   */
>>  int qemu_file_shutdown(QEMUFile *f)
>>  {
>> +    f->shutdown =3D true;
>>      if (!f->ops->shut_down) {
>>          return -ENOSYS;
>>      }
>> @@ -214,6 +217,9 @@ void qemu_fflush(QEMUFile *f)
>>          return;
>>      }
>> =20
>> +    if (f->shutdown) {
>> +        return;
>> +    }
>
> OK, I did wonder if you need to free the iovec.

We need to improve things here.  We should free it on the 1st
error/shutdown.  Withought fixing all callers, I don't feel "safe" doing
it.

>
>>      if (f->iovcnt > 0) {
>>          expect =3D iov_size(f->iov, f->iovcnt);
>>          ret =3D f->ops->writev_buffer(f->opaque, f->iov, f->iovcnt, f->=
pos,
>> @@ -328,6 +334,10 @@ static ssize_t qemu_fill_buffer(QEMUFile *f)
>>      f->buf_index =3D 0;
>>      f->buf_size =3D pending;
>> =20
>> +    if (f->shutdown) {
>> +        return 0;
>> +    }
>
> I also wondered if perhaps an error would be reasonable here; but I'm
> not sure what a read(2) does after a shutdown(2).

We should check this sooner.  Same than prevoious.  If there has been an
error anywhere else, we should fail qemu_fill_buffer().  Right now we
don't do it. and we should.

qemu_get_error() and the setter should dissapear.  And we should just
return errors in all functions.  Especially now that we have migration
thread, and we don't have callbacks anymore.

> Still,
>
>
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

Thanks, Juan.

>>      len =3D f->ops->get_buffer(f->opaque, f->buf + pending, f->pos,
>>                               IO_BUF_SIZE - pending, &local_error);
>>      if (len > 0) {
>> @@ -642,6 +652,9 @@ int64_t qemu_ftell(QEMUFile *f)
>> =20
>>  int qemu_file_rate_limit(QEMUFile *f)
>>  {
>> +    if (f->shutdown) {
>> +        return 1;
>> +    }
>>      if (qemu_file_get_error(f)) {
>>          return 1;
>>      }
>> --=20
>> 2.23.0
>>=20
> --
> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


