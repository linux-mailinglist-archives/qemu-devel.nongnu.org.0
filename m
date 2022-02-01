Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C8EE4A683E
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 23:53:48 +0100 (CET)
Received: from localhost ([::1]:53812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nF21z-0005Ts-6X
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 17:53:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nExow-0000HR-Sn
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 13:24:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34152)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nExov-0000yf-6V
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 13:24:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643739840;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3Xz2QdPg1ca9MUaTupeP9p9z4RplzqojqScy0zbocJM=;
 b=DabgPR+oue+wptHaYovKmkTJ5DebR4jx5VhUw3ZBvlYaPWsoDW0xufs88f1osXY/Xw9xkR
 JgxEFEGumUyYHpvRNbJXbtrS8EtM4NPrH7lFhsWDNG+TszmGcfI2GcvSMhB32gvTKNTba4
 m7Fu4mAkxXxJu+sxGTUqdjVklag4L2Y=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-613-StxaaTS1OzuVYfL-ey2ZKw-1; Tue, 01 Feb 2022 13:23:59 -0500
X-MC-Unique: StxaaTS1OzuVYfL-ey2ZKw-1
Received: by mail-yb1-f199.google.com with SMTP id
 i10-20020a25540a000000b0061391789216so34748297ybb.2
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 10:23:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3Xz2QdPg1ca9MUaTupeP9p9z4RplzqojqScy0zbocJM=;
 b=4BC9aXbr33j/nbAg3xphttnt6tNrL1Gd08ZUqPEL8zgIRJgb0WfoRYbhkUn7U6R1Oa
 pwq56lV+mHy7+ripUywdT7rSfQzPGKnv0QRXXByZl63f9fVZXWX7ChdyRKNMc1i242YY
 26gbZ5MecsuNB2Pb4cF6za+QCqW+7xajW0dJlDhHUChbkjs2/AxhcZ4IxDeKW9hCFp/f
 H0yHJPV3YcClbWojG00ZWIEH8CgnvnEXeOAxW/3AbR5VWaF0c8SrMkxIAwy9soE5LVHy
 RHTOexTuIeCF2f4fMKYMZCpuMevPFWt+LVyCDuUYixWAOT2up+F3wmruFRePSx9sdJT/
 cVsA==
X-Gm-Message-State: AOAM533u8JuQqZosL9TfbKiC4EulkYNUaJgqV5ObZ1DOqwnTqvsBavSm
 jbWgBFwMn3VYk4op1hkCFrlaXg+O0TidWbJ1D2dtifL0EWDX2LIPd379mZY2Z0JiyUdi1ZlWKW4
 gM51Is28GOeZCy+6reUlDV03PpSOSvGg=
X-Received: by 2002:a5b:d41:: with SMTP id f1mr36746234ybr.225.1643739839140; 
 Tue, 01 Feb 2022 10:23:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxFd5UuPyJbfn1SPuOOIT8HL1osW+VFIUtynQVJOx3FKh4kjpuVlS2g2ZyBoUw41C3bGb6XIVbEuGxcrr1lI58=
X-Received: by 2002:ab0:6f11:: with SMTP id r17mr12438977uah.128.1643739400793; 
 Tue, 01 Feb 2022 10:16:40 -0800 (PST)
MIME-Version: 1.0
References: <20220201041134.1237016-1-jsnow@redhat.com>
 <Yfk1ZhkhFIcx7fZY@redhat.com>
In-Reply-To: <Yfk1ZhkhFIcx7fZY@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Tue, 1 Feb 2022 13:16:30 -0500
Message-ID: <CAFn=p-YjmqQ2zF7eWkTu0WXPMaruV7QOoYzoWRUwDitEqjMSLQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/4] Python: Improvements for iotest 040,041
To: Kevin Wolf <kwolf@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.081,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>, Beraldo Leal <bleal@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Hanna Reitz <hreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 1, 2022 at 8:28 AM Kevin Wolf <kwolf@redhat.com> wrote:
>
> Am 01.02.2022 um 05:11 hat John Snow geschrieben:
> > GitLab: https://gitlab.com/jsnow/qemu/-/commits/python-aqmp-fixes
> > CI: https://gitlab.com/jsnow/qemu/-/pipelines/455146881
> >
> > Fixes and improvements all relating to "iotest 040,041, intermittent
> > failure in netbsd VM"
> > https://lists.gnu.org/archive/html/qemu-devel/2022-01/msg01975.html
> >
> > See each patch for details.
>
> Thanks, the new output when QEMU fails to start looks really useful!
>
> The only thing we could probably still improve is detecting that the
> QEMU process has exited instead of waiting for the socket connection to
> time out. But since it only happens in case of failure, the additional
> seconds of waiting are probably only a bit annoying for debugging, but
> not a big problem.

That's absolutely on my radar, I assure you!

It's something that is easy to solve with asyncio:

async def launch(self, ...):
    task1 = asyncio.create_task(self.qmp.accept(...))
    task2 = asyncio.create_subprocess_exec(...)
    ret = asyncio.wait_for((task1, task2))
    ...

If either task raises, then the wait_for will also end prematurely
(and cancel the other task). I'm sure it won't actually be this easy,
but that's the general idea.

Though, that's a pretty big upheaval to the Python code again, so it's
not something I can jam in quickly. I have some light sketches that
examine a "what-if" for an asyncio-native machine.py using the asyncio
QMP code, but there are some design concerns there -- if I go through
the effort of doing this, I will want to publish that python package
upstream as well, and if I do that, it needs to be carefully thought
through in terms of a supportable interface.

Well, I'm thinking about it, anyway. For right now I am interested in
getting the qemu.qmp project out the door and onto PyPI.org, and then
I'll worry about machine improvements. If in the meantime you have a
good idea for how to fix up the machine.py code we already have, I'm
happy to take patches. Otherwise, I'll try to get to it "soon".

>
> Reviewed-by: Kevin Wolf <kwolf@redhat.com>
>

Thanks!


