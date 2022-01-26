Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA96549D064
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 18:08:42 +0100 (CET)
Received: from localhost ([::1]:35446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nClmj-0006KU-T8
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 12:08:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nClVj-0006cY-1P
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 11:51:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37676)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nClVb-0006L3-Qh
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 11:51:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643215858;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o+Yfbohfx3BAOGtWuXkz3uZgVVYStLDpktObzS4i1Zk=;
 b=N4dYg/UwxxpoQ6x3KDpRmN2uw9D1aC43HukRs0Aea8fS8lda5nCkFAD7LrLoBcSDJ+2jV/
 46Bq4uWeI2slaQDZYcUJL4FmHmjv8yHNlloC4Y0Bdvrn7mHy0H9Yr+cXKeHb3vv+mgQfC8
 GkPCmuFirE+seUprDwN0K96mZGRAguM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-661-zoR-ThtOOmK-tneQvxPdgA-1; Wed, 26 Jan 2022 11:50:57 -0500
X-MC-Unique: zoR-ThtOOmK-tneQvxPdgA-1
Received: by mail-wm1-f71.google.com with SMTP id
 z2-20020a05600c220200b0034d2eb95f27so152351wml.1
 for <qemu-devel@nongnu.org>; Wed, 26 Jan 2022 08:50:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=o+Yfbohfx3BAOGtWuXkz3uZgVVYStLDpktObzS4i1Zk=;
 b=huRYoxXEDkZeHjBmQdm7LBrLfMJUgvm1OQLJIHOnka6vhcOrSFwc6s0DH73IpZKuKT
 Q9KntVCjZ1CXLCht5MGz1/CzRDWu9UnJaWsSj479PJ8T+CcvNhVjsrnkJTAde5EjHGRZ
 Pbu+5EGE934wiqn25u2ahX47viLmID6gT3t1nCMDDLMaBogIarFxlMuNt9dsl6HU+4BI
 jARWHlluE4hPYq0fT9JQxgJz2TU3dv/PPM0vnu9CO5yMtuw3ZiTV/94pJpJt7hgvDohe
 t3RcUyWTOB5HstEHc6jhVpKP8TP8qgKVR85DLTuOfJeYECvwKO5tFhc4Ei4kSZVJP8Pe
 YmXA==
X-Gm-Message-State: AOAM530jY9ycAT3pReGLnxg43n2RnTZgLM7je0QlKHT4DQubvAEzSaHY
 Xjj5ZtrY6Olr1f9xjv3Ql+dx84Vh9BjNHeVgFCyazHeCMaw1iqNuFAmRue+qEfIOgdxKGXgyJr2
 dkBiqHLzICfosAL4=
X-Received: by 2002:a5d:6289:: with SMTP id k9mr16850156wru.327.1643215856057; 
 Wed, 26 Jan 2022 08:50:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzl0t1BACrr0Syl3fmRoHPJVb6VIy+0MZWudmecipcES0egcNmgaK0Ok66AzzENNNJOj3DD+Q==
X-Received: by 2002:a5d:6289:: with SMTP id k9mr16850142wru.327.1643215855860; 
 Wed, 26 Jan 2022 08:50:55 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id 11sm3736361wmx.5.2022.01.26.08.50.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jan 2022 08:50:55 -0800 (PST)
Message-ID: <a6bbde0a-7435-9bb0-f6ed-ca453c0ae8e8@redhat.com>
Date: Wed, 26 Jan 2022 17:50:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] qemu-storage-daemon: Fix typo in vhost-user-blk help
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
References: <20220125151514.49035-1-kwolf@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220125151514.49035-1-kwolf@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.155,
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
Cc: f4bug@amsat.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25.01.22 16:15, Kevin Wolf wrote:
> The syntax of the fd passing case misses the "addr.type=" key. Add it.
>
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>   storage-daemon/qemu-storage-daemon.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


