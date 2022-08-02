Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA02587D47
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 15:40:25 +0200 (CEST)
Received: from localhost ([::1]:49602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIs8F-0008GK-VN
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 09:40:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oIs5p-000342-Lc
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 09:37:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oIs5Z-0002T0-Ls
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 09:37:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659447456;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=B8v2ojAdXNaZ6KXyr5vSkfO5EzawSE9NFwB/itfkEbY=;
 b=dK5Y4jGFudqoZiVOscAjCrauerOk0OtMW7yGzSEZSAIhypEc/16zO0rRGFbGFb38ttAMdi
 ewXx/cymigOziOTqynP0ciPbaXpTO6XZ4He9iS3MIQe8ENGj98//McZJ0cSJrP7f6tHVHH
 wen4SblE8NOXvKW91DFlv54tZoJYN4g=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-70-esw96ZmbPx-Y7pSsjZMAng-1; Tue, 02 Aug 2022 09:37:35 -0400
X-MC-Unique: esw96ZmbPx-Y7pSsjZMAng-1
Received: by mail-wm1-f71.google.com with SMTP id
 h189-20020a1c21c6000000b003a2fdf9bd2aso6144260wmh.8
 for <qemu-devel@nongnu.org>; Tue, 02 Aug 2022 06:37:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=B8v2ojAdXNaZ6KXyr5vSkfO5EzawSE9NFwB/itfkEbY=;
 b=OjK2DPi8ScWioGLyLSooudv9zS+GkgeySMqERHhQttxJC2AOl8LNXCQeYfJ5FwiI2G
 qpNcuis3j42luFD74bpeb8rVCHQ5r04wbq1Nz+/NgX1ktsZjkCu4ITILlKXSA7MDy7JJ
 zbfuMZZdbIywg1BVZ6Pfby5ZBBZVnrLcaWXD2gWWwgvbkahOmTKRS6tqRcQGjyxVUbGh
 mljMyCcw18PQTJamrNq8W8MywBPtcLvBGwVzuY13i1pPSOUc9EwnoIcBi3pb7J42wD3A
 Wo0FZq5p2D3s/0/nJnNmgglxv2RrJ9PsHgmLNtdf/3N7RYYL2SIxfW/b/HVW2Dw5SDzq
 Fgzw==
X-Gm-Message-State: AJIora9GW4Q2OLp3sMKxPuj/gmhYrWUHY10p+ZN4vRJXFYfWLyNss/20
 UptHl54nfLjXiMQv8jhhmTaCNhXW/Y6hTra0wjaQfb1eCSlgHNifK5ejAe1TeI+PT3J/MEHjyA3
 A6vHnKK2upUrBlTM=
X-Received: by 2002:a1c:720a:0:b0:3a3:327:da23 with SMTP id
 n10-20020a1c720a000000b003a30327da23mr15032946wmc.196.1659447453795; 
 Tue, 02 Aug 2022 06:37:33 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sznCM9aU3GUpf0uF2aT7h3rrOsPP/pEOUIJSX4rGBQrScc7DlZtln+ImgRqAomg/an26qieA==
X-Received: by 2002:a1c:720a:0:b0:3a3:327:da23 with SMTP id
 n10-20020a1c720a000000b003a30327da23mr15032928wmc.196.1659447453597; 
 Tue, 02 Aug 2022 06:37:33 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 bg3-20020a05600c3c8300b003a327b98c0asm22931132wmb.22.2022.08.02.06.37.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Aug 2022 06:37:32 -0700 (PDT)
Date: Tue, 2 Aug 2022 14:37:31 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Juan Quintela <quintela@redhat.com>, peterx@redhat.com,
 qemu-devel@nongnu.org
Subject: Re: [PATCH for-7.1] Revert "migration: Simplify unqueue_page()"
Message-ID: <Yukom4vCAaZtxFFi@work-vm>
References: <20220802061949.331576-1-thuth@redhat.com>
 <YujksCJ/JjRAJc9N@work-vm>
 <b941a128-11d8-cda1-b48a-bc356a0a60cd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b941a128-11d8-cda1-b48a-bc356a0a60cd@redhat.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Thomas Huth (thuth@redhat.com) wrote:
> On 02/08/2022 10.47, Dr. David Alan Gilbert wrote:
> > * Thomas Huth (thuth@redhat.com) wrote:
> > > This reverts commit cfd66f30fb0f735df06ff4220e5000290a43dad3.
> > > 
> > > The simplification of unqueue_page() introduced a bug that sometimes
> > > breaks migration on s390x hosts. Seems like there are still pages here
> > > that do not have their dirty bit set.
> > 
> > I don't think it's about 'not having their dirty bit set' - it's
> > perfectly fine to have the bits clear (which indicates the page has
> > already been sent to the destination, sometime inbetween the page request
> > being sent from the destination and it being unqueued).
> 
> Ok, could you maybe simply drop that sentence from the commit description
> when picking up the patch? Or shall I resend a v2?

Queued

>  Thomas
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


