Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 704E5578E82
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 01:57:25 +0200 (CEST)
Received: from localhost ([::1]:38188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDac8-0000aj-2r
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 19:57:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1oDaaY-000716-UO
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 19:55:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48215)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1oDaaV-00046P-NS
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 19:55:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658188542;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RwGvQOH3aTAoLOpSK89BroYLOeQKz0lB3uRp3TnQLfo=;
 b=N1GX7xRhYGUGRUp5Qp6WpBElPmu0MlmCuJ8FFQpAMpwDnGuXklkr6u+uEyGWRRzbUoNthl
 YcZV3dkSLcdEbhKKRH+5En9wI2595ryhFIWTDTAbHUXaqj6qViA1NiTr3FCkFMAT/5YoOs
 65Y/tHMSTEEfGZQp9+kYTcXqh4vXlK8=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-660-fAfeR0e6Ow-k5WL8OT0-3w-1; Mon, 18 Jul 2022 19:55:28 -0400
X-MC-Unique: fAfeR0e6Ow-k5WL8OT0-3w-1
Received: by mail-ua1-f70.google.com with SMTP id
 f12-20020ab014cc000000b0038339d55bd6so6326518uae.10
 for <qemu-devel@nongnu.org>; Mon, 18 Jul 2022 16:55:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RwGvQOH3aTAoLOpSK89BroYLOeQKz0lB3uRp3TnQLfo=;
 b=vncRV3e2s4SJbvG8i/P7LllGGsQjkYE5QkvmqQ9tRFy9MVBTp1kLv1MoofQKzaiEIh
 tQnfuQ/JmqVNMrLsyjYvuGo7Nssshdgr6+4IhMoWZ8paQyD6tSmmOE12EoQUCAVWWvGH
 LhjbVvlSG3SQ1nG96uTdBh5NkTLFgc0Bb+iQ9DkNXh0uGhRgNFXqUp75WKw3hmDHpblx
 ViiyMpGyvgE28xIR9PPbdQwjm+mH6OUwzx7N3rr32DTACZQ55lp3zi04/I36Ldx8V/ci
 wIgbJZlcfQnuBnJ7ly6Ib63tHb4Bkd/oMizbcnue9LvVQa8BdMDxZzeGDhF4sqriQ8G6
 1hzQ==
X-Gm-Message-State: AJIora+UmBiQpR1/1DVW0AcNSxY9q9Ks0VdQ9dUA4HUcTUH98fv/EL+t
 ieTfUDD8Jc27lLDElx+FjIJU2ntaPm2WO0A+Y0suvD1iPjA0+MWHqrbpva1CVxpYA/9MOUtBJhT
 E/akvkWg7PB4M/Rd5f0GJmqhiVwsbxEo=
X-Received: by 2002:a1f:ac54:0:b0:374:a175:ecf4 with SMTP id
 v81-20020a1fac54000000b00374a175ecf4mr10293171vke.35.1658188527978; 
 Mon, 18 Jul 2022 16:55:27 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uQRbTwXaiXGjBNZsFnJ2ZDlzCYy2+VWl+GyjH+dfuM9zyZYB3Mne5dxhn4tXirrR97csMI03zD3QMIKm1qKQA=
X-Received: by 2002:a1f:ac54:0:b0:374:a175:ecf4 with SMTP id
 v81-20020a1fac54000000b00374a175ecf4mr10293167vke.35.1658188527813; Mon, 18
 Jul 2022 16:55:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220718172026.139004-1-thuth@redhat.com>
In-Reply-To: <20220718172026.139004-1-thuth@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Mon, 18 Jul 2022 19:55:17 -0400
Message-ID: <CAFn=p-bjTvzqGcGWxEXYi0fuRVmZn8BMcgX=Q_9RpcpvK3XDvQ@mail.gmail.com>
Subject: Re: [PATCH] util: Fix broken build on Haiku
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Alexander von Gluck IV <kallisti5@unixzen.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jul 18, 2022 at 1:20 PM Thomas Huth <thuth@redhat.com> wrote:
>
> A recent commit moved some Haiku-specific code parts from oslib-posix.c
> to cutils.c, but failed to move the corresponding header #include
> statement, too, so "make vm-build-haiku.x86_64" is currently broken.
> Fix it by moving the header #include, too.
>
> Fixes: 06680b15b4 ("include: move qemu_*_exec_dir() to cutils")
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Thanks for this one !!

--js


