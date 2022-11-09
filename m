Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C636224F4
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 08:55:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osfv8-0001vb-8T; Wed, 09 Nov 2022 02:54:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1osfv2-0001uD-C4
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 02:54:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1osfv0-0000PN-C0
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 02:54:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667980480;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QTJ0Ai813JNva/NYkkZKsxbavxWVc3z+NlGRhAKiGkw=;
 b=haBc0y3LIAG2/zoDaaHOrw0AwlnF1RRRMLXiJK8afLkWYH1bMKk09CREKlIh8kYZ40Ic3c
 +z491P+w+OnHcN+bV3Jxm87JDtxuYzp0hCLKLlgD3iSGQ+Ii0B0YPoH6yaqIiCHauHWwQX
 LteKjiuz0VZXkDeUHePvO2dORj9ROKc=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-632-JiVuhyMDOQyt8CcAWpsykg-1; Wed, 09 Nov 2022 02:54:39 -0500
X-MC-Unique: JiVuhyMDOQyt8CcAWpsykg-1
Received: by mail-qv1-f71.google.com with SMTP id
 e13-20020ad450cd000000b004bb49d98da4so11186239qvq.9
 for <qemu-devel@nongnu.org>; Tue, 08 Nov 2022 23:54:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QTJ0Ai813JNva/NYkkZKsxbavxWVc3z+NlGRhAKiGkw=;
 b=QVRmxIP40aK9sZ5y1UyZ9Sl8xOsWJJm2gUs9siN3GGfEodAfdusDAw3hq/nampjZiH
 MYhQSPfkQp1cH3Zl8ETg43LmmLmZhJ1KbDqBmk5PV8lPD4HWYNmumACr2qNMNFBmfuCA
 MTwXgdBf3Nha7RwJnoo+BxyNCWXTfdt6ov7ID2tumV5HwAdIRfR7k8ZYmDXghz4agtyE
 /GigA9n90Tg7bmBoGWcM5FwKjwxOm35gKzPfPOLb92mFNQ76Yv7XfCJ4RHj9vopiWwVy
 LTV0SOSvHCvQp+tzGnFPBsIFEfu4GGVF4FczO+PFYVIndDNv4PVDyIkhV49lH2MdaCT3
 SleA==
X-Gm-Message-State: ACrzQf2HECA6fUCEOlRzF8ri78yR1xA4/WnQniuW5CKIBHrpwaileuhQ
 RCB+Z9uA2ltFEZEVl8Qxg6GUDKHInUHnuvMFi8JvH16mVsoI8G6IBBEj2H8bqyKDzeF6hSAL8Gc
 pveprAzj8QpHmk2A=
X-Received: by 2002:ad4:5964:0:b0:4bb:a86e:d758 with SMTP id
 eq4-20020ad45964000000b004bba86ed758mr52996649qvb.28.1667980479278; 
 Tue, 08 Nov 2022 23:54:39 -0800 (PST)
X-Google-Smtp-Source: AMsMyM7bJ/3zWANyNOgULg1NBSq+UECF8POhBhnkvP3z34TLpwdbUrRb9ccw1ipEyFZeUsseXBJPIA==
X-Received: by 2002:ad4:5964:0:b0:4bb:a86e:d758 with SMTP id
 eq4-20020ad45964000000b004bba86ed758mr52996639qvb.28.1667980479073; 
 Tue, 08 Nov 2022 23:54:39 -0800 (PST)
Received: from [192.168.100.30] ([82.142.8.70])
 by smtp.gmail.com with ESMTPSA id
 de20-20020a05620a371400b006faa2c0100bsm10514796qkb.110.2022.11.08.23.54.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Nov 2022 23:54:38 -0800 (PST)
Message-ID: <11300751-e06e-d1d1-b304-83e2bbf00443@redhat.com>
Date: Wed, 9 Nov 2022 08:54:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PULL 0/2] Net patches
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@gmail.com>, Jason Wang <jasowang@redhat.com>
Cc: stefanha@redhat.com, qemu-devel@nongnu.org
References: <20221108041929.18417-1-jasowang@redhat.com>
 <CAJSP0QVNFCCni5iXz5Dvu0C2oKipNuKk7pKX4t=Gh9zVpzPVZA@mail.gmail.com>
From: Laurent Vivier <lvivier@redhat.com>
In-Reply-To: <CAJSP0QVNFCCni5iXz5Dvu0C2oKipNuKk7pKX4t=Gh9zVpzPVZA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 11/8/22 17:32, Stefan Hajnoczi wrote:
> On Mon, 7 Nov 2022 at 23:20, Jason Wang <jasowang@redhat.com> wrote:
>>
>> The following changes since commit 524fc737431d240f9d9f10aaf381003092868bac:
>>
>>    util/log: Ignore per-thread flag if global file already there (2022-11-07 16:00:02 -0500)
>>
>> are available in the git repository at:
>>
>>    https://github.com/jasowang/qemu.git tags/net-pull-request
>>
>> for you to fetch changes up to fd2c87c7b0c97be2ac8d334885419f51f5963b51:
>>
>>    tests/qtest: netdev: test stream and dgram backends (2022-11-08 12:10:26 +0800)
>>
>> ----------------------------------------------------------------
>>
>> ----------------------------------------------------------------
>> Laurent Vivier (1):
>>        tests/qtest: netdev: test stream and dgram backends
> 
> This test does not pass in CI:
> https://gitlab.com/qemu-project/qemu/-/jobs/3290964536
> https://gitlab.com/qemu-project/qemu/-/jobs/3290964524
> https://gitlab.com/qemu-project/qemu/-/jobs/3290964471
> https://gitlab.com/qemu-project/qemu/-/jobs/3290964475

These four fail because of "No machine specified, and there is no default"

> https://gitlab.com/qemu-project/qemu/-/jobs/3290964569

This one because of an unexpected "info network" result:

st0: index=0,type=stream,
xlnx.xps-ethernetlite.0: 
index=0,type=nic,model=xlnx.xps-ethernetlite,macaddr=52:54:00:12:34:56

> 
> We're in soft freeze now. Please hold off on new tests unless they
> verify regressions/blockers.

Sorry for that, I fix that and wait for 7.3...

Thanks,
Laurent


