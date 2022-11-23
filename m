Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C17DC636548
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Nov 2022 17:05:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxsEb-0002v5-L6; Wed, 23 Nov 2022 11:04:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oxsEW-0002ua-H6
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 11:04:20 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oxsET-0001Da-Hz
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 11:04:19 -0500
Received: by mail-wr1-x434.google.com with SMTP id n7so2462948wrr.13
 for <qemu-devel@nongnu.org>; Wed, 23 Nov 2022 08:04:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QIjkDLxxQB75biEpd41ym7lPb8q7ekkqWOR+cUEhnII=;
 b=zw3P/1sbPIVXatvNZYVyffQfIdZuEZFJ8GyEF1ZfXeoStZQI3f/vcXogNfJDsRs7kO
 ZvRsFMqlTUWLi+KBb2RbBu5MwxsKCnUQ5mY8zZtUqWMGGQRuHOc9dT88pdqJKdEFTkKM
 zrK3C670ideimrTD1nhlfdqbTalhWzXHjbaqtInXjcNYxkGZDTYqT4e7kMDxQyCyEIkk
 xn7yCc5AHJZMnk/MQwbAvj7Y3ClvA+09ZFl1kmDYRgvB1WWSyVNGNGUunwo2q9dx6EUh
 y5uyAm+migzPw3B/HroTFVM0Xb+FM4QGNUVxTUUTxqlpdPRQ8itLY66Jb6/64Y+X7XzL
 SdBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=QIjkDLxxQB75biEpd41ym7lPb8q7ekkqWOR+cUEhnII=;
 b=Gc7Fl48TLJAjWG2l07ZRbF6rlpUVWcAlpx2BE9xkj7zUOxB8fINDYkhvgFstY4s66A
 LAgAKfnTCvha3Fm34E/tLTSGLhQsIbCLAZCH3QLbNxsX5mGw+OIJpnEdOsKASXiynPVC
 AIzx/GOgwOn2BXLpUnUxBD3FtUz+QIQl9NU+iwhFY7jfbt1rCMDjM1Bs1zH7b8pKngL7
 da2J9bBmDM7G2mKRFz8wxwUNfdOxd9gXB0nAj9a5j49BzUrxzqZjCfFS4Yrq+PBydpwv
 YO5MbudfDvys8WgGbVk8r+0aklejnFezopmS3tEcbUxLm+sW6Xb8pOYirA0y8ZTZ72Z6
 0+mg==
X-Gm-Message-State: ANoB5pnlkZa63gzb9DJ1ovO1jmAfqJLkhLR47Nthz3V+8dJ6KzxZXBBM
 jrDPRd4EiId6/pqsHhvy8PlzKA==
X-Google-Smtp-Source: AA0mqf6903k2cT8RcvWZN3+mUTok+KIhnCYZz4s9KAzu328A1A8CvLSPwRN25oFraIV+lPvHrHSL/A==
X-Received: by 2002:adf:cf09:0:b0:22e:7630:dfa with SMTP id
 o9-20020adfcf09000000b0022e76300dfamr10015308wrj.1.1669219455336; 
 Wed, 23 Nov 2022 08:04:15 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 m29-20020a05600c3b1d00b003c6b7f5567csm7882659wms.0.2022.11.23.08.04.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Nov 2022 08:04:14 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 225D21FFB7;
 Wed, 23 Nov 2022 16:04:14 +0000 (GMT)
References: <20221123152134.179929-1-alex.bennee@linaro.org>
 <20221123102522-mutt-send-email-mst@kernel.org>
User-agent: mu4e 1.9.3; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, slp@redhat.com, marcandre.lureau@redhat.com,
 stefanha@redhat.com, mathieu.poirier@linaro.org, viresh.kumar@linaro.org
Subject: Re: [PATCH for 7.2-rc3  v1 0/2] virtio fixes
Date: Wed, 23 Nov 2022 16:03:49 +0000
In-reply-to: <20221123102522-mutt-send-email-mst@kernel.org>
Message-ID: <87bkoxbqtd.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


"Michael S. Tsirkin" <mst@redhat.com> writes:

> On Wed, Nov 23, 2022 at 03:21:32PM +0000, Alex Benn=C3=A9e wrote:
>> Hi,
>>=20
>> This hopefully fixes the problems with VirtIO migration caused by the
>> previous refactoring of virtio_device_started(). That introduced a
>> different order of checking which didn't give the VM state primacy but
>> wasn't noticed as we don't properly exercise VirtIO device migration
>> and caused issues when dev->started wasn't checked in the core code.
>> The introduction of virtio_device_should_start() split the overloaded
>> function up but the broken order still remained. The series finally
>> fixes that by restoring the original semantics but with the cleaned up
>> functions.
>>=20
>> I've added more documentation to the various structures involved as
>> well as the functions. There is still some inconsistencies in the
>> VirtIO code between different devices but I think that can be looked
>> at over the 8.0 cycle.
>
>
> Thanks a lot! Did you try this with gitlab CI? A patch similar to your
> 2/2 broke it previously ...

Looking into it now - so far hasn't broken locally but I guess there is
something different about the CI.

>
>> Alex Benn=C3=A9e (2):
>>   include/hw: attempt to document VirtIO feature variables
>>   include/hw: VM state takes precedence in virtio_device_should_start
>>=20
>>  include/hw/virtio/vhost.h  | 25 +++++++++++++++++++---
>>  include/hw/virtio/virtio.h | 43 ++++++++++++++++++++++++++++++++------
>>  2 files changed, 59 insertions(+), 9 deletions(-)
>>=20
>> --=20
>> 2.34.1


--=20
Alex Benn=C3=A9e

