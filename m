Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7EEB447CAA
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 10:20:15 +0100 (CET)
Received: from localhost ([::1]:54510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mk0p4-0001VO-OI
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 04:20:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mk0mr-0007xr-Oz
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 04:17:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41243)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mk0mk-0001Gb-42
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 04:17:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636363069;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Wajm78U75VqucCmeB/h2Qidv4uAsOs1y9C58Ip5aIDY=;
 b=OUJh5dXcabFl949aPoxOy05SPqhIQnAk1IHsKBIVhBsyG1+S2oxHTZHSpdV0L2547Jy9d4
 g5Xhiukv41njIJl8rpZx4a47GUgP1VdKvOBbRDx7e3K6Jay4NPuMWoWUpM0G8M3WsWPyk3
 UxLNy4WH0CVfs1xpQg6lc5c+hQlH464=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-174-ZmBQlaFtM_qUWDwvhKgSPg-1; Mon, 08 Nov 2021 04:17:48 -0500
X-MC-Unique: ZmBQlaFtM_qUWDwvhKgSPg-1
Received: by mail-wr1-f71.google.com with SMTP id
 z5-20020a5d6405000000b00182083d7d2aso3839059wru.13
 for <qemu-devel@nongnu.org>; Mon, 08 Nov 2021 01:17:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Wajm78U75VqucCmeB/h2Qidv4uAsOs1y9C58Ip5aIDY=;
 b=FuXn4xVa5GVv8/nTxtupdoVPrlhqejNwvBVQDmgBSKE00DaqDlaZq2TvbjyHZOG3QO
 psmjR5u8C1Qz2HrLRH9G++V9+pBLPx+ujWzYNM95qT+ykIfDU/Pw3MN3x/BF13AmjrrR
 ZZeAsFMJL8mIcMSNdP6BBrHgcNM1zvadrO3FtM0y+Tm5mm7hAy7MhcLNuLVA2pUG2/rG
 tbaYIwr9H0ZoSAsROJ15H68/tmsUVCCFDhSXTiY3iwbDNBfH9xZD6xRCa0JkOMqtPddN
 aJesrXEgovEwDwM0gsfqfJPc5ksnhNr84aHExbSxycLelRWiw+BBy4zZHmWQj5o3tZ2I
 r1kA==
X-Gm-Message-State: AOAM530uwRPZUIyrPOu1Nb4kIK8cmqnowU2qPzpiESNjknPjI1aTKbLX
 uzq4ZkWEV0luam0xtNvXpQJGhZCYmoPftSVKBbO44ULh5BVtaLEu85RIySCHEP4vppw9HgJGgSp
 q9YTMwSi62Qy2nuM=
X-Received: by 2002:adf:8008:: with SMTP id 8mr89910764wrk.188.1636363066981; 
 Mon, 08 Nov 2021 01:17:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx+FAkSd7w1cL97/FsFFi8yuuHn22f8CLn8EjQsmUMxDIr5F7qFfmcXmeiL87aBw56XQTuf6w==
X-Received: by 2002:adf:8008:: with SMTP id 8mr89910741wrk.188.1636363066814; 
 Mon, 08 Nov 2021 01:17:46 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id z135sm22911592wmc.45.2021.11.08.01.17.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Nov 2021 01:17:46 -0800 (PST)
Message-ID: <3d3762c0-425f-3a04-216f-4a0915cff29d@redhat.com>
Date: Mon, 8 Nov 2021 10:17:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 4/4] configure: ignore preexisting QEMU_*FLAGS envvars
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20211108084323.541961-1-pbonzini@redhat.com>
 <20211108084323.541961-5-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211108084323.541961-5-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.06, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: thuth@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/8/21 09:43, Paolo Bonzini wrote:
> User flags should be passed via CFLAGS/CXXFLAGS/LDFLAGS,
> or --extra-cflags/extra-cxxflags/--extra-ldflags on the
> command line.
> 
> QEMU_CFLAGS, QEMU_CXXFLAGS and QEMU_LDFLAGS are reserved
> for flags detected by configure, so do not add to them
> and clear them at the beginning of the script.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  configure | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/configure b/configure
> index 1ea26c67e5..2048a52b20 100755
> --- a/configure
> +++ b/configure
> @@ -158,7 +158,7 @@ update_cxxflags() {
>      # Set QEMU_CXXFLAGS from QEMU_CFLAGS by filtering out those
>      # options which some versions of GCC's C++ compiler complain about
>      # because they only make sense for C programs.
> -    QEMU_CXXFLAGS="$QEMU_CXXFLAGS -D__STDC_LIMIT_MACROS -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS"
> +    QEMU_CXXFLAGS="-D__STDC_LIMIT_MACROS -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS"
>      CONFIGURE_CXXFLAGS=$(echo "$CONFIGURE_CFLAGS" | sed s/-std=gnu11/-std=gnu++11/)
>      for arg in $QEMU_CFLAGS; do
>          case $arg in

update_cxxflags() should keep previous QEMU_CXXFLAGS. But since
we call it only once, we don't use it to update. IMHO we should
inline this code where it is called, then overwriting QEMU_CXXFLAGS
makes sense.


