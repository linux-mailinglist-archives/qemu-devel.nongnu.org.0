Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1ADD615D52
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 09:05:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oq8kb-00039S-4R; Wed, 02 Nov 2022 04:05:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oq8kU-0002yR-3F
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 04:05:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oq8kS-0002O6-JN
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 04:05:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667376319;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ii662kuJNZ5EmoIAgC/BcFsG/m5/cZ856ss7IznJF94=;
 b=Wzsp6mkzz+PmXRF2ELO/FIIRXWeWafuQ1xH0/jxbf5wRGxTgqPogYP1vbiOPDOefKZ3D83
 WVrG1j3Hg5gnnYfkjN/JMyhdT5wz/LAx2RPZhCYT7aMSOIy5si1n4xrWlTLTvUaBC4rBb/
 NsSDmNfv+Ddth6Lk8v6AskurEy0e3uw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-648-a43yYj9AMBGO4e14Bmq_Jw-1; Wed, 02 Nov 2022 04:05:18 -0400
X-MC-Unique: a43yYj9AMBGO4e14Bmq_Jw-1
Received: by mail-wm1-f70.google.com with SMTP id
 i7-20020a1c3b07000000b003c5e6b44ebaso725611wma.9
 for <qemu-devel@nongnu.org>; Wed, 02 Nov 2022 01:05:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ii662kuJNZ5EmoIAgC/BcFsG/m5/cZ856ss7IznJF94=;
 b=pwxVX/HkwSZt8924D2NpsB4WxNmAInUMUGsGf2hKcqbOfKryH7jtpnyeRGdya/DnaU
 A11p38NmaS3xqMjZNb79C2dnBvuCo0ljT5eNp3IVKzOOI4RTf2mCSeiN0IrThuihRwm5
 +exx+qisfwJOulL31J2uPSqcGSrzEf1dQ9ONdxXkKqyElMAGXzyJZOXTxima4aLffBNd
 yNXaFMOfeXJ1blRlkbgTxqnMmdPE7nLaHKnr7Q1noYUpl8OXFaoaxT8I8H1VGCXUOeDl
 A5LXR0oSBKnw6QcIIyQ2Z89qJtARcu85Zcq1crpmyGYsxwzbXtKea8xQ5XGm0SX7YR7P
 +KmQ==
X-Gm-Message-State: ACrzQf1VwtOGzpYsOcVAuyflzOBs8FBy0eEbdOuQhoPqXriBfTrN+Rjv
 e7Vy4b8JKH00D8y3dFRxSFHCmobbrjJZk2KrdFA0u6Zusv9yceB+6VVzga/50XlT80cDb5c+pGr
 MvFCcKiQGCgk+dHE=
X-Received: by 2002:a05:6000:1f1a:b0:236:ce27:230a with SMTP id
 bv26-20020a0560001f1a00b00236ce27230amr8546025wrb.469.1667376317186; 
 Wed, 02 Nov 2022 01:05:17 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4bZWS3odkHLfIyP2Sc6bVfC0LsMiqdihuX1CvMh1mg8TrJXMh7j0YNEJOlV4RnXRu8NVZXCg==
X-Received: by 2002:a05:6000:1f1a:b0:236:ce27:230a with SMTP id
 bv26-20020a0560001f1a00b00236ce27230amr8546009wrb.469.1667376316930; 
 Wed, 02 Nov 2022 01:05:16 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 i12-20020a05600c354c00b003c6b70a4d69sm1192300wmq.42.2022.11.02.01.05.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 01:05:16 -0700 (PDT)
Date: Wed, 2 Nov 2022 04:05:13 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Lei He <helei.sig11@bytedance.com>
Cc: arei.gonglei@huawei.com, berrange@redhat.com, pizhenwei@bytedance.com,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v3 0/4] Add a new backend for cryptodev
Message-ID: <20221102040429-mutt-send-email-mst@kernel.org>
References: <20221102080213.46788-1-helei.sig11@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221102080213.46788-1-helei.sig11@bytedance.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.051,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Nov 02, 2022 at 04:02:09PM +0800, Lei He wrote:
> v2 --> v3:
> - Avoid using g_autoptr to free memory that not allocated in current
> function.
> - Fix memory-leak when 'virtio_crypto_handle_request' returns non-zero
>   value.
> - When error occurred, always pass negative status to function 
> 'virtio_crypto_req_complete'.

Thanks!
Can you send fixup patches on top pls?
If I drop v2 at this point I'll have to defer this to after
the release.

-- 
MST


