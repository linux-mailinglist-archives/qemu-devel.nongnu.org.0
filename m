Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 200414F57D8
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Apr 2022 10:42:46 +0200 (CEST)
Received: from localhost ([::1]:36344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nc1FV-0000UO-8l
	for lists+qemu-devel@lfdr.de; Wed, 06 Apr 2022 04:42:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nc1BW-00083t-Pd
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 04:38:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57519)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nc1BU-0005jh-K1
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 04:38:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649234315;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/Q7BrXTl/7U8mIYVEPIk/lPye7brME/iJtfkOkHMEcM=;
 b=fXR1FR2fpqi5/sXhn8GgHAEOv2vUsYtG03Dj9PFkc2Vyio51SSsAauQW0lU/DnEf2qj+Tw
 Di+iRflW8Z+mUjb6eJ3/3zdSKzK1jjTrZOzLBcq1+O8h0q3po658ikTyM33NU0eMGkyJfu
 3y1TG8GHb7O0X73632bbIs3+lKkaW/k=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-245-EPvsXLOxPROPWSKxU1of8w-1; Wed, 06 Apr 2022 04:38:35 -0400
X-MC-Unique: EPvsXLOxPROPWSKxU1of8w-1
Received: by mail-wr1-f71.google.com with SMTP id
 v3-20020adf8b43000000b00205e463b017so254171wra.10
 for <qemu-devel@nongnu.org>; Wed, 06 Apr 2022 01:38:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=/Q7BrXTl/7U8mIYVEPIk/lPye7brME/iJtfkOkHMEcM=;
 b=vqryNmcy25FsCtnzQ5CK4JElmqTegONZu4qZY7YPksT8mYOla/LJUxe2817KghF4zr
 WBLAh5uOSs2lhjHa7fM2faHaGnF1CRP0/ySYbcnAeXB6fBDr4PNd/BNoPuqB9YBiLnNY
 bwSdu3uLTGwMKJ13rzoR8V30ElA+FS5Dc52BaM1fK5g7u+ozsoq2PNVX6qnxli/d99n5
 1GgiFxUkE9ABOEEyvqBqBgWr6d3Is6jL25JKAc2u0cQE0mfnl4tNnblMAaBZf02SLAb/
 1DpTtNjW7aBPhZYh7YJehMI/E4b/6splqtRClhI8dLNjKg0Zn5VqR5MG6hbtIAxx8dIW
 wOMA==
X-Gm-Message-State: AOAM533tMtHaUlvp9lO9FLDcG1OAsDLhudeQGFHFAiz2ES5g5k8/GBDE
 9RKVFPCp4KijGC8+d0XGs7mbMba7Yh5RwHh6BFlZ9Fwp48+U6xOLYV7oTSYLY24U2tZc/3wDBeR
 kQI0emu8+JUFD1BQ=
X-Received: by 2002:a1c:f70e:0:b0:38c:6ca9:2f8f with SMTP id
 v14-20020a1cf70e000000b0038c6ca92f8fmr6407940wmh.162.1649234313931; 
 Wed, 06 Apr 2022 01:38:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyKRF5Iew9gw9HOs/XLj0cB5mef0BmY9RIIkzt91aP7wPsHYqNbN9eGS7J71H65+NckjHhPkw==
X-Received: by 2002:a1c:f70e:0:b0:38c:6ca9:2f8f with SMTP id
 v14-20020a1cf70e000000b0038c6ca92f8fmr6407919wmh.162.1649234313716; 
 Wed, 06 Apr 2022 01:38:33 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 x17-20020a5d4451000000b002061a0a9a13sm4938772wrr.1.2022.04.06.01.38.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Apr 2022 01:38:33 -0700 (PDT)
Date: Wed, 6 Apr 2022 09:38:31 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH] acpi: Bodge acpi_index migration
Message-ID: <Yk1Rh+UOIliSccK1@work-vm>
References: <20220405190658.65187-1-dgilbert@redhat.com>
 <20220405171152-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20220405171152-mutt-send-email-mst@kernel.org>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: peter.maydell@linaro.org, quintela@redhat.com, qemu-devel@nongnu.org,
 peterx@redhat.com, alex.williamson@redhat.com, leobras@redhat.com,
 imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Michael S. Tsirkin (mst@redhat.com) wrote:
> On Tue, Apr 05, 2022 at 08:06:58PM +0100, Dr. David Alan Gilbert (git) wrote:
> 
> The patch is fine but pls repost as text not as
> application/octet-stream.

I've just reposted it with a fudged header that should be fine.
( 20220406083531.10217-1-dgilbert@redhat.com )

Dave

> Thanks!
> 
> -- 
> MST
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


