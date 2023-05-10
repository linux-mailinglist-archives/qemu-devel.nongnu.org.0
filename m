Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA196FD74E
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 08:40:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwdUf-00015u-9l; Wed, 10 May 2023 02:40:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pwdUY-00012M-IU
 for qemu-devel@nongnu.org; Wed, 10 May 2023 02:40:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pwdUW-0003U4-OO
 for qemu-devel@nongnu.org; Wed, 10 May 2023 02:40:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683700799;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F80G1QLuuOFyQmRBt2hRYK2frb50ddGpmDrYRkiI+ac=;
 b=BiXgryoeq/lAT4ywJPfdyF8wBefqjSON7zGksKoax0egkn5NUwIqJm522PjDJx1CCz1SkW
 /pxlvKd6xd6IYfAF/ID+PhOXyiiUiravbKCJ9Uma8eaRnH0rQbzfy68IYwAlTxZwwwZqrx
 dWVyoXe3BBRS0tfYJrsl5GjB70ZcIac=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-325-5EyNJGysMbyIXDpQTmdWlA-1; Wed, 10 May 2023 02:39:57 -0400
X-MC-Unique: 5EyNJGysMbyIXDpQTmdWlA-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-3064d0b726fso2322923f8f.0
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 23:39:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683700796; x=1686292796;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=F80G1QLuuOFyQmRBt2hRYK2frb50ddGpmDrYRkiI+ac=;
 b=NXhYlfUET8s8/g8kbF/7vodtBMjScD3ai8sCfJwarT+fGEufij/WyatsphE/2jepyL
 /GfHtl1bixhedfv1DKtHr4l/uZb+oOopKm74M4XxCBEMnNv9uPbqem+xORXew+fT3g9D
 gXPb2rHm29MNNIQi4J2GOoSNQyeh0D2vtPL+cCqqWPPzwZ7NTtogNuddACadKWA2qtho
 22wS1VIP1y2zT6UNacips8LDDfK+bnU/G1mftnarMJye7+/MPdLSmqu189A+voh2Ms6H
 hjNak88bogUFRzWbbJpUFLQngt1vRo7ST1fLAwGuzzdpJ8UdC966qD7kgt3Xlo3IhxQz
 QktA==
X-Gm-Message-State: AC+VfDyZaooj0XrVHKLGBzzG1px9+nuP+fnJ/J5brfBYRDdwnRusvSVg
 VyjdbQnAWkzf9WNZBBdGo+GmumfwsoOyZ4SPyEXQ0FWxinltBB3G0pyXRJI/zPfpteJJY00X9vY
 WwxMUVNDQmPVmxyY=
X-Received: by 2002:a1c:f708:0:b0:3f1:70e6:df66 with SMTP id
 v8-20020a1cf708000000b003f170e6df66mr10987061wmh.36.1683700796745; 
 Tue, 09 May 2023 23:39:56 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4mf1JW5KljHZQSt4T2Sc4Crk1a+0qjGwnNWnvk8xuzQF5kokLrngWqt45C+Ytreg6NElaQzg==
X-Received: by 2002:a1c:f708:0:b0:3f1:70e6:df66 with SMTP id
 v8-20020a1cf708000000b003f170e6df66mr10987048wmh.36.1683700796470; 
 Tue, 09 May 2023 23:39:56 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-179-53.web.vodafone.de.
 [109.43.179.53]) by smtp.gmail.com with ESMTPSA id
 p20-20020a1c7414000000b003f435652aaesm1876508wmc.11.2023.05.09.23.39.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 May 2023 23:39:55 -0700 (PDT)
Message-ID: <5377130a-6eca-f27e-04e8-9058e7ac3403@redhat.com>
Date: Wed, 10 May 2023 08:39:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 0/2] tests/lcitool: Add mtools and xorriso and remove
 genisoimage as dependencies
To: "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <anisinha@redhat.com>
Cc: qemu-devel@nongnu.org, berrange@redhat.com, alex.bennee@linaro.org,
 philmd@linaro.org, wainersm@redhat.com, bleal@redhat.com
References: <20230504154611.85854-1-anisinha@redhat.com>
 <20230509121552-mutt-send-email-mst@kernel.org>
Content-Language: en-US
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230509121552-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.421, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 09/05/2023 18.16, Michael S. Tsirkin wrote:
> On Thu, May 04, 2023 at 09:16:09PM +0530, Ani Sinha wrote:
>> mformat and xorriso tools are needed by biosbits avocado tests. This patchset
>> adds those two tools in the docker container images.
>> xorriso package conflicts with genisoimage package on some distributions.
>> Therefore, it is not possible to have both the packages at the same time
>> in the container image uniformly for all distribution flavors. Further,
>> on some distributions like RHEL, both xorriso and genisoimage
>> packages provide /usr/bin/genisoimage and on some other distributions like
>> Fedora, only genisoimage package provides the same utility.
>> Therefore, this change removes the dependency on geninsoimage for building
>> container images altogether keeping only xorriso package. At the same time,
>> cdrom-test.c is updated to use and check for existence of only xorrisofs.
>>
>> Patch 1 pulls in the latest changes in lcitool in order to add mappings
>> for these packages in various distros.
>> Patch 2 updates all Dockerfiles in QEMU repository to add these two
>> tools. It also removed genisoimage package and updated cdrom-test to not
>> use genisoimage but xorrisofs.
>>
>> CC: mst@redhat.com
>> CC: berrange@redhat.com
>> CC: alex.bennee@linaro.org
>> CC: philmd@linaro.org
>> CC: wainersm@redhat.com
>> CC: bleal@redhat.com
>> CC: thuth@redhat.com
>> TO: qemu-devel@nongnu.org
>>
>> Changelog:
>> v2: remove genisoimage package and update Dockerfile. Also update cdrom-test.c
>> so that it uses xorrisofs and not genisoimage. I have tested patch #2 on both
>> Fedora 37 and RHEL 9.1. cdrom-test passed on both.
> 
> 
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> 
> who's merging this?

I guess it's either you, Alex or me ... I'll put it into my queue, but if 
you plan a pull request soon, feel free to take it first.

  Thomas


