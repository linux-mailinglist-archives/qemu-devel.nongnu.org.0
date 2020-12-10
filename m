Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E56182D50A4
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 03:11:14 +0100 (CET)
Received: from localhost ([::1]:38918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knBQH-0007H0-GO
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 21:11:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1knBO7-0006nD-4l
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 21:08:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:33282)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1knBNy-0001rL-QV
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 21:08:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607566127;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Jf1/1X4YnO7VtDijfV9FEnR1Y3UtMrA4GiDIxWU3vDM=;
 b=JOwyBQJgqmfpgCIZgTr4y6M6YcnEx8E6aLUpLA1ZHHqi1LxNJXeXec0s9j+uVdBUbMNda4
 1tE8pLByJU5DJWpY5JoPHzAwHF/a0P8jBf+FhvGOXN5uvbX6fwmjPhlFxBqtA1nLDT2raO
 ltg3pGbPwUomQzjubZ7QJG01ZTzpceU=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-394-L0fQ5rkmM6uR4W7TApCJgg-1; Wed, 09 Dec 2020 21:08:46 -0500
X-MC-Unique: L0fQ5rkmM6uR4W7TApCJgg-1
Received: by mail-qk1-f198.google.com with SMTP id z129so2653796qkb.13
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 18:08:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Jf1/1X4YnO7VtDijfV9FEnR1Y3UtMrA4GiDIxWU3vDM=;
 b=hyvXVr7gxo6N8l+SLFNK2m/+/HnKcAlxszf+eEBu/vvTiVCz1f7iEWgIUpooh9iI3v
 HeGRBLwBdkYVP6pwgjcg+H5ipr97mi/URPb7WRoWJ+xtvMRZ6wnX7xTDncCTZdROBrtF
 6HH1u2oCRFunpgYx0gBnExWtZ/JZv0WAkD81CDanqXEsOAQdqJeWohzgxVtgiUn1vNtw
 5Qgv7wUTPbBIJc9JRQoXEG4rw8FPNnGIm/EwW9psVMnrXFz6fV1/Vth+hqRXOMYHMl+H
 V3iK/GGRzu2B/VTzEDFVPTTXnVJyBvTFdZ01yIyIkZixEa3CsMnmys78uSHnX74Mvz8r
 nSlQ==
X-Gm-Message-State: AOAM531ohW9VFXpVBAxG/MSb97r9xZYqKIgq+EJCLbGwy1td44QtAPhb
 +gaxQWnzulscTUWDCgEUa8GDIglwBU53zmk83l368vyNcMwUDBXUXJml+yJEJaB62JHAIbYzftf
 hDqdnFPjI+fdRIbs=
X-Received: by 2002:ae9:ebd5:: with SMTP id b204mr6314217qkg.195.1607566125719; 
 Wed, 09 Dec 2020 18:08:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxI8aOTk8eEfkmR7fk8ueNpeKozgNDK6u79EM2P252ac8OAnWQ/P91PLbLFC5JhAhlUyjU0Mw==
X-Received: by 2002:ae9:ebd5:: with SMTP id b204mr6314193qkg.195.1607566125494; 
 Wed, 09 Dec 2020 18:08:45 -0800 (PST)
Received: from xz-x1 ([142.126.83.202])
 by smtp.gmail.com with ESMTPSA id s11sm2677291qkm.124.2020.12.09.18.08.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 18:08:44 -0800 (PST)
Date: Wed, 9 Dec 2020 21:08:43 -0500
From: Peter Xu <peterx@redhat.com>
To: zhukeqian <zhukeqian1@huawei.com>
Subject: Re: [PATCH] kvm: Take into account the unaligned section size when
 preparing bitmap
Message-ID: <20201210020843.GB3211@xz-x1>
References: <20201208114013.875-1-yuzenghui@huawei.com>
 <20201208151654.GA6432@xz-x1>
 <bb4bcc8b-1d36-9529-d7cd-4d93162d092f@huawei.com>
 <6dc82702-9246-4684-4f28-e104abc0c11d@huawei.com>
MIME-Version: 1.0
In-Reply-To: <6dc82702-9246-4684-4f28-e104abc0c11d@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Zenghui Yu <yuzenghui@huawei.com>, pbonzini@redhat.com,
 qemu-devel@nongnu.org, wanghaibin.wang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Keqian,

On Thu, Dec 10, 2020 at 09:46:06AM +0800, zhukeqian wrote:
> Hi,
> 
> I see that if start or size is not PAGE aligned, it also clears areas
> which beyond caller's expectation, so do we also need to consider this?

Could you elaborate?

If start_delta != 0, kvm_log_clear_one_slot() should already go the slow path.

Thanks,

-- 
Peter Xu


