Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF0049B957
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 17:53:51 +0100 (CET)
Received: from localhost ([::1]:53040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCP4o-0007M5-PE
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 11:53:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nCP2b-0005FB-39
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 11:51:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25997)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nCP2Y-0001Lt-BZ
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 11:51:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643129489;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gZIkEcEsdSXcKmJKlXIBzBpJYEBJJ765pp//xLV5BwY=;
 b=fJVzRTMwT+DVmrF9JB8DYMNDs/BACWoVMMCwytVcrUwBrEyxw4oAh7247v2sFA5gEqiCiq
 5ZLhPsxCGdAOZOyffr3mb5RME9aLAEqRmPyzUU17c3XdmLh1hy/wtxgHIkwbbjvj7RvUPC
 lTNFkf817v8OdBTAffYa9weBmxapqRI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-562-5rxnEGwUPkeAa_JKfunIOg-1; Tue, 25 Jan 2022 11:51:27 -0500
X-MC-Unique: 5rxnEGwUPkeAa_JKfunIOg-1
Received: by mail-wm1-f71.google.com with SMTP id
 w5-20020a1cf605000000b0034b8cb1f55eso1449563wmc.0
 for <qemu-devel@nongnu.org>; Tue, 25 Jan 2022 08:51:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=gZIkEcEsdSXcKmJKlXIBzBpJYEBJJ765pp//xLV5BwY=;
 b=oPG1j4tkUXEaErUoF+/Xxm1M5tKJcqjKcgJwGRV2mNB2HapO2bU0SLJ7xHn7fH2chC
 iqre6pnAMTWSP7cYF1mAWtL2ONyyJzj9baFN9BWPetID23iCLX1Tj4+9n71cu84+yabs
 SOF9W16GBio4O1I+PZmosQE4pSha6Y4dSrGX2wWuuUEliwVT3E6V/USnbgTsIsNLz/kQ
 Bg5gBTSe5/fQgSWjJ8Zc/uhYf2hHlUjX1r2W7Ylujujw/bdJVZ1NoRgz5L9SudYoFTZM
 hzQ9ZVnRkBhPSkWSXUJXGaa7Dj9Ojk76PmjTG9Fd6d3CdiojRjipEeb9qA1tthokqu2e
 VNMw==
X-Gm-Message-State: AOAM532UOD5szTXasxrZFZ4t9ie537O7rMyDd91jKcrLERsMxrsy1Uhd
 Np35CvIdCAdjZtT79tA7kjfzLUFlvI+/YiVBTYxLnctUoGf63367TpfhIqtUcXlSSGytPDga+dG
 VLrzQ1WytBY73nvk=
X-Received: by 2002:adf:eac3:: with SMTP id o3mr14839239wrn.27.1643129486532; 
 Tue, 25 Jan 2022 08:51:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwKhLeJF1fwO6iidN+WbRx5u5JOszKaKcRONpNFTjj/C5+hhr/N2Kjfm05/mjjXftBTbNkVRg==
X-Received: by 2002:adf:eac3:: with SMTP id o3mr14839210wrn.27.1643129486315; 
 Tue, 25 Jan 2022 08:51:26 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:ca91:ec4d:49ff:d0d1?
 ([2a02:8071:5055:3f20:ca91:ec4d:49ff:d0d1])
 by smtp.gmail.com with ESMTPSA id m11sm760427wmi.16.2022.01.25.08.51.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Jan 2022 08:51:25 -0800 (PST)
Message-ID: <bc3fa04f-e384-e059-8aed-fe1c6ac4a2a6@redhat.com>
Date: Tue, 25 Jan 2022 17:51:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v6 04/33] block/export/fuse.c: allow writable exports to
 take RESIZE permission
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20220121170544.2049944-1-eesposit@redhat.com>
 <20220121170544.2049944-5-eesposit@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220121170544.2049944-5-eesposit@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.158,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 John Snow <jsnow@redhat.com>, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Eduardo Habkost <eduardo@habkost.net>, Greg Kurz <groug@kaod.org>,
 qemu-ppc@nongnu.org, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Denis V. Lunev" <den@openvz.org>, Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21.01.22 18:05, Emanuele Giuseppe Esposito wrote:
> Allow writable exports to get BLK_PERM_RESIZE permission
> from creation, in fuse_export_create().
> In this way, there is no need to give the permission in
> fuse_do_truncate(), which might be run in an iothread.
>
> Permissions should be set only in the main thread, so
> in any case if an iothread tries to set RESIZE, it will
> be blocked.
>
> Also assert in fuse_do_truncate that if we give the
> RESIZE permission we can then restore the original ones,
> since we don't check the return value of blk_set_perm.

We do, because we pass &error_abort for errp, so if an error were to 
occur, qemu would abort.

Not that I mind adding an assertion on the return value, just noting 
that we omitted that kind of intentionally.

Reviewed-by: Hanna Reitz <hreitz@redhat.com>

> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>   block/export/fuse.c | 25 ++++++++++++++++++-------
>   1 file changed, 18 insertions(+), 7 deletions(-)
>
> diff --git a/block/export/fuse.c b/block/export/fuse.c
> index 823c126d23..3c177b9e67 100644
> --- a/block/export/fuse.c
> +++ b/block/export/fuse.c
> @@ -86,8 +86,8 @@ static int fuse_export_create(BlockExport *blk_exp,
>   
>       assert(blk_exp_args->type == BLOCK_EXPORT_TYPE_FUSE);
>   
> -    /* For growable exports, take the RESIZE permission */
> -    if (args->growable) {
> +    /* For growable and writable exports, take the RESIZE permission */
> +    if (args->growable || blk_exp_args->writable) {
>           uint64_t blk_perm, blk_shared_perm;
>   
>           blk_get_perm(exp->common.blk, &blk_perm, &blk_shared_perm);
> @@ -392,14 +392,23 @@ static int fuse_do_truncate(const FuseExport *exp, int64_t size,
>   {
>       uint64_t blk_perm, blk_shared_perm;
>       BdrvRequestFlags truncate_flags = 0;
> -    int ret;
> +    bool add_resize_perm;
> +    int ret, ret_check;
> +
> +    /* Growable and writable exports have a permanent RESIZE permission */
> +    add_resize_perm = !exp->growable && !exp->writable;
>   
>       if (req_zero_write) {
>           truncate_flags |= BDRV_REQ_ZERO_WRITE;
>       }
>   
> -    /* Growable exports have a permanent RESIZE permission */
> -    if (!exp->growable) {
> +    if (add_resize_perm) {
> +
> +        if (!qemu_in_main_thread()) {
> +            /* Changing permissions like below only works in the main thread */
> +            return -EPERM;
> +        }
> +
>           blk_get_perm(exp->common.blk, &blk_perm, &blk_shared_perm);
>   
>           ret = blk_set_perm(exp->common.blk, blk_perm | BLK_PERM_RESIZE,
> @@ -412,9 +421,11 @@ static int fuse_do_truncate(const FuseExport *exp, int64_t size,
>       ret = blk_truncate(exp->common.blk, size, true, prealloc,
>                          truncate_flags, NULL);
>   
> -    if (!exp->growable) {
> +    if (add_resize_perm) {
>           /* Must succeed, because we are only giving up the RESIZE permission */
> -        blk_set_perm(exp->common.blk, blk_perm, blk_shared_perm, &error_abort);
> +        ret_check = blk_set_perm(exp->common.blk, blk_perm,
> +                                 blk_shared_perm, &error_abort);
> +        assert(ret_check == 0);
>       }
>   
>       return ret;


