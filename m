Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F30C42A345
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 13:28:30 +0200 (CEST)
Received: from localhost ([::1]:35972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maFxN-0002vh-Ie
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 07:28:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1maFbv-0006Hc-5U
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 07:06:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60888)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1maFbp-0003IZ-4C
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 07:06:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634036772;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Mca5CMeUoKVvvBP76bVoPztuCHz2yPws0PCT2C3xt8M=;
 b=eITWuuIvClNs9V1nL9RtlZlgDuSnNMXlY6Q4HPFE0Xf+OxtbW4El7MZlwQSY8JAypmKusx
 EWg2eIwr9+buo5OGyr4LhY3hLNpUDXLh/q8zOUH2t8slubwZB4ZiBDgp3HLES0Y3oJ+9jg
 JJOKYxgS4VOdxy8bEctVx4o0UkVurwA=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-380-dTrdZq5HMnGWctJo8DZNpg-1; Tue, 12 Oct 2021 07:06:10 -0400
X-MC-Unique: dTrdZq5HMnGWctJo8DZNpg-1
Received: by mail-ed1-f70.google.com with SMTP id
 x5-20020a50f185000000b003db0f796903so18566595edl.18
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 04:06:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Mca5CMeUoKVvvBP76bVoPztuCHz2yPws0PCT2C3xt8M=;
 b=fTzlJrDluFNdJ8KD5Us90023eCMz88FYvciOJVCrY5rVRVLGNmtBsgAPMJ3VUS0kjP
 TFosDTuQRkah0nGNJ7i/y1JxsGCNBnmgl4mkj1SF6O/GkZf0J4OaQ2H7ndRgpAfdRbn6
 zSOjGsBRuKqcOydyl05XtTMPlzcgiunUsss3nLcJfU2gH8+nQSBc1CIh6Yv8LCtrBoQa
 Fte3DDyfMY5x0krfMfJ9Whd1FrHVrF/+MH3Mqys7mLMa473GvGb0ihz5A9U/3riCfOt6
 wO+G2jfhfkghb7Mv9RSLKu05LTmteePsZHvD9bYzhcwuoKW/nVUuo1DpG3L3/B0iCnez
 0yqA==
X-Gm-Message-State: AOAM532c9CWj+0GCFXyx5TtlgyOLy9Di20jgpTOPnGb7S6Dz5OMai+of
 XmKK6pW+PzE1Lm8G1BY+0cXGvDpB4vpxqihuMT7gfybCwjcYJzRn2Oo5lbQAYUMiQCQ4w8nCBQt
 LecJf/omPkdRpFZ8=
X-Received: by 2002:a05:6402:2808:: with SMTP id
 h8mr44090381ede.394.1634036769809; 
 Tue, 12 Oct 2021 04:06:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJys+xhkDb5OJDEOu/w9o6Z09FiOWcbpCm6XsiBxh14ezFNUldt5QOtizq5GpPJnRyaZbLBy6w==
X-Received: by 2002:a05:6402:2808:: with SMTP id
 h8mr44090328ede.394.1634036769550; 
 Tue, 12 Oct 2021 04:06:09 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id c17sm5582036edu.11.2021.10.12.04.06.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Oct 2021 04:06:09 -0700 (PDT)
Message-ID: <711c1dd0-c566-f486-87b1-a5ca8e22b44c@redhat.com>
Date: Tue, 12 Oct 2021 13:06:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3 13/25] include/sysemu/blockdev.h: move drive_add and
 inline drive_def
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20211012084906.2060507-1-eesposit@redhat.com>
 <20211012084906.2060507-14-eesposit@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20211012084906.2060507-14-eesposit@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/10/21 10:48, Emanuele Giuseppe Esposito wrote:
> +    if (type != IF_DEFAULT) {
> +        qemu_opt_set(opts, "if", if_name[type], &error_abort);
> +    }

To avoid exporting if_name, this can be replaced by a string argument 
directly.  But in any case this is okay for this series:

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

Paolo


