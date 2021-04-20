Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 934073655C9
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 11:54:36 +0200 (CEST)
Received: from localhost ([::1]:40890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYn5X-0000Ge-Lh
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 05:54:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lYn4E-0008Ec-SO
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 05:53:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44192)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lYn4B-0002vo-Lv
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 05:53:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618912390;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Rr/Yzjb8+KKh3oaPXu/prUKLJpyL9YCKMH9EM9aXVp4=;
 b=aQe3r7dPvOCJtVfuU/qCAQMqWp2klK66KRzy/YAMpFEXai61oSYwW38fJ28edFghbz/pRj
 dXfZDw/T0PyH6gtBdR++S5cK+q2nq/e8PP+T7fTdsOQkVuRX/G/BiN1E2Z3J0E87B85ZYs
 TJS/x7PfNyHkBOgpb24/nRYWKooA+58=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-516-vC3t_SQkM1uLNwrAx0l3jw-1; Tue, 20 Apr 2021 05:53:02 -0400
X-MC-Unique: vC3t_SQkM1uLNwrAx0l3jw-1
Received: by mail-wr1-f72.google.com with SMTP id
 s9-20020a5d51090000b02901028ea30da6so10572163wrt.7
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 02:53:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Rr/Yzjb8+KKh3oaPXu/prUKLJpyL9YCKMH9EM9aXVp4=;
 b=Eos8bZ+5BiFwWe7ZEU164ztCdHaBqxd0A8JIW4XH6/HAsURpI3ntRGogQi3U4HtNKw
 q8v1/0R43hx+KGZlcdYGK5hFgGLBJKG1WHS2sE4J6ISmVTgwgN5iHh7PiNWTpd9E9BWa
 KuWXxIV7BmHKm4xNHXpNkI6THJAbI8VVfcve4oKLvgaFqnfTVTEwZVHuKPIb6unrSGQO
 vApMjgWSwHqGm5GcMJoopMuCI6e9D2V7zUaY39yJSiNxywAcWe26NYbQiIo07/PmJSjr
 Gt3Rj2y7znEu9VueWMxcMNWPxvhSOtyKwUzwiYBHpHu+//Z8Jy65tPeB9xcQt22Qr9mu
 mghQ==
X-Gm-Message-State: AOAM531ocwxG5EGOHPJ+ZeR/wYltaITBbOC2ywE55UgF/OJO/gK62TXB
 W0mD8qrhMImaB17UL9b+XSHSdkWpf6v4YIVg9nbUSlSJehMotbE1qMdm3q6p13DAP2jymLtg1ti
 CAfIv4p+znrNHE1k=
X-Received: by 2002:adf:9c8e:: with SMTP id d14mr9063104wre.140.1618912381866; 
 Tue, 20 Apr 2021 02:53:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx8vAGlbQ1EZROORpHekKcAGK9HVH7y7K2j1k1NSVLqNmqkVcAk1B4mqL1N6u3uqSYnUOlHLA==
X-Received: by 2002:adf:9c8e:: with SMTP id d14mr9063075wre.140.1618912381654; 
 Tue, 20 Apr 2021 02:53:01 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id u8sm26745677wrr.42.2021.04.20.02.53.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Apr 2021 02:53:01 -0700 (PDT)
Subject: Re: [PATCH v5 04/14] softmmu/memory: Pass ram_flags to
 qemu_ram_alloc_from_fd()
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20210413091421.7707-1-david@redhat.com>
 <20210413091421.7707-5-david@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <83201a21-7f05-88dd-abc7-59576bce2fe9@redhat.com>
Date: Tue, 20 Apr 2021 11:52:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210413091421.7707-5-david@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Marcel Apfelbaum <mapfelba@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Murilo Opsfelder Araujo <muriloo@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Greg Kurz <groug@kaod.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/13/21 11:14 AM, David Hildenbrand wrote:
> Let's pass in ram flags just like we do with qemu_ram_alloc_from_file(),
> to clean up and prepare for more flags.
> 
> Simplify the documentation of passed ram flags: Looking at our
> documentation of RAM_SHARED and RAM_PMEM is sufficient, no need to be
> repetitive.
> 
> Reviewed-by: Peter Xu <peterx@redhat.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  backends/hostmem-memfd.c | 7 ++++---
>  hw/misc/ivshmem.c        | 5 ++---
>  include/exec/memory.h    | 9 +++------
>  include/exec/ram_addr.h  | 6 +-----
>  softmmu/memory.c         | 7 +++----
>  5 files changed, 13 insertions(+), 21 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


