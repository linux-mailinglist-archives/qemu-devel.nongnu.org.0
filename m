Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFEE6673895
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 13:30:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIU3d-0003Qr-6f; Thu, 19 Jan 2023 07:30:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pIU3Z-0003Qg-7J
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 07:30:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pIU3W-0006dH-QB
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 07:30:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674131409;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P5XY7yShrEpIQDxCD5Qi4eppmJgG2WYUSADIdEr4HWs=;
 b=X0Xk+WzrMZy7xM0DFuANyisOvBYusf6B5+qf3yz9E7lmeB3yIEFp6ikXLaIQYlWKytDVav
 Lu6muO6P5dd6ySj1X354qyyhWYz2naLGb/xFYg/YXU7pSOTYMT+dcXv/qlcMeI0BQNEbU+
 woJiPqZmf+pNIExyHalREUYcW9Kftd4=
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-651-c9U6_zHRNrqiJ3ZEDzfcmQ-1; Thu, 19 Jan 2023 07:30:07 -0500
X-MC-Unique: c9U6_zHRNrqiJ3ZEDzfcmQ-1
Received: by mail-vk1-f197.google.com with SMTP id
 u187-20020a1fabc4000000b003ca3e899f8fso536505vke.22
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 04:30:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=P5XY7yShrEpIQDxCD5Qi4eppmJgG2WYUSADIdEr4HWs=;
 b=Hg+pGx/4l3/M6coy2J72Qf3Rq4rzxBeRRQtir/FOKnm2pTiz52P7OLIc6ZEulwFhoG
 5ccsaoHxKeLozT5dVdEmbqoTdrLhuunggG78KmntkVCH7mdUFP8dmi92cphSpuiepa9+
 F5yfuuNQIPnGooQBEC3uKPDbzGSnBwwEOmjyRcJpPn0NG6cYVhd3NzE92EI8g92L7xUU
 RwpwnHy0ML1PoyxQCAkBd7RLqX1eQF9BJFvnFdnrnMgATrLkSOHaV4IegEC8dxKSJSws
 uCaR0oaWgGyj3pTj9aNnFcmNjM/w4W/zyOfrcnjMzTuK3Ir3PwJ1YVlTRkwTGbchn1h4
 WzeQ==
X-Gm-Message-State: AFqh2kpDAzWoRlEmwWrO6Z6zsaQp429wjw43l7c4K6ZBm5arYGvPNzgo
 QZ2wNZ82XYE9pRZtH6uoAtnMymwHFNEsU0dXqdt9nIxRoEvcS1p5dqhNCS4BYyMLFQj+W7ioyHz
 ciwYsrTPRFAsaAiQ=
X-Received: by 2002:a05:6122:854:b0:3dd:e43d:e075 with SMTP id
 20-20020a056122085400b003dde43de075mr6280293vkk.4.1674131407309; 
 Thu, 19 Jan 2023 04:30:07 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsjK47t2pA5ey5o0L+cPPXuDMuIh+Z87K3Fggv0MryYJivdRGQa8TK7vRJINkCfojnzNpZUwQ==
X-Received: by 2002:a05:6122:854:b0:3dd:e43d:e075 with SMTP id
 20-20020a056122085400b003dde43de075mr6280284vkk.4.1674131407051; 
 Thu, 19 Jan 2023 04:30:07 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-178-207.web.vodafone.de.
 [109.43.178.207]) by smtp.gmail.com with ESMTPSA id
 s18-20020a05620a255200b006eeb3165565sm24060868qko.80.2023.01.19.04.30.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 04:30:06 -0800 (PST)
Message-ID: <216fdbe1-edc2-46e9-e867-3b173fa932df@redhat.com>
Date: Thu, 19 Jan 2023 13:30:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: MSYS2 and libfdt
Content-Language: en-US
To: Stefan Weil <sw@weilnetz.de>, Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>
References: <c2246b1a-51b3-2843-5164-c424c571874f@redhat.com>
 <d117d4e8-b906-cbde-5efe-43dbb183965c@weilnetz.de>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <d117d4e8-b906-cbde-5efe-43dbb183965c@weilnetz.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.094, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 19/01/2023 09.55, Stefan Weil wrote:
> Am 19.01.23 um 09:14 schrieb Thomas Huth:
> 
>>
>>  Hi all,
>>
>> in some spare minutes, I started playing with a patch to try to remove the 
>> dtc submodule from the QEMU git repository - according to 
>> https://repology.org/project/dtc/versions our supported build platforms 
>> should now all provide the minimum required version.
>>
>> However, I'm hitting a problem with Windows / MSYS2 in the CI jobs: The 
>> libfdt is packaged as part of the dtc package there:
>>
>>  https://packages.msys2.org/package/dtc
>>
>> ... meaning that it is added with a usr/include and usr/lib path prefix 
>> instead of mingw64/include and mingw64/lib like other packages are using 
>> (see e.g. 
>> https://packages.msys2.org/package/mingw-w64-x86_64-zlib?repo=mingw64). 
>> Thus the compiler does not find the library there. Also there does not 
>> seem to be a difference between a i686 (32-bit) and x86_64 (64-bit) 
>> variant available here? Does anybody know how libfdt is supposed to be 
>> used with MSYS2 ?
>>
>>  Thomas
> 
> 
> Hi Thomas,
> 
> "dtc" is not the right package for cross builds. We'd require 
> mingw-w64-i686-dtc and mingw-w64-x86_64-dtc packages for the QEMU build, but 
> those packages are currently not provided by MSYS2.

Ok, thanks ... so that basically means we cannot get rid of the dtc 
submodule yet.

  Thomas



