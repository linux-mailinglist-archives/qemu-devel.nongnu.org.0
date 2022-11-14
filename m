Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61543628E4A
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 01:27:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouijr-0004Ph-5S; Mon, 14 Nov 2022 18:19:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ouieo-00025D-OX
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:14:28 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oucaM-0007rg-Ih
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 11:45:27 -0500
Received: by mail-wr1-x42b.google.com with SMTP id cl5so19325494wrb.9
 for <qemu-devel@nongnu.org>; Mon, 14 Nov 2022 08:45:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XTZt6pIHyRBd2fUozQ3lvY4ZxtLulVzZXH6aT7zVlvs=;
 b=qs7DoOJgWsQljHUfr8MSwP98c7dtZCFT1ao+oUBxKh8TJlKtELgU3qUPutyy8aytgN
 HUfTpsUe5NNejAP/kbteKrr6uiCuoGanriUkKDScizESwbOtG9xAGCWN/TZdUeH5ckkS
 MDQXqjf9zT+mhqMts06P5HE3/ozZYsoc75MGJFqQeH79gy0AfXT8hfGlNpaNAPVXLcc0
 OttOHzXYbmZXfBaEE7plkTmBkCh3W/Q0SyrY9QsURzFQ5t7cqnh960ZVyJyt+NmQa14r
 xUj1DBRW9N2DEM60fer/3hQlKufGc2sXXAcs+Opd5utuOolF0ifw27KhavCpiRzeircQ
 b5DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=XTZt6pIHyRBd2fUozQ3lvY4ZxtLulVzZXH6aT7zVlvs=;
 b=Qfd063uaw8kaVWwDF9YQsf9MEImRXJ3Gb3yos4G2roZjsetvvWuYALWidwNH1ciFL4
 chQ02ZBNqZML29R9pGNEmVa9leiOgAymiZKLroLRjDWfZ9w5CkwRxeDOrmDjFp88TAXu
 UOgJHXxGF9UqG/bdoA8E4UeW5hrzOBe1HG+3i/T3F19H6zHCn8SnVa9dcCG6Eq1LGXS6
 UlO4kp317z3HXPXgPiVRiWOr5tw2AReZbaaFFi/5wdXRKao2tJH7ob4xrvIumG4LHwUY
 qlDNtYIh/fNyWT7Wd60400o4hNrlsp7EMVCqp6DjmK3ixHKrQnDL2cqujXBjlB0ikN/w
 5p2A==
X-Gm-Message-State: ANoB5pkrreHV9tGvyUTBNr1WhPII+PNWXOj0fwxTTNyqo1rKxqXmEJ1y
 /oG2lfSnjSOj4NV4SfQT6R4pZQ==
X-Google-Smtp-Source: AA0mqf6a+H8CnRKsmSu48uMLKfNQsOj3+oXeu+/cAM2CPpWJnwONtjuxxFWSpZC+KF26INSP0ex2MQ==
X-Received: by 2002:a5d:46cc:0:b0:236:6a5d:16b0 with SMTP id
 g12-20020a5d46cc000000b002366a5d16b0mr8308194wrs.497.1668444324160; 
 Mon, 14 Nov 2022 08:45:24 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 m8-20020adfe948000000b002366553eca7sm9964554wrn.83.2022.11.14.08.45.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Nov 2022 08:45:23 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D805A1FFB7;
 Mon, 14 Nov 2022 16:45:22 +0000 (GMT)
References: <20221108092308.1717426-1-alex.bennee@linaro.org>
 <20221108092308.1717426-6-alex.bennee@linaro.org>
 <2277569a-c218-30d1-4d88-9b77d3604513@linux.ibm.com>
User-agent: mu4e 1.9.2; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Christian Borntraeger <borntraeger@linux.ibm.com>
Cc: qemu-devel@nongnu.org, fam@euphon.net, berrange@redhat.com,
 f4bug@amsat.org, aurelien@aurel32.net, pbonzini@redhat.com,
 stefanha@redhat.com, crosa@redhat.com, "Michael S. Tsirkin"
 <mst@redhat.com>, Raphael Norwitz <raphael.norwitz@nutanix.com>, Kevin
 Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>, "Dr. David Alan
 Gilbert" <dgilbert@redhat.com>, Viresh Kumar <viresh.kumar@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, "open list:Block layer core"
 <qemu-block@nongnu.org>, "open list:virtiofs" <virtio-fs@redhat.com>
Subject: Re: [PATCH v1 5/9] hw/virtio: introduce virtio_device_should_start
Date: Mon, 14 Nov 2022 16:43:47 +0000
In-reply-to: <2277569a-c218-30d1-4d88-9b77d3604513@linux.ibm.com>
Message-ID: <8735albi3h.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
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


Christian Borntraeger <borntraeger@linux.ibm.com> writes:

> Am 08.11.22 um 10:23 schrieb Alex Benn=C3=A9e:
>> The previous fix to virtio_device_started revealed a problem in its
>> use by both the core and the device code. The core code should be able
>> to handle the device "starting" while the VM isn't running to handle
>> the restoration of migration state. To solve this dual use introduce a
>> new helper for use by the vhost-user backends who all use it to feed a
>> should_start variable.
>> We can also pick up a change vhost_user_blk_set_status while we are
>> at
>> it which follows the same pattern.
>> Fixes: 9f6bcfd99f (hw/virtio: move vm_running check to
>> virtio_device_started)
>> Fixes: 27ba7b027f (hw/virtio: add boilerplate for vhost-user-gpio device)
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Cc: "Michael S. Tsirkin" <mst@redhat.com>
>
> Hmmm, is this
> commit 259d69c00b67c02a67f3bdbeeea71c2c0af76c35
> Author:     Alex Benn=C3=A9e <alex.bennee@linaro.org>
> AuthorDate: Mon Nov 7 12:14:07 2022 +0000
> Commit:     Michael S. Tsirkin <mst@redhat.com>
> CommitDate: Mon Nov 7 14:08:18 2022 -0500
>
>     hw/virtio: introduce virtio_device_should_start
>
> and older version?

Only missing the additional Fixes line MST suggested in the review. I
should have made it clearer in the --- comment.

Which test is failing?

--=20
Alex Benn=C3=A9e

