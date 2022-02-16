Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 243AF4B8679
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 12:10:08 +0100 (CET)
Received: from localhost ([::1]:58258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKICF-0007Vv-A2
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 06:10:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nKI3y-0000Ks-IY
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 06:01:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36977)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nKI3v-0003jc-D7
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 06:01:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645009289;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vF2HYvmfsAMIFEN5zvcpCIKLpzPtcRHjb5WkCP7A2jY=;
 b=JTaiA8nRETyuMqk4LYbv++LdPP+GHW8qb4AZJ1nFMAUKVYhaJXDKLKVNdCT5mUO4NmDO8G
 EA0+yabDth+sq5r3G7yr6V0/O1v7jUzbVzUYlEvivMmTJdM3h29G4spasfpIrsiv6DPoIy
 rJZvzVbDr8t7CZSnQcgysrfA55yEKNg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-534-ZwMNTXhYMcWJvWfcP7FVmQ-1; Wed, 16 Feb 2022 06:01:28 -0500
X-MC-Unique: ZwMNTXhYMcWJvWfcP7FVmQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 h82-20020a1c2155000000b003552c13626cso2772165wmh.3
 for <qemu-devel@nongnu.org>; Wed, 16 Feb 2022 03:01:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=vF2HYvmfsAMIFEN5zvcpCIKLpzPtcRHjb5WkCP7A2jY=;
 b=jG7d0MIomH8plNRbOBhk96kNAk0FUprlZEOW/SB/QRfhjqq+QFmN3GT1GWM1kIg+gx
 V7UtGp0Edxy1kKvbnj3EL/xWVoKe88aNmu+P/0kgqq36t2zAhxjNSvCQitTj/D7GUW8w
 II06TIt2b0g92/lYPKg96ocq+pe6NOJG2qHI3xUtVMUp5iGMJ8i930wPrgDlxhqHNOEy
 GU2i6NlJpvD7gTS9AzzeadJXnfBS0rsvQ6mNXdaxTHYspyPhJ7UCV6AjwJ5f8P3Tn7fF
 r8MlImpcdWpsxSQP63xLRXCAmyjsxD22J2UuDwdadD8kiODqdw0UBE0iNFJcaN03j8S2
 fm7g==
X-Gm-Message-State: AOAM530YNyK/wmruWcJyDu9idoKv3RW6Kc2cPnKmu7DcOI5uFSmqnmvO
 x1rb96kDoNcmAtOd54F2NBF+MogN+5Tb4XXv/Hin6aGFixzHPPy1SBFnYFo3vDYR4A82Qjik8Tb
 ZpC/bUyDinwkAbkg=
X-Received: by 2002:a5d:52cb:0:b0:1e4:b8b5:6ce1 with SMTP id
 r11-20020a5d52cb000000b001e4b8b56ce1mr1918287wrv.268.1645009286440; 
 Wed, 16 Feb 2022 03:01:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyhXSvrhCKAEXbmhnb60HuIVTMlQrYXgyEQtubiGKtwQMW5CmE/zlWpnn+ukuLU5ag3R8+s+Q==
X-Received: by 2002:a5d:52cb:0:b0:1e4:b8b5:6ce1 with SMTP id
 r11-20020a5d52cb000000b001e4b8b56ce1mr1918275wrv.268.1645009286281; 
 Wed, 16 Feb 2022 03:01:26 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id o20sm17360009wmq.21.2022.02.16.03.01.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Feb 2022 03:01:25 -0800 (PST)
Date: Wed, 16 Feb 2022 11:01:24 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH 3/3] x86: Switch to q35 as the default machine type
Message-ID: <YgzZhHKSAFYTYFDc@work-vm>
References: <20220215162537.605030-1-dgilbert@redhat.com>
 <20220215162537.605030-4-dgilbert@redhat.com>
 <YgvtLmoJcv+ZSW1S@redhat.com>
 <20220216105808.77kqhmsagz3ej74h@sirius.home.kraxel.org>
MIME-Version: 1.0
In-Reply-To: <20220216105808.77kqhmsagz3ej74h@sirius.home.kraxel.org>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: eduardo@habkost.net, thuth@redhat.com,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>, mst@redhat.com,
 quintela@redhat.com, qemu-devel@nongnu.org, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Gerd Hoffmann (kraxel@redhat.com) wrote:
>   Hi,
>  
> > Given the semantic differences from 'i440fx', changing the default
> > machine type has effects that are equivalent to breaking command
> > line syntax compatibility, which is something we've always tried
> > to avoid.
> 
> And if we are fine breaking backward compatibility I'd rather *not* pick
> a default, effectively making -M $something mandatory, similar to arm.

Oh, that's probably easy to do;  what are other peoples thoughts on
that?

Dave

> take care,
>   Gerd
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


