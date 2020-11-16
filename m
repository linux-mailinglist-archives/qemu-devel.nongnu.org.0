Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE7CE2B44BD
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 14:33:45 +0100 (CET)
Received: from localhost ([::1]:42782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1keedd-0000S0-1F
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 08:33:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dme@dme.org>) id 1keeZl-0006Dr-0E
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 08:29:45 -0500
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:37018)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dme@dme.org>) id 1keeZh-0000qH-E4
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 08:29:44 -0500
Received: by mail-wr1-x444.google.com with SMTP id b6so18701032wrt.4
 for <qemu-devel@nongnu.org>; Mon, 16 Nov 2020 05:29:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dme-org.20150623.gappssmtp.com; s=20150623;
 h=to:cc:subject:in-reply-to:references:from:date:message-id
 :mime-version:content-transfer-encoding;
 bh=01OHeiGwAA19CYkGsvQcr9lQyVQ7kmJrkjS3w/O4NJo=;
 b=lwFYv5WstgsuIKu76pwciW4jUK5Omy4Q4IY3GY2wgk7mGBKvS2q7Bdz2W6H8+M1II1
 aug1w413DJoIQi201xI0/xSU/I7dX0yULHqxTxPJ8AhLuWWok3camJwYy2jta3vFkC5m
 oIb1zQmyRYlB59BDUD6Y5ko0Es5E5t4a34lPPve+2drdGUE3mmHyvd36Vs6AL1jqBY8l
 jWZ9MjhTep5HMJ6FpwwRUpcTcPRJSq6n4U+yGe/dHdytXQ+sapblYXHsYUBOOPMjImXK
 DcXe+gr8JZpxSQXQJGCpCCbXnRKqdfTvlYUaxC+CN1GvmAGqz2updJLhFGxOcPv6ii+0
 R0+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:subject:in-reply-to:references:from:date
 :message-id:mime-version:content-transfer-encoding;
 bh=01OHeiGwAA19CYkGsvQcr9lQyVQ7kmJrkjS3w/O4NJo=;
 b=keW4sPQl8m0p5mC7ArZBi3ejAlPqJG6r6yJjaloE8bUp93AqRzdPx+A8P97cWo9pBN
 W7S4fBhSeAlFCKYeS/5QtsDjfQT3bT+WOoW8nfx+e7ceMLnRnrn3ssM4XsbalME94dwo
 JZuIfOMWf8YW8FQPPFeo064hkS5hv+0OFeM695ES9HYIATh9/DkhijAB4n3SPd9S5yGi
 hF6WorDFjHa04q9FnYRixCBi5SPIlLweyizBWQRUSOuLKuPga3EY/L1mbmOKDzlUNDUX
 i1UgxRNlchZ0XqkbAVweecPNj+i30JyUdCTu//MGT27XUT+qAlmBog5EwZdaK/plyLxA
 yV9Q==
X-Gm-Message-State: AOAM531MskVRh02SPw3+0Z7x5p3nNYb0vJK8vX8HW1sfdVfRoHVUTdPO
 HjJoLM7L64ugmD1I0NsRyF4w0A==
X-Google-Smtp-Source: ABdhPJx14arDk3/AvUOLgTFcv8c62ouqslBo8yUTuGye2kulfOV/1xjwXZzFMUVlz1T/flot06H/YQ==
X-Received: by 2002:a05:6000:372:: with SMTP id
 f18mr20881238wrf.149.1605533379162; 
 Mon, 16 Nov 2020 05:29:39 -0800 (PST)
Received: from disaster-area.hh.sledj.net (disaster-area.hh.sledj.net.
 [2001:8b0:bb71:7140:64::1])
 by smtp.gmail.com with ESMTPSA id y11sm18941870wmj.36.2020.11.16.05.29.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 05:29:38 -0800 (PST)
