Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D228D2B458A
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 15:09:51 +0100 (CET)
Received: from localhost ([::1]:55308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kefCY-0003Qw-VL
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 09:09:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kef8G-0007HO-Ui
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 09:05:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26440)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kef8E-00054b-HP
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 09:05:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605535521;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2t/8ollhjt1K8Re8tNH3g2a9FJsCQb1tj4rUjqRC5iQ=;
 b=YPQH3K1PLq3MA7AcLUSe08PXMFj+XViajz07e+LLsmg46Ra+G8yFmLRofCqvojIpiKj/9H
 fK0AjHOw0cbbe+GOCrbiq/cgCYz0wSdfz1pHck2k2mtNrdBaJxgNVjgQF7IqumTbf81wLT
 URCKhrzSvzFhKPPdGnHK4x3UJxTyAXs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-293-lTHxU0QmO0CVAk4S0PfVqQ-1; Mon, 16 Nov 2020 09:05:20 -0500
X-MC-Unique: lTHxU0QmO0CVAk4S0PfVqQ-1
Received: by mail-wm1-f70.google.com with SMTP id u123so8741691wmu.5
 for <qemu-devel@nongnu.org>; Mon, 16 Nov 2020 06:05:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2t/8ollhjt1K8Re8tNH3g2a9FJsCQb1tj4rUjqRC5iQ=;
 b=n+2E0hKwcfEkWcT889nFrJ9H8LNq4/ZQCEx4uBFXG5+lpgtGJ9VNprRhmdOuJG+RT3
 mLNfDXrjzWGfywB82SEy06XMEaaPZSqhqMsOG+Uau66Pz5jMpj4tYe8UhZAJdKqAFRh/
 liZZ351Wtf+2wnGRJUaUeDwSU1NW8NXOZkvBaiIePWh90oVAsbTMzLjqIagtR43dsgAX
 TIX5lzsxDpR2LPN2nF/9lO5+ujvP/Yg9gf5IVznN3ftscnPWL/UufxywHKZUXJKuHp9+
 DVQ7Yh4uX6wNF3dDxY/1Gi+crcuK27tNCt/VtWWsNb2O/fzXUpndhZiyjlb/H333j1H1
 XTSQ==
X-Gm-Message-State: AOAM531srreQOKXipB2GxP39neE0KCR71VVkVnnDfO9O4PPNVbReG16D
 eQJe7d8HuG72xdBRma2JvEAp75J38QKbS6jtzo2/HTq1dRZ70/ziGFc9vTieGNw3d6+dobs+jve
 zoNh+I/V+/Ad7nWE=
X-Received: by 2002:a1c:2384:: with SMTP id
 j126mr16022042wmj.116.1605535518904; 
 Mon, 16 Nov 2020 06:05:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyMk9imU/Ow5s4RvFVMBnXlY/ggS75fdMcAAS/QViICp2VCqyZIWyGF2CHbaE1rE9I10z9OQA==
X-Received: by 2002:a1c:2384:: with SMTP id
 j126mr16022013wmj.116.1605535518719; 
 Mon, 16 Nov 2020 06:05:18 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id t136sm17281166wmt.18.2020.11.16.06.05.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Nov 2020 06:05:18 -0800 (PST)
Subject: Re: [PATCH 03/13] vmmouse: put it into the 'input' category
To: Gan Qixin <ganqixin@huawei.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
References: <20201115184903.1292715-1-ganqixin@huawei.com>
 <20201115184903.1292715-4-ganqixin@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <350edd33-cb0a-b5a7-ff71-072d57597917@redhat.com>
Date: Mon, 16 Nov 2020 15:05:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201115184903.1292715-4-ganqixin@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/15 22:35:17
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kuhn.chenqun@huawei.com, thuth@redhat.com, zhang.zhanghailiang@huawei.com,
 "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/15/20 7:48 PM, Gan Qixin wrote:
> The category of the vmmouse device is not set, put it into the 'input'
> category.
> 
> Signed-off-by: Gan Qixin <ganqixin@huawei.com>
> ---
> Cc: Michael S. Tsirkin <mst@redhat.com>
> ---
>  hw/i386/vmmouse.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


