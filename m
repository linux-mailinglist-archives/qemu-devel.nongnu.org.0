Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E5D74CBC0A
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 12:01:39 +0100 (CET)
Received: from localhost ([::1]:38144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPjDG-0004nS-4h
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 06:01:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nPjAk-0003CL-O1
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 05:59:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55968)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nPjAg-0006GG-Cv
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 05:59:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646305136;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6CTh+3c334UpPNULlJ+Ax+MIctB7LBq2DmkN5bgr10g=;
 b=ZRrHgsw9Pp9SIfkmR9cRfIf6GZLWY3VV4ALpOzyYHfOr5nLNYpAtS+Lu3ppDBM/vEZzVdy
 oY2cpKgZZR9+vWzsrYcswnhAjqhEGpbKljTIWYm0tdY60Hzbuo44VIOOH2QZ7P6Kw2xmBl
 mzavK5ysQ+xel3uPQpb1a0X+5b+AFm0=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-526-b-l6_62oOiSEj9cz5RAnXQ-1; Thu, 03 Mar 2022 05:58:55 -0500
X-MC-Unique: b-l6_62oOiSEj9cz5RAnXQ-1
Received: by mail-ej1-f71.google.com with SMTP id
 lf15-20020a170906ae4f00b006da86a43346so1394066ejb.14
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 02:58:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6CTh+3c334UpPNULlJ+Ax+MIctB7LBq2DmkN5bgr10g=;
 b=66ZqAfVI6XMEOesUXHWnvhF01B3DDhjdYV/cz818+dN/qNhZqAhhXVVkL/ao5VSaDV
 GY6yncOHc31OTcIENigkusw4M0j/dznvKfnbVNcOrhWrJieJ62TYT6MQZYaHJEKuiCAH
 bHQ7AHuCLQejzFhT2637CElf1FRnEeBfY0wX7TtKbWmAxfI71O5K5TCmIGaAg+bAROqz
 biUiRmIzvTXyBylQr5+ccaWDXwZZGbdqU8okFgMxlBUM2iJ+niOzZbqFvcCAMrZ7QhXL
 RrLmS2QK4jbFWHDkO6Rty42o0pBY1KSJj4DbT/23gbnpwD1ZW0CB0EpSSJubJhei27U3
 zR+g==
X-Gm-Message-State: AOAM533jihUktTBE0cAb3j76pz5xxKsuj2cvI6IcwxhMd3qCItVP1/7Z
 t5WcSkRN5icZAbBBabSd93pQbWSpYmY01ug3tVYPrBqLkx0Cil51dSspvVDlOwyj26FDIsKqL/6
 v0Pg/Gbp6ILRYHSI=
X-Received: by 2002:a17:906:fad5:b0:6ce:e056:5918 with SMTP id
 lu21-20020a170906fad500b006cee0565918mr26827667ejb.562.1646305134180; 
 Thu, 03 Mar 2022 02:58:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyi03aFvrC1cMTJZ1UpiPlp0gd+YOrbS2md3rfGGpcU+4uzzQpb4xzBZLj033tUc4x0p4NDjw==
X-Received: by 2002:a17:906:fad5:b0:6ce:e056:5918 with SMTP id
 lu21-20020a170906fad500b006cee0565918mr26827648ejb.562.1646305133904; 
 Thu, 03 Mar 2022 02:58:53 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id
 b10-20020a056402278a00b00415b20902a6sm750946ede.27.2022.03.03.02.58.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Mar 2022 02:58:53 -0800 (PST)
Message-ID: <1cb8456c-60c9-3a25-50c2-10b00a77ae5f@redhat.com>
Date: Thu, 3 Mar 2022 11:58:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v5 16/16] iotests/image-fleecing: test push backup with
 fleecing
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20220228113927.1852146-1-vsementsov@virtuozzo.com>
 <20220228113927.1852146-17-vsementsov@virtuozzo.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220228113927.1852146-17-vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: fam@euphon.net, kwolf@redhat.com, jsnow@redhat.com, qemu-devel@nongnu.org,
 armbru@redhat.com, nikita.lapshin@virtuozzo.com, stefanha@redhat.com,
 eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28.02.22 12:39, Vladimir Sementsov-Ogievskiy wrote:
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   tests/qemu-iotests/tests/image-fleecing     | 120 ++++++++++++++------
>   tests/qemu-iotests/tests/image-fleecing.out |  63 ++++++++++
>   2 files changed, 151 insertions(+), 32 deletions(-)
>
> diff --git a/tests/qemu-iotests/tests/image-fleecing b/tests/qemu-iotests/tests/image-fleecing
> index 33995612be..89c79af698 100755
> --- a/tests/qemu-iotests/tests/image-fleecing
> +++ b/tests/qemu-iotests/tests/image-fleecing

[...]

> @@ -170,6 +196,20 @@ def do_test(use_cbw, use_snapshot_access_filter, base_img_path,
>           log(cmd)
>           log(vm.hmp_qemu_io(qom_path, cmd, qdev=True))
>   
> +    if push_backup:
> +        # Check that previous operations were done during backup, not after
> +        result = vm.qmp('query-block-jobs')
> +        if len(result['return']) != 1:
> +            log('Backup finished too fast, COW is not tested')

I don’t understand why this log is here, its message sounds like “case 
not run”, but first this logged message will make the whole test fail...

> +
> +        result = vm.qmp('block-job-set-speed', device='push-backup', speed=0)
> +        assert result == {'return': {}}

...and then this will fail, too.

Either this is a hard failure, then the log shouldn’t include “COW is 
not tested” (because it is tested, and the case has failed); or it’s a 
casenotrun, and then nothing should be logged (the message should be 
appended to .casenotrun), and the block-job-set-speed call and waiting 
for BLOCK_JOB_COMPLETED should only be done when the job is still in the 
job list.

> +
> +        log(vm.event_wait(name='BLOCK_JOB_COMPLETED',
> +                          match={'data': {'device': 'push-backup'}}),
> +                          filters=[iotests.filter_qmp_event])
> +        log(vm.qmp('blockdev-del', node_name='target'))
> +
>       log('')
>       log('--- Verifying Data ---')
>       log('')
> @@ -177,15 +217,19 @@ def do_test(use_cbw, use_snapshot_access_filter, base_img_path,
>       for p in patterns + zeroes:
>           cmd = 'read -P%s %s %s' % p
>           log(cmd)
> -        out, ret = qemu_io_pipe_and_status('-r', '-f', 'raw', '-c', cmd, nbd_uri)
> -        if ret != 0:
> -            print(out)
> +        if push_backup:
> +            assert qemu_io_silent('-r', '-c', cmd, target_img_path) == 0
> +        else:
> +            out, ret = qemu_io_pipe_and_status('-r', '-f', 'raw', '-c', cmd, nbd_uri)
> +            if ret != 0:
> +                print(out)

The existing principle of “print qemu-io’s output on error” seemed 
perfectly fine to me.  Why not continue using it?

(e.g. like

args = ['-r', '-c', cmd]
if push_backup:
     args += [target_img_path]
else:
     args += ['-f', 'raw', nbd_uri]
out, ret = qemu_io_pipe_and_status(*args)

)

>       log('')
>       log('--- Cleanup ---')
>       log('')
>   
> -    log(vm.qmp('nbd-server-stop'))
> +    if not push_backup:
> +        log(vm.qmp('nbd-server-stop'))
>   
>       if use_cbw:
>           if use_snapshot_access_filter:
> +read -P0xcd 0x3ff0000 64k
> +
> +Done


