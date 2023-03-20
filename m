Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D5F36C0BB2
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 09:03:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peASt-0003RW-P3; Mon, 20 Mar 2023 04:01:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1peASg-0003Of-Sj
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 04:01:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1peASf-0008Tt-Es
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 04:01:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679299299;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KHohr79IHNnJb6Q2PQ0oleVos1WeH+/Gqn6sDaZBteo=;
 b=QPQOZGHfpDtVwGLjOqd1IKe3px/z2L7wDGeJyVRQ52ZLVRAEPow8s2bDs7Q55kEA1TSKyr
 FshFAmXqdu2KgHcbQJK8RLkqB9YRc3XH1GoC6GEGyRyLNUDQWSqWN8REaCR6ctZxjJNkGi
 NhcHn0i9RnQDngxzB8iPuADWVB7usSQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-644-xvf-AuMTMROy4j5aJyYnrw-1; Mon, 20 Mar 2023 04:01:32 -0400
X-MC-Unique: xvf-AuMTMROy4j5aJyYnrw-1
Received: by mail-wm1-f70.google.com with SMTP id
 p21-20020a05600c1d9500b003ed34032a01so5139079wms.2
 for <qemu-devel@nongnu.org>; Mon, 20 Mar 2023 01:01:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679299290;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KHohr79IHNnJb6Q2PQ0oleVos1WeH+/Gqn6sDaZBteo=;
 b=Bb+bW8RTIun4in5vLw+h1gPPm7rrSkLGs8YXyyWvfR8gEid7i8+HCLk1d9AjKMrYxa
 QXQ0UJF/upicbRBpcyr3u+mjSEkg2nlAAuJq4QtMp3CLTNqzX9ps1RvafJ9iS7czFK/7
 BO9e7HIQ7awRsVfHDjiRzW3+p0hkrS6fQZ4VJg57FpGCD34trjXLeIQnNiBucYYJE5pC
 DJ3U5JhFU91g+zA2rhMQERCfsO4akK3v1WCjSMPWHJrMhufICkAO+NDFkP8pJ1b6RTS+
 cmtMGnDgW9qNkutXn0a5CXxfcswUVt4hayGS0THQY4vy+7X7Xm50389hjfe572rOaJXG
 vO1A==
X-Gm-Message-State: AO0yUKXoSkyDR2XkLHSN0LWOG7+FdmYicoByuF1K4DGu8L7g2m+fLCYE
 y6jZJ+A2BMYx99/0ow9I8s3Zh/TTjj7hrgoz2efZ654zvIKSzVgcM4itUk9VX6bgIdOWXd4P9Ch
 c/lxrJbiipRYaJVQ=
X-Received: by 2002:adf:f94e:0:b0:2d1:947:318b with SMTP id
 q14-20020adff94e000000b002d10947318bmr10279062wrr.13.1679299290825; 
 Mon, 20 Mar 2023 01:01:30 -0700 (PDT)
X-Google-Smtp-Source: AK7set8R//c4ZlqbzI3gueBsSXgYccawiVT8eSpYJaiNN/lkCRsHhETvb9mXLAtWvydyI9gb/9QoSg==
X-Received: by 2002:adf:f94e:0:b0:2d1:947:318b with SMTP id
 q14-20020adff94e000000b002d10947318bmr10279046wrr.13.1679299290555; 
 Mon, 20 Mar 2023 01:01:30 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-179-234.web.vodafone.de.
 [109.43.179.234]) by smtp.gmail.com with ESMTPSA id
 s2-20020a5d5102000000b002c71b4d476asm8182291wrt.106.2023.03.20.01.01.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Mar 2023 01:01:29 -0700 (PDT)
Message-ID: <3e7d65b7-1d44-221c-512d-c573e021f389@redhat.com>
Date: Mon, 20 Mar 2023 09:01:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] qtests: avoid printing comments before g_test_init()
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20230317170553.592707-1-berrange@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230317170553.592707-1-berrange@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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

On 17/03/2023 18.05, Daniel P. Berrangé wrote:
> The TAP protocol version line must be the first thing printed on
> stdout. The migration test failed that requirement in certain
> scenarios:
> 
>    # Skipping test: Userfault not available (builtdtime)
>    TAP version 13
>    # random seed: R02Sc120c807f11053eb90bfea845ba1e368
>    1..32
>    # Start of x86_64 tests
>    # Start of migration tests
>    ....
> 
> The TAP version is printed by g_test_init(), so we need to make
> sure that any methods which print are run after that.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   tests/qtest/migration-test.c | 10 +++++++---
>   1 file changed, 7 insertions(+), 3 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>


