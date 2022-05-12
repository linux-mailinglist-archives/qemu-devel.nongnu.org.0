Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31F1F52526F
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 18:22:45 +0200 (CEST)
Received: from localhost ([::1]:51090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npBaO-0002QA-5O
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 12:22:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1npBUA-0004Tu-H9
 for qemu-devel@nongnu.org; Thu, 12 May 2022 12:16:18 -0400
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132]:35651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1npBU8-000201-SG
 for qemu-devel@nongnu.org; Thu, 12 May 2022 12:16:18 -0400
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-2f7c57ee6feso62748457b3.2
 for <qemu-devel@nongnu.org>; Thu, 12 May 2022 09:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EnqOz9dp/CGXnFeugf9/JbllnQs3jpwM3UrT7KyBzmM=;
 b=JdvzZe0XgVH3R+q+aC8OnIc8/Eqs8NHEXKBhWGJuw41dGGaOLMo+IqCSilGXHcDKV2
 t1HFPj0iXDbAS5cQghUaCNHajBbWTqZDbLg91t7GgoCo+G4uU2uABJTYqwaqhPTzajFs
 Es56vNpDf7g6LjEjkhNYsBbGqLPm48Qn+OG3/lJFlzkowcDm9XCP/VCbba2CcLKcXId5
 quDd4WpI5CiqenGofDrjGFqJchGzO45pfKqPIPmZPq7D1Of7G2mykzwuC8cumUbE2EsB
 934JheExovyVzMPf5CBry3xRUgUjEJau3O329l3/5ZX4lTT5mBzzVoOFR0rpiJo5NEWX
 bD4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EnqOz9dp/CGXnFeugf9/JbllnQs3jpwM3UrT7KyBzmM=;
 b=iE6m6DWYorLeHeTYc3XmZRPz4WXRI69LQVqYtjMCLtuhjNKwrl4S7qlZgLpk6F0Aby
 T3WCQcCILQKPPlgz86FVQ7zBhTDe82Z/JwKw+bjG5ukZVEypm67qlY+BzzWjL2XmaHyj
 qIvI+0MgK4MKbUhls2DOgygIhNCQCBg87fgoBTP51grPybo9HGAXCvdnM6GTO1y/YlpG
 Hx3pIGmv5BezgH627oDD30hFNTyJsl/EylFwTO2zfrJ9HLSXhDZt0jfp4GJwH4HuzJQD
 cqz8JTBqsaYqe7WZYNBJbGAQOKL/rfqJMEUMJU0inZF1THdDFdFio/emrXaUqHb8hCj6
 vnSw==
X-Gm-Message-State: AOAM533LpPB9D2up3XPt8SNczJ4VcGAn42f7Av25SX5Qmb1kUqHYUybV
 xuFXVCrvt635k8mKKg1bsb0XiRtwAMnUITyDY8og+w==
X-Google-Smtp-Source: ABdhPJxzeMplvHORmRjnlVSKFfhUSuURXj3hJhpEDxDsuo4ey8moJKkMUuv2opBV6/FibYDw+Cp/NlaPi4ns9Ig96z0=
X-Received: by 2002:a81:106:0:b0:2d0:e682:8a7a with SMTP id
 6-20020a810106000000b002d0e6828a7amr875552ywb.257.1652372175658; Thu, 12 May
 2022 09:16:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220426201514.170410-1-eblake@redhat.com>
 <20220426201514.170410-7-eblake@redhat.com>
In-Reply-To: <20220426201514.170410-7-eblake@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 May 2022 17:16:04 +0100
Message-ID: <CAFEAcA_Ggo+2e4=6inTxKc=h6L1WEzORwiiRfQxs=wFZL2vUow@mail.gmail.com>
Subject: Re: [PULL 06/13] nbd: remove peppering of nbd_client_connected
To: Eric Blake <eblake@redhat.com>
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>, 
 Lukas Straub <lukasstraub2@web.de>, 
 "open list:Network Block Dev..." <qemu-block@nongnu.org>,
 Hanna Reitz <hreitz@redhat.com>, 
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>, 
 Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1132.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Tue, 26 Apr 2022 at 21:21, Eric Blake <eblake@redhat.com> wrote:
>
> From: Paolo Bonzini <pbonzini@redhat.com>
>
> It is unnecessary to check nbd_client_connected() because every time
> s->state is moved out of NBD_CLIENT_CONNECTED the socket is shut down
> and all coroutines are resumed.

Hi; Coverity points out (CID 1488362) that this part of this change
has resulted in some dead code:

> @@ -512,7 +508,7 @@ static int coroutine_fn nbd_co_send_request(BlockDriverState *bs,
>      if (qiov) {
>          qio_channel_set_cork(s->ioc, true);
>          rc = nbd_send_request(s->ioc, request);
> -        if (nbd_client_connected(s) && rc >= 0) {
> +        if (rc >= 0) {
>              if (qio_channel_writev_all(s->ioc, qiov->iov, qiov->niov,
>                                         NULL) < 0) {
>                  rc = -EIO;

because the change means this code is now

        if (rc >= 0) {
            if (qio_channel_writev_all(s->ioc, qiov->iov, qiov->niov,
                                       NULL) < 0) {
                rc = -EIO;
            }
        } else if (rc >= 0) {
            rc = -EIO;
        }

and the "else if" clause is dead and can be deleted.

thanks
-- PMM

