Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E70FF6219D2
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 17:52:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osRph-0005Be-NT; Tue, 08 Nov 2022 11:52:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1osRpc-0005AK-Tk
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 11:52:12 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1osRpb-0003JF-6a
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 11:52:12 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 a11-20020a05600c2d4b00b003cf6f5fd9f1so9460237wmg.2
 for <qemu-devel@nongnu.org>; Tue, 08 Nov 2022 08:52:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h9Hli6/J6woMHzWWxqg4iMfqtyy7Avj69wB+Ck4/WGU=;
 b=bXUyzDqLoLWZGtywefffhHIr0PsBVsefBPY7NR0PkBRVfSScXkxM3oKVJl0f4s4SSJ
 6ceWfnIyxsSyixXqmeZzybrsUi5Bl24AdHbAN3ueWYiqSw6iGwVZSEE/JEOwyQQnAylk
 mDh6h6r/PoXre2W+jvAATbOBcXqRlKfLpBMzJ0BGbkBjaIGIOMG/MmPnGCYAwknTpwzX
 8Ap8WTsOLIGmqaC0BqtYjMEXSIkzFnnTKl5IgUutUUki/bs/bdesIb7rzxmByI3TUgAY
 L0IPGCaRKkgByvvU7gzSkL+LPHcm8GGO1hFYrbZ/wKYbXbeA308pcMS6zy29aHYMZ2FC
 hWPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=h9Hli6/J6woMHzWWxqg4iMfqtyy7Avj69wB+Ck4/WGU=;
 b=2QQU6EUJfQ1SdkSm9lKgn/sGfPd554MwWMUGDM6ooRrq4BFT8ojteUovA5YPQToISr
 NM9OnWYPYPhxC5rA3w3qWOb4sDLI91xpN52NT+n3XT/mbmlY7iWDDgmXSJQkGR6GicLN
 oJoqfv6qF/mjFwlch+IoFBpevKTxD77EpjK5PN5LxdxishJp1dtvSMgD16uk0CpTvo25
 KFnshO/bl5CGKJiJ03iBFnmq1YyksHuSiLVJ1sStKcRvkaJ5Wx31YmtN+sFhjGk/C9Lv
 gM677grsQb6SBvh20AcW2XmJsqIRkeYmXIfh+gAhQCh8x+dIz5wROgYKt8bmSMt1qqQ2
 20zw==
X-Gm-Message-State: ACrzQf0prV3RI0FqjlGjDkN1OWb1LrAT3q0m0AyFXH3qunpVVqTIDV4e
 JWDNpypXzdEhjf9g/ft0FqCDWg==
X-Google-Smtp-Source: AMsMyM4ow+nwSa4RM+lRvoJYFpicZD5YLYEFLsGw5M8kVbFSyd3VuVin1MTrQIGJjkYFW4envRN+7A==
X-Received: by 2002:a05:600c:1d11:b0:3cf:7981:9a2 with SMTP id
 l17-20020a05600c1d1100b003cf798109a2mr30311999wms.92.1667926328988; 
 Tue, 08 Nov 2022 08:52:08 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 k4-20020a5d6e84000000b00236722ebe66sm10896587wrz.75.2022.11.08.08.52.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Nov 2022 08:52:08 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BAAC21FFB7;
 Tue,  8 Nov 2022 16:52:07 +0000 (GMT)
References: <20221108092308.1717426-1-alex.bennee@linaro.org>
 <20221108092308.1717426-6-alex.bennee@linaro.org>
 <20221108043249-mutt-send-email-mst@kernel.org>
 <8735atg2vh.fsf@linaro.org>
 <20221108052544-mutt-send-email-mst@kernel.org>
 <87y1slelmw.fsf@linaro.org>
 <20221108102011-mutt-send-email-mst@kernel.org>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, fam@euphon.net, berrange@redhat.com,
 f4bug@amsat.org, aurelien@aurel32.net, pbonzini@redhat.com,
 stefanha@redhat.com, crosa@redhat.com, Raphael Norwitz
 <raphael.norwitz@nutanix.com>, Kevin Wolf <kwolf@redhat.com>, Hanna Reitz
 <hreitz@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Viresh Kumar <viresh.kumar@linaro.org>, Mathieu Poirier
 <mathieu.poirier@linaro.org>, "open list:Block layer core"
 <qemu-block@nongnu.org>, "open list:virtiofs" <virtio-fs@redhat.com>
Subject: Re: [PATCH  v1 5/9] hw/virtio: introduce virtio_device_should_start
Date: Tue, 08 Nov 2022 16:41:17 +0000
In-reply-to: <20221108102011-mutt-send-email-mst@kernel.org>
Message-ID: <87tu39e6dk.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
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

> On Tue, Nov 08, 2022 at 11:21:26AM +0000, Alex Benn=C3=A9e wrote:
>>=20
>> "Michael S. Tsirkin" <mst@redhat.com> writes:
>>=20
>> > On Tue, Nov 08, 2022 at 10:23:15AM +0000, Alex Benn=C3=A9e wrote:
>> >>=20
>> >> "Michael S. Tsirkin" <mst@redhat.com> writes:
>> >>=20
>> >> > On Tue, Nov 08, 2022 at 09:23:04AM +0000, Alex Benn=C3=A9e wrote:
>> >> >> The previous fix to virtio_device_started revealed a problem in its
>> >> >> use by both the core and the device code. The core code should be =
able
>> >> >> to handle the device "starting" while the VM isn't running to hand=
le
>> >> >> the restoration of migration state. To solve this dual use introdu=
ce a
>> >> >> new helper for use by the vhost-user backends who all use it to fe=
ed a
>> >> >> should_start variable.
>> >> >>=20
>> >> >> We can also pick up a change vhost_user_blk_set_status while we ar=
e at
>> >> >> it which follows the same pattern.
>> >> >>=20
>> >> >> Fixes: 9f6bcfd99f (hw/virtio: move vm_running check to virtio_devi=
ce_started)
>> >> >> Fixes: 27ba7b027f (hw/virtio: add boilerplate for vhost-user-gpio =
device)
>> >> >> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> >> >> Cc: "Michael S. Tsirkin" <mst@redhat.com>
>> >> >
>> >> > why is this in this patchset?
>> >>=20
>> >> As per my cover letter:
>> >>=20
>> >>   Most of these patches have been posted before as single patch RFCs.=
 A
>> >>   couple are already scheduled through other trees so will drop out in
>> >>   due course
>> >>=20
>> >> but I keep them in my tree until they are merged so I can continue to
>> >> soak test them (and have a stable base for my other WIP trees).
>> >
>> > That's fine just pls don't double-post them on list, certainly
>> > not as part of a patchset.
>>=20
>> Why not? Is this breaking some tooling?
>
> Yes patchset breaks git am if you try to apply part of it.
>
> Reposting creates work for reviewers - why should they have to read the s=
ame
> patch twice?  In this case it also made me scratch my head trying to
> figure out what to do about it.
>
> But, if you are careful and maintain an ordered changelog after "---"
> and there it says=20
> 	changes since rfc:
> 		no changes, subject changed=20
>
> then this second part is less of a problem

Ahh yes, I should have updated to point out I added the extra Fixes line
as per the review. I guess you added that in your PR? Anyway it's
dropped now your PR has gone in.

--=20
Alex Benn=C3=A9e

