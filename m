Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE2E446423
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 14:29:21 +0100 (CET)
Received: from localhost ([::1]:57340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mizHT-0001HU-V9
	for lists+qemu-devel@lfdr.de; Fri, 05 Nov 2021 09:29:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mizFL-0008Cd-0P
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 09:27:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53519)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mizFG-0001J3-T9
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 09:27:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636118815;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A3v1Kwu/D7VMLJOSCkry+oYDcsVNS833SFiRE2ADIeQ=;
 b=MJbOUNWZeOR7ValseshYcxmfK2DnK1Bf3bqMdJxIJ30RlpGFEMquy35vp54NdKMZPU3lVr
 7zCbe9+wwCuwaJv3fzeqhr2xs0ft3tpOKkVpPTrsrv/t6Ivf1QQHFLK5M6w40L0TaI49gg
 SwrababpdLgoxlVnvkxzJIENae4/gso=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-86-pxuvecyzMyGxm41Tbm58oQ-1; Fri, 05 Nov 2021 09:26:54 -0400
X-MC-Unique: pxuvecyzMyGxm41Tbm58oQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 d13-20020adf9b8d000000b00160a94c235aso2338517wrc.2
 for <qemu-devel@nongnu.org>; Fri, 05 Nov 2021 06:26:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=A3v1Kwu/D7VMLJOSCkry+oYDcsVNS833SFiRE2ADIeQ=;
 b=6Qr3/y+pmkFeUMIvpyBwxIb0avWVmljNPMiHrAx1VcPWdcRpz0p2TSX+aX+2l0Lf/v
 JrFwktlVD4dVf12OWIrPRs5UOnY+QBCr6jO17eX/D6D81mMprmNsHcNYbZsHQTtFBk87
 CJNYJaitb0fuQbmm1pKdnbfy5frsUJ3x/kMtnoQMZA1ZeSEU6LbiRz+OxN0wYWgtSa6q
 6MwBXYr3sC+3hNX4PBpDchBqPX6NPgepZxVeoXqEuLL9TwRCCsRWhKI5ejPx1ukqusOv
 2YLHELj/M/1pYNIOpsNBuNHKzx6c/hwDGHOvYg2dmR4DMkyigfw4zHJGil+EoAeN+sxH
 AndA==
X-Gm-Message-State: AOAM532UVW0B4ccwTRCfufOFttIC7jGB2dlYx9G6ZZzJzrOb12FR7RQQ
 P1itwNBDSrdmvb+4h5wzK5sYWw1mB/oLeU31oAcWzh82WP7czQU1fQmoa811aSLBxbYTB64DXqU
 TEjKL8gPCp6M7rf8=
X-Received: by 2002:a05:600c:2046:: with SMTP id
 p6mr30375166wmg.87.1636118813236; 
 Fri, 05 Nov 2021 06:26:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwGq3lHmQxMu2uX2VNjvIjX+Usi/49qtHpZkNMgOzxX5tEVyqo6BRWZs03u+SD4NREWtwsYhQ==
X-Received: by 2002:a05:600c:2046:: with SMTP id
 p6mr30375126wmg.87.1636118812862; 
 Fri, 05 Nov 2021 06:26:52 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id s24sm7399636wmj.26.2021.11.05.06.26.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Nov 2021 06:26:52 -0700 (PDT)
Message-ID: <98d98c4b-9e34-700c-c659-2dd6f169a4c8@redhat.com>
Date: Fri, 5 Nov 2021 14:26:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] docs: fix qemu incorrect tag
To: huangy81@chinatelecom.cn, qemu-devel <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>
References: <2f6070f08d63fd2281d324c70bb5f8db3b4c803c.1636116975.git.huangy81@chinatelecom.cn>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <2f6070f08d63fd2281d324c70bb5f8db3b4c803c.1636116975.git.huangy81@chinatelecom.cn>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.648,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.093, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Eric Blake <eblake@redhat.com>, Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc'ing qemu-trivial@

On 11/5/21 14:01, huangy81@chinatelecom.cn wrote:
> From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> 
> The last modification of the patchset may be 2 month before
> merging dirtyrate implementation, it used the wrong tag, so
> fix with 6.2.

Maybe:

 The patchset merged in 71864eadd9a ("migration/dirtyrate:
 introduce struct and adjust DirtyRateStat") was targeting
 QEMU 6.1 but got merged later, so correct the tag for 6.2.

Anyhow,
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> ---
>  qapi/migration.json | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/qapi/migration.json b/qapi/migration.json
> index 87146ce..f0aefda 100644
> --- a/qapi/migration.json
> +++ b/qapi/migration.json
> @@ -1740,7 +1740,7 @@
>  #
>  # @dirty-rate: dirty rate.
>  #
> -# Since: 6.1
> +# Since: 6.2
>  #
>  ##
>  { 'struct': 'DirtyRateVcpu',
> @@ -1774,7 +1774,7 @@
>  #
>  # @dirty-bitmap: calculate dirtyrate by dirty bitmap.
>  #
> -# Since: 6.1
> +# Since: 6.2
>  #
>  ##
>  { 'enum': 'DirtyRateMeasureMode',
> @@ -1796,13 +1796,13 @@
>  # @calc-time: time in units of second for sample dirty pages
>  #
>  # @sample-pages: page count per GB for sample dirty pages
> -#                the default value is 512 (since 6.1)
> +#                the default value is 512 (since 6.2)
>  #
>  # @mode: mode containing method of calculate dirtyrate includes
> -#        'page-sampling' and 'dirty-ring' (Since 6.1)
> +#        'page-sampling' and 'dirty-ring' (Since 6.2)
>  #
>  # @vcpu-dirty-rate: dirtyrate for each vcpu if dirty-ring
> -#                   mode specified (Since 6.1)
> +#                   mode specified (Since 6.2)
>  #
>  # Since: 5.2
>  #
> 


