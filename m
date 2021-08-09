Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55EDD3E48DE
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 17:31:21 +0200 (CEST)
Received: from localhost ([::1]:51826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD7FH-0005UG-Tx
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 11:31:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mD7E4-0004Fu-88
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 11:30:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58368)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mD7E1-0000F4-4y
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 11:30:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628522999;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l5dZasIXmwFxT/ZTxYzeXahw5XdQdYHcEEkNLa4fr4k=;
 b=POZiqwgCe75hHfdGrLOxGlRojUYXxzVn4fq3sofBbzI4V61k5+4DvQUsRWhOiIfRKgOKWj
 jBn5ytzDRl6T4qEZM+mEja13PmJx4lq/nN5//vrbE1UuaV0mVz1tJaU0oP0VedbtASmIpz
 sko3osY8SeIVFnguhvUduNIAvHozcyQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-595-6udOGBqINoClkNgkw7FkRQ-1; Mon, 09 Aug 2021 11:29:56 -0400
X-MC-Unique: 6udOGBqINoClkNgkw7FkRQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 j33-20020a05600c1c21b02902e6828f7a20so118858wms.7
 for <qemu-devel@nongnu.org>; Mon, 09 Aug 2021 08:29:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=l5dZasIXmwFxT/ZTxYzeXahw5XdQdYHcEEkNLa4fr4k=;
 b=nQDQQ+ThgtEmtk+Wr2xJy1Hu/JcCcFs9eeklbatP9GsvGsL0af3+WzFp6llJqv4tpY
 RCydB6/HuA+3OCdfF6mPP9T5X4ZnbYJ0IMOlEkKnI7rSczN3+iMgQMndwRL7qhOxWgQ6
 fhcH+y+PNDJQksTyhqqdNjCIMIqxvhR5CcmCB96GV89mzs5FRZuiK2J/UNgH54LE41QV
 y1BHpPkjRU2nM4AP2o40dSR+m9w1+Zjc+A8FN0sKAHCvxs343QKX4gO3EGR7A2UXrLJu
 Z44oJ/kup86eLgVhdXuQv5szLZb4VFIAXiaRHLYvYwVaKIHGVfp1ZXxeu+TvmWS3IfzM
 LY6A==
X-Gm-Message-State: AOAM531cMPIKRJUuWZ8f7ucRFvPLvlBkVOYH2Jva6fxzEy7OoUmi5bKD
 u7BVEtI2W/ktk1tB5jQFFx9ZZCY5xV9/p0no7TT/IcqmrOKvb0BbmNLCtnPuOza+udBrMBq+fze
 8Iy3ZrcR2vFmoeSOdZShh2T993FNeJX2bahAusAr4I0HlYoN4x3qAFSJay3B9A8Tx
X-Received: by 2002:a1c:1d13:: with SMTP id d19mr7099019wmd.135.1628522994807; 
 Mon, 09 Aug 2021 08:29:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw3Uuz8Eqsgh1Rwj+smBJBzpgruRObNr8CUVKsNdcf6kHm71OVy49ns9gx8u0k74KX5ylJDQw==
X-Received: by 2002:a1c:1d13:: with SMTP id d19mr7099000wmd.135.1628522994622; 
 Mon, 09 Aug 2021 08:29:54 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 u25sm4693269wml.8.2021.08.09.08.29.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Aug 2021 08:29:54 -0700 (PDT)
Subject: Re: [PATCH v2] block/export/fuse.c: fix musl build
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, qemu-devel@nongnu.org
References: <20210809095101.1101336-1-fontaine.fabrice@gmail.com>
From: Hanna Reitz <hreitz@redhat.com>
Message-ID: <ebbfad5c-fdfe-e77b-55da-bff5d8efca59@redhat.com>
Date: Mon, 9 Aug 2021 17:29:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210809095101.1101336-1-fontaine.fabrice@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09.08.21 11:51, Fabrice Fontaine wrote:
> Fix the following build failure on musl raised since version 6.0.0 and
> https://gitlab.com/qemu-project/qemu/-/commit/4ca37a96a75aafe7a37ba51ab1912b09b7190a6b
> because musl does not define FALLOC_FL_ZERO_RANGE:
>
> ../block/export/fuse.c: In function 'fuse_fallocate':
> ../block/export/fuse.c:563:23: error: 'FALLOC_FL_ZERO_RANGE' undeclared (first use in this function)
>    563 |     } else if (mode & FALLOC_FL_ZERO_RANGE) {
>        |                       ^~~~~~~~~~~~~~~~~~~~
>
> Fixes:
>   - http://autobuild.buildroot.org/results/b96e3d364fd1f8bbfb18904a742e73327d308f64
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2 (after review of Philippe Mathieu-Daudé):
>   - Use CONFIG_FALLOCATE_ZERO_RANGE and make safer #ifdef'ry
>
>   block/export/fuse.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)

Thanks, applied to my block branch:

https://github.com/XanClic/qemu/commits/block

(Of note: I’ve had an email address change today, so sending the pull 
request may become a bit hairy.  If it doesn’t work out, I’ll have to 
ask Kevin (or Peter directly, given this is a build fix) tomorrow.)


