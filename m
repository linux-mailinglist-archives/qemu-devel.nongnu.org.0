Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBFB1455688
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Nov 2021 09:11:44 +0100 (CET)
Received: from localhost ([::1]:46210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mncWF-0004jA-5L
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 03:11:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mncSR-0001NM-Cb
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 03:07:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46406)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mncSO-0000AG-I9
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 03:07:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637222856;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=St7EjzF3zsHYHz9CCAnm6psqKMGnFtRlpuP1S4TIvDo=;
 b=b9V+cAVcTlTb5nZZ19zkELRazhMvV5cOgvwsPRokviyqrAERI+cz5ujreGTE9BYIgyFNq6
 s6r+JNHEIj81oc0lilpY/N5AMgJtqVAWtxz/Mz77t6BIQOakCQqEEOjaI7ZcOGunJpX/YK
 pZtcAuVzn9gZC4kW1hObXh0IEE3GAx4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-425-xLD7SZxGPOCKuwROnpy-lQ-1; Thu, 18 Nov 2021 03:07:34 -0500
X-MC-Unique: xLD7SZxGPOCKuwROnpy-lQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 201-20020a1c04d2000000b003335bf8075fso2269493wme.0
 for <qemu-devel@nongnu.org>; Thu, 18 Nov 2021 00:07:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=St7EjzF3zsHYHz9CCAnm6psqKMGnFtRlpuP1S4TIvDo=;
 b=P48f7MJ4zh0f+TLmswCAwjxjMPypoYwsb8oVr57Q95H4G+w7Lox9BFKmStQ0B98FiZ
 T2CJ22dgQEWnvtDLEvf1mYxl0pA1kEE+XQJMonLEbZgttiGWjJG9pvfIR8HQWCY2bO9f
 94KJOk0AiCoAcybcdmuqx2g77xaCKSn1FjsD6FTeT5D04C/D/e7rE2fUSd5gOYPTsBnI
 WER7YBJ+7nJZXzCUCgtp51D1W2bRf0TYLk3RXT2QYOreXhvTA9ayJBqwlQ6adthbCVIC
 2doaYBkSljnmqAd/1U3beoeisCkAxx5fAw4uaKD353Tgs962SND202XvBVqYiDVpfiA/
 zOUw==
X-Gm-Message-State: AOAM5312LH9F4v5MhrImWWJ+aAa8IKNsncSfVqC9XUEIkmWs6P1JlpzN
 fFVJs87PdcOyIRCCAlyuWvI5uyLJZA8dqW9eYYAdRJ3E+iE2pM8xb8WZRnmcpKhFrDxdFoQQE6g
 PsitnNd5PGY+udcc=
X-Received: by 2002:adf:d091:: with SMTP id y17mr28021789wrh.418.1637222853573; 
 Thu, 18 Nov 2021 00:07:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzpHinS5iFdYRBdEl/6KCre1uOwyat88g2d9JQFQDsPBKjhf6kEMlnqwRU921GymmQXNN5B/Q==
X-Received: by 2002:adf:d091:: with SMTP id y17mr28021747wrh.418.1637222853263; 
 Thu, 18 Nov 2021 00:07:33 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id d6sm2227983wrx.60.2021.11.18.00.07.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Nov 2021 00:07:33 -0800 (PST)
Message-ID: <073cbf85-e231-a113-5da4-e2028c48c44a@redhat.com>
Date: Thu, 18 Nov 2021 09:07:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2 13/13] blockdev: Drop unused drive_get_next()
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20211117163409.3587705-1-armbru@redhat.com>
 <20211117163409.3587705-14-armbru@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20211117163409.3587705-14-armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.084, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17.11.21 17:34, Markus Armbruster wrote:
> drive_get_next() is basically a bad idea.  It returns the "next" block
> backend of a certain interface type.  "Next" means bus=0,unit=N, where
> subsequent calls count N up from zero, per interface type.
>
> This lets you define unit numbers implicitly by execution order.  If the
> order changes, or new calls appear "in the middle", unit numbers change.
> ABI break.  Hard to spot in review.
>
> The previous commits eliminated all uses.  Drop the function.
>
> Cc: Kevin Wolf <kwolf@redhat.com>
> Cc: Hanna Reitz <hreitz@redhat.com>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   include/sysemu/blockdev.h |  1 -
>   blockdev.c                | 10 ----------
>   2 files changed, 11 deletions(-)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


