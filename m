Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D834B3ED198
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 12:06:52 +0200 (CEST)
Received: from localhost ([::1]:34858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFZW7-0006C2-Jj
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 06:06:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mFZVA-0005N5-8F
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 06:05:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59997)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mFZV7-0003Hc-V9
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 06:05:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629108347;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OgK/FcoshbUab0amQDU60TLILNg6bu8jxezR9nIVV4s=;
 b=d5hV/fRvLGzQk9aXVyNJ14nloMkI7yXQbxjvq3vuSVWLV7JrzhxzpTppYxYRQOLApAo/kB
 umolEjztbQh5qeK5PH/LrKpEm9hpUJeZ6m+qGxoFX9X8i/LbCyp8/7Ci9cYnfKxAtFOKb/
 F8jEbeZ/EyBLmtDWgDuilQ6Oqsyotac=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-350-R7-D0MjmMJy0TUXwybdT-Q-1; Mon, 16 Aug 2021 06:05:46 -0400
X-MC-Unique: R7-D0MjmMJy0TUXwybdT-Q-1
Received: by mail-wr1-f70.google.com with SMTP id
 t15-20020a5d42cf000000b001565f9c9ee8so3146477wrr.2
 for <qemu-devel@nongnu.org>; Mon, 16 Aug 2021 03:05:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OgK/FcoshbUab0amQDU60TLILNg6bu8jxezR9nIVV4s=;
 b=D4Ts3z5viit2QY8Aqlv32k19awjp/cLj8evq6oEu1h5JoKwkjvX3AZLgn/sXarPwBJ
 OFRUT7aETWb9LqpkmePU4bL3fiDa2iOddIibOv8A7wCmM1JK/6NBBiBlgwXbn9RJO4pG
 W2wa3YRiSPuU4iRPw5xjS7yMdF2m6NbqhP8bcUfI4+87zTrwRoYM/BiH7Uz2DlGMHxhS
 yeDUzvLXSYWr3V/Uv5098+dOfKLlo/VNTi6+JjzYZijO5S0s2kyOm5nDTDAJ5TSKSuP5
 T2/ZyKwbXIVHR5vIEOo2aNXMFh78BcIS32yuOpuKy04IwODYjAvtDq+kjpFZi2scm44X
 lp0A==
X-Gm-Message-State: AOAM533NoFv0b6xnNlGW9HRZjTUgbOxHE/RGzfluIWwdY25byw5dbGuQ
 ek/e+6AbTw8/3WwWRBuY8pbPqxUvtIavI1bmJjpTXkrmcV3jvbZwnOwTFP8OvIfXnG2esXfFV2o
 GZqTgH7YdPjGwIbeYmjEEmyqVj78rLufC/LY1foIdshMF5QMg/zWklDb0dGeH9zhe
X-Received: by 2002:adf:e983:: with SMTP id h3mr17737653wrm.51.1629108344942; 
 Mon, 16 Aug 2021 03:05:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzjqST0eD7oBETEEjiW2TfOVu815k+EoODP1yaU8F93a5AVIm10wpDyoILTBFrlRyXVGIIIUA==
X-Received: by 2002:adf:e983:: with SMTP id h3mr17737634wrm.51.1629108344754; 
 Mon, 16 Aug 2021 03:05:44 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id h12sm10060628wmm.29.2021.08.16.03.05.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Aug 2021 03:05:44 -0700 (PDT)
Subject: Re: [PATCH v2] hw/i386/acpi-build: Get NUMA information from struct
 NumaState
To: Jingqi Liu <jingqi.liu@intel.com>, imammedo@redhat.com, mst@redhat.com,
 marcel.apfelbaum@gmail.com, pbonzini@redhat.com, ehabkost@redhat.com,
 richard.henderson@linaro.org
References: <20210806031904.9687-1-jingqi.liu@intel.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <447c802d-956d-5cf6-2008-467555590215@redhat.com>
Date: Mon, 16 Aug 2021 12:05:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210806031904.9687-1-jingqi.liu@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.147, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/6/21 5:19 AM, Jingqi Liu wrote:

Maybe prepend with:

Since commits aa57020774b ("numa: move numa global variable
nb_numa_nodes into MachineState") and 7e721e7b10e ("numa: move
numa global variable numa_info into MachineState"), we can ...

> We can get NUMA information completely from MachineState::numa_state.
> Remove PCMachineState::numa_nodes and PCMachineState::node_mem,
> since they are just copied from MachineState::numa_state.
> 
> Signed-off-by: Jingqi Liu <jingqi.liu@intel.com>
> ---
>  hw/i386/acpi-build.c | 12 +++++++-----
>  hw/i386/pc.c         |  9 ---------
>  include/hw/i386/pc.h |  4 ----
>  3 files changed, 7 insertions(+), 18 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


