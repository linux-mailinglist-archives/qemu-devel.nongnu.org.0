Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F012B83D8
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 19:31:35 +0100 (CET)
Received: from localhost ([::1]:47886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfSEw-0006rG-9I
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 13:31:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kfS3F-0008LE-IJ
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 13:19:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kfS3D-00026f-Ql
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 13:19:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605723567;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nI3t3JFooBzf9xGqjX5LRHyMBOfYpTRY7RlnbJtPsHc=;
 b=ir9A8VZGSm1JTUQdA/08isFboKuviSH3NAezdUsqOhsK/DkucK8pLI9HGdmjX7y9zT+cqK
 v/IsONmvNo5VdoF6o2ag3IV/Zz2pXCFFqV5sPsbTIE1g2oDTFJGXowNkKBlu/IGPkI/AoB
 dpLJZbwmSoQ4O1bHG2Bd39XTlPaE6kc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-586-o86Hz26IOJSLja6JYTTC7A-1; Wed, 18 Nov 2020 13:19:25 -0500
X-MC-Unique: o86Hz26IOJSLja6JYTTC7A-1
Received: by mail-wr1-f71.google.com with SMTP id h11so1164846wrq.20
 for <qemu-devel@nongnu.org>; Wed, 18 Nov 2020 10:19:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nI3t3JFooBzf9xGqjX5LRHyMBOfYpTRY7RlnbJtPsHc=;
 b=S+3nJhQDqZ3Xiw8X1oR3e9heMx8xy/nEjoeteUXEenQ+P1G4TO1oGJ1iru1SWOWEtj
 yN2DgqL6TvI8q8m9YJRnzcU/4joPY/H8lHP3r7iSzfQaqCJjyo7glid12DEdT+ItPge4
 J1dAfIkVMa8yY2JyMdIS3TlG0KAWgpfkvv1HfL2nT/ArBR9g6CMXI9tVkVNhYlba7614
 3drnZ66lxiM4YG/2SzdvCmQ2E16iJq3fARZZdPeU36iIvpei9S9d2EXrTCJNPiWEV+M7
 n5M0x6M15PQFThhoA/4D2qpn5me6UwxMQW9vf0p43ohzKj6Nas7J3td+L2XcDEwuyVzq
 9xCA==
X-Gm-Message-State: AOAM533XTyZOSyg5Sa6f4bVDLy4sMvnOEl13JiLng9iPK0LFlh5HUWrU
 4i2wYnO9/scfoA1KrZ58UKVVHa3xxL/kEzobcbRYADCZRmAl/8/8dusMnuGVmMRyTsC/UYfCV2P
 p2p+ghGUA0SkFACw=
X-Received: by 2002:a7b:c5c6:: with SMTP id n6mr371448wmk.131.1605723564209;
 Wed, 18 Nov 2020 10:19:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxV9XyFEYNEGhuvxWAqfZG5+oGU4YdrMKJwc1S2rW1BzRi8h7AEMRyE7+NGnvi/PhGJcN7YSQ==
X-Received: by 2002:a7b:c5c6:: with SMTP id n6mr371432wmk.131.1605723564030;
 Wed, 18 Nov 2020 10:19:24 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id 90sm14379116wrl.60.2020.11.18.10.19.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Nov 2020 10:19:23 -0800 (PST)
Subject: Re: [PATCH 5/6] configure / meson: Move check for sys/signal.h to
 meson.build
To: Eric Blake <eblake@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20201118171052.308191-1-thuth@redhat.com>
 <20201118171052.308191-6-thuth@redhat.com>
 <3b3bacda-c6fc-a038-49df-0ca0bc5422e4@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <5134d7ad-107b-8e15-9075-795c033ab276@redhat.com>
Date: Wed, 18 Nov 2020 19:19:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <3b3bacda-c6fc-a038-49df-0ca0bc5422e4@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 19:41:43
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/18/20 6:27 PM, Eric Blake wrote:
> On 11/18/20 11:10 AM, Thomas Huth wrote:
> 
> In the subject: s/signal/kcov/

With the typo fixed:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


