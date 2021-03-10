Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0CD9334044
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 15:24:34 +0100 (CET)
Received: from localhost ([::1]:37890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJzlJ-0003B6-Rv
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 09:24:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lJzjo-0002VV-JD
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 09:23:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lJzjm-0004OZ-4F
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 09:23:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615386177;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rN9yx1KsYEECkKH5LZNy9OuWKp5o+zFlpkEIvakNdVU=;
 b=KCD9Av2m0CzGAF5rfyJYff8EtrJl5CtQIa886a2lKiyQ+Mwdjit4bUHs+R+9LikYpnQJbT
 ZwAgQJd9scQ6HOA/QYpbPIaAD8+ADErbwAG10KwG21QcLLPZW65MOzU6A2DuiI8o9zVLlT
 k98Ypq2pMBDXokPlUQVWrhhmCVVwG9E=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-451-kCAdt6lSOvOwunfRByfw1g-1; Wed, 10 Mar 2021 09:22:55 -0500
X-MC-Unique: kCAdt6lSOvOwunfRByfw1g-1
Received: by mail-ej1-f70.google.com with SMTP id sa29so7285091ejb.4
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 06:22:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rN9yx1KsYEECkKH5LZNy9OuWKp5o+zFlpkEIvakNdVU=;
 b=Ap8xO9Jjf/7/7x6xIKp3PtfRe3HXewOCpRw/AuuIIm7no2VLc8W8opL7MYsRsHN6SN
 gL3vIzOwhU8/4WkcmS7nLWnT7VkLwC0DopaGC0CwgzzZj8cW23F5J/r9uIpGpPe3VKmQ
 tE3raZHbRb+tOBI38f27DXns4Sx8+VFL9zNCK8PhGDGGRgCRme3X2nvE/qHjf6quxOLQ
 aCraOOgKKCbfzm78Srzmi8K9IpwYezn1HcV00rDw4xEt9/cebAOp9LCl7VDIDqTapuzX
 b4n801IRmMo2AD58Q8+QrUMPr2tJFdabgIdCr0SiW7t7hPuOfxFDkhGpDS5myibTAjCo
 gBVg==
X-Gm-Message-State: AOAM533a0qaeON2uDTjuS+gFvXiadWvq+WRPzSipbgHouQ9JXs1uZcH7
 jHhbaDTU2KO1BLeMme9hoQ7hC15bVMCwOJBeOQ8XjO8odZxBWeJFm9dZP/hst8jKpLmG528LL8w
 f0UbJcDTZJwpGl9U=
X-Received: by 2002:a17:906:f44:: with SMTP id
 h4mr3882042ejj.204.1615386174580; 
 Wed, 10 Mar 2021 06:22:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxZunoFL1kME5WahohY7ThbwPrP6NCdFhIhAzPScz0jUseQBp6Xt1I0+BdcexjNJdD0mKY8QQ==
X-Received: by 2002:a17:906:f44:: with SMTP id
 h4mr3882032ejj.204.1615386174453; 
 Wed, 10 Mar 2021 06:22:54 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id u59sm11073488edc.73.2021.03.10.06.22.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Mar 2021 06:22:54 -0800 (PST)
Subject: Re: [PATCH] block: Introduce zero-co:// and zero-aio://
To: fam@euphon.net, qemu-devel@nongnu.org
References: <20210310141752.5113-1-fam@euphon.net>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <d16dce2d-f844-5e58-6ae1-bbf366e74b60@redhat.com>
Date: Wed, 10 Mar 2021 15:22:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210310141752.5113-1-fam@euphon.net>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/10/21 3:17 PM, fam@euphon.net wrote:
> From: Fam Zheng <famzheng@amazon.com>
> 
> null-co:// has a read-zeroes=off default, when used to in security
> analysis, this can cause false positives because the driver doesn't
> write to the read buffer.
> 
> null-co:// has the highest possible performance as a block driver, so
> let's keep it that way. This patch introduces zero-co:// and
> zero-aio://, largely similar with null-*://, but have read-zeroes=on by
> default, so it's more suitable in cases than null-co://.

Thanks!

> 
> Signed-off-by: Fam Zheng <fam@euphon.net>
> ---
>  block/null.c | 91 ++++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 91 insertions(+)

> +static int zero_file_open(BlockDriverState *bs, QDict *options, int flags,
> +                          Error **errp)
> +{
> +    QemuOpts *opts;
> +    BDRVNullState *s = bs->opaque;
> +    int ret = 0;
> +
> +    opts = qemu_opts_create(&runtime_opts, NULL, 0, &error_abort);
> +    qemu_opts_absorb_qdict(opts, options, &error_abort);
> +    s->length =
> +        qemu_opt_get_size(opts, BLOCK_OPT_SIZE, 1 << 30);

Please do not use this magic default value, let's always explicit the
size.

    s->length = qemu_opt_get_size(opts, BLOCK_OPT_SIZE, 0);
    if (s->length < 0) {
        error_setg(errp, "%s is invalid", BLOCK_OPT_SIZE);
        ret = -EINVAL;
    }

> +    s->latency_ns =
> +        qemu_opt_get_number(opts, NULL_OPT_LATENCY, 0);
> +    if (s->latency_ns < 0) {
> +        error_setg(errp, "latency-ns is invalid");
> +        ret = -EINVAL;
> +    }
> +    s->read_zeroes = true;
> +    qemu_opts_del(opts);
> +    bs->supported_write_flags = BDRV_REQ_FUA;
> +    return ret;
> +}

Otherwise LGTM :)


