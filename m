Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C4A6EE7C7
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 20:50:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prNj6-0006nL-A1; Tue, 25 Apr 2023 14:49:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1prNj4-0006n4-GM
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 14:49:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1prNj3-00079L-3V
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 14:49:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682448555;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=H3LNuL4CW1cNRwCecLgHmbEEIGIe2Khm3KHOggvYEkU=;
 b=QWWJBANa2z/Eh2L2wa9/xuHpwpvjGRnrc+cRQxzE+QySaugP3XZoQ00CDWKnQyC+/6jx7o
 aexVMlRz43S7QQ6dOwsG9yQcO7zHcpmghDsbxFfa+TkXQeraTh4RrB1xxFuMTLYCaivp1Y
 O/x4tdupfnKPBW0mPYjqTKjELsgtt9U=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-246--RgcenpKP1K7mduGptIkYQ-1; Tue, 25 Apr 2023 14:49:13 -0400
X-MC-Unique: -RgcenpKP1K7mduGptIkYQ-1
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-3ef4f29c9d1so15402131cf.0
 for <qemu-devel@nongnu.org>; Tue, 25 Apr 2023 11:49:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682448552; x=1685040552;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=H3LNuL4CW1cNRwCecLgHmbEEIGIe2Khm3KHOggvYEkU=;
 b=Mp0I1D92VLgiPial6n9S/2ZEsvJp/7QY7OgJy3w++TzFsJA1NoAWT3EvhaRlCSoh+t
 gGBzdzLUOUdcNFPe/JvQdaoMSeeH0BhY7qpLo3BGG0cIdgPwQk2FNURqqI6m2irV9PM4
 CaiyLcuao4jzzn3S2YqihL+DWvnk8uOSPKBqOb+HuRZnu1Bg6KjRQ9Z7IhaSUibTCDhg
 JwIfeJcdXpm/txwqDG2fevEPqMx9xHNwet+mTHdbG34soC09rcCl/955uVWP6dmOpb5k
 NQVX6KlOqUq+npW3CqfIADOAClBC0TXTfxN5Y6gdLyzofTwkqGP7UqUb5UynGPqIWPEe
 jtcQ==
X-Gm-Message-State: AAQBX9dcT+AkKhLNZcPgZGVRzEmGLtLGSvkg9N9mDF/80v+c08GCrRnF
 IuRTbodGEIpb7mt/FudO3wDwpWTPtrw1w0wYtHMrtrpr3WK5/swpIsy5Pb7C8WHlrvUXKq91/Wh
 BDmBY7EKO6GIGYmY=
X-Received: by 2002:a05:622a:1a12:b0:3eb:143a:746a with SMTP id
 f18-20020a05622a1a1200b003eb143a746amr28391823qtb.4.1682448552746; 
 Tue, 25 Apr 2023 11:49:12 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZnxDQ4mQewmw6T2Pvrm9mWzGYEBS5z/gPeMzZ7REsTiC2ZOedS/5MnzrO9hBTl3Y2lqRMurg==
X-Received: by 2002:a05:622a:1a12:b0:3eb:143a:746a with SMTP id
 f18-20020a05622a1a1200b003eb143a746amr28391808qtb.4.1682448552523; 
 Tue, 25 Apr 2023 11:49:12 -0700 (PDT)
Received: from x1n (bras-base-aurron9127w-grc-40-70-52-229-124.dsl.bell.ca.
 [70.52.229.124]) by smtp.gmail.com with ESMTPSA id
 w29-20020ac84d1d000000b003e4ee0f5234sm4702096qtv.87.2023.04.25.11.49.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 11:49:11 -0700 (PDT)
Date: Tue, 25 Apr 2023 14:49:10 -0400
From: Peter Xu <peterx@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org, Yanan Wang <wangyanan55@huawei.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Leonardo Bras <leobras@redhat.com>
Subject: Re: [PATCH v8 0/3] Eliminate multifd flush
Message-ID: <ZEggpionTpImHcQu@x1n>
References: <20230425163114.2609-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230425163114.2609-1-quintela@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Apr 25, 2023 at 06:31:11PM +0200, Juan Quintela wrote:
> Hi
> 
> In this v8:
> - rebase over latests

One trivial comment for patch 1 on the compat bits, for patch 2-3:

Acked-by: Peter Xu <peterx@redhat.com>

Nit: I still think we should just squash the three patches into one, but
I'm fine either way.

Thanks,

-- 
Peter Xu


