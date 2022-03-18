Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 656554DE35D
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 22:16:37 +0100 (CET)
Received: from localhost ([::1]:48162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVJxc-0008Mk-GW
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 17:16:36 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nVJvv-000726-Qg
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 17:14:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nVJvj-0002dD-AP
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 17:14:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647638077;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=p0ILwbLx5cX2JAGxVG1Q/Bzz4pMXa23Bbpwuq4Nm4H4=;
 b=iFwAYJTKCSnStKD8fE3GVtnYOvpUYLhfdQI2NF5hY8pIDTeQ6Kqow9pO7ygpm89zS+Nrws
 U7lDzEI3SO86AE31BWRD1uGNezR+NjKPkECOgUpP+SDE7dTvuXghviisLAL82uqfR8DLyO
 5zxDop7CeUJOCTbLW9xNLDEljLq9I98=
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-414-WtDhbdUqNiOEKUKF1WHqlA-1; Fri, 18 Mar 2022 17:14:36 -0400
X-MC-Unique: WtDhbdUqNiOEKUKF1WHqlA-1
Received: by mail-vs1-f71.google.com with SMTP id
 s15-20020a056102108f00b003207cd1704eso850073vsr.5
 for <qemu-devel@nongnu.org>; Fri, 18 Mar 2022 14:14:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=p0ILwbLx5cX2JAGxVG1Q/Bzz4pMXa23Bbpwuq4Nm4H4=;
 b=dZbaIH0jcL7O7tno4OlY+VKxo+SkKiqJ2ZZGonjoDDig13ieaOBZnSJX4Y5GkARr7R
 V/1WlKGxMhci9RRWjySctdI9v+AISHIG9vYOQrwRpm2aHtjB9QqYnwgurkZ33wFIOBSI
 qumw4aZySfNz/O6cLm+7NNYt1RCaodheDHsbffp2YimrDUy87HOi3aeD7hdXAhfDeX5W
 o/+xjH5jAP/e4rl7Hp9xW5dt8w6ugnKLo7nEkEPdpBXyirDBIuF/VwqjZxxtjbORZ1x2
 jN/g069VAGtd+YeCrqm7L+gzwtj1JEaLpEMeAfG7GDoT6gspJGZEm5cD4VmkA4h/Hf61
 3QVw==
X-Gm-Message-State: AOAM532ZVI23UZ7CbiFj2vTG059UWH6ba3BktdSVbRZKsqe0oFJKWQCV
 LumwVqhfQiVdTjf7OrFkVzv3NG/r3438EsMgBdIMkL8udNvFmJXMkqgplR/VDkzVwZJ0lt79Skf
 G7znOHNTwHyUPzyT/E0Z0nOi7QtHc9V0=
X-Received: by 2002:a05:6102:c8e:b0:321:7348:6c2a with SMTP id
 f14-20020a0561020c8e00b0032173486c2amr4433035vst.11.1647638076244; 
 Fri, 18 Mar 2022 14:14:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxuzInMzFTJkwSZpZa0wgoZi9j4OIkt+d9AxkS8Ik+ZrCYjNti+VJ9CnKK/C1P2X7Wd8O9AN5R/LuwGJyCYT+0=
X-Received: by 2002:a05:6102:c8e:b0:321:7348:6c2a with SMTP id
 f14-20020a0561020c8e00b0032173486c2amr4433026vst.11.1647638076042; Fri, 18
 Mar 2022 14:14:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220317234937.569525-1-jsnow@redhat.com>
 <73e7fc10-e843-68fd-ebe3-e7916c891c34@redhat.com>
In-Reply-To: <73e7fc10-e843-68fd-ebe3-e7916c891c34@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Fri, 18 Mar 2022 17:14:25 -0400
Message-ID: <CAFn=p-bffj3CK9o2haN-3PDRQvyMcdnMRJ0fKpqAFifYq_L63A@mail.gmail.com>
Subject: Re: [PATCH v4 00/18] iotests: add enhanced debugging info to qemu-img
 failures
To: Hanna Reitz <hreitz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
 Cleber Rosa <crosa@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Mar 18, 2022 at 9:36 AM Hanna Reitz <hreitz@redhat.com> wrote:
>
> On 18.03.22 00:49, John Snow wrote:
> > Hiya!
> >
> > This series effectively replaces qemu_img_pipe_and_status() with a
> > rewritten function named qemu_img() that raises an exception on non-zero
> > return code by default. By the end of the series, every last invocation
> > of the qemu-img binary ultimately goes through qemu_img().
> >
> > The exception that this function raises includes stdout/stderr output
> > when the traceback is printed in a a little decorated text box so that
> > it stands out from the jargony Python traceback readout.
> >
> > (You can test what this looks like for yourself, or at least you could,
> > by disabling ztsd support and then running qcow2 iotest 065.)
> >
> > Negative tests are still possible in two ways:
> >
> > - Passing check=False to qemu_img, qemu_img_log, or img_info_log
> > - Catching and handling the CalledProcessError exception at the callsite.
>
> Thanks!  Applied to my block branch:
>
> https://gitlab.com/hreitz/qemu/-/commits/block
>
> Hanna
>

Actually, hold it -- this looks like it is causing problems with the
Gitlab CI. I need to investigate these.
https://gitlab.com/jsnow/qemu/-/pipelines/495155073/failures

... and, ugh, naturally the nice error diagnostics are suppressed here
so I can't see them. Well, there's one more thing to try and fix
somehow.

--js


