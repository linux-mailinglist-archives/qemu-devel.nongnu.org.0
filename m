Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64DED2DE319
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 14:09:23 +0100 (CET)
Received: from localhost ([::1]:47744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqFVa-0004aR-0i
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 08:09:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kqFTp-00042C-RZ
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 08:07:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56450)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kqFTo-0004H2-Db
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 08:07:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608296851;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qacsSh4favAsJCUK0oJ15yR0w8zjNZVeZQa3PE+FIg0=;
 b=ZVodn3Z1XbmPDsQLNV00P7/nxAZlCZvlK+J2oIjTCwlVbh4L/sirHJ0Gxv0OSm8Rq0QyLt
 t8+toIgNGInBWAwRFESWJhpt+vf5iWY8utyX4u6FvwAG6pQrbUsKYB2yTPvEIBONkFg7k8
 uKzMSrfpZmILKZzNF7klaQVVBYMbnnU=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-549-fBasH34lOAO5HKGznnGzOw-1; Fri, 18 Dec 2020 08:07:30 -0500
X-MC-Unique: fBasH34lOAO5HKGznnGzOw-1
Received: by mail-ed1-f69.google.com with SMTP id z20so1018430edl.21
 for <qemu-devel@nongnu.org>; Fri, 18 Dec 2020 05:07:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qacsSh4favAsJCUK0oJ15yR0w8zjNZVeZQa3PE+FIg0=;
 b=i73Vv5j6FqDXhbAfsl+gmm1McireAieyQ86gggm758LJrs6MLI5xBKVHDrMxSFascB
 yhpP9uLopMu7MsecxSFiFbBabQtXNiQ9SRmoVjFxAhno1pURBvcWZ3AkzhKtJoanEvAp
 jJWnfNBWCpnscz+ks0fJPUd8eo4SMuEKzbb9pk+Qyvb8khk3C+OZFkT+lGFS+MBfEvHd
 /W/HVy706NKmR/8UE9ic0mOefLI3LvomzXvSCQ9VQ8QrQRIM8ufjaEho55ZiILmezUCY
 r5YMxQl/bG1MzsNtMFS7Q/hETNQRoWH/FJzYxBhiYsG4JqpjKKY0ZXVtf09Yj+ezRz+2
 89Ug==
X-Gm-Message-State: AOAM530/Epus/00dSFSwc8uE7Rmn/yNF4fWFFlLth4g6QMbb9Y1206+D
 vqpSJxQV+C0KH2BrbmG4tLfL8WgnAdqYl7BksxlbfmcXFdgUS6I7fvZ9uV5dN3uw3bDnELgkXDa
 bWEIxLndH9p2OjXo=
X-Received: by 2002:a05:6402:1765:: with SMTP id
 da5mr4366128edb.27.1608296849246; 
 Fri, 18 Dec 2020 05:07:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxncrVE3GvA6TbBHVyFYgVPQkSLmsauguq6hWR0qNveSFTUfD9ovVcqawAiXmb0J1GXPV/ldg==
X-Received: by 2002:a05:6402:1765:: with SMTP id
 da5mr4366110edb.27.1608296849089; 
 Fri, 18 Dec 2020 05:07:29 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id u2sm5576765ejb.65.2020.12.18.05.07.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Dec 2020 05:07:28 -0800 (PST)
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <20201218084611.634254-1-marcandre.lureau@redhat.com>
 <023ac901-2c57-15da-4dfe-62b1f4f1c23d@redhat.com>
 <CAMxuvayDzUmpBg8n10zD=7pYtKtwQZs1n0wAvPjMzKTZ4ZNuGQ@mail.gmail.com>
 <9ea55256-e3fd-e8e7-3b70-9c690b09dc74@redhat.com>
 <CAMxuvaw=koNfQbhVpaHWt0nCZhMzy703X=Hhxw_gi2wCJyjciA@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] whpx: fix compilation
Message-ID: <d54e4e19-d199-a03d-ceab-0da9ba21ac48@redhat.com>
Date: Fri, 18 Dec 2020 14:07:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <CAMxuvaw=koNfQbhVpaHWt0nCZhMzy703X=Hhxw_gi2wCJyjciA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: sunilmut@microsoft.com, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

You're right that the headers _are_ included in whp-dispatch.h, so yeah 
they do provide WHV_PARTITION_HANDLE which is the only thing that needs 
API includes.

But in turn whpx_state is only needed for whpx_apic_in_platform(), so 
the main issue is that sysemu/whpx.h is exposing unnecessary application 
details.  We can make two changes.  First, make whpx_apic_in_platform() 
a function instead of a macro, so that whpx_state can be moved to a new 
header whpx-internal.h.

In fact, whp-dispatch.h and the new header can be merged, too.  I'll 
send two patches.

Paolo


