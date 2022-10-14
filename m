Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C27CD5FEAB7
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Oct 2022 10:45:20 +0200 (CEST)
Received: from localhost ([::1]:36696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ojGJj-0003Uy-II
	for lists+qemu-devel@lfdr.de; Fri, 14 Oct 2022 04:45:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ojGEU-0007Im-Ks
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 04:39:54 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:41901)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ojGES-0007iR-Nh
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 04:39:54 -0400
Received: by mail-wr1-x434.google.com with SMTP id bu30so6462676wrb.8
 for <qemu-devel@nongnu.org>; Fri, 14 Oct 2022 01:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VWDnWtBs+9ZgC5TTdDxLxwi0yw71TmWvtpz30R9yoNc=;
 b=ftn0rqBSymuxDxeV2qbNJF7peQNPd21kWxAq9SjM8dwj7UsgKYzQByRVsvhwjxg4qG
 odOO3TU5PALW+RS1A5ubRIBCIfdEw/1h7lu7ApjuSm6RQlMj1+qpnHq06+0fBQoLvem7
 c0kqHqr1PnctbvhQUPI9amFkMZfd0A48f3EP+nyQI5NQ4B5kS+P9qN+VK4npOBqx1olB
 vX3bDmUhkq/QelgAncm9LpVtegkfcFP3tBBJxweEmc+E3GX6rBFzsCsQQINjtpp9GdNC
 WL1OCv8f6q4JAgOxzN7eLeGTJPmTdZzGkyvuc8+XGv6hijDqbazfOLVJFvyISc+T1xfE
 8xoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=VWDnWtBs+9ZgC5TTdDxLxwi0yw71TmWvtpz30R9yoNc=;
 b=fCVcUhuLf2tnu5tvis3BBh/SJZ0LSF3UWp0UjMEILG8ELVV9bJYcPdPua7zU7Ut8FK
 U+u8wHTyn0FylMotn507Lk3Da3LEseaOE9po39k4QskfARxOXLuxKxNxJ9qx7Tgyei1d
 N+TYY2Y433tzJ9dCDZ203cbkJmwNDtcqSXZCATOD+wwBIN4oE736T78xUAowRJG6ADG3
 mqUMHKQt6nYe59Et/b8pfs39BbAbJuirfR8YqtDqd8KJcljR0bumizX054VuHTHfLF/X
 1ic9o2sdrSI6ou6cQ3z2xA9rJAS0z/sAeb0YKspLYNtbYWO3OWqjc6qWHj2AkSFDxAFd
 8UrA==
X-Gm-Message-State: ACrzQf3gcRwHsxtgc6JS7jkUsiiMx56KnIscMRGicUuBBCynIH3+pQB8
 WVLsDxR4zf+tgJXFmwi/fJkWAQ==
X-Google-Smtp-Source: AMsMyM7B0oQGnQX9F9UJB7lVkg4f0X76ejNej7bWTWWNprbpZMrRm4Im38+m/eSeyCnTP49mFr2VEw==
X-Received: by 2002:a5d:4745:0:b0:22e:3521:a557 with SMTP id
 o5-20020a5d4745000000b0022e3521a557mr2463638wrs.125.1665736790789; 
 Fri, 14 Oct 2022 01:39:50 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 d9-20020adfe889000000b00223b8168b15sm1411372wrm.66.2022.10.14.01.39.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Oct 2022 01:39:50 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BD0311FFB7;
 Fri, 14 Oct 2022 09:39:49 +0100 (BST)
References: <20221010172813.204597-1-mst@redhat.com>
 <20221010172813.204597-8-mst@redhat.com>
 <3a002a6a-9135-ad45-3fed-7dd270450d0b@linux.ibm.com>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Christian Borntraeger <borntraeger@linux.ibm.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org, Peter
 Maydell <peter.maydell@linaro.org>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, Mathieu
 Poirier <mathieu.poirier@linaro.org>, virtio-fs@redhat.com
Subject: Re: Regression save/restore of vsock: (was [PULL 07/55] hw/virtio:
 move vm_running check to virtio_device_started)
Date: Fri, 14 Oct 2022 09:37:00 +0100
In-reply-to: <3a002a6a-9135-ad45-3fed-7dd270450d0b@linux.ibm.com>
Message-ID: <87pmeuol2i.fsf@linaro.org>
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Christian Borntraeger <borntraeger@linux.ibm.com> writes:

> Am 10.10.22 um 19:29 schrieb Michael S. Tsirkin:
>> From: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> All the boilerplate virtio code does the same thing (or should at
>> least) of checking to see if the VM is running before attempting to
>> start VirtIO. Push the logic up to the common function to avoid
>> getting a copy and paste wrong.
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Message-Id: <20220802095010.3330793-11-alex.bennee@linaro.org>
>> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
>> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
>
> This results in a regression for our s390x CI when doing save/restore of =
guests with vsock:
>
>
>                 #1  0x000003ff9a248580 raise (libc.so.6 + 0x48580)
>                 #2  0x000003ff9a22b5c0 abort (libc.so.6 + 0x2b5c0)
>                 #3  0x000003ff9a2409da __assert_fail_base (libc.so.6 + 0x=
409da)
>                 #4  0x000003ff9a240a4e __assert_fail (libc.so.6 + 0x40a4e)
>                 #5  0x000002aa2d69a066 vhost_vsock_common_pre_save (qemu-=
system-s390x + 0x39a066)
>                 #6  0x000002aa2d55570e vmstate_save_state_v (qemu-system-=
s390x + 0x25570e)
>                 #7  0x000002aa2d556218 vmstate_save_state (qemu-system-s3=
90x + 0x256218)
>                 #8 0x000002aa2d570ba4
> qemu_savevm_state_complete_precopy_non_iterable (qemu-system-s390x +
> 0x270ba4)
>                 #9  0x000002aa2d5710b6 qemu_savevm_state_complete_precopy=
 (qemu-system-s390x + 0x2710b6)
>                 #10 0x000002aa2d564d0e migration_completion (qemu-system-=
s390x + 0x264d0e)
>                 #11 0x000002aa2d8db25c qemu_thread_start (qemu-system-s39=
0x + 0x5db25c)
>                 #12 0x000003ff9a296248 start_thread (libc.so.6 + 0x96248)
>                 #13 0x000003ff9a31183e thread_start (libc.so.6 + 0x11183e)

Which test does this break?

Looking at the change the only thing I can think of is there is a subtle
change in the order of checks because if the device is set as
use_started we return the result regardless of vm or config state:

    if (vdev->use_started) {
        return vdev->started;
    }

Could some printfs confirm that?

--=20
Alex Benn=C3=A9e

