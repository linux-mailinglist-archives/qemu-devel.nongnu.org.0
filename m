Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80163675612
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 14:44:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIrg0-00016e-DF; Fri, 20 Jan 2023 08:43:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pIrfy-00013p-4q
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 08:43:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pIrfw-0007XB-L8
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 08:43:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674222203;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UArJqVW381ofUdb2RLmJ9mZN+hHLcwctmdXM+iKpkOY=;
 b=dFbd8p4PIzx6szRsiGOjQ2r0/mY+oL3exhxWU9FbZVeUCTgPYIeDxZtUuB4S+b+FkEw5xv
 AtK8iujPrKnIp+L0ofvbPcpKFi7jxDOdLA7uv46a12nAjO8jy0MJNFIEXrTNFWhiQBVSDp
 pKO9SZneMcUxYOqIgZsnlciO2U8vxlM=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-177-xuMiO_9lPmGu2r8Dl9NsCw-1; Fri, 20 Jan 2023 08:43:22 -0500
X-MC-Unique: xuMiO_9lPmGu2r8Dl9NsCw-1
Received: by mail-ed1-f71.google.com with SMTP id
 v8-20020a056402348800b0049e1913bd43so3962230edc.20
 for <qemu-devel@nongnu.org>; Fri, 20 Jan 2023 05:43:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UArJqVW381ofUdb2RLmJ9mZN+hHLcwctmdXM+iKpkOY=;
 b=mGaIMMST+oULs03OOj5C2JGc3D46OMN+7ksqUyfLrHwlcVDMu8MTmgQ+PBnEE3Fbsx
 TI3JRbG9fOFNEigd33VSr9oVR7Ta19bE986XPLd+EXqkwcdcDi3VomVGcFgkJVxgnIGY
 nFV3gzX1x905QLaqZe5letr9bVB4kzYUjawvjsstNKcwlwTjAB0v4uBe47S6XkK3/BQ7
 TPRV9aMaPBS6tDk7hf7vj+Wg1i1RvFOQ0UjiNRR8tyLbU0nGxFE5kgU4PlkmUMtzmwY3
 IWiU/E0nectC0m1qEyO2MmhXdDta+0NsdMA4t3KUkzEkQYaDjlrze6/870wfG+4Rstee
 U0LQ==
X-Gm-Message-State: AFqh2krmN77MxuwhXcs+KSIlvJyR3hWeGWc0eq+AhkCxfpmEwbwM/29A
 dBbvh6lugc3YGuM6d53GwH2KuPdUp7oAaQzpWK/xhDClKuSIIo1E2ykXcaJso/2JgFj1Xzlx98w
 IdGXqsV4Zk1Dpw8g=
X-Received: by 2002:a17:906:2dd6:b0:86b:119c:7ea8 with SMTP id
 h22-20020a1709062dd600b0086b119c7ea8mr15235425eji.49.1674222201342; 
 Fri, 20 Jan 2023 05:43:21 -0800 (PST)
X-Google-Smtp-Source: AMrXdXt+Yy9991FEq0piuCJyBM/01F++20/6JYfMIDhqVjlT7se31sYMHds+CpURwFFcSj1y3BfSjg==
X-Received: by 2002:a17:906:2dd6:b0:86b:119c:7ea8 with SMTP id
 h22-20020a1709062dd600b0086b119c7ea8mr15235395eji.49.1674222200985; 
 Fri, 20 Jan 2023 05:43:20 -0800 (PST)
Received: from ?IPV6:2a02:8071:5050:c500:3cbc:a8ad:61a8:57e3?
 ([2a02:8071:5050:c500:3cbc:a8ad:61a8:57e3])
 by smtp.gmail.com with ESMTPSA id
 q27-20020a1709066b1b00b0087329ff593fsm5420131ejr.144.2023.01.20.05.43.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Jan 2023 05:43:20 -0800 (PST)
Message-ID: <a79ae21b-67d1-d750-d891-652d29a0777b@redhat.com>
Date: Fri, 20 Jan 2023 14:43:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 03/12] block/vmdk: Change extent info type
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>
References: <20220620162704.80987-1-hreitz@redhat.com>
 <20220620162704.80987-4-hreitz@redhat.com> <Y8lfsJ5W2UxUPmWm@redhat.com>
From: Hanna Czenczek <hreitz@redhat.com>
In-Reply-To: <Y8lfsJ5W2UxUPmWm@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.089, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 19.01.23 16:20, Kevin Wolf wrote:
> Am 20.06.2022 um 18:26 hat Hanna Reitz geschrieben:
>> VMDK's implementation of .bdrv_get_specific_info() returns information
>> about its extent files, ostensibly in the form of ImageInfo objects.
>> However, it does not get this information through
>> bdrv_query_image_info(), but fills only a select few fields with custom
>> information that does not always match the fields' purposes.
>>
>> For example, @format, which is supposed to be a block driver name, is
>> filled with the extent type, e.g. SPARSE or FLAT.
>>
>> In ImageInfo, @compressed shows whether the data that can be seen in the
>> image is stored in compressed form or not.  For example, a compressed
>> qcow2 image will store compressed data in its data file, but when
>> accessing the qcow2 node, you will see normal data.  This is not how
>> VMDK uses the @compressed field for its extent files: Instead, it
>> signifies whether accessing the extent file will yield compressed data
>> (which the VMDK driver then (de-)compresses).
> Actually, VMDK was the only user of the field in ImageInfo. qcow2
> doesn't set the field at all because it would have to parse all L2
> tables in order to set it.

Right, makes sense.

> So I suppose @compressed can now be removed from ImageInfo?

I think so.  Looks like it was indeed introduced specifically for VMDK’s extent information (cbe82d7fb32, f4c129a38a5) so that ImageInfo could be used there, which this patch here changes.  So we should probably indeed remove the field – it did lead me to naïvely believe that it would have a meaning on images that actually support compression (like qcow2) after all.

Hanna


