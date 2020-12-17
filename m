Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCCFC2DD317
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 15:39:33 +0100 (CET)
Received: from localhost ([::1]:45142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpuRI-0006tk-Bo
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 09:39:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kpuP0-0005eD-IP
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 09:37:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31253)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kpuOv-0007qz-0f
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 09:37:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608215821;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=s3dIxyTS8y3OicPT8ExvIWlNk6sXUNBdh3LfqSfY1dA=;
 b=A2cQs2mdsz9beqYZc2ErcFACgix9tFU90gmwMLzFi5/VxkQBIpE/uCsFxyFQQGfrvxOWPs
 dR7BOm195Flxr2YreLFE/u3s/kc2QxbkPWMKpqvAdY4lTA5t6Nb4Erw2SfzYgJF+acYdKT
 reXfBEqi5kppdsVuI3zRsyqFT0B+9fo=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-359-hvZOFeL4NHqiZoq5lUYZ2Q-1; Thu, 17 Dec 2020 09:36:55 -0500
X-MC-Unique: hvZOFeL4NHqiZoq5lUYZ2Q-1
Received: by mail-qt1-f198.google.com with SMTP id e14so20841002qtr.8
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 06:36:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=s3dIxyTS8y3OicPT8ExvIWlNk6sXUNBdh3LfqSfY1dA=;
 b=YlBsQP72HfUGB+h6rS4nFON5nA7Zy4loXHosPNTa/HQmOQ/rvwb0fR0uLWnJb1tvUc
 P8PO5XkwrfNuHnFpG2wilPfwplYaoddCQN19ob3BHMTbQKFbhFiEj17i4IpcNQXFw1eJ
 LcxJS18lCb6K7SPo/U6VVJnur1stl/rf1At1ajMqQdKn7hUOVbYWS2Dyi8Cfhu+8f2rN
 cj771EhhZyUSfei4dXWrxJLwNFQKtLEG+Bc1yADdhmESyXpHZZYnOO27ck1+fvl3FLdr
 Tw8jtD3PGSuG2WRX/PNQCW+BRfeY7aVNd8n12eBaiwYlzONICp6TotG9V6Ag46qBYxvZ
 dfQA==
X-Gm-Message-State: AOAM531M2w2YFXhoCpeBgoA9+HhKga2DmSm++TW2S2f1+SzMJ9MxyXSO
 vFn90lFR6CBOX/7EcLZ+G3iU6W5iwzAojegdo5UgvH0cLwQ6ahz0pQn8STR4bDlvn2hJWhq+O+Z
 I1jWVjuuBIePZHkM=
X-Received: by 2002:a05:6214:80d:: with SMTP id
 df13mr49747205qvb.10.1608215815265; 
 Thu, 17 Dec 2020 06:36:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyeM38RzR7BeGQnOxDRpNdFKjk/d5XXMp31lj3sHk+O6fIcz44eiSVDY0EmlK89Sy6eXfkdHw==
X-Received: by 2002:a05:6214:80d:: with SMTP id
 df13mr49747180qvb.10.1608215815054; 
 Thu, 17 Dec 2020 06:36:55 -0800 (PST)
Received: from xz-x1 ([142.126.83.202])
 by smtp.gmail.com with ESMTPSA id s11sm3519531qkm.124.2020.12.17.06.36.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 06:36:54 -0800 (PST)
Date: Thu, 17 Dec 2020 09:36:52 -0500
From: Peter Xu <peterx@redhat.com>
To: Keqian Zhu <zhukeqian1@huawei.com>
Subject: Re: [PATCH v2 2/2] accel: kvm: Add aligment assert for
 kvm_log_clear_one_slot
Message-ID: <20201217143652.GC39844@xz-x1>
References: <20201217014941.22872-1-zhukeqian1@huawei.com>
 <20201217014941.22872-3-zhukeqian1@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20201217014941.22872-3-zhukeqian1@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 jiangkunkun@huawei.com, qemu-devel@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 wanghaibin.wang@huawei.com, Zenghui Yu <yuzenghui@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Dec 17, 2020 at 09:49:41AM +0800, Keqian Zhu wrote:
> The parameters start and size are transfered from QEMU memory
> emulation layer. It can promise that they are TARGET_PAGE_SIZE
> aligned. However, KVM needs they are qemu_real_page_size aligned.
> 
> Though no caller breaks this aligned requirement currently, we'd
> better add an explicit assert to avoid future breaking.
> 
> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>

Acked-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


