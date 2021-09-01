Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB8E3FD87D
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 13:12:32 +0200 (CEST)
Received: from localhost ([::1]:43960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLOAR-0006BT-RH
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 07:12:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mLO6W-0002RW-7j
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 07:08:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46404)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mLO6R-0005qB-2y
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 07:08:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630494498;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Gu8bvIVXhfNKjBh9jBheO1ZqmEiR9cSo0BqjKYdfpXw=;
 b=YyZhE6ZgYa7C+Z6RiJSruFsbWozDdtpI3M8T/HcpA3tTqST2veKdafnQffkw21VyIrYAVW
 jZSRHiHqLMsl4Byegb2y4ilUEQTDN81nakWVmrf59Vt8EUC7nhDAY7TDSdhVsA7STq+SxN
 TKVPfSx2QCQ/8sVy7fYB0kbqqzinSf8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-460-mZkwbkQ-NsiByhl9pHthsQ-1; Wed, 01 Sep 2021 07:08:15 -0400
X-MC-Unique: mZkwbkQ-NsiByhl9pHthsQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 f19-20020a1c1f13000000b002e6bd83c344so886035wmf.3
 for <qemu-devel@nongnu.org>; Wed, 01 Sep 2021 04:08:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=Gu8bvIVXhfNKjBh9jBheO1ZqmEiR9cSo0BqjKYdfpXw=;
 b=YEFnmVo2BIlz47NJtofiIHr8KbV7QyHBxyVRVZ5uTqkbGyZEvpgprB8+k4HfVkeI68
 g41+DOBMOKvLN+Fj1fr0YQz7RduioPuulGcsVybijx0XUsnCzFOzfoNyWiPTUh88GmrR
 RbZo5JLXVui9AFsHgNu1xkkYCXX9PeXj+TAnVlnKwFNWDVtaLqUIPlHyK//tZAtlLIf6
 6DNzBgWeBwxLa0ibYK8doEyDdhu4VZovd/ePhC0FRYWQd+aW0jo5v/ccgKzV3rceRxFF
 bkIoynh+zbHmi4L07eySVhwLYxRHoL0Ef+3fQxu/81K6bp+nWcFg17DtH6t6cPlpiUiC
 uduA==
X-Gm-Message-State: AOAM532UFRZxxAD+tBoIXNQ3KU1bM3Q3G1VMoOuSsBKi1Nzknr6BoF87
 SZy/+PiaDKkFmzbS9ZF7h+Ps1rM62KveBwIAQBPjJigJrl85IY2k21yLWea5P0hS3TovdkjKwAm
 E6vIPEWoQcpGe86c=
X-Received: by 2002:a05:6000:259:: with SMTP id
 m25mr37477921wrz.53.1630494494440; 
 Wed, 01 Sep 2021 04:08:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJylrJJRZoHjAEVVxtn1QDGRbUO21fpbp99KEwPr3BkJPSvbO5GXZJZsNHA9f2vrdlv3yu827Q==
X-Received: by 2002:a05:6000:259:: with SMTP id
 m25mr37477902wrz.53.1630494494265; 
 Wed, 01 Sep 2021 04:08:14 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 z9sm16959475wre.11.2021.09.01.04.08.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Sep 2021 04:08:13 -0700 (PDT)
Subject: Re: [PATCH] block/export/fuse.c: fix fuse-lseek on uclibc or musl
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, qemu-devel@nongnu.org
References: <20210827220301.272887-1-fontaine.fabrice@gmail.com>
From: Hanna Reitz <hreitz@redhat.com>
Message-ID: <22b83df9-a75a-7392-d87e-4035a8a641c1@redhat.com>
Date: Wed, 1 Sep 2021 13:08:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210827220301.272887-1-fontaine.fabrice@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, NICE_REPLY_A=-1.029, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

On 28.08.21 00:03, Fabrice Fontaine wrote:
> Include linux/fs.h to avoid the following build failure on uclibc or
> musl raised since version 6.0.0:
>
> ../block/export/fuse.c: In function 'fuse_lseek':
> ../block/export/fuse.c:641:19: error: 'SEEK_HOLE' undeclared (first use in this function)
>    641 |     if (whence != SEEK_HOLE && whence != SEEK_DATA) {
>        |                   ^~~~~~~~~
> ../block/export/fuse.c:641:19: note: each undeclared identifier is reported only once for each function it appears in
> ../block/export/fuse.c:641:42: error: 'SEEK_DATA' undeclared (first use in this function); did you mean 'SEEK_SET'?
>    641 |     if (whence != SEEK_HOLE && whence != SEEK_DATA) {
>        |                                          ^~~~~~~~~
>        |                                          SEEK_SET
>
> Fixes:
>   - http://autobuild.buildroot.org/results/33c90ebf04997f4d3557cfa66abc9cf9a3076137
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>   block/export/fuse.c | 3 +++
>   1 file changed, 3 insertions(+)

Thanks, applied to my block branch:

https://github.com/XanClic/qemu/commits/block

Hanna


