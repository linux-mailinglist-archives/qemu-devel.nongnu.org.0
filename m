Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B6562C426
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 17:23:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovLBw-0005ss-QU; Wed, 16 Nov 2022 11:23:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ovLBu-0005ms-HO
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 11:23:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ovLBt-0004kq-2P
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 11:23:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668615788;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zPz7DOhc+teb4K5ze1wO5T91BSkuBHY05xrPLUPOWhg=;
 b=NKZ89Uzm6JdZshHKZUCBSQwnUeKTwa6FUtADKCAQtkLdp/MgM5gjMibitUAwliSxdLfoyq
 0OSQs9aHJ//U3ayrbwn03lAiX/QWX80+6r0t5SNEvbkVAOIgA2j/U3GSH8Rmob8ygWyzYj
 s0wTkH2XmOSnjBDIyE3qhGv+eo1nzM8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-673-0TO_H88DPa2KaN1IX-fUnQ-1; Wed, 16 Nov 2022 11:23:06 -0500
X-MC-Unique: 0TO_H88DPa2KaN1IX-fUnQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 j20-20020adfb314000000b002366d9f67aaso3819189wrd.3
 for <qemu-devel@nongnu.org>; Wed, 16 Nov 2022 08:23:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zPz7DOhc+teb4K5ze1wO5T91BSkuBHY05xrPLUPOWhg=;
 b=XTKa0v3EgI2CQNG5NtIj1vfDspQdtesBU9eryjZjxa/ZcrKB69vmhzo79kRPidWTFP
 tKmF8Fj8BgVcWPXaoxwggIVRHRoaiCUYI0ibT6Jbh1SYoLlLiaEs+geoUn3X9RENVE6t
 2/ZMpDGPV6rSPncdvMX1fmCfMrdJslUnh82IzrKQIfxdCg6XgueJ0rr8IG5NJvG9yBcc
 dhzkunmbq1Bx1S3NEM8ns+0pqWW/nk+UR7FmdJbd1mTK1IwAStNfeEHo0GgZVu6LehOG
 wZ19SHXbXx23OlkYEmCK3Lyu4QttNy/mT5JNCERl13X7OFGEA7G38n4gxxDJPlpcWbNe
 twmg==
X-Gm-Message-State: ANoB5pnYuZfr9Hdo6z1HALeOBJJnslFn5c/gvxTdZoy2Igz2WmkWWj0z
 kepmGklYHmGCjmnj0+yiXJC7Yk+9f/WuuE37Jy+6ZlTkWdXG4PI5A1W9YlchbeKdUF6BW/rO1vm
 /KyfONikwINEfpQ8=
X-Received: by 2002:a05:600c:19d1:b0:3cf:8b92:4503 with SMTP id
 u17-20020a05600c19d100b003cf8b924503mr2529397wmq.131.1668615785611; 
 Wed, 16 Nov 2022 08:23:05 -0800 (PST)
X-Google-Smtp-Source: AA0mqf77XWGiwosLT0oiBrdB/gEuv5dcm+VwS0HIv6GI3M4DB/U/t+9Bj5NgB9WBtEjiP7fQQOYbMA==
X-Received: by 2002:a05:600c:19d1:b0:3cf:8b92:4503 with SMTP id
 u17-20020a05600c19d100b003cf8b924503mr2529381wmq.131.1668615785427; 
 Wed, 16 Nov 2022 08:23:05 -0800 (PST)
Received: from redhat.com ([2.52.131.207]) by smtp.gmail.com with ESMTPSA id
 ay6-20020a05600c1e0600b003cfd42821dasm2874626wmb.3.2022.11.16.08.23.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Nov 2022 08:23:04 -0800 (PST)
Date: Wed, 16 Nov 2022 11:23:01 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: qemu-devel@nongnu.org, eduardo@habkost.net, berrange@redhat.com,
 pbonzini@redhat.com, armbru@redhat.com, eblake@redhat.com,
 marcel.apfelbaum@gmail.com, imammedo@redhat.com, ani@anisinha.ca,
 den-plotnikov@yandex-team.ru
Subject: Re: [PATCH RFC 0/2] add SHPC hotplug event
Message-ID: <20221116112145-mutt-send-email-mst@kernel.org>
References: <20221116161234.44206-1-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221116161234.44206-1-vsementsov@yandex-team.ru>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Nov 16, 2022 at 07:12:32PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> Hi all! Please look at 02 for the details.


In the future, pls use --subject-prefix='PATCH RFC' with git-format-patch to
add same prefix to all patches.
If you are resending, add 'resend' in the subject, or increase the
version #.

> Vladimir Sementsov-Ogievskiy (2):
>   hw/pci/shpc: introduce FOR_EACH_DEVICE_IN_SLOT
>   qapi: introduce DEVICE_POWER_ON for SHPC hotplug
> 
>  hw/pci/shpc.c  | 53 +++++++++++++++++++++++++++++++++++++++++---------
>  qapi/qdev.json | 23 ++++++++++++++++++++++
>  2 files changed, 67 insertions(+), 9 deletions(-)
> 
> -- 
> 2.34.1


