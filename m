Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC9566DC54
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 12:26:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHk55-0003j8-PR; Tue, 17 Jan 2023 06:24:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pHk4Y-0003UO-FA
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 06:24:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pHk4V-0002eM-Ti
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 06:24:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673954646;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ML0kkYKqgv+53d7sHNc/zCqr0lzlk7iT4mfPhz6Nh4g=;
 b=Mjdl06CsfYuath+ozArTj1g/RFpV9kIqnl6jmbMUVICUPkY4P96H6eBMlQ0KH90BNGeAc0
 ZQG7GMBD3oQLmsdjvLA3Pd58HyY8zqW4CdUtSu0vx8ikA5C9uyWdBzOcBRS5CD9oF8yexh
 P2NX3OriGxHNdfMuc3IVqLNFJ9pdJ/g=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-617-9GQa5tBjO9y41POqDGH1NQ-1; Tue, 17 Jan 2023 06:24:05 -0500
X-MC-Unique: 9GQa5tBjO9y41POqDGH1NQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 m9-20020a056402430900b0049ca14dc2aaso7459046edc.16
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 03:24:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ML0kkYKqgv+53d7sHNc/zCqr0lzlk7iT4mfPhz6Nh4g=;
 b=0dTn/b5bazWvoEBQ7pTR2giwMsdTtw7GeUOJ/mYewXn6tTnowPvsH+ViBHhUbqwNof
 trOZ3JaIj+UyTVELPiSEQjHRIW3KkHd7OGgZuwjsv7QFmmQTmEZ8LVrYrPyXq+d6f+YS
 Q+qUVtbZqgreeHXbyuzybuXf/vukW+rpbBcVbEnMsFqRLcYdfY3ZwfG3Ddp76Xe+j81K
 oaKbCB27CzRr3XGDOawM7ptIMrALjldZTMG5ownuhl5090y4bI651iLlU0ltr7y//P/4
 C6ebuz15VSNLfYYu2EKS+R/YPPZ8LqX4BbRABJ+Qf6wdSkGy0eRxT3QZUYtnxGCcFtZ7
 CF0Q==
X-Gm-Message-State: AFqh2koYU+BaF7K1QdqhlXjkpAyMDsAeUQRAw2rUrPQIy0jPEVwuNmfa
 i5yIS1K19bXowu3jWVdYeAPWQhfrY/qN3cg5UXYU9zW8azFROiddNZczbeFfOHeDbfZ36G/9XGL
 b2at+A3Ckp0UwYH8=
X-Received: by 2002:a05:6402:120a:b0:472:d867:4c3d with SMTP id
 c10-20020a056402120a00b00472d8674c3dmr13385171edw.40.1673954644296; 
 Tue, 17 Jan 2023 03:24:04 -0800 (PST)
X-Google-Smtp-Source: AMrXdXv7zQOExMlo1bt2TiHqM1lu5889siz/W1FGmHEpMaS3o9XN/+as72BAOvomlTscMfKUmfWQsw==
X-Received: by 2002:a05:6402:120a:b0:472:d867:4c3d with SMTP id
 c10-20020a056402120a00b00472d8674c3dmr13385153edw.40.1673954644016; 
 Tue, 17 Jan 2023 03:24:04 -0800 (PST)
Received: from ?IPV6:2a02:8071:5050:c500:3cbc:a8ad:61a8:57e3?
 ([2a02:8071:5050:c500:3cbc:a8ad:61a8:57e3])
 by smtp.gmail.com with ESMTPSA id
 c6-20020a056402100600b0046b471596e6sm12619016edu.57.2023.01.17.03.24.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Jan 2023 03:24:03 -0800 (PST)
Message-ID: <7c6fa2b1-b0e3-2b98-1a4d-a0d49143f73a@redhat.com>
Date: Tue, 17 Jan 2023 12:24:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 0/4] qemu-img: Fix exit code for errors closing the image
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Cc: aesteve@redhat.com, nsoffer@redhat.com, qemu-devel@nongnu.org
References: <20230112191454.169353-1-kwolf@redhat.com>
From: Hanna Czenczek <hreitz@redhat.com>
In-Reply-To: <20230112191454.169353-1-kwolf@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.097, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 12.01.23 20:14, Kevin Wolf wrote:
> This series addresses the problem described in these bug reports:
> https://gitlab.com/qemu-project/qemu/-/issues/1330
> https://bugzilla.redhat.com/show_bug.cgi?id=2147617
>
> qcow2 can fail when writing back dirty bitmaps in qcow2_inactivate().
> However, when the function is called through blk_unref(), in the case of
> such errors, while an error message is written to stderr, the callers
> never see an error return. Specifically, 'qemu-img bitmap/commit' are
> reported to exit with an exit code 0 despite the errors.
>
> The solution taken here is inactivating the images first, which can
> still return errors, but already performs all of the write operations.
> Only then the images are actually blk_unref()-ed.

Reviewed-by: Hanna Czenczek <hreitz@redhat.com>


