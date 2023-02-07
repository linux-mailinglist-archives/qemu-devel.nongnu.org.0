Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B839E68D5F0
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 12:48:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPMSJ-0001q6-5w; Tue, 07 Feb 2023 06:48:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pPMSH-0001me-Cf
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 06:48:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pPMSF-0006XA-Gg
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 06:48:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675770486;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q/tlj2G+bGJ0zY3gamWORuMf77cSiGeIV4WMkaxInQM=;
 b=W1fmkFJyRp7Ek+dHAgOkzGhUsTdiBFZQMe5TMrifuwOBcY4Ga2g9GNBT9bX0MfxgRBqnjm
 9aBRL6VZWiqEFpjfJvIg052lF7xBVcz/GanEzKnptHt1kZZLh/9xafTWkiOtN6MFsWbA2r
 nP8Dgg71XKX4wRK6gP+wdR1w6iXDSXA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-672-2wfXytXsOMKX4G70ToRBgg-1; Tue, 07 Feb 2023 06:48:05 -0500
X-MC-Unique: 2wfXytXsOMKX4G70ToRBgg-1
Received: by mail-wm1-f72.google.com with SMTP id
 k17-20020a05600c1c9100b003dd41ad974bso8035809wms.3
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 03:48:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Q/tlj2G+bGJ0zY3gamWORuMf77cSiGeIV4WMkaxInQM=;
 b=lcnSdUrDSzmXG5xcP6ibORx9DokcItQtSl6BarsYPweKrOyvmjjBVIoAI3Lr8AUZyF
 niVKuY8j2djmSJmpmSSGZqjuAb3E38I35bUGgcm4AJhaw2mvjTVsWyF8OEtybY+xJ+c9
 7l6iiL2jYLoawhDDmhMJm9rl9yXR/74bbeOjshyJ3VWOM4NAGhAEfm4LoZ9wXLv+wQxU
 6tj/9nJAJpoJvhbaHediijT0kZC6GKSuWTCSpJz6DIycG1REmVXATZN4oBwEOhl1g4tR
 Q8VTylJk0dc/1MEH1vuAtJUi3vc+DqBa8cinarunnpaR0bbA9YTd7ib+Ii+aDUo/8jDh
 XnuA==
X-Gm-Message-State: AO0yUKVEPjjVfaxxoz7SmltMN0EGq3cU4s8jvDRO5UdFx6fK80CAQ3aT
 vbPiy064/UV9vq1eoRzAHPS/hVfh7sl5PgO7vVpfo7sE6aDGDKfUuQbV8M4q8JebNfIEj1iqGtn
 iu7csJt0Cu9NcGhI=
X-Received: by 2002:a05:600c:705:b0:3dc:16d2:ae5e with SMTP id
 i5-20020a05600c070500b003dc16d2ae5emr2861590wmn.32.1675770484689; 
 Tue, 07 Feb 2023 03:48:04 -0800 (PST)
X-Google-Smtp-Source: AK7set89t8lP2bCW1crpgYiguitYF7+rbxSX5WLPCRizlgPX1ULPF8ut81LIpynyiuI49xe3cznn6A==
X-Received: by 2002:a05:600c:705:b0:3dc:16d2:ae5e with SMTP id
 i5-20020a05600c070500b003dc16d2ae5emr2861579wmn.32.1675770484515; 
 Tue, 07 Feb 2023 03:48:04 -0800 (PST)
Received: from ?IPV6:2003:cf:d708:4b2c:f69d:dcc6:80c8:9f6f?
 (p200300cfd7084b2cf69ddcc680c89f6f.dip0.t-ipconnect.de.
 [2003:cf:d708:4b2c:f69d:dcc6:80c8:9f6f])
 by smtp.gmail.com with ESMTPSA id
 g10-20020a05600c310a00b003de77597f16sm14400533wmo.21.2023.02.07.03.48.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 03:48:04 -0800 (PST)
Message-ID: <f81c4a23-5c0d-3118-ed94-e5bb8a386051@redhat.com>
Date: Tue, 7 Feb 2023 12:48:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 1/4] block: fix detect-zeroes= with
 BDRV_REQ_REGISTERED_BUF
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Fam Zheng <fam@euphon.net>, Fiona Ebner <f.ebner@proxmox.com>,
 qemu-stable@nongnu.org, Eric Blake <eblake@redhat.com>
References: <20230201152751.270508-1-stefanha@redhat.com>
 <20230201152751.270508-2-stefanha@redhat.com>
From: Hanna Czenczek <hreitz@redhat.com>
In-Reply-To: <20230201152751.270508-2-stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.148, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 01.02.23 16:27, Stefan Hajnoczi wrote:
> When a write request is converted into a write zeroes request by the
> detect-zeroes= feature, it is no longer associated with an I/O buffer.
> The BDRV_REQ_REGISTERED_BUF flag doesn't make sense without an I/O
> buffer and must be cleared because bdrv_co_do_pwrite_zeroes() fails with
> -EINVAL when it's set.
>
> Fiona Ebner <f.ebner@proxmox.com> bisected and diagnosed this QEMU 7.2
> regression where writes containing zeroes to a blockdev with
> discard=unmap,detect-zeroes=unmap fail.
>
> Buglink: https://gitlab.com/qemu-project/qemu/-/issues/1404
> Fixes: e8b6535533be ("block: add BDRV_REQ_REGISTERED_BUF request flag")
> Tested-by: Fiona Ebner <f.ebner@proxmox.com>
> Cc: qemu-stable@nongnu.org
> Reviewed-by: Eric Blake <eblake@redhat.com>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>   block/io.c | 3 +++
>   1 file changed, 3 insertions(+)

Reviewed-by: Hanna Czenczek <hreitz@redhat.com>


