Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA043D035
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jun 2019 17:06:19 +0200 (CEST)
Received: from localhost ([::1]:59968 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1haiLq-0002l8-9t
	for lists+qemu-devel@lfdr.de; Tue, 11 Jun 2019 11:06:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49120)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <pbonzini@redhat.com>) id 1haiHI-0008NW-GG
 for qemu-devel@nongnu.org; Tue, 11 Jun 2019 11:01:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1hai2U-000612-Ah
 for qemu-devel@nongnu.org; Tue, 11 Jun 2019 10:46:19 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:37179)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1hai2U-000602-2i
 for qemu-devel@nongnu.org; Tue, 11 Jun 2019 10:46:18 -0400
Received: by mail-wm1-f65.google.com with SMTP id 22so3247641wmg.2
 for <qemu-devel@nongnu.org>; Tue, 11 Jun 2019 07:46:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=u0pKX1Gpuq1szK531lu6VU6STfr7eTVlQOsvTQVcSwA=;
 b=mHfClt5PTvQVDC7SStP4w9IPF8AL74wHptQhC6pGAEEPXAnpI400cW+df6EIeW/Np1
 8y9Vp92FOz9iG7waaBBSAL44eH91PlD9udC9tONkOXKE+Dn/Z1kWFjwdxbz4gVtD+Bj/
 uhO5Man6nj5xFOujWYIJGWfzgibZXRkVDOv97W8ghdH2gUSVxtT99sPZcqjHRDeOuRq0
 b6n5dJzpHKnjVk2Pv/Z+0wGyQHu/kxTuDCiW5EloQn4a4vUVRjQhwnQtCpBnHM1wX5PO
 6F9tvHKYOsVQnN6rDKRypZCx7qrJkdVFpz2sbuKTY+7dP7TvBRR4XPRa33Q8FGY55bFm
 Hcow==
X-Gm-Message-State: APjAAAXNhdw7IS9N47Aoz9iwB63QoPDtiSn97epY7RVEzpw2uCfuSHWt
 sMR5k9wJD5K+ZpXdg5oYBRimWw==
X-Google-Smtp-Source: APXvYqyKHNzhon+NcT5y0BfDPPBRu2lxHZ/KtNuLRlvOqmu4hwVzqRNBfM/Anw4v5TJtweMX6iIKNA==
X-Received: by 2002:a1c:208c:: with SMTP id
 g134mr18290611wmg.112.1560264376712; 
 Tue, 11 Jun 2019 07:46:16 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:49d3:a711:c5a3:8ebf?
 ([2001:b07:6468:f312:49d3:a711:c5a3:8ebf])
 by smtp.gmail.com with ESMTPSA id f10sm23198827wrg.24.2019.06.11.07.46.11
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Tue, 11 Jun 2019 07:46:16 -0700 (PDT)
To: "wangjie (P)" <wangjie88@huawei.com>,
 Michal Privoznik <mprivozn@redhat.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
References: <1559048796-57016-1-git-send-email-wangjie88@huawei.com>
 <cac8ed16-7846-ca22-2463-c3c738066d61@redhat.com>
 <f165741a-2ffd-62fd-b121-49bf1a3597f1@redhat.com>
 <ca74a7bf-dd68-d4c3-2c25-8e43db52678c@redhat.com>
 <f9b6dd9e-3e58-add9-c5ab-da1a883a0a4b@redhat.com>
 <b8a358ee-eb1f-14ca-b406-295ef668bb55@redhat.com>
 <4955ec04-1884-3a68-975f-8d72487c253c@huawei.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <fefb9893-fc15-bf1b-ed3c-e37c9dd66c65@redhat.com>
Date: Tue, 11 Jun 2019 16:46:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <4955ec04-1884-3a68-975f-8d72487c253c@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.65
Subject: Re: [Qemu-devel] [Qemu-block] [PATCH] pr-manager-helper: fix pr
 process been killed when reconectting
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
Cc: eric.fangyi@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/06/19 15:51, wangjie (P) wrote:
> Hi， Paolo and Michal：
> 
> Base on my patch, I found another problem is that：
> 
>     qemu: report DISCONNECTED
> 
>     libvirt: start pr-helper #1, but it will takes a while to complete
> this action
> 
>     qemu: reconnect to start pr-helper #1 immediately and failed, so
> report DISCONNECTED
> 
>     libvirt: begin to call qemuProcessStartManagedPRDaemon to start
> pr-helper #2, but virPidFileAcquirePath failed, so close fd and unlink
> pidfile by mistake
> 
> 
> based on the above problem, I thought out two ways to fix this problem:
> 
> 1. qemu: when call pr_manager_helper_write failed, sleep one second to
> make sure libvirt had started pr-helper before call
> pr_manager_helper_initialize.
> 
> 2. libvirt: if virFileLock failed in virPidFileAcquirePath, not to close
> fd and unlink pidfile, because pr-helper #1 is using the pidfile.

I think this could also be fixed by using the socket activation protocol
in libvirt, because QEMU will be able to connect.  libvirt will have to
discard events from QMP right after it calls listen() on the socket.

Paolo

