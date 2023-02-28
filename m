Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A8DA6A597F
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 13:53:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWzSb-0002me-Sq; Tue, 28 Feb 2023 07:52:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pWzSY-0002mT-Ex
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 07:51:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pWzSV-0005Ge-UQ
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 07:51:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677588713;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+JOUEx6pt5NmJTBXPkqeI5x+CL1msS5VLju33oDFjo4=;
 b=DuKH9o/aZhNiBtKL2SbYP6jtB62q30EhpagzPbooGWzA90DKFIUTF5JMLvU0g3+YvUORzL
 p1AglZAILSNBMo1Jk+2o/EmdvQ8I/zKyBK815RLTY/e8pB7LywgVET7cbKPjvy32kN5a1M
 f0vKQlMFjh0qNcik1zjyY1ZgPyeHvKY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-106-8EydqEgaO6iq0wZge874Yw-1; Tue, 28 Feb 2023 07:51:52 -0500
X-MC-Unique: 8EydqEgaO6iq0wZge874Yw-1
Received: by mail-wm1-f71.google.com with SMTP id
 c7-20020a7bc847000000b003e00be23a70so6865481wml.2
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 04:51:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+JOUEx6pt5NmJTBXPkqeI5x+CL1msS5VLju33oDFjo4=;
 b=m2ybuN8EMVaSodRKTq9X8aQLwF4x1JBqxKQdhwOacomEApghTAm3CIMG4qVXlTv2Ov
 oEqV90ynzLBG66r2cpmk/qGGkIrmA2gYXH9Tj4ZqzwLyN9BIxzyqfRvCgWOBV+VDwEcA
 /hS9KZygNzHo31Nira53ZfGR+YqT7z+EvtOCvx6/Jq6OQraJOAmTinpRLWSUiY1rgiAx
 GSamrxjv/X/CHs2lUFzvR3j9wgMfbZnZUZ6J8i4kt316Sk31fpjxgHTRZf+af08CO5WR
 +Ey0oqzn7iiQ1AWlwTnDyE5Hyu51hqY8tp/hnsp0hjv31TJRVZNFnzzX68K8GE7wDQgj
 5T4g==
X-Gm-Message-State: AO0yUKVRgWe9lIwJe9IAzugWWKAk3nIyCLHk82MWVGvxbgJS0nW4kwIf
 qgDEkBph3T5+EjaZB4jDX8/eqN6wmrfqAXqQwm4W+2Ram8MMchedmtsAf51Iv/Cy6pdPUzeb2CU
 fpMWG4VSyMXZxK+U=
X-Received: by 2002:adf:ffcd:0:b0:2c5:5ff8:93e5 with SMTP id
 x13-20020adfffcd000000b002c55ff893e5mr1950801wrs.44.1677588711105; 
 Tue, 28 Feb 2023 04:51:51 -0800 (PST)
X-Google-Smtp-Source: AK7set8BXn5e5IrV4UjQZRCLl3XTaL1I1vk7ifnVn6K9Qp2GxwUvj0xONhWWdUm6/+1ZM67IKCYAGg==
X-Received: by 2002:adf:ffcd:0:b0:2c5:5ff8:93e5 with SMTP id
 x13-20020adfffcd000000b002c55ff893e5mr1950785wrs.44.1677588710837; 
 Tue, 28 Feb 2023 04:51:50 -0800 (PST)
Received: from redhat.com (62.117.240.9.dyn.user.ono.com. [62.117.240.9])
 by smtp.gmail.com with ESMTPSA id
 m4-20020a05600c4f4400b003e209b45f6bsm17139301wmq.29.2023.02.28.04.51.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 04:51:50 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Cc: "John Berberian, Jr" <jeb.study@gmail.com>,  =?utf-8?Q?Marc-Andr=C3=A9?=
 Lureau <marcandre.lureau@gmail.com>,  Stefan Weil <sw@weilnetz.de>,
 qemu-devel@nongnu.org,  "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v2] Fix exec migration on Windows (w32+w64).
In-Reply-To: <Y/3o7y2R1bOfQMT0@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Tue, 28 Feb 2023 11:43:43 +0000")
References: <20230116013421.3149183-1-jeb.study@gmail.com>
 <CAJ+F1C+x3tSHAb6LbL+GK0m08UuKCS0RWygz41gMFycqL0JrrQ@mail.gmail.com>
 <Y8UXR6uqdv22auoE@redhat.com>
 <db09ab65-a6a7-0096-625a-c323a4b5aacf@gmail.com>
 <CAJ+F1CKkqcgCYfnGVK7LSD5gE1ueX2HrCGqP26_UJZYt3E-q4A@mail.gmail.com>
 <12107bdf-f631-e42a-5136-59bb67e301fc@gmail.com>
 <87pm9ukpti.fsf@secure.mitica> <87lekikopl.fsf@secure.mitica>
 <Y/3o7y2R1bOfQMT0@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Tue, 28 Feb 2023 13:51:48 +0100
Message-ID: <878rgikl5n.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:
> On Tue, Feb 28, 2023 at 12:35:02PM +0100, Juan Quintela wrote:
>> Juan Quintela <quintela@redhat.com> wrote:
>> > "John Berberian, Jr" <jeb.study@gmail.com> wrote:
>> >> ping. Is there anything I can do to help this get merged?
>> >
>> > Hi
>> >
>> > I have to get back from Marc/Daniel before proceed.
>> >
>> > You did an answer, but they didn't respond.
>> >
>> > What should we do here?
>> >
>> > Thanks, Juan.
>>=20
>> Reviewed-by: Juan Quintela <quintela@redhat.com>
>>=20
>> queued.
>>=20
>> Althought I would have preffer to create a
>>=20
>> os_get_cmd_path()
>>=20
>> in both os-win32.c and os-posix.c, so we don't have the #ifdefs at all.
>
> IMHO it is preferable to NOT have it in os-posix/win32 as we don't
> want any other areas of QEMU to mistakenly think it is a good idea
> to use. This will be relatively short lived once we introduce the
> new migration parameters to replace the URI, and can deprecate
> the use of shell.

ok, ok......

I will tell myself that it is just temporary O:-)

Later, Juan.


