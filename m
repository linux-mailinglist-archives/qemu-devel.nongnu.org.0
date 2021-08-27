Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62BEF3F9BEE
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 17:51:42 +0200 (CEST)
Received: from localhost ([::1]:44334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJe8m-0006th-F5
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 11:51:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mJe73-0005QM-Ve
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 11:49:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38843)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mJe71-0007vN-4Z
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 11:49:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630079385;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AVXPcUpaM7EsaIiaWnM1MAa8KIKcgFARZPli8KEmoEs=;
 b=TkJ6DnXIsAftp9GCQCPQDxb5gtHZKWN9pod/cpeBib6bRyF9HaqZ77kYwZuwlVKXF9sSpi
 9pSaIw5RWRNb29DNo7+x8eRTorcRnocTaY+XD3rmojlgBdtY3X/G99+bbzlmDUdJB4PKad
 vwNB8/pESSLsSsJTZ0y9/D1J+YmnITM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-360-uPU1hNelOu6tRWl6TcQEHg-1; Fri, 27 Aug 2021 11:49:43 -0400
X-MC-Unique: uPU1hNelOu6tRWl6TcQEHg-1
Received: by mail-wm1-f71.google.com with SMTP id
 c4-20020a1c9a04000000b002e864b7edd1so2242012wme.6
 for <qemu-devel@nongnu.org>; Fri, 27 Aug 2021 08:49:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AVXPcUpaM7EsaIiaWnM1MAa8KIKcgFARZPli8KEmoEs=;
 b=FlF//DRWrDhkS8Vc03pfc4aaA2swOzfBd1EdbL3NLCCOpplJfz8Yd2Z4t0+Ajk/qci
 yA+E+caRXETpsEjiio2pYnOUJdthby/PEP/nBln4ctlplp6/AWQ1gPB9xD6Wkyvnc76W
 m1FlCTGeSsgvMskjWzl/RR+e93u97Rcc8DXlu+a0X1VY9Rda9oRau2k1qQyrLBBkDB2y
 qkQ0hKuCdKDb+rfvdiamkHsnMN5Z/i+wG7rirahyJSiA+p75V/ZtAKd/WlRTzdRfHYGq
 xvg1ev+LuYhVvMzScfHBk/0epk+g85yuxzxwKot0EfpxGQRNXHR9mCHeQndEis95ekyN
 AjwA==
X-Gm-Message-State: AOAM531+YhCNOR9zskjAtUXYDSG5LzIeBudZ1V5dB9vvU8HCvFf+LG0n
 FUwL7/dJcMO+cW6t+QO9QdaiAOdZ/f6jlEq3ItZ0xxPyEAN8t5HUOAKz2LyJAeP6+dvpvTitM/4
 NKySjyX+wSU+28hc=
X-Received: by 2002:a5d:55cd:: with SMTP id i13mr11079338wrw.366.1630079382703; 
 Fri, 27 Aug 2021 08:49:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxVkrFAbK/k3XdnznVwztxYu4/JjgpQQs/O5q5c8rpM17yesoG60cPe3vTxqoELGePBRhEzqA==
X-Received: by 2002:a5d:55cd:: with SMTP id i13mr11079309wrw.366.1630079382362; 
 Fri, 27 Aug 2021 08:49:42 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id o34sm11696364wms.10.2021.08.27.08.49.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Aug 2021 08:49:42 -0700 (PDT)
Subject: Re: [PATCH 4/3] gitlab-ci: Don't try to use the system libfdt in the
 debian job
To: Thomas Huth <thuth@redhat.com>, David Gibson
 <david@gibson.dropbear.id.au>, qemu-devel@nongnu.org
References: <20210827151718.178988-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <a5703232-ed43-3f15-9b47-bd0d7bbcf704@redhat.com>
Date: Fri, 27 Aug 2021 17:49:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210827151718.178988-1-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.743,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.437, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/27/21 5:17 PM, Thomas Huth wrote:
> libfdt in Debian is too old to be usable for QEMU. So far we were
> silently falling back to the internal dtc submodule, but since
> this is wrong, let's remove the --enable-fdt=system switch here now.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  Sorry, I just noticed this after sending out the first three patches already
> 
>  .gitlab-ci.d/buildtest.yml | 1 -
>  1 file changed, 1 deletion(-)

Acked-by: Philippe Mathieu-Daudé <philmd@redhat.com>


