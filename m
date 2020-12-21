Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECEBD2DFDB4
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 16:48:52 +0100 (CET)
Received: from localhost ([::1]:46290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krNQa-0001pC-1Z
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 10:48:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1krN7g-0003yP-R1
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 10:29:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52796)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1krN7f-0005I5-4e
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 10:29:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608564557;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IVy8vtxMEo/uIv4yozx0ODaeWjB5p67KIOpQprOfV40=;
 b=UH/zPkpRcvgyVQJkl7FL+WE6doXiywlp3xjZi4m2eqN/a6nMXuTK03y4S3MnoOhbMe2+bJ
 0qRjdvESiWzeil27FH0Wow+5uzwbMTEVnHHlAFAFHNrtIl+Ldw5TvaIZvpFNp5DVuKgj96
 +yaw3Zof2Q8rtjYoL7wbkjxUbPeKzwU=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-569-ACIUPsrjM2-6rAx567AH-Q-1; Mon, 21 Dec 2020 10:29:14 -0500
X-MC-Unique: ACIUPsrjM2-6rAx567AH-Q-1
Received: by mail-qk1-f200.google.com with SMTP id p21so3828330qke.6
 for <qemu-devel@nongnu.org>; Mon, 21 Dec 2020 07:29:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=IVy8vtxMEo/uIv4yozx0ODaeWjB5p67KIOpQprOfV40=;
 b=ruMTJFpUaHSGj+JJEEAWdEBMsbHme0PvYC/7vjpUI8ZyTuADQUOWjqdN2s5k2fLbLk
 5LI5oz+3NmGzicd3zdIemTcrKfXAWY6h61idlCEZOpdwaAUjSlKg3TwZbCw4/1M3xXsP
 /KRBQrtyHjDr/AI68coaRH875Qo16s77Sy34Wsm+W8C2vxwrizg7AsTU2b3WoLi+UZqw
 kp7d235kL3Wxp4yowIabR010wvPKboZW/4Z+VB1U6+B8YKdteZ6YtiJyfiknaxvCisOs
 dd+iH94EXSholuhwV/ru7nzk4DerqP+/nwB4w1UXckUE2hA2TKP6XADXmoGPYhd/07Q8
 ePUw==
X-Gm-Message-State: AOAM530yP0N7YSrY1jtXRSEwcTqCSiHAPU2bnTll7/Iu6fX0FaMqWUyo
 kxvkfc/hEBW1d2GrHj1UOea4FAc2R3mtPyxYPkpvn4wm2JE1s3OPatTGdGsyAN3IKdWk6txQUW/
 ibxWz9Bqo6QDl/2c=
X-Received: by 2002:a0c:f107:: with SMTP id i7mr17617829qvl.35.1608564553624; 
 Mon, 21 Dec 2020 07:29:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwfPZk4wUi9EkGmT0zNJJXztPPaqRSBxRPK+wVfM77AppF4DOTgXUIKr1OFe4AOC558v7WWmA==
X-Received: by 2002:a0c:f107:: with SMTP id i7mr17617807qvl.35.1608564553435; 
 Mon, 21 Dec 2020 07:29:13 -0800 (PST)
Received: from xz-x1 ([142.126.83.202])
 by smtp.gmail.com with ESMTPSA id d72sm10965011qkg.34.2020.12.21.07.29.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Dec 2020 07:29:12 -0800 (PST)
Date: Mon, 21 Dec 2020 10:29:11 -0500
From: Peter Xu <peterx@redhat.com>
To: Keqian Zhu <zhukeqian1@huawei.com>
Subject: Re: [PATCH] Docs/RCU: Correct sample code of qatomic_rcu_set
Message-ID: <20201221152911.GC6640@xz-x1>
References: <20201221121745.27156-1-zhukeqian1@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20201221121745.27156-1-zhukeqian1@huawei.com>
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 wanghaibin.wang@huawei.com, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Dec 21, 2020 at 08:17:45PM +0800, Keqian Zhu wrote:
> Correct sample code to avoid confusing readers.
> 
> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