Received: from localhost (disaster-area.hh.sledj.net [local])
 by disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id 47e299cc;
 Mon, 16 Nov 2020 13:29:37 +0000 (UTC)
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Subject: Re: [RFC PATCH 1/5] hw/block: blk_check_size_and_read_all should
 report backend name
In-Reply-To: <0a06d4fd-215b-4bfb-cef7-5d1a03e1a41d@redhat.com>
References: <20201116104216.439650-1-david.edmondson@oracle.com>
 <20201116104216.439650-2-david.edmondson@oracle.com>
 <0a06d4fd-215b-4bfb-cef7-5d1a03e1a41d@redhat.com>
X-HGTTG: zarquon
From: David Edmondson <dme@dme.org>
Date: Mon, 16 Nov 2020 13:29:37 +0000
Message-ID: <cund00djupq.fsf@zarquon.hh.sledj.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: neutral client-ip=2a00:1450:4864:20::444;
 envelope-from=dme@dme.org; helo=mail-wr1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NEUTRAL=0.779, UNPARSEABLE_RELAY=0.001 autolearn=no autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Monday, 2020-11-16 at 12:23:24 +01, Philippe Mathieu-Daud=C3=A9 wrote:

> On 11/16/20 11:42 AM, David Edmondson wrote:
>> If there are problems examining or reading data from the block
>> backend, the error messages should include an appropriate identifier
>> to assist in diagnoses.
>>=20
>> Signed-off-by: David Edmondson <david.edmondson@oracle.com>
>> ---
>>  hw/block/block.c | 14 +++++++-------
>>  1 file changed, 7 insertions(+), 7 deletions(-)
>>=20
>> diff --git a/hw/block/block.c b/hw/block/block.c
>> index 1e34573da7..8b284e1f14 100644
>> --- a/hw/block/block.c
>> +++ b/hw/block/block.c
>> @@ -20,9 +20,6 @@
>>   * BDRV_REQUEST_MAX_BYTES.
>>   * On success, return true.
>>   * On failure, store an error through @errp and return false.
>> - * Note that the error messages do not identify the block backend.
>> - * TODO Since callers don't either, this can result in confusing
>> - * errors.
>>   * This function not intended for actual block devices, which read on
>>   * demand.  It's for things like memory devices that (ab)use a block
>>   * backend to provide persistence.
>> @@ -32,17 +29,19 @@ bool blk_check_size_and_read_all(BlockBackend *blk, =
void *buf, hwaddr size,
>>  {
>>      int64_t blk_len;
>>      int ret;
>> +    const char *name =3D blk_name(blk);
>>=20=20
>>      blk_len =3D blk_getlength(blk);
>>      if (blk_len < 0) {
>>          error_setg_errno(errp, -blk_len,
>> -                         "can't get size of block backend");
>> +                         "can't get size of block backend %s",
>
> Maybe '%s' to notice empty name?

Okay.

>> +                         name);
>>          return false;
>>      }
>>      if (blk_len !=3D size) {
>>          error_setg(errp, "device requires %" HWADDR_PRIu " bytes, "
>> -                   "block backend provides %" PRIu64 " bytes",
>> -                   size, blk_len);
>> +                   "block backend %s provides %" PRIu64 " bytes",
>> +                   size, name, blk_len);
>>          return false;
>>      }
>>=20=20
>> @@ -55,7 +54,8 @@ bool blk_check_size_and_read_all(BlockBackend *blk, vo=
id *buf, hwaddr size,
>>      assert(size <=3D BDRV_REQUEST_MAX_BYTES);
>>      ret =3D blk_pread(blk, 0, buf, size);
>>      if (ret < 0) {
>> -        error_setg_errno(errp, -ret, "can't read block backend");
>> +        error_setg_errno(errp, -ret, "can't read block backend %s",
>> +                         name);
>>          return false;
>>      }
>>      return true;
>>=20

dme.
--=20
She looks like Eve Marie Saint in "On the Waterfront".

