Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 982103340D2
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 15:54:03 +0100 (CET)
Received: from localhost ([::1]:37818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK0Dq-00088j-Mt
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 09:54:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lK0A4-0005wX-A3
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 09:50:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:46000)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lK0A2-0003YH-BE
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 09:50:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615387805;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PRtWNy/NDok7f1iWfLBivzp/rU/ybv4EUVehPR/t8lg=;
 b=WX+U+qIZorfdBwGqKza5kITsp+kIfaLUzNrR+kAY+M7m8j+k1ttcH+zhHUYwmwFSuA67bh
 rLmiS0CegFBsAx1RVYJkc1r0RMvaZlmRJ/B2/0wsm88rJXvO2XD4MGn03WpyUEjAm0XsTp
 XoRyIxaHF5y0Dsah9yUM4ZHWBEPNi5k=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-185-Xro9cix9OWqHDA9g5GtAjw-1; Wed, 10 Mar 2021 09:49:16 -0500
X-MC-Unique: Xro9cix9OWqHDA9g5GtAjw-1
Received: by mail-ej1-f69.google.com with SMTP id 11so7297480ejz.20
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 06:49:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PRtWNy/NDok7f1iWfLBivzp/rU/ybv4EUVehPR/t8lg=;
 b=nR6YDa4tTUNl8GZNp3+a+Y+6UCwdPLLXuo7f0NinenRSE8BPqL4zVFn3YSwLwXUqX3
 shDKBVhCmWhd0sg8PiyXQEP3RpXbHTIajJPQ7OD6s5ZC6+x2NL41OvS68UAFPEmj7SCu
 6an3JbdrTRfHJi+5bekcljBxh+B6YZp6y+eW69n+vItk9YWPSw5lQ+UN2v1dYJYdQJhN
 hw72PZCUJ2l6mjyAW+PWT2oG/OdGCoXgssphcoKDTXvmWSeOdgxINth6qjneJft81Lxz
 uDBKs9fkhczKOqL2CCqvbVffvMPTCry+QqtQcNA+N66aaXGHeG+PLSC+178NtlX9oiOl
 ARNA==
X-Gm-Message-State: AOAM530h91N+B+gOEmdeesyC4thTftwnHOo2M9AxTSIj1D+1E1qeSbxB
 lyJdxtMHd29B7tC6Bq2ESEofFa8czuvZ0zKiqkyOG0GdjyuQWwZ3tlX70Tv5ke1gdXzzrrY+l+w
 frvWfLfjTZP81K6s=
X-Received: by 2002:a05:6402:3122:: with SMTP id
 dd2mr3656259edb.253.1615387755476; 
 Wed, 10 Mar 2021 06:49:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwheH7GaYr5x45eIGSXQ/rXqn/CVN91HcdOZDNFloG5VEdggpfvGdisgV+ckFib2PyhxF15yw==
X-Received: by 2002:a05:6402:3122:: with SMTP id
 dd2mr3656240edb.253.1615387755307; 
 Wed, 10 Mar 2021 06:49:15 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id d6sm10218155eje.20.2021.03.10.06.49.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Mar 2021 06:49:14 -0800 (PST)
Subject: Re: [PATCH] block: Introduce zero-co:// and zero-aio://
To: Fam Zheng <famforupstream@gmail.com>
References: <20210310141752.5113-1-fam@euphon.net>
 <d16dce2d-f844-5e58-6ae1-bbf366e74b60@redhat.com>
 <CAGNx5+34xWD33-YQmS_Tw-bV3nFMJSpB72c6paGpN4pdmmPkAg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <557f59ec-ccbe-64a5-a21f-ab24dc818f2b@redhat.com>
Date: Wed, 10 Mar 2021 15:49:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAGNx5+34xWD33-YQmS_Tw-bV3nFMJSpB72c6paGpN4pdmmPkAg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/10/21 3:28 PM, Fam Zheng wrote:
> On Wed, 10 Mar 2021 at 14:24, Philippe Mathieu-Daudé <philmd@redhat.com
> <mailto:philmd@redhat.com>> wrote:
> 
>     On 3/10/21 3:17 PM, fam@euphon.net <mailto:fam@euphon.net> wrote:
>     > From: Fam Zheng <famzheng@amazon.com <mailto:famzheng@amazon.com>>
>     >
>     > null-co:// has a read-zeroes=off default, when used to in security
>     > analysis, this can cause false positives because the driver doesn't
>     > write to the read buffer.
>     >
>     > null-co:// has the highest possible performance as a block driver, so
>     > let's keep it that way. This patch introduces zero-co:// and
>     > zero-aio://, largely similar with null-*://, but have
>     read-zeroes=on by
>     > default, so it's more suitable in cases than null-co://.
> 
>     Thanks!
> 
>     >
>     > Signed-off-by: Fam Zheng <fam@euphon.net <mailto:fam@euphon.net>>
>     > ---
>     >  block/null.c | 91
>     ++++++++++++++++++++++++++++++++++++++++++++++++++++
>     >  1 file changed, 91 insertions(+)
> 
>     > +static int zero_file_open(BlockDriverState *bs, QDict *options,
>     int flags,
>     > +                          Error **errp)
>     > +{
>     > +    QemuOpts *opts;
>     > +    BDRVNullState *s = bs->opaque;
>     > +    int ret = 0;
>     > +
>     > +    opts = qemu_opts_create(&runtime_opts, NULL, 0, &error_abort);
>     > +    qemu_opts_absorb_qdict(opts, options, &error_abort);
>     > +    s->length =
>     > +        qemu_opt_get_size(opts, BLOCK_OPT_SIZE, 1 << 30);
> 
>     Please do not use this magic default value, let's always explicit the
>     size.
> 
>         s->length = qemu_opt_get_size(opts, BLOCK_OPT_SIZE, 0);
>         if (s->length < 0) {
>             error_setg(errp, "%s is invalid", BLOCK_OPT_SIZE);
>             ret = -EINVAL;
>         }
> 
> 
> Doesn't that result in a bare
> 
>   -blockdev zero-co://
> 
> would have 0 byte in size?

Yes, this will display an error.

Maybe better something like:

    if (s->length == 0) {
        error_append_hint(errp, "Usage: zero-co://,size=NUM");
        error_setg(errp, "size must be specified");
        ret = -EINVAL;
    } else if (s->length < 0) {
        error_setg(errp, "%s is invalid", BLOCK_OPT_SIZE);
        ret = -EINVAL;
    }

> 
> I'm copying what null-co:// does today, and it's convenient for tests.
> Why is a default size bad?

We learned default are almost always bad because you can not get
rid of them. Also because we have reports of errors when using
floppy and another one (can't remember) with null-co because of
invalid size and we have to explain "the default is 1GB, you have
to explicit your size".

Phil.


